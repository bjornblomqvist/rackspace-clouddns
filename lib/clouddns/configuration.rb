module CloudDns
  module Configuration
    @@logger = false
    @@fetch_async_responses = true
  
    # Set logger mode
    #
    # value - Enable/disable logger
    #
    def log_requests= (value)
      @@logger = value == true
    end
  
    # Return current logger state
    #
    def log_requests
      @@logger
    end
  
    def fetch_async_responses= (value)
      @@fetch_async_responses = value == true
    end
  
    def fetch_async_responses
      @@fetch_async_responses
    end
  end
end
