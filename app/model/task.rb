class Task < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    belongs_to :creator, class_name: "User"
end