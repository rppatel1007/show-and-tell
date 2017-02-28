class User < ApplicationRecord
  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
end
