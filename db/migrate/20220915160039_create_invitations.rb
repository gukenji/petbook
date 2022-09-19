class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.references :invited_user
      t.references :requesting_user
      t.timestamps
    end
  end
end
