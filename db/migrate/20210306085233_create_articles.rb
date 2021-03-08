class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user         , foreign_key: true
      t.string     :name         , null: false
      t.text       :text         , null: false
      t.integer    :category_id     , null: false
      t.integer    :status_id     , null: false
      t.integer    :charge_id     , null: false
      t.integer    :area_id     , null: false
      t.integer    :day_id     , null: false
      t.integer    :price     , null: false
      t.timestamps
    end
  end
end
