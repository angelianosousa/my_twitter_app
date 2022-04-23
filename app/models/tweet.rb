class Tweet < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :likes, dependent: :destroy

  paginates_per 10

  validates :declaration, presence: true, length: { maximum: 200 }

  def like(user_id)
    self.likes.create user_id: user_id
  end

  def dislike(user_id)
    self.likes.where(user_id: user_id).first.destroy
  end
end
