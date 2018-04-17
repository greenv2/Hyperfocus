class CreateStudyGuides < ActiveRecord::Migration[5.0]
  def change
    create_table :study_guides do |t|
      t.string :title

      t.timestamps
    end
  end
end
