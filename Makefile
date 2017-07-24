.PHONY: install
install:
	gem install foreman
	bundle install

.PHONY: start
start: 
	bundle exec rackup -p $(PORT)

.PHONY: spec
spec:
	bundle exec rspec

.PHONY: test
test: spec
