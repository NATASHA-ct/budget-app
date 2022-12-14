class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: %i[show edit update destroy]
  before_action :set_group

  # GET /expenses or /expenses.json
  def index
    @expenses = @group.expenses.order(created_at: :desc)
  end

  # GET /expenses/1 or /expenses/1.json
  def show; end

  # GET /expenses/new
  def new
    @expense = @group.expenses.build
  end

  # GET /expenses/1/edit
  def edit
    @expense = @group.expenses.find(params[:id])
  end

  # POST /expenses or /expenses.json
  def create
    @expense = current_user.expenses.build(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to group_path(@group), notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    @expense = @group.expenses.find(params[:id])

    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to group_path(@group), notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense = @group.expenses.find(params[:id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to group_path(@group), notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = current_user.groups.find_by(id: params[:group_id])
  end

  def set_expense
    @expense = Expense.find_by(id: params[:expense_id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount, :group_id)
  end
end
