class KarigarsController < ApplicationController
  before_action :set_karigar, only: [:show, :edit, :update, :destroy]

  # GET /karigars
  # GET /karigars.json
  def index
    @karigars = Karigar.all
  end

  # GET /karigars/1
  # GET /karigars/1.json
  def show
  end

  # GET /karigars/new
  def new
    @karigar = Karigar.new
  end

  # GET /karigars/1/edit
  def edit
  end

  # POST /karigars
  # POST /karigars.json
  def create
    @karigar = Karigar.new(karigar_params)

    respond_to do |format|
      if @karigar.save
        format.html { redirect_to @karigar, notice: 'Karigar was successfully created.' }
        format.json { render :show, status: :created, location: @karigar }
      else
        format.html { render :new }
        format.json { render json: @karigar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /karigars/1
  # PATCH/PUT /karigars/1.json
  def update
    respond_to do |format|
      if @karigar.update(karigar_params)
        format.html { redirect_to @karigar, notice: 'Karigar was successfully updated.' }
        format.json { render :show, status: :ok, location: @karigar }
      else
        format.html { render :edit }
        format.json { render json: @karigar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /karigars/1
  # DELETE /karigars/1.json
  def destroy
    @karigar.destroy
    respond_to do |format|
      format.html { redirect_to karigars_url, notice: 'Karigar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_karigar
      @karigar = Karigar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def karigar_params
      params.require(:karigar).permit(:name, :address, :phone)
    end
end
