class Admin::ProductsController < Admin::BaseController
  before_action :set_admin_product, only: [:show, :edit, :update, :destroy]

  # GET /admin/products
  def index
    @admin_products = Product.all
  end

  # GET /admin/products/1
  def show
  end

  # GET /admin/products/new
  def new
    @admin_product = Product.new
  end

  # GET /admin/products/1/edit
  def edit
  end

  # POST /admin/products
  # POST /admin/products.json
  def create
    @admin_product = Product.new(admin_product_params)
    respond_to do |format|
      if @admin_product.save
        format.html { redirect_to [:admin, @admin_product], notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_product }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/products/1
  # PATCH/PUT /admin/products/1.json
  def update
    respond_to do |format|
      if @admin_product.update(admin_product_params)
        format.html { redirect_to [:admin, @admin_product], notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products/1
  # DELETE /admin/products/1.json
  def destroy
    @admin_product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_product
      @admin_product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_product_params
      params[:product].permit(:title, :description, :price, :avatar, pictures_attributes: [:id, :avatar, :_destroy])
    end
end
