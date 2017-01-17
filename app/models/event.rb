class Event < ApplicationRecord
  belongs_to :organization

  validates_presence_of :organization_id
  validates_presence_of :message, :hostname, :timestamp
end
