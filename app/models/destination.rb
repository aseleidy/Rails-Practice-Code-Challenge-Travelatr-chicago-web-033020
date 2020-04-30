class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def average_age
        blogger_ages = self.bloggers.map do |blogger|
            blogger.age
        end

        total_ages = blogger_ages.inject do |sum, age|
            sum + age
        end
        
        total_ages / blogger_ages.length
    end

    def most_recent
        posts_created_at = self.posts.sort_by do |post|
            post.created_at
        end

        posts_created_at.last(5)
    end
end
