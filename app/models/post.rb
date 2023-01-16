class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
    validates :title_is_not_click_bait

    def title_is_not_click_bait
        title_must_include = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        if !title_must_include.any? { |word| title.include?(word) }
            errors.add(:title, "Not click bait-y enough!")
        end
    end
end
