class Event < ApplicationRecord
  # Событие принадлежит юзеру
  belongs_to :user

  has_many :comments, dependent: :delete_all
  has_many :subscriptions, dependent: :delete_all
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :photos, dependent: :delete_all
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

  def pincode_valid?(pin2chek)
    pincode == pin2chek
  end
end
