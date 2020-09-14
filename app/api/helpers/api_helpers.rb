module API::Helpers
  module ApiHelpers
    extend Grape::API::Helpers

    # Grape::Entity.format_with :iso8601 do |date|
    #   date.iso8601 if date
    # end

    def pagination(object)
      {
          current_page: object.current_page,
          next_page: object.next_page,
          prev_page: object.prev_page,
          total_pages: object.total_pages,
          total_count: object.total_count
      }
    end

    def init_request_context
      @request_context = API::RequestContext.new(request)
    end

    def authenticate_app!
      init_request_context

      raise API::ApiExceptions::HeaderNotFoundException, "app_version" unless @request_context.app_version.present?
      raise API::ApiExceptions::HeaderNotFoundException, "device_os_type" unless @request_context.device_os_type.present?
      raise API::ApiExceptions::HeaderNotFoundException, 'device_uuid' unless @request_context.device_uuid.present?
    end
  end
end
