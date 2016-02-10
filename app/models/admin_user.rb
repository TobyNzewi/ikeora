class AdminUser < ActiveRecord::Base
  after_create { |admin| admin.invite! }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable


  def password_required?
    new_record? ? false : super
  end

end
