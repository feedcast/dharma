source "https://rubygems.org"
ruby "2.4.1"

# Server
gem "sinatra", "2"
gem "puma", "~> 3"
gem "rack-rewrite", "~> 1.5.0"

# AB Testing
gem "redis"
gem "split"

# Environment
gem "dotenv", require: true

group :development, :test do
  gem "rspec", "~> 3"
  gem "rack-test", "0.6"
  gem "byebug", platform: :mri
end
