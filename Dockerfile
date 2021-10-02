FROM ruby:3.0.2

ARG app=/opt/app
WORKDIR $app

ADD Gemfile Gemfile.lock ./
RUN gem install bundler && \
    bundle config set deployment 'false' && \
    bundle config set with 'development' && \
    bundle install

ENV RAILS_ROOT=$app \
    RAILS_ENV=${RAILS_ENV:-production} \
    RACK_ENV=${RAILS_ENV:-production} \
    NODE_ENV=${NODE_ENV:-production} \
    RAILS_LOG_TO_STDOUT=${RAILS_LOG_TO_STDOUT:-yes}

ADD . ./

EXPOSE 8080
CMD bundle exec puma -b tcp://0.0.0.0:8080
