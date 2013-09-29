require 'rubygems'
require 'bundler/setup'
require 'spec'
$: << '.'
require 'spec_helper'
require 'sample'

describe Sample do
  it "should return 1", :example_for => 'spec annotation' do
    Sample.new.one.should == 1
  end
end
