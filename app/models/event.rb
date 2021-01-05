class Event < ApplicationRecord
  # Событие принадлежит юзеру
  belongs_to :user

  has_many :comments
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :photos
  # Валидируем юзера на присутствие. В Rails 5 связи 
  # валидируются по умолчанию
  validates :user, presence: true
  # Валидируем заголовок, он не может быть длиннее 255 букв
  validates :title, presence: true, length: {maximum: 255}
  # У события должны быть заполнены место и время
  validates :address, presence: true
  validates :datetime, presence: true

  def visitors
    (subscribers + [user]).uniq
  end
end
