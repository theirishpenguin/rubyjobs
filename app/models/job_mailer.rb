class JobMailer < ActionMailer::Base
  
	def confirmation(job)
		recipients job.email
		from 			'jobs@rubyjobs.ie'
		subject 	'[RubyJobs.ie] Your job is now live'
		body 			:job => job
	end

end
