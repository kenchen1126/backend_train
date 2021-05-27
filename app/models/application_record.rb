class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.task_status_enum(enum_value)
    I18n.t("activerecord.attributes.task.status.#{enum_value}")
  end
  def self.task_priority_enum(enum_value)
    I18n.t("activerecord.attributes.task.priority.#{enum_value}")
  end
end

