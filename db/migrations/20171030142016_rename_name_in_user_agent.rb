# frozen_string_literal: true

Hanami::Model.migration do
  up do
    rename_column :refresh_tokens, :name, :user_agent
  end

  down do
    rename_column :refresh_tokens, :user_agent, :name
  end
end
