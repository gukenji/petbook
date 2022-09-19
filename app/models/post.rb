class Post < ApplicationRecord
  belongs_to :user


  def self.timestamp(id)
    post_time = Post.find(id).created_at
    diff = Time.now-post_time
    days, diff = diff.divmod(86400)
    hours, diff = diff.divmod(3600)
    mins, diff = diff.divmod(60)
    { days: days, h: hours, min: mins}
  end

end
