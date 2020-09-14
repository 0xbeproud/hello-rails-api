module API::V1
  class Users < API::ApiBase
    before do
      authenticate_app!
    end

    resources :users do
      resources :signup do
        desc 'user signup'
        post do
          present :message, 'signup'
        end
      end
      resources :signin do
        desc 'user signin'
        post do
          present :message, 'signin'
        end

      end
    end
  end
end
