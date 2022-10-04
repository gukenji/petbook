class AddUploadedUrlToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :uploaded_url, :string
  end
end
