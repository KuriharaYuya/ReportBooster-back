FROM ruby:3.2.2
RUN apt-get update && apt-get install -y graphviz

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle 
COPY . .
