class BalanceEnquiriesController < ApplicationController
  before_action :set_balance_enquiry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /balance_enquiries
  # GET /balance_enquiries.json
  def index
    @balance_enquiries = BalanceEnquiry.all.paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
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
    @balance_enquiry = BalanceEnquiry.new(balance_enquiry_params)

    respond_to do |format|
      if @balance_enquiry.save
        format.html { redirect_to @balance_enquiry, notice: 'Balance enquiry was successfully created.' }
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
        format.html { redirect_to @balance_enquiry, notice: 'Balance enquiry was successfully updated.' }
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
      format.html { redirect_to balance_enquiries_url, notice: 'Balance enquiry was successfully destroyed.' }
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
      params.require(:balance_enquiry).permit(:lena, :dena, :balance_date)
    end
end
