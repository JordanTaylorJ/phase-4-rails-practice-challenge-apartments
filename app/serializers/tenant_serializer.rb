class TenantSerializer < ActiveModel::Serializer
  attributes :id, :name, :age 

  #has_many :leases
  #has_many :apartments

  #def four_char
  #  "#{self.object.name[0..3]}"
  #end 

  #def greater_than_four
  #  if self.object.name.length > 4 
  #    "#{self.object.name}"
  #  else
  #    "name is too short!"
  #  end 
  #end

end
