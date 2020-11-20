class Article < ApplicationRecord
  acts_as_paranoid
  validates :title, presence: true

  belongs_to :user
end
