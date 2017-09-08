require_relative "lib/dharma/bootstrap"
require_relative "lib/dharma/api"
require "split/dashboard"

run Rack::URLMap.new(
  "/api" => Dharma::API.new,
  "/dashboard" => Split::Dashboard.new
)
