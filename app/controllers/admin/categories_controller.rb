class Admin::CategoriesController < Admin::BaseController
  before_action :set_admin_category, only: [:show, :edit, :update, :destroy]
  before_action :set_admin_categories, only: [:new, :edit, :show]

  # GET /admin/products
  def index
    @admin_categories = Category.all
  end

  # GET /admin/products/1
  def show
  end

  # GET /admin/products/new
  def new
    @admin_category = Category.new
  end

  # GET /admin/products/1/edit
  def edit
  end

  # POST /admin/products
  # POST /admin/products.json
  def create
    @admin_category = Category.new(admin_category_params)
    respond_to do |format|
      if @admin_category.save
        format.html { redirect_to [:admin, @admin_category], notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/products/1
  # PATCH/PUT /admin/products/1.json
  def update
    respond_to do |format|
      if @admin_category.update(admin_category_params)
        format.html { redirect_to [:admin, @admin_category], notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products/1
  # DELETE /admin/products/1.json
  def destroy
    @admin_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_category
      @admin_category = Category.find(params[:id])
      id = @admin_category.ancestry
      @parent_name = Category.find(id).name unless id == nil
    end

    def set_admin_categories
      @admin_categories = Category.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_category_params
      params[:category][:ancestry] = nil if params[:category][:ancestry] == ""
      params[:category].permit(:name, :ancestry)
    end
end
