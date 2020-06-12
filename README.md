# ActiveRecord Starter Code

## Instructions 
- Fork and clone this repo 
- Go through each file and practice explaining what is happening in every file
- Create migrations for two models:
    - A `users` table with the following attributes: name, email, age
    - A `tasks` table with the following attributes: title, description, category, done (this should be a boolean value), due_date
    - A task should also belong_to a user 
- Set up the two models (these are files that should be added under the app folder). 
- Use the command `rake console` to start a pry session. Practice using the following commands with Users and Tasks: 
  - `.new` 
  - `.create`
  - `.update`
  - `.save`
  - `.destroy`
  - `.find_by`
- Pay attention to the return values and use the [documentation](https://guides.rubyonrails.org/active_record_basics.html) to find the many different ways you can use the same method. 


```
[1] pry(main)> user = User.create
=> #<User:0x00007fffdf810b00 id: 1, name: nil, age: nil, email: nil>
[2] pry(main)> user.name = "Bob"
=> "Bob"
[3] pry(main)> user.save
=> true
[4] pry(main)> user.tasks << Task.create(title: "Mow the lawn")
=> [#<Task:0x00007fffdf6e78c8
  id: 1,
  title: "Mow the lawn",
  description: nil,
  category_id: nil,
  complete: nil,
  due_date: nil,
  user_id: 1>]
[5] pry(main)> user.tasks.build(title: "Laundry")
=> #<Task:0x00007fffdf5468e8
 id: nil,
 title: "Laundry",
 description: nil,
 category_id: nil,
 complete: nil,
 due_date: nil,
 user_id: 1>
[6] pry(main)> user.save
=> true
[7] pry(main)> Task.all
=> [#<Task:0x00007fffdf855160
  id: 1,
  title: "Mow the lawn",
  description: nil,
  category_id: nil,
  complete: nil,
  due_date: nil,
  user_id: 1>,
 #<Task:0x00007fffdf854968
  id: 2,
  title: "Laundry",
  description: nil,
  category_id: nil,
  complete: nil,
  due_date: nil,
  user_id: 1>]
[8] pry(main)> Task.create(title: "Dishes", user_id: user.id)
=> #<Task:0x00007fffdee2f4d8
 id: 3,
 title: "Dishes",
 description: nil,
 category_id: nil,
 complete: nil,
 due_date: nil,
 user_id: 1>
[9] pry(main)> user.tasks
=> [#<Task:0x00007fffdf6e78c8
  id: 1,
  title: "Mow the lawn",
  description: nil,
  category_id: nil,
  complete: nil,
  due_date: nil,
  user_id: 1>,
 #<Task:0x00007fffdf5468e8
  id: 2,
  title: "Laundry",
  description: nil,
  category_id: nil,
  complete: nil,
  due_date: nil,
  user_id: 1>]
[10] pry(main)> user.first.tasks
NoMethodError: undefined method `first' for #<User id: 1, name: "Bob", age: nil, email: nil>
from /home/kamrinkennedy/.rvm/gems/ruby-2.6.1/gems/activemodel-5.2.4.3/lib/active_model/attribute_methods.rb:430:in `method_missing'
[11] pry(main)> User.first.tasks
=> [#<Task:0x00007fffdf73a370
  id: 1,
  title: "Mow the lawn",
  description: nil,
  category_id: nil,
  complete: nil,
  due_date: nil,
  user_id: 1>,
 #<Task:0x00007fffdf73a0f0
  id: 2,
  title: "Laundry",
  description: nil,
  category_id: nil,
  complete: nil,
  due_date: nil,
  user_id: 1>,
 #<Task:0x00007fffdf739e20
  id: 3,
  title: "Dishes",
  description: nil,
  category_id: nil,
  complete: nil,
  due_date: nil,
  user_id: 1>]
[12] pry(main)> task = user.tasks.third
=> nil
[13] pry(main)> user = User.first
=> #<User:0x00007fffdf98a990 id: 1, name: "Bob", age: nil, email: nil>
[14] pry(main)> task = user.tasks.third
=> #<Task:0x00007fffdfe69718
 id: 3,
 title: "Dishes",
 description: nil,
 category_id: nil,
 complete: nil,
 due_date: nil,
 user_id: 1>
[15] pry(main)> task.category.build(name: "Chores")
NoMethodError: undefined method `build' for nil:NilClass
from (pry):15:in `__pry__'
[16] pry(main)> task.build_category(name: "Chores")
=> #<Category:0x00007fffdfed96f8 id: nil, name: "Chores">
[17] pry(main)> user.tasks.class
=> Task::ActiveRecord_Associations_CollectionProxy
[18] pry(main)> task.category
=> #<Category:0x00007fffdfed96f8 id: nil, name: "Chores">
[19] pry(main)> task.save
=> true
[20] pry(main)> task.category
=> #<Category:0x00007fffdfed96f8 id: 1, name: "Chores">
[21] pry(main)> task.category.save
=> true
[22] pry(main)> task.category.users
=> [#<User:0x00007fffe00482a0 id: 1, name: "Bob", age: nil, email: nil>]
[23] pry(main)> task.category.name
=> "Chores"
[24] pry(main)> 
```