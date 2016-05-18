class Api::ComitesController < Api::CorsController
  respond_to :json

  def show
    respond_with Comite.find(params[:id])
  end
  
  def index
    respond_with Comite.all  
  end
  
  def create
    @comite = current_user.universities.build(university_params)
    if @comite.save
      render json: @comite, status: 201, location: [:api, @comite]
    else
      render json: { errors: @comite.errors }, status: 422
    end
  end

  private

    def comite_params
      params.require(:comite).permit(:city, :name)
    end
end
