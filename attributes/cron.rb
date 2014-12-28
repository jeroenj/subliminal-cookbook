default[:subliminal][:binary] = '/usr/local/bin/subliminal'
default[:subliminal][:log_directory] = '/var/log/subliminal'
default[:subliminal][:verbose] = true
default[:subliminal][:languages] = %w[en]
default[:subliminal][:providers] = nil # an array of supported providers

default[:subliminal][:cron_jobs] = []
