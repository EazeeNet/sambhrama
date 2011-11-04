require 'spec_helper'

describe NewsController do

  describe "GET 'fetch'" do
    it "should be successful" do
      get 'fetch'
      response.should be_success
    end
  end

end
