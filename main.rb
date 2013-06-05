require 'rubygems'
require 'sinatra'
require 'redis'
require 'uri'

$redis = Redis.new

class MinStore < Sinatra::Base
  set :public_folder, File.dirname(__FILE__) + '/public'

  helpers do
    def production?
      # are we in production?
      ENV['RACK_ENV'] && ENV['RACK_ENV'].strip == 'production'
    end
  end

  get "/min-store.js" do
    # serve the client js
    content_type 'application/javascript'
    erb : 'min-store.js'
  end

  get '/:key' do
    # return this key's value
  end

  delete '/:key' do
    # delete this key out of redis and mongo(?)
  end

  post '/:key/:value' do
    # create a key and give it this value, replacing any existing key
  end

  patch '/increment/:key/:value' do
    # modify a key and increment by this value
  end

  patch '/decrement/:key/:value' do
    # modify a key and decrement it by this value
  end
end