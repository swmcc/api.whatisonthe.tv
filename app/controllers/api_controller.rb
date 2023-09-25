# frozen_string_literal: true

require 'tvdb_api'

class ApiController < ApplicationController
  before_action :api

  def search
    query = params[:query]
    render json: query.present? ? api.search(query) : {}
  end

  def movie
    id = params[:id]
    render json: id.present? ? api.movie(id) : {}
  end

  def series
    id = params[:id]
    render json: id.present? ? api.series(id) : {}
  end

  def person
    id = params[:id]
    render json: id.present? ? api.person(id) : {}
  end

  private

  def api
    @api ||= TVDBApi.new
  end
end
