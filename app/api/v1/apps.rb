module API::V1
  class Apps < API::ApiBase
    before do
      authenticate_app!
    end

    resources :apps do
      desc "welcome api"
      get :welcome do
        {message: 'welcome'}
      end

      desc "hello api"
      get :hello do
        'hello'
      end
    end
  end
end
