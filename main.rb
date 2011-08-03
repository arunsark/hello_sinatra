$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__))
require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'hello'
require 'pages'
