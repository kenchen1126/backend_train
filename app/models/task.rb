class Task < ApplicationRecord
  validates :name, presence: true

  enum status: [task_status_enum(:pending), task_status_enum(:in_progress), task_status_enum(:done) ]
  enum priority: [task_priority_enum(:low), task_priority_enum(:medium), task_priority_enum(:high) ]
end
