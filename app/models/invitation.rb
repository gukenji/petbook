class Invitation < ApplicationRecord
  belongs_to :invited_user, class_name: "User"
  belongs_to :requesting_user, class_name: "User"
end
