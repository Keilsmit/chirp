class Post < ApplicationRecord
  validates :body, :user_id, presence: true
  validates :body, length: {in: 1..160}
  include PgSearch

  belongs_to :user

  def self.timeline(user)
   following_ids = user.followees(User).pluck(:id)
   all_ids = following_ids << user.id
   where(user_id: all_ids).order("created_at DESC")
  end

end
