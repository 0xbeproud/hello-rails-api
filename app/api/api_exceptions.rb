module API
  class ApiExceptions < StandardError
    attr_reader :status, :error_code, :error_msg

    def initialize(error_code = nil, error_msg = nil, status = nil)
      @error_code = error_code || 500
      @error_msg = error_msg || '알 수 없는 서버 에러입니다'
      @status = status || :internal_server_error
    end

    # def fetch_json
    #   Helpers::Render.json(@error_code, @error_msg, @status)
    #   {error_code: 400, error_msg: e.message}.to_json
    # end
  end

  # Authorized
  class UnauthorizedException < AppApiException
    def initialize(message = "인증에 실패하였습니다.")
      super(401, message, 401)
    end
  end

  class UnauthorizedAppException < UnauthorizedException
    def initialize
      super("앱 인증에 실패하였습니다")
    end
  end

  class UnauthorizedUserException < UnauthorizedException
    def initialize
      super("사용자 인증에 실패하였습니다")
    end
  end

  # Bad Request
  class BadRequestException < AppApiException
    def initialize(message = "잘못된 요청입니다")
      super(400, message, 400)
    end
  end

  class EntityNotFoundException < BadRequestException
    def initialize(entity = nil)
      if entity
        super("#{entity}를(을) 찾을 수 없습니다")
      else
        super("해당 데이터를 찾을 수 없습니다")
      end
    end
  end

  class EntityAlreadyExistException < BadRequestException
    def initialize
      super("해당 데이터가 이미 있습니다")
    end
  end

  class HeaderNotFoundException < BadRequestException
    def initialize(header = nil)
      if header
        super("#{header} 헤더를 찾을 수 없습니다")
      else
        super("헤더를 찾을 수 없습니다")
      end
    end
  end

  class ParamNotFoundException < BadRequestException
    def initialize(param = nil)
      if param
        super("#{param} 파리미터를 찾을 수 없습니다")
      else
        super("파라미터를 찾을 수 없습니다")
      end
    end
  end

  # Invalid Value
  class InvalidValueException < BadRequestException
    def initialize(message = "잘못된 값입니다")
      super
    end
  end
end
