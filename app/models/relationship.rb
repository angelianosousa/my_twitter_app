class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User', counter_cache: true
  belongs_to :followed, class_name: 'User', counter_cache: true
  validates :followed_id, :follower_id, presence: true
  
  validates :folower_id, uniquiness: true
end
