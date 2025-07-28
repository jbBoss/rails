class OrderedItemsController < ApplicationController
  before_action :set_ordered_item, only: %i[ show edit update destroy ]

  # GET /ordered_items or /ordered_items.json
  def index
    @ordered_items = OrderedItem.all
  end

  # GET /ordered_items/1 or /ordered_items/1.json
  def show
  end

  # GET /ordered_items/new
  def new
    @ordered_item = OrderedItem.new
  end

  # GET /ordered_items/1/edit
  def edit
  end

  # POST /ordered_items or /ordered_items.json
  def create
    @ordered_item = OrderedItem.new(ordered_item_params)

    respond_to do |format|
      if @ordered_item.save
        format.html { redirect_to @ordered_item, notice: "Ordered item was successfully created." }
        format.json { render :show, status: :created, location: @ordered_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ordered_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordered_items/1 or /ordered_items/1.json
  def update
    respond_to do |format|
      if @ordered_item.update(ordered_item_params)
        format.html { redirect_to @ordered_item, notice: "Ordered item was successfully updated." }
        format.json { render :show, status: :ok, location: @ordered_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ordered_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordered_items/1 or /ordered_items/1.json
  def destroy
    @ordered_item.destroy!

    respond_to do |format|
      format.html { redirect_to ordered_items_path, status: :see_other, notice: "Ordered item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordered_item
      @ordered_item = OrderedItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def ordered_item_params
      params.expect(ordered_item: [ :quantity, :price_in_cents, :order_id, :product_id ])
    end
end
