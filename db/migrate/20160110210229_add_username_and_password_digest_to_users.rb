class AddUsernameAndPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, index: true
    add_column :users, :password_digest, :string
  end
end
