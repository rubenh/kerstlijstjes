module ApplicationHelper

  def own_list?(user)
    current_user.id == user.id
  end

end
