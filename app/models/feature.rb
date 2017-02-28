class Feature < ActiveRecord::Base
  extend Flip::Declarable

  strategy Flip::CookieStrategy
  # strategy Flip::DatabaseStrategy
  # strategy Flip::DeclarationStrategy
  default false

  feature :placeholder_over_label,
          description: 'When this toggle is turned on, there will no longer be labels.'

  feature :edit_in_place,
          description: 'When this feature toggle is on a user will now be able to update and show instead of refreshing the page'
end
