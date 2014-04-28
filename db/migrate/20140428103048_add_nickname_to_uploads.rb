class AddNicknameToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :nickname, :string
  end
end
