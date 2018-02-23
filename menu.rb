ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym
require 'rubygems'
require 'sinatra/activerecord'
require './environments'
require './models/item'
require_relative 'routes'

class Items < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :public_folder, 'public', File.dirname(__FILE__)
  set :css_path, 'public/style.css'
  enable :sessions
  set :views, Proc.new { File.join(root, "views") }
  register Sinatra::ActiveRecordExtension
  use Rack::MethodOverride
end
