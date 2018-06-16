class RedeemItemsController < ApplicationController
  before_action :set_redeem_item, only: [:show, :edit, :update, :destroy]

  # GET /redeem_items
  # GET /redeem_items.json
  def index
    @redeem_items = RedeemItem.all
  end

  # GET /redeem_items/new
  def new
    @redeem_item = RedeemItem.new
  end

  # GET /redeem_items/1/edit
  def edit
  end

  # POST /redeem_items
  # POST /redeem_items.json
  def create
    @redeem_item = RedeemItem.new(redeem_item_params)

    respond_to do |format|
      if @redeem_item.save
        format.html { redirect_to redeem_items_url, notice: 'Redeem item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @redeem_item.update(redeem_item_params)
        format.html { redirect_to redeem_items_url, notice: 'Redeem item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
 
  def destroy
    @redeem_item.destroy
    respond_to do |format|
      format.html { redirect_to redeem_items_url, notice: 'Redeem item was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_redeem_item
      @redeem_item = RedeemItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def redeem_item_params
      params.require(:redeem_item).permit(:name, :cost)
    end
end
