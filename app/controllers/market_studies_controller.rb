class MarketStudiesController < ApplicationController
  before_action :set_market_study, only: [:show, :edit, :update, :destroy]

  # GET /market_studies
  def index
    @market_studies = MarketStudy.all
  end

  # GET /market_studies/1
  def show
  end

  # GET /market_studies/new
  def new
    @market_study = MarketStudy.new
  end

  # GET /market_studies/1/edit
  def edit
  end

  # POST /market_studies
  def create
    @market_study = MarketStudy.new(market_study_params)

    if @market_study.save
      redirect_to @market_study, notice: 'Market study was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /market_studies/1
  def update
    if @market_study.update(market_study_params)
      redirect_to @market_study, notice: 'Market study was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /market_studies/1
  def destroy
    @market_study.destroy
    redirect_to market_studies_url, notice: 'Market study was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_market_study
      @market_study = MarketStudy.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def market_study_params
      params.require(:market_study).permit(:title, :content)
    end
end
