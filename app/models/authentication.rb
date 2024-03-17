class Authentication
  def initialize(session, user)
    session[:current_authentication] = self
    @user_id = user.id
  end

  def destroy(session)
    session[:current_authentication] = nil
    @user_id = nil
  end

  def user
    User.find_by(id: @user_id)
  end

  def user=(user)
    @user_id = user.id
  end
end
