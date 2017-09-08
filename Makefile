.PHONY: install
install:
	gem install foreman
	cp .env.example .env
	bundle install

.PHONY: start
start: 
	foreman start

.PHONY: spec
spec:
	bundle exec rspec

.PHONY: test
test: spec

.PHONY: compose
compose:
	docker-compose up -d

.PHONY: decompose
decompose:
	docker-compose stop
