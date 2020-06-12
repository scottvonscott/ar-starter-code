class Category < ActiveRecord::Base
    has_many :tasks
    has_many :users, through: :tasks
    has_many :task_creators, through: :tasks, source: :creator
end