class Post < ApplicationRecord
    validates :text, presence: true
    belongs_to :user
    has_many :likes
    has_many :comments
    has_many :liked_user, through: :likes, source: :user
end
