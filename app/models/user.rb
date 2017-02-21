class User < ApplicationRecord
  validates :password, presence: {on: :create}, confirmation: true
  validates :name, uniqueness: {case_senstive: true}
  attr_accessor :password, :password_confirmation
  has_many :plan_items, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :participating_events, through: :participations, source: :plan_item
  def password=(val)
    if val.present?
      self.hashed_password =BCrypt::Password.create(val)
    end
    @password = val
  end

  private
  def self.authenticate(full_name, password)
    user = find_by(full_name: full_name)
    if user && user.hashed_password.present? &&
        BCrypt::Password.new(user.hashed_password) == password
      user
    else
      nil
    end
  end

end
