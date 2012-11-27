Cooperhewitt::Application.routes.draw do


  resource :login, :only => [:show], :controller => 'login'

  resource :callback, :only => [:show], :controller => 'callback'

  resource :search, :only => [:show], :controller => 'search'

  resources :type_of_thing, :path => '', :controller => 'type_of_thing', :only => [:show]

  resource :votes, :only => [:create], :controller => 'votes'

  root :to => 'homepage#show'


end
