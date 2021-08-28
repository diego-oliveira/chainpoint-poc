class Api::V1::BadgeController < ApplicationController
  def create
    badge = Badge.new(badge_params)
    badge.validate!
    response = ChainpointService.submit(badge.to_cryptographic_hash)
    render json: { badge: badge, chainpoint_response: response }, status: 200
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :uuid, :issue_date)
  end
end
