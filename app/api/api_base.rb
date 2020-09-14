module API
  class ApiBase < Grape::API

    def self.inherited(subclass)
      super
      subclass.instance_eval do
        include API::ExceptionsHandler
      end
    end
  end
end