# Encoding: utf-8
require 'spec_helper'

describe Flick do
  it 'responds to starrable?' do
    flick = Flick.new
    flick.should respond_to :starrable?
    flick.starrable?.should == true
  end
end
