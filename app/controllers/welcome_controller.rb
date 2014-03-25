require 'statsd'

class WelcomeController < ApplicationController



  def index
    ## Added this for Level 2 to 4
    my_statsd = Statsd.new 'localhost', 8125

    ## Added this for Level 2 to 3
    my_statsd.increment 'page.views', :tags => ["support"]
    my_statsd.histogram 'page.latency', rand(100), :tags => ["support"]
    my_statsd.increment 'page.views', :tags => ["page:home"]

    ## Added this for Level 4
    my_statsd.count 'page.overall_views', rand(100), :tags => ["page:home"]
  end


  def manageUsers
  end


  def managePosts   
  end


end
