class Article < ApplicationRecord
  validates_presence_of :title, :content, :slug
  validates :slug, uniqueness: { case_sensitive: false }

  scope :recent, -> { order(created_at: :desc) }
end
