require_relative "lib/laboratorium/bootstrap"
require_relative "lib/laboratorium/api"
require "split/dashboard"

run Rack::URLMap.new("/api" =>  Laboratorium::API.new,
                     "/dashboard" => Split::Dashboard.new)
