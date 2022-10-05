class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def self.timestamp(id)
    post_time = Post.find(id).created_at
    diff = Time.now - post_time
    days, diff = diff.divmod(86_400)
    hours, diff = diff.divmod(3600)
    mins, diff = diff.divmod(60)
    { days: days, h: hours, min: mins }
  end

  def self.timelinePosts(user)
    friends = User.searchfriends(user.id)
    posts = []
    friends.each do |friend|
      posts << if user.id != friend.friend_id
                 Post.where(user_id: friend.friend_id)
               else
                 Post.where(user_id: friend.user_id)
               end
    end
    posts.flatten
  end
end
