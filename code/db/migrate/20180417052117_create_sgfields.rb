class CreateSgfields < ActiveRecord::Migration[5.0]
  def change
    create_table :sgfields do |t|
      t.references :study_guide, foreign_key: true
      t.string :type
      t.string :content

      t.timestamps
    end
  end
end
