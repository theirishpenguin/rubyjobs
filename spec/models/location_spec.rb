require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../factory'

describe Location do
	describe "validations" do
		it "should be valid with valid attributes" do
			Factory.build(:location).should be_valid
		end
		
		it { should validate_presence_of(:name) }
	end
end
