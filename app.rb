# frozen_string_literal: true

$LOAD_PATH << File.expand_path('.', __dir__)
ENV['APP_ENV'] ||= 'development'

require 'bundler'
Bundler.require(:default, ENV['APP_ENV'])

require 'sinatra'
require 'json'

def full_path(route)
  return route unless %w[staging production].include? ENV['APP_ENV']

  "/#{ENV['APP_ENV']}#{route}"
end


### APP CODE STARTS HERE ###

get '/' do
  status 200
  erb :index
end
