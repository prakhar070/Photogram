class Post < ApplicationRecord
    self.per_page = 2
    has_one_attached:image
end
