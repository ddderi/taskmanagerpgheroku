class WelcomeController < ApplicationController
  
  def home
    @current = current_user
  end
end
