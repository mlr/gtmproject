class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all

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
    @organization = Organization.find_by!(slug: params[:id])
    @organization.destroy
  end

  private

    def organization_params
      params.require(:organization).permit(:name, :slug)
    end
end
