require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "is invalid without an organization" do
    event = build(:event, organization_id: nil)
    assert_not event.valid?
  end
end
