class CreateMedia < ActiveRecord::Migration[7.0]
  def change
    
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    # create_table :videos, id: :uuid do |t|
    #   t.string :title,    unique: true, null: false, default: ""
    #   t.string :slug,     unique: true, null: false, default: ""
    #   t.string :poster,   default: ""
    #   t.string :file,     null: false, default: ""
    #   t.integer :width,   null: false, default: 0
    #   t.integer :height,  null: false, default: 0
    #   t.timestamps
    # end

    # create_table :images, id: :uuid do |t|
    #   #better seo, naming with title photo
    #   t.string :title,    unique: true, null: false, default: ""
    #   t.string :slug,     unique: true, null: false, default: ""
    #   t.string :alt,      null: false, default: ""
    #   t.integer :width,   null: false, default: 0
    #   t.integer :height,  null: false, default: 0
    #   # img data
    #   t.string :file,     default: ""
    #   t.string :mime_type,null: false, default: ""
    #   t.string :extension,null: false, default: ""
    #   # extract colors with imagemagick
    #   t.string :rainbow,    default: "#FFF,#000"
    #   t.string :bg,       default: "#FFF"
    #   t.string :color,    default: "#000"

    #   t.timestamps
    # end
  end
end