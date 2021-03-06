class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  validates :recommend, presence: true
  validates :rating, presence: true

  validates :text, length: { maximum: 500 }
  validates_numericality_of :rating, inclusion: { in: 0..100 }
end
