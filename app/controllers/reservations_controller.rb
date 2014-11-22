class ReservationsController < ApplicationController

  def create
    @present = Present.find(params[:present_id])
    @present.reserver = current_user
    @present.save!
    redirect_to present_path(@present.user)
  end

  def destroy
    @present = Present.find(params[:present_id])
    @present.update_column(:reserved_by_id, nil)
    redirect_to present_path(@present.user)
  end

end
