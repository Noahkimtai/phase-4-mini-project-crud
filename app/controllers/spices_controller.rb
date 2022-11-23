class SpicesController < ApplicationController

    def index
        spices = Spice.all 
        render json: spices
    end

    def create
        spice = Spice.create(params.permit(:title, :image, :description, :notes, :rating))
        render json: spice, status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spice_params)
            render json: spice
        else
            render json: {error: "Spice not Available"}, status: :not_found
        end
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
    end

    private
    def spice_params
        params.permit(:title, :image, :description, :rating)
    end
end
