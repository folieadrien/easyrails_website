class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  before_create :set_profile

  devise :database_authenticatable,
            :registerable,
            :recoverable,
            :rememberable,
            :trackable,
            :validatable,
            :omniauthable
  validates :email, :password, presence: true

  def self.get_by_provider provider, uid
    if provider.present? && uid.present?
      user = self.where(provider: provider, uid: uid).first
    end
  end

  def self.get_by_email email
    if email.present?
      user = self.where(email: email).first
    end
  end

  protected

  def set_profile
    self.create_profile
  end

end
