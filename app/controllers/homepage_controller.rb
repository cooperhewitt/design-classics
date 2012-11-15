class HomepageController < ApplicationController

  def show

    options = {
      :body => {
        "method" => "cooperhewitt.objects.getRandom",
        "access_token" => "5c39afbf961a01785e6477be4879c93b"
      }
    }

    @response = HTTParty.post('https://api.collection.cooperhewitt.org/rest/', options)

  end

end
