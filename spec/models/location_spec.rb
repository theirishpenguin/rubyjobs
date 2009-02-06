require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../factory'

describe Location do
	describe "validations" do
		it "should be valid with valid attributes" do
			Factory.build(:location).should be_valid
		end
		
		it "should ensure that a name is provided" do
			location = Factory.build(:location, :name => nil)
			location.should_not be_valid
			location.errors.on(:name).should_not be_nil
		end
	end
end
