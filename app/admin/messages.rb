ActiveAdmin.register Message do
  form do |f|
    f.inputs do
      f.input :message_type, :as => :select, :collection => { 'News' =>1 , 'Events' => 2 , 'Thought Of Day' => 3, 'Jokes' => 4, 'Question Of Day' => 5, 'Answer Of Day' => 6    }
     f.input :message_text_short
     f.input :message_text_long
     f.input :event_date
     f.input :exp_date
      end
    f.buttons
  end
end
