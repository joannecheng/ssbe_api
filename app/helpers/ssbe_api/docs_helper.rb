module SsbeApi
  module DocsHelper

    def group_routes_by_controller
      Rails.application.routes.routes.routes.map do |route| 
        route.defaults.merge({
          :request_method => format_verb(route.constraints[:request_method]),
          :path => route.path.spec
        })
      end.compact.reject { |path| path[:request_method].nil? || path[:controller].nil? }.group_by { |path| path[:controller] }
    end

    def format_verb(verb)
      verb.inspect.gsub(/\W+/, '')
    end

  end
end
