class Post < ApplicationRecord
  validates :title, presence: true
  enum status: [:draft, :published]

  scope :active, -> {where(active: true)}
end
