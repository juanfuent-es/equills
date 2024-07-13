class CreateLetrisms < ActiveRecord::Migration[7.0]
  def change
    create_table :letrisms do |t|
      t.references :user,   null: false, foreign_key: true, type: :uuid
      t.references :equill, null: false, foreign_key: true, type: :uuid
      t.string :chars,      default: ""
      t.string :slug,       default: ""
      t.string :img,        default: ""
      t.json :paths,        default: "{}"
      #colors
      t.string :bg,         default: "#151512"
      t.string :fill,       default: "#151512"
      t.string :stroke,     default: "#eae7e1"
      #
      t.boolean :gallery,   null: false, default: false

      t.timestamps
    end
  end
end