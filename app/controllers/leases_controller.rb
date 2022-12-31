class LeasesController < ApplicationController

    def create
        lease = Lease.create(lease_params)
        if lease.valid? 
            render json: lease, status: :created
        else 
            render json: {errors: lease.errors.full_messages}, status: :unprocessable_entity
        end 
    end

    def destroy
        lease = Lease.find_by(id: params[:id])
        if lease
            lease.destroy 
            head :no_content 
        else 
            render json: {error: "lease not found"}, status: :not_found
        end 
    end 

    private 

    def lease_params
        params.permit(:id, :rent, :apartment_id, :tenant_id)
    end 

end
