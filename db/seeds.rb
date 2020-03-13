# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Habit.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('habits')
HabitRecord.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('habit_records')
Category.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('categories')
CategoryScore.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('category_scores')
LifeWheel.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('life_wheels')
MoodRecord.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('mood_records')
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')



users = User.create([{email: 'alona@alona.com', name: 'Alona', password: '123'},
                    {email: 'calvin@calvin.com', name: 'Calvin', password: '123'},
                   ])

habits = Habit.create([{name: 'hydrate', user: users[0], start_date: Date.new(2020, 2, 3), end_date: Date.new(2020, 4, 7)},
                       {name: 'jumping jacks', user: users[0], start_date: Date.new(2020, 3, 2), end_date: Date.new(2020, 7, 4)} 
                      ])

habit_records = HabitRecord.create([{habit: habits[0], yes_date: Date.new(2020, 3, 12)},
                                   {habit: habits[0], yes_date: Date.new(2020, 3, 11)}])

mood_records = MoodRecord.create([{user: users[0], date: Date.new(2020, 3, 12), mood: 3}, {user: users[0], date: Date.new(2020, 3, 11), mood: 4}])


categories = Category.create([{name: 'Health', user: users[0]},
                              {name: 'Family', user: users[0]},
                              {name: 'Career', user: users[0]}
                              ])

life_wheels = LifeWheel.create([{name: 'Winter', date: Date.new(2020, 1, 1), user: users[0]},
                                {name: 'Spring', date: Date.new(2020, 3, 10), user: users[0]}])

category_scores = CategoryScore.create([{category: categories[0], life_wheel: life_wheels[0], score: 7, comment: 'need to eat more vitamins'},
                                        {category: categories[1], life_wheel: life_wheels[0], score: 10},
                                        {category: categories[2], life_wheel: life_wheels[0], score: 3, comment: 'start the job search'},
                                        {category: categories[0], life_wheel: life_wheels[1], score: 4, comment: 'always tired - figure out why'},
                                        {category: categories[1], life_wheel: life_wheels[1], score: 6, comment: 'call my parents more often'},
                                        {category: categories[2], life_wheel: life_wheels[1], score: 10, comment: 'best job ever!'}])