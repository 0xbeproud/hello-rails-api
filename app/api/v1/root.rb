module API::V1
  class Root < Grape::API

    version "v1", using: :path

    add_swagger_documentation info: {
        title: "Hello Rails Api",
        description: "A description of the Hello Rails Api.",
        # models: [Entities::TaskEntity, Entities::TaskCouponEntity]
    }

    mount API::V1::Apps
  end
end
