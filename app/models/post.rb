class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w( Fiction Non-Fiction)}
    validates :not_clickbaity

    def not_clickbaity
        if !title.include?("Won't Believe") || !title.include?("Secret") || !title.include?("Top [number]") || !title.include?("Guess")
            errors.add(:title, "Not click baity")
        end
    end


end
