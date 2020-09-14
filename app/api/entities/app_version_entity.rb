module API::Entities
  class AppVersionEntity < BaseEntity
    root 'app_versions', 'app_version'

    expose :app_id, documentation: {type: 'int', desc: 'app id', required: true, param_type: 'body'}
    expose :version, documentation: {type: 'string', desc: 'app version', required: true, param_type: 'body'}
    expose :build_code, documentation: {type: 'string', desc: 'app build code', required: true, param_type: 'body'}
    expose :update_type, documentation: {type: 'string', desc: 'update type', required: true, param_type: 'body'}
    expose :update_title, documentation: {type: 'string', desc: 'update title', required: true, param_type: 'body'}
    expose :update_description, documentation: {type: 'string', desc: 'update description', required: true, param_type: 'body'}
    expose :publish_at, documentation: {type: 'datetime', desc: 'publish_at', required: true, param_type: 'body'}
    expose :enabled, documentation: {type: 'boolean', desc: 'enabled', required: true, param_type: 'body'}

  end
end
