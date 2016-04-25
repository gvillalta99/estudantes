FROM ruby:2.3.0
MAINTAINER gvillalta99@gmail.com

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

ADD . /app
ENTRYPOINT ["bundle", "exec"]
