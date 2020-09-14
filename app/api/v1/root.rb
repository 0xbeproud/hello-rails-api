require 'grape-swagger'

module API::V1
  class Root < Grape::API
    version "v1", using: :path

    mount API::V1::Apps

    # mount 밑에 있어야 함.
    add_swagger_documentation info: {
        title: "Hello Rails Api",
        description: "A description of the Hello Rails Api.",
    }

  end
end
