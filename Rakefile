require 'bundler'
Bundler.require

require_relative 'connection'
require_relative 'models/user'
require_relative 'models/page'
require_relative 'models/tag'

require 'sinatra/activerecord/rake'


namespace :db do

  desc 'create blog database'
  task :create_db do
    conn = PG::Connection.open()
    conn.exec('CREATE DATABASE blog_db;')
    conn.close
  end
  desc 'drop blog database'
  task :drop_db do
    conn = PG::Connection.open()
    conn.exec('DROP DATABASE blog_db;')
    conn.close
  end

  desc 'create user with write access'
  task :create_user do
      user = User.new({username: "john"})
      user.password = "olsen"
      user.save
  end

  desc 'create page data'
  task :create_page1 do
      page = Page.new({header: "The lost Pokemon", article: "John Milton knew where it was!", tag: "dorky"})
      page.save
  end

  desc 'create page data'
  task :create_page2 do
      page = Page.new({header: "The life of pie", article: "What was this even from", tag: "even dorkier"})
      page.save
  end


end
