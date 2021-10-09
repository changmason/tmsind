class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]

  # GET /companies or /companies.json
  def index
    @companies = search_companies
  end

  # GET /companies/1 or /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: "Company was successfully created." }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def search_companies
      scope = Company

      if params[:name].present?
        scope = scope.where(['name like ?', "%#{params[:name]}%"])
      end

      if params[:telephone].present?
        scope = scope.where(telephone: params[:telephone])
      end

      if params[:address].present?
        scope = scope.where(['address like ?', "%#{params[:address]}%"])
      end

      if params[:email].present?
        scope = scope.where(email: params[:email])
      end

      if params[:main_type].present?
        scope = scope.where(main_type: params[:main_type])
      end

      if params[:sub_type].present? && params[:sub_type].last.present?
        scope = scope.where(sub_type: params[:sub_type])
      end

      if params[:company_no].present?
        scope = scope.where(company_no: params[:company_no])
      end

      scope.all
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name, :branch_name, :telephone, :address, :email, :business_hours, :charges, :main_type, :sub_type, :company_no, :lat_lng)
    end
end
