# frozen_string_literal: true

require 'tvdb_api'

class ApiController < ApplicationController
  before_action :api

  def search
    render json: process_request(:search, :query)
  end

  def movie
    render json: process_request(:movie, :id)
  end

  def series
    render json: process_request(:series, :id)
  end

  def person
    render json: process_request(:person, :id)
  end

  private

  def api
    @api ||= TVDBApi.new
  end

  def process_request(api_method, param_key)
    param_value = params[param_key]
    param_value.present? ? api.send(api_method, param_value) : {}
  end
end
