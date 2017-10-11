# frozen_string_literal: true

Hanami::Model.migration do
  up do
    create_table :users do
      primary_key :id

      column :first_name, String, size: 32
      column :last_name, String, size: 32
      column :email, String, null: false, unique: true, index: true
      column :phone, Integer, unique: true

      column :password, String, null: false, unique: true, size: 60
      column :confirmation_token, String, unique: true, size: 36
      column :reset_password_token, String, unique: true, size: 36

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end

  down do
    drop_table :users
  end
end
