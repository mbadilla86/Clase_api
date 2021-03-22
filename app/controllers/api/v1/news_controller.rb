class Api::V1::NewsController < ApplicationController
  before_action :set_api_v1_news, only: [:show, :update, :destroy]

  # GET /api/v1/news
  def index
    @api_v1_news = Api::V1::News.all

    render json: @api_v1_news
  end

  # GET /api/v1/news/1
  def show
    render json: @api_v1_news
  end

  # POST /api/v1/news
  def create
    @api_v1_news = Api::V1::News.new(api_v1_news_params)

    if @api_v1_news.save
      render json: @api_v1_news, status: :created, location: @api_v1_news
    else
      render json: @api_v1_news.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/news/1
  def update
    if @api_v1_news.update(api_v1_news_params)
      render json: @api_v1_news
    else
      render json: @api_v1_news.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/news/1
  def destroy
    @api_v1_news.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_news
      @api_v1_news = Api::V1::News.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_news_params
      params.fetch(:api_v1_news, {})
    end
end
