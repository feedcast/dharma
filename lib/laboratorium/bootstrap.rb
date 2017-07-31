module Laboratorium
  require "split"
  require_relative "api"

  ::Split.configure do |config|
    config.redis = ENV.fetch("REDIS_URL", "redis://127.0.0.1:6379")

    # Allow Redis to fail, force the control option when it does
    config.db_failover = true

    # We need this since the user is not based on cookie,
    # yet defined by multiple applications
    config.allow_multiple_experiments = true

    # Hack to load the user from the context,
    # allowing us to receive it in the payload
    config.persistence = Split::Persistence::RedisAdapter.with_config(
      lookup_by: ->(context) { context.send(:user_id) }
    )
  end

end
