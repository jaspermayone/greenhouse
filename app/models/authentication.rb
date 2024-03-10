class Authentication
  attr_accessor :user

  def initialize(session, user)
    session[:current_authentication] = self
    @user = user
  end

  def destroy(session)
    session[:current_authentication] = nil
    @user = nil
  end
end
