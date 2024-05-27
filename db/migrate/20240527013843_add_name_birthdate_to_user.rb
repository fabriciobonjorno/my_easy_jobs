# frozen_string_literal: true

class AddNameBirthdateToUser < ActiveRecord::Migration[7.1]
  if table_exists? 'users'
    def change
      add_column :users, :name, :string unless column_exists? :users, :name
      add_column :users, :birthdate, :date unless column_exists? :users, :birthdate

      add_index :users, :name
      add_index :users, :birthdate
    end
  end
end
