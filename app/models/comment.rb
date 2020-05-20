#comment model
class Comment < ApplicationRecord
    #this is a polymorphic association, a comment can belong to either a post or another comment(as a reply), here commentable refers to either post or comment
    belongs_to :commentable, polymorphic: true

    # a comment can have infact many comments i.e replies
    has_many :comments, as: :commentable

    # a comment belongs to a user
    belongs_to :user
end
