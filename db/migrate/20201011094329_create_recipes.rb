class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|

      t.string     :name,        null: false
      t.string     :bread,       null: false
      t.integer    :breadtype_id,   null: false
      t.string     :material,    null: false
      t.text       :recipe,      null: false
      t.integer    :calorie
      t.references :user,        null: false, foreign_key: true
      t.timestamps 
    end
  end
end
