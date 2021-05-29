require 'faker'

100.times do 
  Task.create(name: Faker::Lorem.word,
              description: Faker::Lorem.paragraph,
              start_at: Faker::Time.backward(days: 2, period: :morning),
              end_at: Faker::Time.forward(days: 4, period: :evening),
              priority: Task.priorities.values.sample,
              status: Task.statuses.values.sample
  )
end
