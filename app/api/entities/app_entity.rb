module API::Entities
  class AppEntity < BaseEntity
    root 'apps', 'app'

    expose :os_type, documentation: {type: 'string', desc: 'os type', required: true, param_type: 'body'}
    expose :store_url, documentation: {type: 'string', desc: 'store url', required: true, param_type: 'body'}

  end
end
