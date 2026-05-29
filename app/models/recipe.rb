class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    validates :title, presence: true
    validates :cooking_time, :servings, numericality: { only_integer: true, greater_than: 0 }
    validates :spiciness, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
    validates :servings, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 10 }

    before_save :normalize_title

    scope :search_by_name, ->(query) { where("title LIKE ?", "%#{query}%") if query.present? }
    scope :cooking_time_less_than, ->(amount) { where("cooking_time < ?", cooking_time) if amount.present? }
    scope :spicy, ->  { where("spiciness >= 4") }
    scope :by_servings, ->(amount) { where(servings: amount) if amount.present? }
    scope :by_spiciness, ->(amount) { where(spiciness: amount) if amount.present? }

    def normalize_title
        self.title = title.downcase.strip.capitalize
    end
end
