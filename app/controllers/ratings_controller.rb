class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  before_action :set_burger, only: [:new, :create, :index]

  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = @burger.ratings
  end

  # GET /ratings/1
  # GET /ratings/1.jsonuuu
  def show
  end

  # GET /ratings/new
  def new
    
    @rating = @burger.ratings.new
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = @burger.ratings.new(rating_params)
    @rating.user = current_user

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @burger, notice: 'Rating was successfully created.' }
        format.json { render :show, status: :created, location: @rating }
      else
        format.html { render :new }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @burger, notice: 'Rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to @burger, notice: 'Rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      set_burger
      @rating = @burger.ratings.find(params[:id])
    end

    def set_burger
      @burger = Burger.find(params[:burger_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:meat_rating, :cheese_rating, :toppings_rating, :bun_rating, :user_id, :burger_id)
    end
end
