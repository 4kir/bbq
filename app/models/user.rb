class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :omniauthable, omniauth_providers: [:facebook, :vkontakte]

  # Юзер может создавать много событий
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :name, presence: true, length: {maximum: 35}
  validates :email, length: {maximum: 255}, uniqueness: true
  validates :email, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  private

  def self.find_for_oauth(access_token)
    # Достаём email из токена
    email = access_token.info.email
    user = where(email: email).first

    # Возвращаем, если нашёлся
    return user if user.present?

    # Если не нашёлся, достаём провайдера, айдишник и урл
    provider = access_token.provider
    id = access_token.extra.raw_info.id

    if provider == "facebook"
      url = "https://facebook.com/#{id}"
    elsif provider == "vkontakte"
      url = "https://vk.com/#{id}"
    end

    where(url: url, provider: provider).first_or_create! do |user|
      # Если создаём новую запись, прописываем email и пароль
      user.email = email
      user.password = Devise.friendly_token.first(16)
      user.name = access_token.info.first_name
    end
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
      .update_all(user_id: self.id)
  end

  def send_devise_notification(notification, *args)
      devise_mailer.send(notification, self, *args).deliver_later
  end
end
