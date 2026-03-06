class CreateTaskCompletions < ActiveRecord::Migration[8.1]
  def change
    create_table :task_completions do |t|
      t.date :date
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
    add_index :task_completions, :date
  end
end
