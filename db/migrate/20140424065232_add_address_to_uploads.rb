class AddAddressToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :address, :string
  end
end
