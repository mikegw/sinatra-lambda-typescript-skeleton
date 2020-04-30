# Sinatra Lambda Skeleton

## What's included?

- `app.rb`: A Sinatra application that can be run locally
- `serverless.yml`: Configuration for a lambda-backed API gateway in AWS
- `lambda.rb`: A wrapper to convert requests between AWS lambda events and Rack Requests
- Typescript Skeleton (using Node 10 & webpack, bundled to `public/main.js`)
- Testing using RSpec for the back-end & Mocha/Chai for the front-end
- [COMMENTED] S3 setup

## Requirements

- `ruby 2.5.8`
- `bundler`
- `node 10`
- `npm`
- AWS Credentials in a `.aws/credentials` file

## Setup

To set up, run the following:
```
rvm use 2.5.8
bundle install

npm install
webpack
```

## Running locally

```
ruby app.rb
```

## Deployment

```
bin/deploy
bin/deploy test
bin/deploy production
```
