FROM ruby:3.3.0-slim

RUN mkdir -p /greenhouse
WORKDIR /greenhouse

RUN apt-get -y update -qq

ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT="development" \
    BUNDLE_GEMFILE=Gemfile

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libpq-dev libvips pkg-config libcairo2-dev curl postgresql-client-15 libvips gnupg && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

RUN apt-get update && apt-get install -y nodejs

RUN gem install bundler -v 2.5.11

ADD package-lock.json /greenhouse/package-lock.json
ADD package.json /greenhouse/package.json
ADD .ruby-version /greenhouse/.ruby-version
ADD Gemfile /greenhouse/Gemfile
ADD Gemfile.lock /greenhouse/Gemfile.lock

RUN bundle install
RUN npm install

RUN ln -s /greenhouse/.rubocop.yml ~/.rubocop.yml
RUN ln -s /greenhouse/.rubocop_todo.yml ~/.rubocop_todo.yml

ADD . /greenhouse
# RUN bundle exec bootsnap precompile app/ lib/

# # RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# COPY --from=build /usr/local/bundle /usr/local/bundle
# COPY --from=build /greenhouse /greenhouse

# RUN useradd greenhouse --create-home --shell /bin/bash && \
#     chown -R greenhouse:greenhouse db log storage tmp
# USER greenhouse:greenhouse

# ENTRYPOINT ["/greenhouse/bin/docker-entrypoint"]

EXPOSE 3000
CMD ["./bin/rails", "server"]
