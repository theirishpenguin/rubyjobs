module Factory
  def self.create_job(attributes = {})
    job = Factory.new_job(attributes)
		job.save!
		job
  end

	def self.new_job(attributes = {})
    default_attributes = {
   		:company			 			=> 'ACME Inc.',
			:url						 		=> 'www.acme.org',
			:email							=> 'jobs@acme.org',
			:type_id						=> Factory.create_type.id,
			:location_id				=> Factory.create_location.id,
			:title							=> 'Rails developer required for greenfield project',
			:description				=> 'We are planning on revamping our online store and need someone to build the Rails application',
			:how_to_apply				=> 'Email jobs@acme.org or call 01-1234567'
    }
    Job.new default_attributes.merge(attributes)
  end

  def self.create_location(attributes = {})
    default_attributes = {
      :name => 'Dublin'
    }
    Location.create! default_attributes.merge(attributes)
  end

  def self.create_type(attributes = {})
    default_attributes = {
      :name => 'Contract'
    }
    Type.create! default_attributes.merge(attributes)
  end
end
