class TenantsController < ApplicationController

    def index
        render json: Tenant.all, status: :ok
    end 

    def create
        tenant = Tenant.create(tenant_params)
        if tenant.valid?
            render json: tenant, status: :created
        else 
            render json: {error: tenant.errors.full_messages}, status: :unprocessable_entity 
        end 
    end 

    def update
        tenant = find_tenant
        tenant.update(tenant_params)
        render json: tenant, status: :accepted
    rescue ActiveRecord::RecordNotFound 
            render_not_found_response 
    end 

    def destroy
        tenant = find_tenant
        if tenant 
            tenant.destroy
            head :no_content
        else 
            render_not_found_response
        end 
    end 

    def four_char
        tenants = Tenant.four_char
        render json: tenants, status: :ok
    end

    private

    def tenant_params
        params.permit(:id, :name, :age)
    end 

    def render_not_found_response
        render json: {error: "tenant not found"}, status: :not_found 
    end 

    def find_tenant
        tenant = Tenant.find(params[:id])
    end 

end
