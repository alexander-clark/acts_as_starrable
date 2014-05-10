# Encoding: utf-8
require 'spec_helper'

describe User do
  it 'responds to starrable?' do
    user = User.new
    user.should respond_to :starrable?
    user.starrable?.should == false
  end
end
