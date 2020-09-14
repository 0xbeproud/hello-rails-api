module API
  module ExceptionsHandler
    extend ActiveSupport::Concern

    included do
      rescue_from API::ApiExceptions::BadRequestException do |e|
        Rails.logger.debug("error => #{e.class}, #{e.message.inspect}")
        Rack::Response.new({error_code: e.error_code, error_msg: e.error_msg}.to_json, e.status)
      end

      rescue_from API::ApiExceptions::UnauthorizedUserException, API::ApiExceptions::UnauthorizedAppException do |e|
        Rails.logger.debug("error => #{e.class}, #{e.message.inspect}")
        error!(message: e.message, status: 401)
        Rack::Response.new({error_code: e.error_code, error_msg: e.error_msg}.to_json, e.status)
      end

      rescue_from API::ApiExceptions::AppApiException do |e|
        Rails.logger.debug("error => #{e.class}, #{e.message.inspect}")
        Rack::Response.new({error_code: e.error_code, error_msg: e.error_msg}.to_json, e.status)
      end

      rescue_from Grape::ApiExceptions::ValidationErrors do |e|
        Rails.logger.debug("error => #{e.class}, #{e.message.inspect}")
        error_messages = e.message.gsub(" is missing", "가 필요합니다")
        Rack::Response.new({error_code: 400, error_msg: error_messages}.to_json, 400)
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        Rails.logger.debug("error => #{e.class}, #{e.message.inspect}")
        Rack::Response.new({error_code: 400, error_msg: e.message}.to_json, 400)
      end

      rescue_from StandardError do |e|
        Rails.logger.debug("error => #{e.class}, #{e.message.inspect}")
        error!(message: e.message, status: 500)
      end
    end
  end
end
