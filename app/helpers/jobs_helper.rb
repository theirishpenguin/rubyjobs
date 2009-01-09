module JobsHelper
	
	def rss_link
		param_present?(:search) ? formatted_jobs_url(:rss, rss_link_attributes) : "http://feeds.feedburner.com/rubyjobsireland"
	end
	
  def rss_link_attributes
    param_present?(:search) ? {:search => "#{params[:search]}"} : {}
  end
end
