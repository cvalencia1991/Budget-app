class PaymentsController < ApplicationController
  before_action only: %i[show edit update destroy]

  # GET /payments or /payments.json
  def index
    @payments = Payment.includes(:group).order(created_at: :desc)
    @total = Payment.includes(:group).sum(:amount)
  end

  # GET /payments/1 or /payments/1.json
  def show
    if Payment.find_by(group_id: params[:id]).nil?
      flash[:alert] = 'There is no transaction in this group'
    else
      @payments = Payment.where(group_id: params[:id]).order(created_at: :desc)
      @total = Payment.includes(:group).where(group_id: params[:id]).sum(:amount)
    end
  end

  # GET /payments/new
  def new
    @groups = Group.all
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit; end

  # POST /payments or /payments.json
  def create
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to payment_url(@payment.group_id), notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html do
          redirect_to payment_path(@payment.group_id), method: :get, notice: 'Payment was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  # Only allow a list of trusted parameters through.
  def payment_params
    params.require(:payment).permit(:name, :amount, :user_id, :group_id)
  end
end
