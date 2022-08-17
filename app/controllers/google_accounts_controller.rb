class GoogleAccountsController < ApplicationController

    def index
        @google_accounts = Current.user.google_accounts
    end

end