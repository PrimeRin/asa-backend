# frozen_string_literal: true
max_threads_count = ENV.fetch('RAILS_MAX_THREADS', 5)
min_threads_count = ENV.fetch('RAILS_MIN_THREADS') { max_threads_count }
threads min_threads_count, max_threads_count

worker_timeout 3600 if ENV.fetch('RAILS_ENV', 'development') == 'development'

port ENV.fetch('PORT', 3000)

environment ENV.fetch('RAILS_ENV', 'development')

pidfile ENV.fetch('PIDFILE', 'tmp/pids/server.pid')

if ENV.fetch('RAILS_ENV') == 'production'
  ssl_bind '0.0.0.0', ENV.fetch('RAILS_BACKEND_PORT', 3007), {
    key: ENV.fetch('SSL_KEY_PATH', nil),
    cert: ENV.fetch('SSL_CERT_PATH', nil),
    verify_mode: 'none'
  }
end

plugin :tmp_restart
