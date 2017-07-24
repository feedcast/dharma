# 👩🏻‍🔬Laboratorium [![Build Status](https://travis-ci.org/marceloboeira/laboratorium.svg?branch=master)](https://travis-ci.org/marceloboeira/laboratorium) [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)
> AB testing as a service

## Setup

Use `make install` to install the ruby dependencies.

### Environment variables

`REDIS_URI` - URI to connect to Redis. e.g.: `redis://127.0.0.1:6379`

## Showtime

Finally, run `make start` to start the server.

The server will start at `http://localhost:5000` by default.

The dashboard will start at `http://localhost:5000/dashboard` by default.

The api is running under `/api`, same port as the core.

#### Endpoints

* `GET /api/experiments?experiment=foo&controll=blue&alternatives[]=green&alternatives[]=yellow&identifier=0001` - Returns the alternative for an specific user
* `PUT /api/experiments?experiment=foo&identifier=0001` - Finish an experiment for a given user
