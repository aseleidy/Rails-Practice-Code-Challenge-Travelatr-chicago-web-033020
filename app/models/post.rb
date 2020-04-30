class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    # before
    before_validation :set_likes_to_zero

    # validations
    validates_presence_of :title
    validates :content, length: { minimum: 100 }

    def set_likes_to_zero
        if self.likes == nil
            self.likes = 0
        end
    end
end
