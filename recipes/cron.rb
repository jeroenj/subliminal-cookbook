include_recipe 'subliminal::default'

user 'subliminal' do
  system true
  manage_home true
  home '/home/subliminal' # subliminal's config is saved in ~/.config
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
    'download',
    node[:subliminal][:languages].map { |language| "--language #{language}" },
    node[:subliminal][:providers].map { |provider| "--provider #{provider}" },
    ('--verbose' if node[:subliminal][:verbose] && !node[:subliminal][:very_verbose]),
    ('--verbose --verbose' if node[:subliminal][:very_verbose]),
    cron_job[:options],
    cron_job[:path],
    ">> #{::File.join node[:subliminal][:log_directory], cron_job[:name]}.log 2>&1"
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
