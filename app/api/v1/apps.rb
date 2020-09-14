module API::V1
  class Apps < API::ApiBase
    before do
      authenticate_app!
    end

    resources :apps do
      desc "welcome api"
      get :welcome do
        present :message, 'welcome'
      end

      desc "hello api"
      get :hello do

        app = App.find_by(os_type: 'ANDROID')
        app.app_versions

        present app.app_versions, with: API::Entities::AppVersionEntity
      end
    end
  end
end
