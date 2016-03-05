class NewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  
  
  layout "user_layout"
  def index
    @news = News.order(created_at: :desc).paginate(page: params[:page],per_page:10)
  end

  def new
    @news = News.new
  end

  def edit
  end

  def create
    @news = current_user.news.build(news_params)
    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
        if @news.update(news_params)
          format.html { redirect_to @news, notice: 'News was successfully updated.' }
          format.json { render :show, status: :ok, location: @news }
        else
          format.html { render :edit }
          format.json { render json: @news.errors, status: :unprocessable_entity }
        end
    end
  end

  def show    
  end

  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_path, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:news_title, :news_type, :news_content)
    end
end
