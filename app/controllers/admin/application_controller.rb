# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    load_and_authorize_resource :class => :admin
    rescue_from CanCan::AccessDenied, with: :handle_access_denied

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end

    private

		  def handle_access_denied
		  	if user_signed_in?
		      redirect_to :root, notice: "Access was denied."
		    else
		    	redirect_to new_user_session_path, notice: "Authorization required."
		    end
		  end
  end
end
