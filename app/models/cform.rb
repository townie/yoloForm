class Cform < ActiveRecord::Base

  validates :first_name, presence: true, format: { with: /[^\d]/ }
  validates :last_name, presence: true, format: { with: /[^\d]/i }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }, uniqueness: true
  validates :subject, presence: true
  validates :description, presence: true

end
