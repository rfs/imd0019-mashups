class ProblemTypesController < ApplicationController
  before_action :set_problem_type, only: [:show, :edit, :update, :destroy]

  # GET /problem_types
  # GET /problem_types.json
  def index
    @problem_types = ProblemType.all
  end

  # GET /problem_types/1
  # GET /problem_types/1.json
  def show
  end

  # GET /problem_types/new
  def new
    @problem_type = ProblemType.new
  end

  # GET /problem_types/1/edit
  def edit
  end

  # POST /problem_types
  # POST /problem_types.json
  def create
    @problem_type = ProblemType.new(problem_type_params)

    respond_to do |format|
      if @problem_type.save
        format.html { redirect_to @problem_type, notice: 'Problem type was successfully created.' }
        format.json { render :show, status: :created, location: @problem_type }
      else
        format.html { render :new }
        format.json { render json: @problem_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /problem_types/1
  # PATCH/PUT /problem_types/1.json
  def update
    respond_to do |format|
      if @problem_type.update(problem_type_params)
        format.html { redirect_to @problem_type, notice: 'Problem type was successfully updated.' }
        format.json { render :show, status: :ok, location: @problem_type }
      else
        format.html { render :edit }
        format.json { render json: @problem_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problem_types/1
  # DELETE /problem_types/1.json
  def destroy
    @problem_type.destroy
    respond_to do |format|
      format.html { redirect_to problem_types_url, notice: 'Problem type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem_type
      @problem_type = ProblemType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def problem_type_params
      params.require(:problem_type).permit(:name)
    end
end
