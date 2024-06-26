# frozen_string_literal: true

class TestController < ActionController::API
  def status
    # Check database connection
    db_status = ActiveRecord::Base.connection_pool.with_connection(&:active?) ? 'Connected' : 'Not Connected'

    ActiveRecord::Base.connection_pool.with_connection(&:active?)
    # Check server status
    server_status = 'Running'

    render json: { db_status: db_status, server_status: server_status }, status: :ok
  end
end
