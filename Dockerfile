FROM node:16.20.0 as node
FROM ruby:3.0.4

RUN apt-get update && apt-get install -y default-mysql-client

WORKDIR /cell_shift
COPY Gemfile Gemfile.lock /cell_shift/
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

COPY --from=node /usr/local/bin/node /usr/local/bin/node
COPY --from=node /usr/local/include/node /usr/local/include/node
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs && \
    ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm

RUN npm install --global yarn
RUN yarn install

EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
