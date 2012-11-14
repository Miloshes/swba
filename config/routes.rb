Swbratislava::Application.routes.draw do
  match '/thanks', :to => 'pages#thanks'
  match '/blogger', :to => 'users#blogger'
  match '/final_pitches', :to => 'users#final_pitches'
  match '/save_blogger', :to => 'users#save_blogger'
end