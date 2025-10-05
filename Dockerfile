FROM ruby:3.3

WORKDIR /app
COPY . .

RUN gem install bundler && bundle install

EXPOSE 3000
CMD ["bash", "-c", "bundle exec rails s -p 3000 -b '0.0.0.0'"]
