# frozen_string_literal: true

class AddCompanyNameToCompany < ActiveRecord::Migration[7.1]
  if table_exists? 'companies'
    def change
      add_column :companies, :company_name, :string unless column_exists? :companies, :company_name

      add_index :companies, :company_name
    end
  end
end
