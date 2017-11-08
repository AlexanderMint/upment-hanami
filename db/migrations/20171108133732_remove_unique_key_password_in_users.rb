# frozen_string_literal: true

Hanami::Model.migration do
  up do
    alter_table :users do
      drop_constraint 'users_password_key'
    end
  end

  down do
    alter_table :users do
      add_unique_constraint :password
    end
  end
end
