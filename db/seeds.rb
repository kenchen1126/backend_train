require 'faker'
# first user
user = User.create(name: "Ken", email: "banacat@example.com", password: "banacat" )
# 測試資料
user.tasks.create(name: "吃飯",
description: Faker::Lorem.paragraph,
start_at: Faker::Time.backward(days: 2, period: :morning),
end_at: Faker::Time.forward(days: 4, period: :evening),
priority: Task.priorities.values.sample,
status: Task.statuses.values.sample
)
user.tasks.create(name: "做作業",
description: Faker::Lorem.paragraph,
start_at: Faker::Time.backward(days: 2, period: :morning),
end_at: Faker::Time.forward(days: 4, period: :evening),
priority: Task.priorities.values.sample,
status: Task.statuses.values.sample
)
user.tasks.create(name: "玩電腦",
description: Faker::Lorem.paragraph,
start_at: Faker::Time.backward(days: 2, period: :morning),
end_at: Faker::Time.forward(days: 4, period: :evening),
priority: Task.priorities.values.sample,
status: Task.statuses.values.sample
)


