class Task < ApplicationRecord
  enum status: { pending: 1, in_progress: 2, done: 3 }
  enum priority: { low: 1, medium: 2, high: 3 }
end
