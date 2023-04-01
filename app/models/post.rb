class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_is_sufficiently_clickbait_y

    def title_is_sufficiently_clickbait_y
        unless title && title.match?(/(Won't Believe)|(Secret)|(Guess)|(Top\s\d)/)
            errors.add(:title, "title is insufficiently clickbait-y")
        end
    end
end
