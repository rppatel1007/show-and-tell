class Feature < ActiveRecord::Base
  extend Flip::Declarable

  strategy Flip::CookieStrategy
  # strategy Flip::DatabaseStrategy
  # strategy Flip::DeclarationStrategy
  default false

  feature :placeholder_over_label,
          description: 'When this toggle is turned on, there will no longer be labels.'

  feature :optional_middle_name,
          description: 'When enabled, middle name field becomes optional and required fields are marked as such'
end
