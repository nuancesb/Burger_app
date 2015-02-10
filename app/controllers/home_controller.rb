class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @burgers = Burger.all
  end

  def my_profile
  end

  def about_us
  end


  def gallery
    @burgers = Burger.all
  end

  def review_a_burger
  end

  def london_burger_map
  end




  def faq
  end

  






















end
