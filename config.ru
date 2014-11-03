require 'bundler'
Bundler.require

Dir.glob('./{helpers,models,controllers}/*.rb').each do |file|
	require file
	puts "required #{file}"
end

require_relative 'connection.rb'

map('/entries'){ run EntriesController }
map('/users'){ run UsersController }
map('/sessions'){ run SessionsController }
map('/tags'){ run TagsController }
map('/'){ run WelcomeController }