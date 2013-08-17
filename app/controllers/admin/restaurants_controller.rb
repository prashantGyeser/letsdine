class Admin::RestaurantsController < Admin::ApplicationController
  # GET /restaurants
  # GET /restaurants.json
  def index
    @admin_restaurants = Restaurant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_restaurants }
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @admin_restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_restaurant }
    end
  end

  # GET /restaurants/new
  # GET /restaurants/new.json
  def new
    @admin_restaurant = Restaurant.new
    20.times { @admin_restaurant.menu_items.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_restaurant }
    end
  end

  # GET /restaurants/1/edit
  def edit
    @admin_restaurant = Restaurant.find(params[:id])
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @admin_restaurant = Restaurant.new(params[:restaurant])
    @admin_restaurant.status = "open"
    
    respond_to do |format|
      if @admin_restaurant.save

        menu_items = MenuItem.all

        menu_items.each do |menu_item|
          if menu_item.name.empty?
            menu_item.destroy
          end
        end

        format.html { redirect_to @admin_restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render json: @admin_restaurant, status: :created, location: @restaurant }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /restaurants/1
  # PUT /restaurants/1.json
  def update
    @admin_restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @admin_restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to admin_restaurant_path, notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @admin_restaurant = Restaurant.find(params[:id])
    @admin_restaurant.destroy

    respond_to do |format|
      format.html { redirect_to admin_restaurants_url }
      format.json { head :no_content }
    end
  end

end
