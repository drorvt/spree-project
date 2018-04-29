FROM ruby:2.4.1

MAINTAINER Eyal.stoler@kenshoo.com

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get install -y imagemagick
RUN apt-get update
RUN gem install mysql2

ENV APP_HOME /app


ARG MYSQL_DATABASE='innodb'
#ARG MYSQL_DATABASE='spree'
ARG MYSQL_HOST='127.0.0.1'
ARG MYSQL_PASSWORD
ARG MYSQL_USER='root'

ARG MYSQL_PORT=3306


# ENV MYSQL_DATABASE $MYSQL_DATABASE 
# ENV MYSQL_HOST $MYSQL_HOST
# ENV MYSQL_PASSWORD $MYSQL_PASSWORD
# ENV MYSQL_USER $MYSQL_USER

ENV MYSQL_DATABASE ${MYSQL_DATABASE}
ENV MYSQL_USER ${MYSQL_USER}
ENV MYSQL_PASSWORD ${MYSQL_PASSWORD}
ENV MYSQL_HOST ${MYSQL_HOST}
ENV MYSQL_PORT ${MYSQL_PORT}

ENV APP_HOME /app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

RUN rails db:migrate

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
