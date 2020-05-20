#like model
class Like < ApplicationRecord
    #a like belongs to a user
    belongs_to :user
    #a like belongs to a post
    belongs_to :post
end
