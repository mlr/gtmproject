class OrganizationsController < ApplicationController
  include ActionController::MimeResponds

  def index
    @organizations = Organization.order(:created_at)

    render json: @organizations
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      render json: @organization, status: :created
    else
      render json: @organization.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @organization = Organization.find_by!(slug: params[:slug])
    @organization.destroy
  end

  def foreign_hosts
    @organizations = Organization.with_foreign_hostname
  end

  private

    def organization_params
      params.require(:organization).permit(:name)
    end
end
