class Profile < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :email, :user
  validates_presence_of :first_name, :last_name, :phone_number, :account_type,
                        :on => :update

  validate :account_type_included_in_admin_created, :on => :update

  after_update :update_user_email, :if => :email_changed?


  def update_user_email
    unless user.email == self.email
      user.update_attribute(:email, self.email)
    end
  end

  def account_type_included_in_admin_created
    errors.add(:account_type, "Must exist") unless AccountType.all_valid_types.include? account_type
  end

end
