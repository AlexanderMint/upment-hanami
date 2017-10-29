# frozen_string_literal: true

Hanami::Model.migration do
  up do
    add_column :refresh_tokens, :name, String
  end

  down do
    drop_column :refresh_tokens, :name
  end
end
