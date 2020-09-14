module API
  class RequestContext
    attr_reader :app_version, :app_build_code, :device_os_type, :device_os_version, :device_uuid, :manufacturer, :model

    def initialize(request)
      Rails.logger.debug(request.headers)

      @app_version = request.headers['X-Eav']
      @app_build_code = request.headers['X-Eabc']
      @device_os_type = request.headers['X-Edos']
      @device_os_version = request.headers['X-Edov']
      @device_uuid = request.headers['X-Euuid']
      @manufacturer = request.headers['X-Edme']
      @model = request.headers['X-Edmo']
    end
  end
end