require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  test "sets the slug using the name" do
    org = create(:organization, name: "ACME Inc.")
    assert_equal org.slug, "acme-inc"
  end
end
