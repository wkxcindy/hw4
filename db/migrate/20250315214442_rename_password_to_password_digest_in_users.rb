class RenamePasswordToPasswordDigestInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :password, :password_digest
  end
end

