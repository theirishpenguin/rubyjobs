require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../factory'

describe JobMailer do
	describe "when sending a confirmation email" do
		before do
			@job = Factory(:job)
			@email = JobMailer.create_confirmation(@job)
		end
		
		it "should be sent to the creator's email address" do
			@email.to.should == [@job.email]
		end
		
		it "should be from jobs@rubyjobs.ie" do #NOTE: GJ: we may move this to configuration later
			@email.from.should == ['jobs@rubyjobs.ie']
		end
		
		it "should provide a link to the job" do
			@email.body.should =~ /www.rubyjobs.ie\/jobs\/#{@job.id}/
		end
		
		it "should provide a link to edit the job" do
			@email.body.should =~ /edit\?key=#{@job.key}/
		end
	end
end
