worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 30
# Make forks faster
preload_app true

