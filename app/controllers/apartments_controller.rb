class ApartmentsController < ApplicationController

    def index
        render json: Apartment.all, status: :ok
    end 

    def create
        apartment = Apartment.create(apartment_params)
        if apartment.valid?
            render json: apartment, status: :created
        else 
            render json: {error: apartment.errors.full_messages}, status: :unprocessable_entity
        end 
    end 

    def update
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            apartment.update(apartment_params)
            render json: apartment, status: :accepted
        else 
            render json: {error: "apartment not found"}, status: :not_found
        end 
    end 

    def destroy
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            apartment.destroy
            head :no_content
        else 
            render json: {error: "apartment not found"}, status: :not_found 
        end 
    end 

    private 

    def apartment_params
        params.permit(:id, :number, :lease_id)
    end 
    
end
