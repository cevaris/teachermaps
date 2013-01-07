require 'google/api_client'

class GoogleApi

	attr_accessor :documents, :authorization_uri, 

	def initialize
		@client = client()
		@documents = Array.new
	end     

	def documents
		@documents
	end

	def authorization_uri
		@client ||= client()
		@client.authorization.authorization_uri.to_s
	end 

	def refresh_token (auth_code)

		@client ||= client()

		if @client.authorization.access_token.nil
			# Rails.logger.info("Google Auth Code: #{auth_code}")  
		    @client.authorization.code = auth_code
		    @client.authorization.fetch_access_token!
		end
	  
	end

	def fetch_documents

		@documents = (begin
			drive = @client.discovered_api('drive', 'v2')

		    result = Array.new
		    
		    api_result = @client.execute(
		      :api_method => drive.files.list
		    )

		    if api_result.status == 200
		      files = api_result.data
		      result.concat(files.items)
		    else
		      Rails.logger.info("An error occurred pulling data from Google API HTTP Error #{api_result.status}")
		    end

		    result
		end)
	end


	def client()
		@client ||= (begin
			client = Google::APIClient.new

			client.authorization.client_secret = Rails.application.config.CLIENT_SECRET
			client.authorization.redirect_uri  = Rails.application.config.REDIRECT_URI
			client.authorization.client_id     = Rails.application.config.CLIENT_ID
			client.authorization.scope         = Rails.application.config.SCOPES

			client
		end)
	end

end