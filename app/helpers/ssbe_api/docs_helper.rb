module SsbeApi
  module DocsHelper

    def group_routes_by_controller
      Rails.application.routes.routes.named_routes.map do |k, v| 
        v.defaults.merge({
          :request_method => format_verb(v.verb),
          :path => v.path.spec
        })
      end.reject { |path| path[:request_method].empty? }.group_by { |path| path[:controller] }
    end

    def format_verb(verb)
      verb.inspect.gsub(/\W+/, '')
    end

  end
end
