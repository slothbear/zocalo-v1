class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.text :first_name
      t.text :middle_name
      t.text :last_name
      t.date :paid_on
      t.date :expire_on
      t.decimal :amount
      t.text :comments

      t.timestamps
    end
  end
end
