module PresentsHelper

  def reserved_by_me?(present)
    current_user.id == present.reserver.id
  end

  def own_present?(present)
    current_user.id == present.user.id
  end
end
