class OmniauthCallbackController < ApplicationController

    def google
       
        # @user = User.new(
        #     name: auth.info.name,
        #     email: auth.info.email
        # )
        # @user.save
        # if @user.save.valid?
        
        # @user.google_accounts.create(
        #     name: auth.info.name,
        #     email: auth.info.email,
        #     image: auth.info.image
        # )
        
        Current.user.google_accounts.create(
            name: auth.info.name,
            email: auth.info.email,
            image: auth.info.image

        )
        # session[:user_id] = Current.user.id
        redirect_to '/home'
        # end
        # else 
        #   redirect_to '/login', notice: "counldn't connect to your account"
        # end
    end

    def auth
        request.env['omniauth.auth']
    end
end

