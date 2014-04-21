class AddEmailToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :email, :string
  end
end
