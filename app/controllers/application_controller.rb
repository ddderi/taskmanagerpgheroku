class ApplicationController < ActionController::Base
    
     before_action :current_user

    private


    def current_user
        #  @user = (User.find_by(id: session[:user_id]) || User.new )
        if session[:user_id]
        Current.user = (User.find_by(id: session[:user_id]) || User.create(id: session[:user_id]))
        end
        # || User.new 
    end

    def isadmin?
        current_user.manager != false
    end

    def admin
        return redirect_to(controller: 'welcome', action: 'home'), flash[:message] = "Not authorized to be here" unless isadmin?
    end

    def logged_in?
        current_user.id != nil 
    end

    def require_logged_in
        return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
      end
end
