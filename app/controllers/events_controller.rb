class EventsController < ApplicationController
  before_action :set_organization

  def index
    @events = Event.order("created_at DESC")

    if organization_id
      @events = @events.where(organization: @organization)
    end

    if limit_value
      @events = @events.limit(limit_value)
    end

    if filter_params.presence
      filter_params.each do |filter, value|
        @events = @events.where("#{filter} = ?", value)
      end
    end

    render json: @events
  end

  def create
    @event = @organization.events.new(event_params)

    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  private

    def organization_id
      params[:organization_id]
    end

    def set_organization
      @organization = Organization.find_by(slug: organization_id)
    end

    def event_params
      params.require(:event).permit(:message, :hostname, :timestamp)
    end

    def limit_value
      params.permit(:latest)[:latest]
    end

    def filter_params
      params.permit(:hostname)
    end
end
