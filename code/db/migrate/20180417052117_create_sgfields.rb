class CreateSgfields < ActiveRecord::Migration[5.1]

  def change
    create_table :sgfields do |t|
      t.belongs_to :study_guide, foreign_key: true
      t.string :type
      t.string :content

      t.timestamps
    end
  end
end
