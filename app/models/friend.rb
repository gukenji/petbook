class Friend < ApplicationRecord
  belongs_to :friend, class_name: "User"
  belongs_to :user, class_name: "User"
end
