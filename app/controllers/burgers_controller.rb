class BurgersController < ApplicationController
  before_action :set_burger, only: [:show, :edit, :update, :destroy]

  authorize_resource

  # GET /burgers
  # GET /burgers.json
  def index
    @burgers = Burger.all
    
  end

  # GET /burgers/1
  # GET /burgers/1.json
  def show
    @reviews = Rating.where(burger_id: @burger.id).order("created_at DESC")
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review_meat = @reviews.average(:meat_rating)
      @avg_review_cheese = @reviews.average(:cheese_rating)
      @avg_review_toppings = @reviews.average(:toppings_rating)
      @avg_review_bun = @reviews.average(:bun_rating)
    end
  end

  # GET /burgers/new
  def new
    @burger = Burger.new
  end

  # GET /burgers/1/edit
  def edit
  end

  # POST /burgers
  # POST /burgers.json

  def create

    @burger = Burger.new(burger_params)
    @burger.user_id = current_user.id
    respond_to do |format|
      if @burger.save
        format.html { redirect_to @burger, notice: 'Burger was successfully created.' }
        format.json { render :show, status: :created, location: @burger }
      else
        format.html { render :new }
        format.json { render json: @burger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /burgers/1
  # PATCH/PUT /burgers/1.json
  def update
    respond_to do |format|
      if @burger.update(burger_params)
        format.html { redirect_to @burger, notice: 'Burger was successfully updated.' }
        format.json { render :show, status: :ok, location: @burger }
      else
        format.html { render :edit }
        format.json { render json: @burger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /burgers/1
  # DELETE /burgers/1.json
  def destroy
    @burger.destroy
    respond_to do |format|
      format.html { redirect_to burgers_url, notice: 'Burger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_burger
      @burger = Burger.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def burger_params
      params.require(:burger).permit(:name, :price, :profile_picture, :restaurant_name, :restaurant_id)
    end
end
