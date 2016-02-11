class Profile < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :email, :user
  validates_presence_of :first_name, :last_name, :phone_number,
                        :on => :update

  after_update :update_user_email, :if => :email_changed?



  def update_user_email
    unless user.email == self.email
      user.update_attribute(:email, self.email)
    end
  end

end
