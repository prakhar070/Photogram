class Post < ApplicationRecord
    self.per_page = 2
    has_one_attached:image
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :user

    validates :caption, presence: true, length: { minimum: 3 }
    validates :image, presence: true
end
