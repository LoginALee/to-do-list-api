# frozen_string_literal: true

user = User.create(username: 'reizl', password: 'sample', email: 'example@gmail.com')
Todo.create(title: 'Buy food: milk, bread, fruits', done: false, user_id: user.id)
Todo.create(title: 'Imagine Dragons tickets', done: false, user_id: user.id)
