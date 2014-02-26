class LotsController < ApplicationController
  def show
    @lot = Lot.find(params[:id])
  end

  private

  def lot_params
    params[:lot].permit(:lot_id)
  end

end
