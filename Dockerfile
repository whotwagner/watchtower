FROM ruby:latest
RUN mkdir /app
ADD . /app/
RUN cd /app && mkdir data && bundle install
WORKDIR /app
ENTRYPOINT ["/app/watchtower"]
