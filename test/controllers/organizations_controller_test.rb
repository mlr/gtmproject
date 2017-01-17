require 'test_helper'

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization = create(:organization)
  end

  test "should get index" do
    get organizations_url, as: :json
    assert_response :success
  end

  test "should create organization" do
    assert_difference('Organization.count') do
      post organizations_url, params: {
        organization: { name: "MyOrg" }
      }, as: :json
    end

    assert_response 201
  end

  test "should destroy organization" do
    assert_difference('Organization.count', -1) do
      delete organization_url(@organization), as: :json
    end

    assert_response 204
  end

  test "should destroy organization's events" do
    create(:event, organization: @organization)

    assert_difference -> { @organization.events.count }, -1 do
      delete organization_url(@organization), as: :json
    end
  end

  test "should not destroy other organizations' events" do
    other_org = create(:organization)
    create(:event, organization: other_org)

    assert_no_difference -> { other_org.events.count } do
      delete organization_url(@organization), as: :json
    end
  end
end
