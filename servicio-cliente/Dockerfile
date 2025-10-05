FROM ruby:3.0
WORKDIR /app
COPY . .
RUN bundle install
CMD ["rails", "s", "-b", "0.0.0.0"]
