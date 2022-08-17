class Task < ApplicationRecord
    has_many :user_tasks, dependent: :destroy
    has_many :users, through: :user_tasks
    validates :name, :description, :deadline, presence: true
    validates :deadline, comparison: { greater_than: Time.now, message: "cannot be before today"}
    validate :setdonedate

    def setdonedate
        # self.donedate = DateTime.now unless !self.done
        if self.done
            self.donedate = DateTime.now
        elsif !self.done
            self.donedate = nil
        end
    end

end
