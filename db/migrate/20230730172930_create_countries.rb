class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :continent,      null: false, default: "", comment: ""
      t.string :sub_continent,  null: true,  default: "", comment: "Countries on two continents or in America (South|North)"
      t.string :name_es,        null: false, default: ""
      t.string :name_en,        null: false, default: ""
      t.boolean :active,        null: false, default: true
      # coutry codes. Tel and alpha codes
      t.string :code,           null: false, default: "", :limit => 10
      t.string :alpha_2,        null: false, default: "", :limit => 2, index: { unique: true }
      t.string :alpha_3,        null: false, default: "", :limit => 3, index: { unique: true }
    end
  end
end