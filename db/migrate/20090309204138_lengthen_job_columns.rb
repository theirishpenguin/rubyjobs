class LengthenJobColumns < ActiveRecord::Migration
  def self.up
		change_column :jobs, :title, 				:string, :limit => 120
		change_column :jobs, :description, 	:string, :limit => 2000
  end

  def self.down
		change_column :jobs, :title, 				:string, :limit => 50
		change_column :jobs, :description, 	:string, :limit => 1000
  end
end
