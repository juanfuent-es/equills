module PostsHelper

  def time_ago (date)
    return time_ago_in_words(date)
  end

  def tag_cloud(tags, classes)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      index = tag.count.to_f / max.count * (classes.size - 1)
      yield(tag, classes[index.round])
    end
  end

  def add_page_block(f)
		new_object = Block.new
    id = new_object.object_id
		fields = f.fields_for(:blocks, new_object) do |builder|
			render("admin/pages/block_fields", object: builder, idx: id)
		end
		link_to('<i class="fa-solid fa-plus"></i> Nuevo Bloque'.html_safe, '#', :id => "add-new-block", class:  "float-right btn btn-primary btn-sm", data: { id: id, fields: fields.gsub("\n", "") })
	end
  
  def add_page_asset(f)
		new_object = Asset.new
    id = new_object.object_id
		fields = f.fields_for(:assets, new_object) do |builder|
			render("admin/pages/asset_fields", object: builder, idx: id)
		end
		link_to('<i class="fa-solid fa-plus"></i> Nuevo Asset'.html_safe, '#', :id => "add-new-asset", class:  "float-right btn btn-primary btn-sm", data: { id: id, fields: fields.gsub("\n", "") })
	end

end