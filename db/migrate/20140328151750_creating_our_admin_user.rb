class CreatingOurAdminUser < ActiveRecord::Migration
  def change

    User.create({email: "k@gmail.com", password: "admin12345", role: "admin"})
  end
end
