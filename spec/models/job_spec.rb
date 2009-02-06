require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../factory'

describe Job do
	describe "when creating a job" do
		it "should have a key" do
			@job = Factory(:job)
			@job.key.should_not be_nil
		end

		it "should have a unique key" do
			@job1 = Factory(:job)
			@job2 = Factory(:job)
			@job1.key.should_not == @job2.key
		end
	end

	describe "when saving a job" do
		it "the key should be the same as before the save" do
			@job1 = Factory(:job)
			pre_save_key = @job1.key
			@job1.save!
			@job1.key.should == pre_save_key
		end
	end

	describe "validations" do
		it "should be valid with valid attributes" do
			Factory(:job).should be_valid
		end

		it "should ensure that a company is provided" do
			@job = Factory.build(:job, :company => nil)
			@job.should_not be_valid
			@job.errors.on(:company).should_not be_nil
		end

		it "should ensure that an email is provided" do
			@job = Factory.build(:job, :email => nil)
			@job.should_not be_valid
			@job.errors.on(:email).should_not be_nil
		end

		it "should ensure that email is a valid email" do
			@job = Factory.build(:job, :email => 'invalid@email')
			@job.should_not be_valid
			@job.errors.on(:email).should_not be_nil
		end

		it "should ensure that a type_id is provided" do
			@job = Factory.build(:job, :type_id => nil)
			@job.should_not be_valid
			@job.errors.on(:type_id).should_not be_nil
		end

		it "should ensure that a location_id is provided" do
			@job = Factory.build(:job, :location_id => nil)
			@job.should_not be_valid
			@job.errors.on(:location_id).should_not be_nil
		end

		it "should ensure that a title is provided" do
			@job = Factory.build(:job, :title => nil)
			@job.should_not be_valid
			@job.errors.on(:title).should_not be_nil
		end

		it "should ensure that a description is provided" do
			@job = Factory.build(:job, :description => nil)
			@job.should_not be_valid
			@job.errors.on(:description).should_not be_nil
		end

		it "should ensure that a how_to_apply is provided" do
			@job = Factory.build(:job, :how_to_apply => nil)
			@job.should_not be_valid
			@job.errors.on(:how_to_apply).should_not be_nil
		end
	end

	describe "searching" do
		it "should be searchable" do
			Job.should respond_to(:search_for)
		end
		
		it "should search the company" do
			Job.search_for('google').length.should == 0
			Factory(:job, :company => 'Google')
			Job.search_for('google').length.should == 1
		end
		
		it "should search the title" do
			Job.search_for('contract').length.should == 0
			Factory(:job, :title => 'Developer needed (contract)')
			Job.search_for('contract').length.should == 1
		end
		
		it "should search the description" do
			Job.search_for('june 2009').length.should == 0
			Factory(:job, :description => 'This job starts in June 2009')
			Job.search_for('june 2009').length.should == 1
		end
		
		it "should search the how_to_apply" do
			Job.search_for('jobs@acme.org').length.should == 0
			Factory(:job, :how_to_apply => 'email us - jobs@acme.org')
			Job.search_for('jobs@acme.org').length.should == 1
		end
		
		it "should search the location" do
			Job.search_for('dublin').length.should == 0
			Factory(:job, :location => Factory(:location, :name => 'Dublin'))
			Job.search_for('dublin').length.should == 1
		end
		
		it "should search the type" do
			Job.search_for('permanent').length.should == 0
			Factory(:job, :type => Factory(:type, :name => 'Permanent'))
			Job.search_for('permanent').length.should == 1
		end
	end
end
