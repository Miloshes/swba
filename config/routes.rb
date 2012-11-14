Swbratislava::Application.routes.draw do
  
  root :to => 'pages#home'
  
  match '/thanks', :to => 'pages#thanks'
  match '/too_late', :to => 'pages#too_late'
  match '/try_again', :to => 'pages#try_again'
  match '/blogger', :to => 'users#blogger'
  match '/final_pitches', :to => 'users#final_pitches'
  match '/save_blogger', :to => 'users#save_blogger'
  match '/save_observer', :to => 'users#save_observer'
  match '/confirm', :to => 'users#confirm_observer'
end