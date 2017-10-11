# frozen_string_literal: true

Hanami::Model.migration do
  up do
    create_table :refresh_tokens do
      primary_key :id
      foreign_key :user_id, :users, on_delete: :cascade, null: false

      column :token, String, null: false, unique: true, index: true, size: 36

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end

  down do
    drop_table :refresh_tokens
  end
end
