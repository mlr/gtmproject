require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Event.destroy_all
    @organization = create(:organization)
    @event = create(:event, organization: @organization, message: "foo")

    # Simulates some time passing so we can assert around event order
    travel_to 5.minutes.from_now

    @other_org = create(:organization)
    @other_event = create(:event, organization: @other_org, message: "bar")
  end

  test "should get events for all organizations" do
    get events_url, as: :json
    assert_response :success
    response = JSON.parse(@response.body)
    assert_equal ["bar", "foo"], response.map { |e| e['message'] }
  end

  test "should get events for a specific organization" do
    get organization_events_url(@organization), as: :json
    assert_response :success
    response = JSON.parse(@response.body)
    assert_equal ["foo"], response.map { |e| e['message'] }
  end

  test "should get latest N events for an organization" do
    5.times { create(:event, organization: @organization, message: "foo") }
    get organization_events_url(@organization, latest: 5), as: :json
    assert_response :success
    response = JSON.parse(@response.body)
    assert_equal 5, response.count
  end

  test "should get all events if an invalid latest value is given" do
    5.times { create(:event, organization: @organization, message: "foo") }
    get organization_events_url(@organization, latest: "asdf"), as: :json
    assert_response :success
    response = JSON.parse(@response.body)
    assert_equal 6, response.count
  end

  test "should get all events if a negative limit value is given" do
    5.times { create(:event, organization: @organization, message: "foo") }
    get organization_events_url(@organization, latest: -1), as: :json
    assert_response :success
    response = JSON.parse(@response.body)
    assert_equal 6, response.count
  end

  test "should get events for an organization filtered by hostname" do
    Event.destroy_all
    create(:event, organization: @organization, message: "foo", hostname: "foobarbaz.com")
    create(:event, organization: @organization, message: "bar", hostname: "website.com")
    create(:event, organization: @organization, message: "baz", hostname: "website.com")

    get organization_events_url(@organization, hostname: "website.com"), as: :json
    assert_response :success
    response = JSON.parse(@response.body)
    assert_equal ["bar", "baz"], response.map { |e| e['message'] }
  end

  test "should create event" do
    assert_difference('Event.count') do
      post organization_events_url(@organization),
        params: { event: {
          hostname: @event.hostname,
          message: @event.message,
          timestamp: @event.timestamp
      } }, as: :json
    end

    assert_response 201
  end
end
