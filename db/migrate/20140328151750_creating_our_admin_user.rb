class CreatingOurAdminUser < ActiveRecord::Migration
  def change
    #   t.string   "email",                  default: "",       null: false
    # t.string   "encrypted_password",     default: "",       null: false
    # t.string   "role",                   default: "viewer", null: false
    User.create({email: "k@gmail.com", password: "admin12345", role: "admin"})
  end
end
