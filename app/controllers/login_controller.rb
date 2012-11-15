class LoginController < ApplicationController


  def show
    client = OAuth2::Client.new('e129d553792a9f1a4237df58321fd911', 'client_secret', :site => 'https://api.collection.cooperhewitt.org/rest/')

    render :text => client.auth_code.authorize_url(:redirect_uri => 'http://localhost:8080/oauth2/callback')
  end

end
