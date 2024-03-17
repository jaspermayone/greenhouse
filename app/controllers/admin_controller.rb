class AdminController < ApplicationController
  include Authenticatable
  before_action :authenticate_user!, :ensure_super_admin!
end
