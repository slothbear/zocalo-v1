class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.text :first_name
      t.text :middle_name
      t.text :last_name, null: false
      t.text :address
      t.text :city
      t.text :state
      t.text :zip
      t.text :email
      t.text :email_alternate
      t.text :url
      t.text :phone
      t.text :phone_alternate
      t.date :birthday
      t.date :joined_on
      t.date :renewed_on
      t.date :expire_on
      t.text :directory_items, array: true, default: []
      t.text :interests
      t.text :source
      t.date :subscription_started_on
      t.date :subscription_renewed_on
      t.date :subscription_end_on
      t.text :newsletter_format

      t.timestamps
    end
  end
end
