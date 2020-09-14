module API
  class Root < Grape::API
    prefix "api"

    default_format :json
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    helpers do
      include API::Helpers::ApiHelpers

      params :pagination do
        optional :page, type: Integer
        optional :per_page, type: Integer
      end

      def permitted_params
        @permitted_params ||= declared(params, include_missing: false)
      end

      def logger
        Rails.logger
      end
    end

    mount API::V1::Root
  end
end
