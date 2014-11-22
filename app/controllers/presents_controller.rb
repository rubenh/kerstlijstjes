class PresentsController < ApplicationController

  before_filter :authenticate_user!

  def new
    @present = current_user.presents.new
  end

  def create
    @present = current_user.presents.new(permitted_params)
    if @present.save
      redirect_to present_path(current_user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @presents = Present.where(user_id: params[:id])
  end

  def edit
    @present = current_user.presents.find(params[:id])
  end

  def update
    @present = current_user.presents.find(params[:id])
    if @present.update_attributes(permitted_params)
      redirect_to present_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @present = current_user.presents.find(params[:id])
    @present.destroy!
    redirect_to present_path(current_user.id)
  end

  private

  def permitted_params
    params.require(:present).permit(:title)
  end

end
