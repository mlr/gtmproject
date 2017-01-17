require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "is invalid without an organization" do
    event = build(:event, organization_id: nil)
    assert_not event.valid?
  end

  test "is invalid without a message" do
    event = build(:event, message: "")
    assert_not event.valid?
  end

  test "is invalid without a hostname" do
    event = build(:event, hostname: "")
    assert_not event.valid?
  end

  test "is invalid without a timestamp" do
    event = build(:event, timestamp: "")
    assert_not event.valid?
  end

  test "is invalid with an invalid timestamp" do
    event = build(:event, timestamp: "foo")
    assert_not event.valid?
  end
end
