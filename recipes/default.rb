python_pip 'subliminal'

include_recipe('subliminal::cron') if node[:subliminal][:cron_jobs].any?
