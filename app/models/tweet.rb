class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :body,
    presence: true,
    length: { maximum: 200 }
end
