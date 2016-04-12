class ProfilesController < ApplicationController
  def show
    @user = User.find_by_profile_name(params[:id])
    if @user
      @statuses = @user.statuses.all
      render action: 'show'
    else
      #To make Rails render a 404 error page
      render file: 'public/404', status: 404, formats: [:html]
    end

  end
end
