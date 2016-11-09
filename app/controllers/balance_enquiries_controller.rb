class BalanceEnquiriesController < ApplicationController
  before_action :set_balance_enquiry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_karigar, only: [:index, :edit, :show, :new, :create, :destroy, :update]
  
  # GET /balance_enquiries
  # GET /balance_enquiries.json
  def index
    @balance_enquiries = BalanceEnquiry.where(karigar_id: params[:karigar_id]).paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
  end

  # GET /balance_enquiries/1
  # GET /balance_enquiries/1.json
  def show
  end

  # GET /balance_enquiries/new
  def new
    @balance_enquiry = BalanceEnquiry.new
  end

  # GET /balance_enquiries/1/edit
  def edit
  end

  # POST /balance_enquiries
  # POST /balance_enquiries.json
  def create
    params["balance_enquiry"]["karigar_id"] = params["karigar_id"]
    @balance_enquiry = BalanceEnquiry.new(balance_enquiry_params)
    respond_to do |format|
      if @balance_enquiry.save
        format.html { redirect_to karigar_balance_enquiries_path(@karigar), notice: 'Balance enquiry was successfully created.' }
        format.json { render :show, status: :created, location: @balance_enquiry }
      else
        format.html { render :new }
        format.json { render json: @balance_enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /balance_enquiries/1
  # PATCH/PUT /balance_enquiries/1.json
  def update
    respond_to do |format|
      if @balance_enquiry.update(balance_enquiry_params)
        format.html { redirect_to karigar_balance_enquiries_path(@karigar), notice: 'Balance enquiry was successfully updated.' }
        format.json { render :show, status: :ok, location: @balance_enquiry }
      else
        format.html { render :edit }
        format.json { render json: @balance_enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /balance_enquiries/1
  # DELETE /balance_enquiries/1.json
  def destroy
    @balance_enquiry.destroy
    respond_to do |format|
      format.html { redirect_to karigar_balance_enquiries_path(@karigar), notice: 'Balance enquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_balance_enquiry
      @balance_enquiry = BalanceEnquiry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def balance_enquiry_params
      params.require(:balance_enquiry).permit(:lena, :dena, :balance_date, :karigar_id)
    end

    def set_karigar
      @karigar = Karigar.find params[:karigar_id]  
    end
end
