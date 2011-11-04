ActiveAdmin.register NewsTicker do
  form do |f|
    f.inputs do
      f.input :title
      f.input :description, :as => :radio
      end
    f.buttons
  end
end
