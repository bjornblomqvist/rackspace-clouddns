require 'spec_helper'

describe 'CloudDns::AsyncResponse' do
  before :each do
    stub_authentication
    @client = CloudDns::Client.new(:username => 'foo', :api_key => 'bar')
  end
  
  it 'requires client, data hash and job id' do
    proc { CloudDns::AsyncResponse.new(@client, nil) }.
      should raise_error ArgumentError, "Data required!"
      
    proc { CloudDns::AsyncResponse.new(@client) }.
      should raise_error ArgumentError, "Job ID required!"
  end
  
  it 'returns a response content' do
    stub_get("/status/5fa38d01-1805-4f4f-a41a-56a3859f7ea0", {}, 'domain_export.json')
    
    resp = CloudDns::AsyncResponse.new(@client, '5fa38d01-1805-4f4f-a41a-56a3859f7ea0')
    resp.content.should be_a Hash
  end
end
