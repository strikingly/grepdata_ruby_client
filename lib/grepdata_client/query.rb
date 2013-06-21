module GrepdataClient
  class DataRequest
    attr_reader :request, :url, :params, :headers, :action
    
    def initialize(action, options)
      @action = action.to_s
      @url = "#{options[:url]}/#{@action}"
      @headers = options[:headers] || {}
      @params = options[:params] || {}
      
      params = Utils.format_params @action, @params
      @request = ::Typhoeus::Request.new(@url, params: params, headers: @headers)
    end
    
    def get_result
      return @request.response.body
    end
  end
end