FROM ruby:2.6.3-stretch

COPY . /application

WORKDIR /application


RUN bundle install --deployment --without development  \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt install -y nodejs
    
ENV RAILS_ENV production

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    apt install -y nodejs


ENTRYPOINT ['./entrypoint.sh']