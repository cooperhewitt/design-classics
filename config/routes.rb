Cooperhewitt::Application.routes.draw do


  resource :login, :only => [:show], :controller => 'login'

  resource :callback, :only => [:show], :controller => 'callback'

  root :to => 'homepage#show'


end
