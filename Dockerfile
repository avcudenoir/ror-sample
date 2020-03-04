# Strict version applied, Gemfile declares it and fails when there is a difference
FROM ruby:2.6.3

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# v8 runtime -- dependency for execjs
RUN apt update ; apt install -y nodejs yarn

# Keep the app data in /srv
RUN mkdir -p /srv
WORKDIR /srv

# Dependencies for RoR app
COPY . /srv
RUN yarn install
RUN bundle install
