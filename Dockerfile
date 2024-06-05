FROM ruby:3.3.0-slim as base

WORKDIR /greenhouse

ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"


FROM base as build

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libpq-dev libvips pkg-config libcairo2-dev

COPY .ruby-version Gemfile Gemfile.lock ./
# RUN bundle install
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# COPY package.json package-lock.json ./
# RUN npm install

COPY . .

RUN bundle exec bootsnap precompile app/ lib/

RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile


FROM base

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y postgresql-client-15 libvips curl libjemalloc2  git && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives


COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /greenhouse /greenhouse

RUN useradd greenhouse --create-home --shell /bin/bash && \
    chown -R greenhouse:greenhouse db log storage tmp
USER greenhouse:greenhouse

ENTRYPOINT ["/greenhouse/bin/docker-entrypoint"]

EXPOSE 3000
CMD ["./bin/rails", "server"]