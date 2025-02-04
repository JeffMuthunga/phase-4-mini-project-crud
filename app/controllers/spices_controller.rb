class SpicesController < ApplicationController


    def index
        render json: Spice.all, except: [:created_at, :updated_at]
    end
    def show
        spice =find_spice
        render json: spice, status: :ok
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice, status: :202
    end
    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end

    private

    def find_spice
        Spice.find(params[:id])
    end
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    
end
