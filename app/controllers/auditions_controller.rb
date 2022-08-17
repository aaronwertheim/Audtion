class AuditionsController < ApplicationController
    def index
        render json: @current_user.auditions
    end

    def create
        render json: @current_user.auditions.create!(audition_params)
    end

    def update
        audition = Audition.find(params[:id])
        audition.update!(audition_params)
        render json: audition, status: :accepted
    end

    def destroy
        audition = Audition.find(params[:id])
        audition.destroy
        head :no_content  
    end

    private

    def audition_params
        params.permit(:show_id, :user_id, :full_name, :desired_role, :audition_time)
    end
end
