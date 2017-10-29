# frozen_string_literal: true

Hanami::Model.migration do
  up do
    create_table :roles do
      primary_key :id
      foreign_key :user_id, :users, on_delete: :cascade, null: false
      column :name, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end

  down do
    drop_table :roles
  end
end
