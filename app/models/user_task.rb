class UserTask < ApplicationRecord
  belongs_to :user, optional: true, dependent: :delete
  belongs_to :task, optional: true, dependent: :delete
end
