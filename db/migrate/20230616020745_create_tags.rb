class CreateTags < ActiveRecord::Migration[7.0]

  def change
    create_table :tags do |t|
    	t.string :name,	null: false, default: "", :limit => 20
    end

    create_table :taggings do |t|
      t.references :page, 	null: false,	foreign_key: true, type: :uuid
      t.references :tag, 	  null: false,	foreign_key: true
      t.index [:tag_id, :page_id], unique: true
    end
    
  end

end