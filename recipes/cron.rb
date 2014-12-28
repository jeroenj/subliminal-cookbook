include_recipe 'subliminal::default'
include_recipe('subliminal::colorlog') if node[:subliminal][:colorlog]

user 'subliminal' do
  system true
  shell '/bin/false'
end

directory node[:subliminal][:log_directory] do
  mode 0755
  owner 'subliminal'
  group 'subliminal'
end

node[:subliminal][:cron_jobs].each do |cron_job|
  cmd = [
    node[:subliminal][:binary],
    cron_job[:path],
    cron_job[:options],
    "--languages #{node[:subliminal][:languages].join(' ')}",
    ("--providers #{node[:subliminal][:providers].join(' ')}" if node[:subliminal][:providers]),
    ('--color' if node[:subliminal][:colorlog]),
    ('--verbose' if node[:subliminal][:verbose]),
    '--cache-file /tmp/subliminal.cache.dbm',
    "> #{::File.join node[:subliminal][:log_directory], cron_job[:name]}.log 2>&1"
  ].compact.join(' ')

  cron_d "subliminal-#{cron_job[:name]}" do
    minute cron_job[:minute]
    hour cron_job[:hour]
    day cron_job[:day]
    month cron_job[:month]
    weekday cron_job[:weekday]
    command cmd
    user 'subliminal'
  end
end
