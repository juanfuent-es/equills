class CreateEquills < ActiveRecord::Migration[7.0]

  def change

    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :equills, id: :uuid do |t|
      t.string :name,         default: ""
      t.string :difficult,    default: ""
      t.string :icon,         default: ""
      t.string :thumb,        default: ""
      t.string :preview,      default: ""
      t.string :slug,         default: ""
      t.string :family,       default: ""
      t.string :param_1,      default: ""
      t.string :param_2,      default: ""
      t.boolean :public
      t.text :js
      t.text :css
      t.text :html
      t.text :libraries
      t.text :description
      t.timestamps
    end

    create_table :shortcuts do |t|
      t.references :equill, null: false, foreign_key: true, type: :uuid
      t.string :name,       default: ""
      t.string :unicode,    default: ""
    end

    create_table :properties do |t|
      t.references :equill, null: false, foreign_key: true, type: :uuid
      t.string :name,       default: "", null: false
      t.string :key,        default: "", null: false
      t.string :tipo,       default: "Float", null: false
      t.float :min,         default: 0.0
      t.float :max,         default: 0.0
      t.float :step,        default: 0.0
      t.jsonb :range,       default: '{min:0.0,max:0.0,step:0.0}'
      t.timestamps
    end

  end

end