class UserPost < ApplicationRecord
  def user
    User.find_by(id: self.user_id)
  end
end
