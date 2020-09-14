module API::V1
  class Welcome < Grape::API
    include API::V1::ApiV1Base

    resources :welcome do
      desc "welcome api"
      get do
        {message: 'welcome'}
      end
    end
  end
end
