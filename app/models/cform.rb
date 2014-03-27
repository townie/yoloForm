class Cform < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :description, presence: true
  validates :title, presence: true

end
