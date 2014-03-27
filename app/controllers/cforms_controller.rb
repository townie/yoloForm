class CformsController < ApplicationController
  before_action :set_cform, only: [:show, :edit, :update, :destroy]

  # GET /cforms
  # GET /cforms.json
  def index
    @cforms = Cform.all
  end

  # GET /cforms/1
  # GET /cforms/1.json
  def show
  end

  # GET /cforms/new
  def new
    @cform = Cform.new
  end

  # GET /cforms/1/edit
  def edit
  end

  # POST /cforms
  # POST /cforms.json
  def create
    @cform = Cform.new(cform_params)

    respond_to do |format|
      if @cform.save
        format.html { redirect_to @cform, notice: 'Cform was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cform }
      else
        format.html { render action: 'new' }
        format.json { render json: @cform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cforms/1
  # PATCH/PUT /cforms/1.json
  def update
    respond_to do |format|
      if @cform.update(cform_params)
        format.html { redirect_to @cform, notice: 'Cform was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cforms/1
  # DELETE /cforms/1.json
  def destroy
    @cform.destroy
    respond_to do |format|
      format.html { redirect_to cforms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cform
      @cform = Cform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cform_params
      params.require(:cform).permit(:email, :subject, :description, :first_name, :last_name)
    end
end
