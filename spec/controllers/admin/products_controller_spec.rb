require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Admin::ProductsController do

  # This should return the minimal set of attributes required to create a valid
  # Admin::Product. As you add validations to Admin::Product, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Admin::ProductsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all admin_products as @admin_products" do
      product = Admin::Product.create! valid_attributes
      get :index, {}, valid_session
      assigns(:admin_products).should eq([product])
    end
  end

  describe "GET show" do
    it "assigns the requested admin_product as @admin_product" do
      product = Admin::Product.create! valid_attributes
      get :show, {:id => product.to_param}, valid_session
      assigns(:admin_product).should eq(product)
    end
  end

  describe "GET new" do
    it "assigns a new admin_product as @admin_product" do
      get :new, {}, valid_session
      assigns(:admin_product).should be_a_new(Admin::Product)
    end
  end

  describe "GET edit" do
    it "assigns the requested admin_product as @admin_product" do
      product = Admin::Product.create! valid_attributes
      get :edit, {:id => product.to_param}, valid_session
      assigns(:admin_product).should eq(product)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Admin::Product" do
        expect {
          post :create, {:admin_product => valid_attributes}, valid_session
        }.to change(Admin::Product, :count).by(1)
      end

      it "assigns a newly created admin_product as @admin_product" do
        post :create, {:admin_product => valid_attributes}, valid_session
        assigns(:admin_product).should be_a(Admin::Product)
        assigns(:admin_product).should be_persisted
      end

      it "redirects to the created admin_product" do
        post :create, {:admin_product => valid_attributes}, valid_session
        response.should redirect_to(Admin::Product.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved admin_product as @admin_product" do
        # Trigger the behavior that occurs when invalid params are submitted
        Admin::Product.any_instance.stub(:save).and_return(false)
        post :create, {:admin_product => {  }}, valid_session
        assigns(:admin_product).should be_a_new(Admin::Product)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Admin::Product.any_instance.stub(:save).and_return(false)
        post :create, {:admin_product => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested admin_product" do
        product = Admin::Product.create! valid_attributes
        # Assuming there are no other admin_products in the database, this
        # specifies that the Admin::Product created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Admin::Product.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => product.to_param, :admin_product => { "these" => "params" }}, valid_session
      end

      it "assigns the requested admin_product as @admin_product" do
        product = Admin::Product.create! valid_attributes
        put :update, {:id => product.to_param, :admin_product => valid_attributes}, valid_session
        assigns(:admin_product).should eq(product)
      end

      it "redirects to the admin_product" do
        product = Admin::Product.create! valid_attributes
        put :update, {:id => product.to_param, :admin_product => valid_attributes}, valid_session
        response.should redirect_to(product)
      end
    end

    describe "with invalid params" do
      it "assigns the admin_product as @admin_product" do
        product = Admin::Product.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Admin::Product.any_instance.stub(:save).and_return(false)
        put :update, {:id => product.to_param, :admin_product => {  }}, valid_session
        assigns(:admin_product).should eq(product)
      end

      it "re-renders the 'edit' template" do
        product = Admin::Product.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Admin::Product.any_instance.stub(:save).and_return(false)
        put :update, {:id => product.to_param, :admin_product => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested admin_product" do
      product = Admin::Product.create! valid_attributes
      expect {
        delete :destroy, {:id => product.to_param}, valid_session
      }.to change(Admin::Product, :count).by(-1)
    end

    it "redirects to the admin_products list" do
      product = Admin::Product.create! valid_attributes
      delete :destroy, {:id => product.to_param}, valid_session
      response.should redirect_to(admin_products_url)
    end
  end

end
