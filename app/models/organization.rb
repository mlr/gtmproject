class Organization < ApplicationRecord
  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  before_validation :set_slug

  def to_param
    slug
  end

  private

    def set_slug
      self[:slug] ||= name.parameterize
    end
end
