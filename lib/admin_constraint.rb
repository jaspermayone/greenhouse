# frozen_string_literal: true

# Used to restrict access of things to admins. See routes.rbfor more info.
class AdminConstraint
  # check to see if the signed in user is an admin

  def matches?(request)
    return false unless request.session[:user_id]

    user = User.find(request.session[:user_id])
    user&.admin?
  end

end
