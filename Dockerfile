FROM ruby:3.3.0

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get -y update -qq

# install postgresql-client for easy importing of production database & vim
# for easy editing of credentials
RUN apt-get -y install postgresql-client vim poppler-utils
ENV EDITOR=vim

# Install node18

RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update; apt-get install -y nodejs

# Install Git
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libvips pkg-config wget unzip curl gnupg2

RUN gem install bundler

ADD package-lock.json /usr/src/app/package-lock.json
ADD package.json /usr/src/app/package.json
ADD .ruby-version /usr/src/app/.ruby-version
ADD Gemfile /usr/src/app/Gemfile
ADD Gemfile.lock /usr/src/app/Gemfile.lock

ENV BUNDLE_GEMFILE=Gemfile \
  BUNDLE_JOBS=4 \
  BUNDLE_PATH=/usr/local/bundle

RUN bundle install
RUN npm install

# Rubocop can't find config when ran with solargraph inside docker
# https://github.com/castwide/solargraph/issues/309#issuecomment-998137438
RUN ln -s /usr/src/app/.rubocop.yml ~/.rubocop.yml
RUN ln -s /usr/src/app/.rubocop_todo.yml ~/.rubocop_todo.yml

ADD . /usr/src/app

EXPOSE 3000

# CMD ["./bin/rails", "server"]
CMD ["bundle", "exec", "rails", "server"]