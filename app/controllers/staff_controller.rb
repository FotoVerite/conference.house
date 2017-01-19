# StaffController inherits from ApplicationController
# It contains methods common to all staff area controllers.
#
# All staff area controllers should inherit from StaffController
# and NOT from Application Controller.
#
class StaffController < ApplicationController

  before_action :confirm_staff_login

  layout "staff"

  private

end
