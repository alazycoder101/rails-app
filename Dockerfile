ARG RUBY_VERSION=3.1.0
FROM ruby:$RUBY_VERSION-slim

RUN apt-get update -qq && \
    apt-get install -y -q build-essential sqlite3 libsqlite3-dev

ARG app=/opt/app
WORKDIR $app

#ADD Gemfile Gemfile.lock ./
ADD Gemfile ./
RUN gem install bundler && \
    bundle config set deployment 'false' && \
    bundle config set with 'development' && \
    bundle install --jobs 5 --retry 3

ENV RAILS_ROOT=$app \
    RAILS_ENV=${RAILS_ENV:-production} \
    RACK_ENV=${RAILS_ENV:-production} \
    NODE_ENV=${NODE_ENV:-production} \
    RAILS_LOG_TO_STDOUT=${RAILS_LOG_TO_STDOUT:-yes}

ADD . ./

EXPOSE 8080
CMD bundle exec puma -b tcp://0.0.0.0:8080
