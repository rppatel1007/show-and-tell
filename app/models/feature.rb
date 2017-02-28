class Feature < ActiveRecord::Base
  extend Flip::Declarable

  strategy Flip::CookieStrategy
  # strategy Flip::DatabaseStrategy
  # strategy Flip::DeclarationStrategy
  default false

  feature :placeholder_over_label,
          description: 'When this toggle is turned on, there will no longer be labels.'

  feature :js_update_enhancement,
          description: 'Highlights user selection, Adds hover CSS, and reloads user card client-side after an update'
end
