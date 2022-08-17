class AdminController < ApplicationController
    before_action :require_logged_in
    before_action :admin

    def index
        @current = current_user
        @stats = User.where(manager: false)
    end


end
