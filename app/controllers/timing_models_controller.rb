class TimingModelsController < ApplicationController
  before_action :set_timing_model, only: [:show, :edit, :update, :destroy]

  # GET /timing_models
  def index
    @timing_models = TimingModel.all
  end

  # GET /timing_models/1
  def show
  end

  # GET /timing_models/new
  def new
    @timing_model = TimingModel.new
  end

  # GET /timing_models/1/edit
  def edit
  end

  # POST /timing_models
  def create
    @timing_model = TimingModel.new(timing_model_params)

    if @timing_model.save
      redirect_to @timing_model, notice: 'Timing model was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /timing_models/1
  def update
    if @timing_model.update(timing_model_params)
      redirect_to @timing_model, notice: 'Timing model was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /timing_models/1
  def destroy
    @timing_model.destroy
    redirect_to timing_models_url, notice: 'Timing model was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timing_model
      @timing_model = TimingModel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def timing_model_params
      params.require(:timing_model).permit(:title, :content)
    end
end
