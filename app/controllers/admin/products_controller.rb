class Admin::ProductsController < Admin::BaseController
    inherit_resources

  respond_to :html
  #respond_to :js, only: [:create, :destroy]

  before_action :build_resource, only: [:index, :new]
  #before_action :collection, only: [:create, :destroy], if: -> { request.xhr? }

  before_action :admin_categories, only: [:new, :show, :edit, :update]

  private

  def admin_categories
    @admin_categories = Category.all
  end

  def build_resource_params
    [params.fetch(:product, {}).permit(:title, :description, :price,:category_id, :avatar, pictures_attributes: [:id, :avatar, :_destroy])]
  end

end
