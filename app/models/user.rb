class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_one :profile, :dependent => :destroy

  after_create :create_profile
  after_update :update_profile_email, :if => :email_changed?

  # for facebook omniauth sign-in
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # user.image = auth.info.image # todo add image sometimes
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def create_profile
    Profile.create(email: self.email, user: self)
  end

  def update_profile_email
    unless profile.email == self.email
      profile.update_attribute(:email, self.email)
    end
  end
end
