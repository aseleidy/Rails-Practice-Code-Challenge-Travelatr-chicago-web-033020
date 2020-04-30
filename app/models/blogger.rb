class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    # validations
    validates_uniqueness_of :name
    validates_numericality_of :age, greater_than: 0
    validates :bio, length: { minimum: 30 }

    def featured_post
        sorted_posts = self.posts.sort_by do |post|
            post.likes
        end
        sorted_posts.last
    end
    
    def total_likes
         posts_likes = self.posts.map do |post|
            post.likes
        end

        posts_likes.inject do |sum, likes_num|
            sum + likes_num
        end
    end
    
end
