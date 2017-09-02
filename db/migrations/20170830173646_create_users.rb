# frozen_string_literal: true

Hanami::Model.migration do
  change do
    create_table :graphql do
      primary_key :id
      column :email, String, null: false, unique: true, index: true
      column :first_name, String, null: false
      column :last_name, String, null: false
      column :phone, Integer, unique: true

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
