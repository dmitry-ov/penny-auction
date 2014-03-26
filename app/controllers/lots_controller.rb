class LotsController < ApplicationController

  def index
    @lot_active = Lot.active
    @lot_future = Lot.future
    @lot_finished = Lot.finished
  end

  def show
    @lot = Lot.find(params[:id])
  end

  private

  def lot_params
    params[:lot].permit(:lot_id)
  end

end
