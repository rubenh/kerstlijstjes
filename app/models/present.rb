class Present < ActiveRecord::Base

  belongs_to :user
  belongs_to :reserver, class_name: 'User', foreign_key: 'reserved_by_id'

  validates_presence_of :title,
                        :user_id


  def reserved?
    reserver.present?
  end

end
