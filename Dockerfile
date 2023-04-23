FROM ruby:3.2.0

# Install Node.js v18.12.1 and npm v9.4.0
RUN apt-get update && \
    apt-get install -y curl graphviz && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@9.4.0 && \
    apt-get install -y default-jre && \
    npm install -g @openapitools/openapi-generator-cli



WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle
COPY . .