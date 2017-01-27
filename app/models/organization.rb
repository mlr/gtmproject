class Organization < ApplicationRecord
  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  before_validation :set_slug

  has_many :events, dependent: :destroy

  def to_param
    slug
  end

  NATIVE_HOSTNAMES = ["com", "net", "edu", "gov"].freeze

  def self.with_foreign_hostname
    query = NATIVE_HOSTNAMES.inject([]) do |parts, tld|
      parts << "hostname LIKE '%.#{tld}'"
      parts
    end.join(" OR ")

    joins(:events).where.not(query)
  end

  private

    def set_slug
      self[:slug] ||= name.parameterize
    end
end
