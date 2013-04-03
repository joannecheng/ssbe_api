module SsbeApi
  module DocsHelper

    def group_routes_by_controller
      Rails.application.routes.routes.routes.map do |route| 
        route.defaults.merge({
          :request_method => format_verb(route.constraints[:request_method]),
          :path => route.path.spec
        })
      end.reject { |path| path[:request_method].nil? || path[:controller].nil? }.group_by { |path| path[:controller] }.sort 
    end

    def format_verb(verb)
      return nil if verb.nil?
      verb.inspect.gsub(/\W+/, '')
    end

    def comments(route)
      begin
        MethodComments.new(controller_class(route[:controller]).constantize.instance_method(route[:action]).comment)
      rescue
        NullMethodComments.new
      end
    end

    def controller_class(controller)
      controller.split('_').map(&:capitalize).join('').pluralize + "Controller"
    end

  end
end
