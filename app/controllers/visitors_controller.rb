class VisitorsController < ApplicationController

  def index
    @users = User.all.order(name: :asc)
  end

end
