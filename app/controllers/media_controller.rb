# frozen_string_literal: true

class MediaController < ApplicationController
  def show
    external_id = params[:id]
    media = MediaInfoService.find_or_fetch_by_external_id(external_id)

    if media
      render json: media
    else
      render json: { error: 'Media not found' }, status: :not_found
    end
  end
end
