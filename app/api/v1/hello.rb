module API::V1
  class Hello < Grape::API
    include API::V1::ApiV1Base

    resources :hello do
      desc "hello api"
      get do
        'hello'
      end
    end
  end
end
