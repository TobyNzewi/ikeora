class ProfilesController < InheritedResources::Base
  before_action :authenticate_user!

  private

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :country, :occupation, :specialization,
                                      :phone_number, :age, :years_of_commitment, :date_of_birth, :user_id)
    end
end

