ENV["RACK_ENV"] = "test"

require "laboratorium/bootstrap"
require "rack/test"

RSpec.configure do |config|
  config.order = :random

  Kernel.srand(config.seed)
end
