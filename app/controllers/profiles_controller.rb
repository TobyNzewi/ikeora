class ProfilesController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_current_profile

  def edit

  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html{ redirect_to profile_show_path, notice: "Profile successfully updated" }
      else
        format.html{ render :edit, alert: "Error updating profile" }
      end
    end
  end

  def show

  end

  def destroy
    respond_to do |format|
      if @profile.destroy
        format.html{ redirect_to root_path, notice: "Profile successfully removed" }
      else
        format.html{ redirect_to :back, alert: "Error occurred. Try again later"}
      end
    end
  end

  private

  def set_current_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :country, :occupation, :specialization,
                                    :phone_number, :age, :years_of_commitment, :date_of_birth, :user_id,
                                    :email, :account_type
    )
  end
end

