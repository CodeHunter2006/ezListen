class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
	skip_before_action :verify_authenticity_token, if: :json_request?, only: [:update]

  # GET /articles
  # GET /articles.json
  def index
		if params[:process] == "true"
			@article = Article.find_by(status: nil)
			if not @article
				@article = Article.find_by(status: "")
			end

			if @article
				redirect_to action: "edit", id: @article.id, format: params[:format]
			else
				respond_to do |format|
					format.html { render :no_more_articles }
					format.json { render json: "no more articles" }
				end
			end
		else
			@articles = Article.all
		end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
		respond_to do |format|
			format.html
			format.json { render json: @article }
		end
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:source_url, :title, :text_content, :audio_file_url, :status)
    end

		def json_request?
			request.format.json?
		end
end