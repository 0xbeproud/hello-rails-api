require 'grape-swagger'

module API::V1
  class Root < Grape::API
    prefix "api"
    version "v1", using: :path

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

    mount API::V1::Apps

    # mount 밑에 있어야 함.
    add_swagger_documentation info: {
        title: "Hello Rails Api",
        description: "A description of the Hello Rails Api.",
    }

  end
end
