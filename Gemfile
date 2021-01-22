# frozen_string_literal: true

# AWS only supports 2.5.7 & 2.7.2
ruby '2.7.2'

source 'https://rubygems.org'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem 'aws-sdk-s3'
gem 'sinatra'
gem 'bundler'

group :development, :test do
  gem 'pry'
end

group :development do
  gem 'guard-rspec', require: false
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rspec'
end

group :test do
  gem 'rspec'
end
