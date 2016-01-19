class AddBusinessNameToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :business_name, :string
  end
end
