module API
  module ApiBase
    extend ActiveSupport::Concern
    include API::ExceptionsHandler

    included do
      prefix "api"
      default_format :json
      format :json
      formatter :json, Grape::Formatter::ActiveModelSerializers

      helpers do
        include API::Helpers::ApiHelpers

        def permitted_params
          @permitted_params ||= declared(params, include_missing: false)
        end

        def logger
          Rails.logger
        end
      end
    end
  end
end
