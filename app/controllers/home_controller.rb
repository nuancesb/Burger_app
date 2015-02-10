class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @burgers = Burger.all
  end

  def about_us
  end


  def gallery
  end

  def review_a_burger
  end

  def faq
  end






















end
