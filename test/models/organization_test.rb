require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  test "sets the slug using the name" do
    org = create(:organization, name: "ACME Inc.")
    assert_equal org.slug, "acme-inc"
  end

  test "it requires a name" do
    org = build(:organization, name: "")
    assert_not org.valid?
  end

  test "it requires a unique name" do
    create(:organization, name: "ACME Inc.")
    org = build(:organization, name: "ACME Inc.")
    assert_not org.valid?
  end

  test "it requires a unique slug" do
    create(:organization, slug: "myslug")
    org = build(:organization, slug: "myslug")
    assert_not org.valid?
  end

  test ".with_foreign_hostname returns orgs with events that have a foreign hostname" do
    org = create(:organization)
    create(:event, organization: org, hostname: "foobar.co.ca")
    assert Organization.with_foreign_hostname.include?(org)
  end

  test ".with_foreign_hostname does not returns orgs with events with familar host names" do
    org = create(:organization)
    create(:event, organization: org, hostname: "foobar.com")
    assert_not Organization.with_foreign_hostname.include?(org)
  end
end
