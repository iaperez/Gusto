class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:show]
  authorize_resource decent_exposure: true

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_store
    @store = Store.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def store_params
    params.require(:store).permit(:name,
                                  :prices,
                                  :busyness,
                                  :noise,
                                  :adventure,
                                  :convenience,
                                  :bargain,
                                  :website,
                                  :description,
                                  :img_url,
                                  :category_ids,
                                  :style_ids,
                                  :scent_ids,
                                  :music_style_ids,
                                  :air_type_ids,
                                  :categories_list,
                                  :styles_list,
                                  :personalities_list,
                                  :scents_list,
                                  :music_styles_list,
                                  :air_types_list,
                                  :variety,
                                  :sales,
                                  :discounts,
                                  :size,
                                  :organization,
                                  :customer_service,
                                  :parking,
                                  :public_transit,
                                  :stores_nearby,
                                  :accessible,
                                  :image,
                                  :thumbnail1,
                                  :thumbnail2,
                                  :thumbnail3)
  end
end
