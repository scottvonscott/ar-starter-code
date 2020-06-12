class User < ActiveRecord::Base
    has_many :tasks
    has_many :categories, through: :tasks
    has_many :created_tasks, foreign_key: "creator_id", class_name: "Task"
end