class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id', dependent: :destroy

  has_many :event_attendees, dependent: :destroy
  has_many :attended_events, through: :event_attendees, source: :event, foreign_key: 'attendee_id'
end
