class ApplicationJob < ActiveJob::Base
  Rails.application.config.active_job.queue_adapter = :sidekiq
end
