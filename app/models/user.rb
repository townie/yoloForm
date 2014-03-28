class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  roles = %w(admin viewer)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :role, presence: true, inclusion: {in: roles, message: "must be an admin or a viewer"}
end
