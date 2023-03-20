class ApplicationController < ActionController::API
    wrap_parameters format: []
    
    rescue_from ActiveRecord::RecordInvalid, with: :render_custom_error

    private
   
    def render_custom_error(invalid)
        render json: {errors: invalid.record.errors}, status: 422
    end
end
