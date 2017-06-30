class CreateFeatureds < ActiveRecord::Migration[5.1]
  def change
    create_table :featureds do |t|
      t.references :band, foreign_key: true
      t.string :description
      t.timestamps
    end
  end
end
