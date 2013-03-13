worker_processes 4
timeout 30
preload_app true

before_fork do |server, worker|
  # This is a hack.  The code is run with 'before_fork' so it runs
  # *after* Unicorn installs its own TERM signal handler (which makes
  # this highly dependent on the Unicorn implementation details).
  #
  # We install our own signal handler for TERM and simply re-send a QUIT
  # signal to our self.
  Signal.trap 'TERM' do
    puts 'intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  # Replace with MongoDB or whatever
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
    Rails.logger.info('Disconnected from ActiveRecord')
  end

  # If you are using Redis but not Resque, change this
  if defined?(Resque)
    Resque.redis.quit
    Rails.logger.info('Disconnected from Redis')
  end
end

after_fork do |server, worker|
  # Replace with MongoDB or whatever
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
    Rails.logger.info('Connected to ActiveRecord')
  end

  # If you are using Redis but not Resque, change this
  if defined?(Resque)
    Resque.redis = ENV['REDISTOGO_URL']
    Rails.logger.info('Connected to Redis')
  end
end
