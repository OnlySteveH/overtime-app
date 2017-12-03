# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.

# if in the future I want to have a super_user, editor_user, read-only_admin_user, etc.
# do this to avoid hardcoding AdminUser, via this custom method of list of users.
module Admin
  def self.admin_types
    ['AdminUser']
  end

  class ApplicationController < Administrate::ApplicationController
    # to ensure user is signed_in
    before_action :authenticate_user!
    before_action :authenticate_admin

    def authenticate_admin
      # authentication logic for admin
      # unless the current_user is of try the type of the list of admin_types of AdminUser,
      # give them this message and redirect to homepage,
      # otherwise if the object of admin_types is of AdminUser is present allow user
      # to proceed as admin.
      unless Admin.admin_types.include?(current_user.try(:type))
        flash[:alert] = "You are not authorized to access this page."
        redirect_to(root_path)
      end
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
