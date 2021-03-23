class Api::V1::NewsController < ApplicationController
  before_action :set_api_v1_news, only: [:show, :update, :destroy]

  # GET /api/v1/news
  def index
    @api_v1_news = News.active 

    render json: @api_v1_news
  end

  # GET /api/v1/news/1
  def show
    render json: @api_v1_news
  end

  # POST /api/v1/news
  def create
    @api_v1_news = News.new(api_v1_news_params)

    if @api_v1_news.save
      render json: @api_v1_news, status: :created
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
    @api_v1_news.active = false

    if @api_v1_news.save
      render json: @api_v1_news, status: :ok
    else
      render json: @api_v1_news.errors, status: :unprocessable_entity
    end
  end

  def between
    start = Date.parse(params[:start])
    final = Date.parse(params[:final])
    @news = News.where("created_at BETWEEN ? AND ?", start, final)
    render json: @news, status: :ok 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_news
      @api_v1_news = News.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_news_params
      params.require(:news).permit(:title, :content, :author, :status, :active, :category)
    end
end
