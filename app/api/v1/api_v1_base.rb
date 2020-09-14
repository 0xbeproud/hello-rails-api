module API::V1
  module ApiV1Base
    extend ActiveSupport::Concern
    included API::ApiBase

    included do
      version "v1", using: :path
    end
  end
end
