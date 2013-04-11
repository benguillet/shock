set :environment, 'development'
set :output, '~/Dropbox/Projects/perso/shock/logs/import.log'
set :job_template, "zsh ':job'"

every 1.minute do
  rake 'earthquake:import'
end
