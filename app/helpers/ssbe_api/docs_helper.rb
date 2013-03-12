module SsbeApi
  module DocsHelper

    def group_routes_by_controller
      Rails.application.routes.routes.named_routes.map do |k, v| 
        v.defaults.merge({
          :request_method => v.constraints[:request_method],
          :path => v.path.spec
        })
      end.group_by { |path| path[:controller] }
    end

    def controllers
      Rails.application.routes.routes.named_routes.map { |k, v| v.defaults[:controller] }.compact.uniq
    end
  end
end
