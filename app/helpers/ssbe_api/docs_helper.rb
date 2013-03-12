module SsbeApi
  module DocsHelper

    def group_routes_by_controller
      Rails.application.routes.routes.named_routes.map do |k, v| 
        v.defaults.merge({
          :request_method => format_verb(v.verb),
          :path => v.path.spec
        })
      end.compact.group_by { |path| path[:controller] }
    end

    def format_verb(verb)
      verb.inspect.gsub(/\W+/, '')
    end

    def controllers
      Rails.application.routes.routes.named_routes.map { |k, v| v.defaults[:controller] }.compact.uniq
    end
  end
end
