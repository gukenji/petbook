class Invitation < ApplicationRecord
  belongs_to :invited_user, class_name: "User"
  belongs_to :requesting_user, class_name: "User"
  scope :invites_received, -> (user) { where('invited_user_id::int = ? ', user.id) }
end
