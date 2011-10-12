class CodeType < ActiveRecord::Base
  has_many :types, :class_name=>'CodeType', :foreign_key => "parent_id"
end
