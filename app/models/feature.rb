class Feature < ActiveRecord::Base
  extend Flip::Declarable

  strategy Flip::CookieStrategy
  # strategy Flip::DatabaseStrategy
  # strategy Flip::DeclarationStrategy
  default false

  feature :placeholder_over_label,
          description: 'When this toggle is turned on, there will no longer be labels.'

  feature :restful_routes,
        default: true,
        description: 'When this toggle is turned on, the profile route will follow RESTful conventions.'
end
