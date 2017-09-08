require_relative "lib/dharma/bootstrap"
require_relative "lib/dharma/api"
require "split/dashboard"
require "rack/rewrite"

use Rack::Rewrite do
  r302 "/", "/dashboard"
end

run Rack::URLMap.new(
  "/api" => Dharma::API.new,
  "/dashboard" => Split::Dashboard.new
)
