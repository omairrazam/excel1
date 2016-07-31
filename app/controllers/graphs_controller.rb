class GraphsController < ApplicationController
  before_action :set_graph, only: [:show, :edit, :update, :destroy]

  # GET /graphs
  def index
    @graphs = Graph.all
  end

  # GET /graphs/1
  def show
  end

  # GET /graphs/new
  def new
    @graph = Graph.new
  end

  # GET /graphs/1/edit
  def edit
  end

  # POST /graphs
  def create
    @graph = Graph.new(graph_params)

    if @graph.save
      redirect_to @graph, notice: 'Graph was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /graphs/1
  def update
    if @graph.update(graph_params)
      redirect_to @graph, notice: 'Graph was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /graphs/1
  def destroy
    @graph.destroy
    redirect_to graphs_url, notice: 'Graph was successfully destroyed.'
  end

  def update_data
    graph = Graph.find(params[:graph_id])
    graph.update_data
    redirect_to category_path(graph.category), success: 'Graph data has loaded'
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_graph
      @graph = Graph.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def graph_params
      params[:graph]
    end
end
