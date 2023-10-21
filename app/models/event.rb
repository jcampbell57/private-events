class Event < ApplicationRecord
  validates :date, presence: true
  validates :location, presence: true

  belongs_to :creator, class_name: 'User'

  has_many :event_attendees
  has_many :attendees, through: :event_attendees, source: :user

  scope :future, -> { where('date > ?', Date.today) }
  scope :past, -> { where('date < ?', Date.today) }
end
