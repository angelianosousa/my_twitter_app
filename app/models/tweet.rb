class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :declaration, presence: true, length: { maximum: 200 }

  def like(user_id)
    self.likes.create user_id: user_id
  end

  def dislike(user_id)
    self.likes.where(user_id: user_id).first.destroy
  end
end
