class Post < ApplicationRecord
    validates :text, presence: true
    belongs_to :user
    has_many :likes
    has_many :comments
    has_many :liked_user, through: :likes, source: :user
    
    # あるユーザー（引数）が投稿にいいねしているかの真偽を返すメソッド
    def liking_user?(user)
        self.liked_user.pluck("id").include?(user.id)
    end
    #投稿のいいねの数を返すメソッド
    def liking_count
        self.liked_user.length
    end
end
