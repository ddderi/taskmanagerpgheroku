class User < ApplicationRecord
    before_validation :nameclean
    has_secure_password
    has_many :google_accounts
    has_many :user_tasks, dependent: :destroy
    has_many :tasks, through: :user_tasks
    #has_and_belongs_to_many :tasks
    validates :name, presence: true
    validate :passwordvalid?, on: :create
    validate :emailvalid?, on: :create
    

    def passwordvalid?
        errors.add(:password, 'must contains special sign "!@#$%&?" to be valid !') unless password =~ /[!@#$%&?]/
    end

    def emailvalid?
        errors.add(:email, 'is not an email format') unless email =~ /[.]/
    end
    
    def nameclean
        self.name = self.name.strip
    end
    
   


end
