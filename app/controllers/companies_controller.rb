class CompaniesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

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

  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      redirect_to @company
    else
      render 'edit'
    end
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
