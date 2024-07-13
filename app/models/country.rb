class Country < ApplicationRecord
    
    before_save { |obj| obj.send("#{:code}=", obj.send(:code).downcase) }
    before_save { |obj| obj.send("#{:alpha_2}=", obj.send(:alpha_2).downcase) }
    before_save { |obj| obj.send("#{:alpha_3}=", obj.send(:alpha_3).downcase) }
    before_save { |obj| obj.send("#{:continent}=", obj.send(:continent).downcase) }
    before_save { |obj| obj.send("#{:sub_continent}=", obj.send(:sub_continent).downcase) }
    
    after_initialize { |obj| obj.send("#{:continent}=", obj.send(:continent).titleize) }
    after_initialize { |obj| obj.send("#{:sub_continent}=", obj.send(:sub_continent).titleize) }

    validates_presence_of :name_en, :name_es, :code, :alpha_2, :continent, :alpha_3
    validates_uniqueness_of :alpha_2, :alpha_3

end