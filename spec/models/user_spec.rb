require 'rails_helper'


# in the GEMFILE
# gem 'rspec-rails' 


# at the top of spec FOLDER 
# require 'rails-helper'


# In the console to generate folder 
# rails generate rspec:install

describe User do 
   
    it 'creates a user class' do 
        user = User.new
        expect(user).to be_kind_of(User)
    end

    it 'has a #passwordvalid? method' do 
        user = User.new
        expect(user).to respond_to(:passwordvalid?)
        
    end

    it 'has a #emailvalid? method' do 
        user = User.new
        expect(user).to respond_to(:emailvalid?)
    end

    it 'has a #nameclean method which should strip user name to avoid error in Database' do 
        user = User.new(email: 'test@live.fr', name: 'testname', password: 'password!@')
        expect(user).to respond_to(:nameclean)
        user = User.create(email: 'test@live.fr', name: ' namewspace', password: 'password!@')
        expect(user.name).to eq('namewspace')
    end

    it 'User cannot be created without a name' do 
        user = User.create(email: 'test@live.fr', name: '', password: 'password!@')
        expect(user).to_not be_valid
    end



    it 'has a method for including this /[.]/ in email format' do
        user = User.create(email: 'test', name: 'testname', password: 'password!@')
        expect(user).to_not be_valid
        user = User.create(email: 'test@live.fr', name: 'testname', password: 'password!@')
        expect(user).to be_valid
    end

    it '#passwordvalid? method should return false unless one of these signs are in the password "!@#$%&?"  ' do
        user = User.create(email: 'test@live.fr', name: 'testname', password: 'password')
        expect(user).to_not be_valid
    end

    


# check if user have manager method : checking if user.manager exist ?

    it 'have a manager row' do 
        user = User.new
        expect(user).to respond_to(:manager)
        
    end


# check if user has a manager false method 
  

    it 'responds to the manager row' do
        user = User.new 
        expect(user.manager).to eq false
    end


end