class AdminV2::CompaniesController < AdminV2Controller

  def show_companies
    @title_admin = "Entreprises"
    @companies = Company.all
  end

  def create_company
    @title_admin = "Entreprise"
    @company = Company.new
  end

  def new_company
    @title_admin = "Entreprise"
    @company = Company.new(params[:company].permit(:name, :description, :address, :zip_code, :city, :phone_number, :website, :twitter, :linkedin))
    if @company.save
      flash["sucess"] = "Company created"
      redirect_to admin_v2_admin_show_companies_path()
    else
      flash["fail"] = "Company not created"
      redirect_to admin_v2_admin_create_company_path()
    end
  end

  def edit_company
    @title_admin = "Entreprise"    
    @company = Company.find(params[:id])
  end

  def update_company
    @title_admin = "Entreprise"
    @company = Company.find(params[:id])

    if @company.update_attributes(params[:company].permit(:name, :description, :address, :zip_code, :city, :phone_number, :website, :twitter, :linkedin))
      flash["sucess"] = "Company edited"
      redirect_to admin_v2_admin_show_companies_path
    else
      redirect_to admin_v2_admin_edit_company_path(company)
    end
  end

  def delete_company
    @company = Company.find(params[:id])
    if @company.destroy
      flash["sucess"] = "Company deleted"
      redirect_to admin_v2_admin_show_companies_path()
    else
      flash[:error] = "Company not deleted"
      redirect_to admin_v2_admin_show_companies_path()
    end    
  end

end
