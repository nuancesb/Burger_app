class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @burgers = Burger.all
  end
end
