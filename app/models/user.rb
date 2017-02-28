class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  validate :middle_name_present

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  private

  def middle_name_present
    if !Flip.middle_name_optional? && middle_name.blank?
      errors.add(:middle_name, "can't be blank")
    end
  end
end
