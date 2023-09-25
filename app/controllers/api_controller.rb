# frozen_string_literal: true

require 'tvdb_api'

class ApiController < ApplicationController
  before_action :api

  def fetch_posts
    query = params[:query]
    puts api.search(query)
    render json: query.present? ? api.search(query) : {}
  end

  private

  def api
    @api ||= TVDBApi.new
  end
end
