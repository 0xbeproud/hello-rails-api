module API::V1
  class Root < Grape::API
    mount API::V1::Hello
    mount API::V1::Welcome

    add_swagger_documentation info: {
        title: "Hello Rails Api",
        description: "A description of the Hello Rails Api.",
        # models: [Entities::TaskEntity, Entities::TaskCouponEntity]
    }
  end
end
