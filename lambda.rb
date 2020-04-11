# frozen_string_literal: true

require 'app'

def call_api(event:, context:)
  env = build_sinatra_env(event)

  rack_response = Sinatra::Application.call(env)
  build_aws_api_gateway_response(rack_response)
rescue StandardError => e
  puts e.message
  puts e.backtrace
  {
    'statusCode' => 500,
    'body' => e
  }
end

def build_sinatra_env(event)
  puts event
  env = {
    'REQUEST_METHOD' => event['httpMethod'],
    'SCRIPT_NAME' => '',
    'PATH_INFO' => event['path'] || '',
    'QUERY_STRING' => query_string(event['queryStringParameters']) || '',
    'SERVER_NAME' => 'localhost',
    'SERVER_PORT' => 443,

    'rack.version' => Rack::VERSION,
    'rack.url_scheme' => 'https',
    'rack.input' => StringIO.new(event['body'] || ''),
    'rack.errors' => $stderr
  }

  event['headers']&.each { |key, value| env[key] = "HTTP_#{value}" }
  puts env
  env
end

def build_aws_api_gateway_response(rack_response)
  status_code, headers, body = *rack_response

  body_string = ''
  body.each { |item| body_string += item }

  {
    statusCode: status_code,
    headers: headers,
    body: body_string
  }
end

def query_string(hash)
  return unless hash.is_a?(Hash)

  hash.to_a.map { |x| "#{x[0]}=#{x[1]}" }.join('&')
end
