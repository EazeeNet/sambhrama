require 'spec_helper'

describe StaticController do

  describe "GET 'about_us'" do
    it "should be successful" do
      get 'about_us'
      response.should be_success
    end
  end

  describe "GET 'kannada_culture'" do
    it "should be successful" do
      get 'kannada_culture'
      response.should be_success
    end
  end

  describe "GET 'about_member'" do
    it "should be successful" do
      get 'about_member'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
  end

end
