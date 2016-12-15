class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin
      @companies = Company.all
    else
      redirect_to root_path
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new()
    # formulaire
  end

  def create
    # fornulaire when submitted
    @company = Company.new(company_params)
    @company.created_by = current_user.id
    if @company.save
      current_user.company = @company
      current_user.save
      redirect_to company_path(@company)
    else
      render 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path
  end

  private
    def company_params
      params.require(:company).permit(:name, :description, :picture, :created_by)
    end
end
