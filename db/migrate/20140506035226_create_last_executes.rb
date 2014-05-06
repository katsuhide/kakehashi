class CreateLastExecutes < ActiveRecord::Migration
  def change
    create_table :last_executes do |t|
      t.datetime :executed_time

      t.timestamps
    end
  end
end
