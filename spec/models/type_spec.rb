require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../factory'

describe Type do
	#it { should validate_presence_of(:name) } #NOTE: GJ: why is this not working with rspec-rails 1.1.12??
	
	describe "validations" do
		it "should be valid with valid attributes" do
			Factory.build(:type).should be_valid
		end
	
		it "should ensure that a name is provided" do
			type = Factory.build(:type, :name => nil)
			type.should_not be_valid
			type.errors.on(:name).should_not be_nil
		end
	end
end
