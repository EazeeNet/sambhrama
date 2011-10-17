ActiveAdmin.register CodeType do
    
    form do |f|
      f.inputs "Details" do
        f.input :name        
        f.input :parent_id
      end
      f.buttons
    end
end
