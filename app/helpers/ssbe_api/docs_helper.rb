module SsbeApi
  module DocsHelper

    def group_routes_by_controller
      named_routes = Rails.application.routes.routes.named_routes
    end
  end
end
