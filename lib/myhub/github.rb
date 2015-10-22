
module Myhub
  class Github
    include HTTParty
    base_uri "https://api.github.com"

    # Your code here too!
    def initialize
      @headers = {
          "Authorization"  => "token #{ENV["AUTH_TOKEN"]}",
          "User-Agent"     => "HTTParty"
      }
    end

    def get_issues
      Github.get(
          "org/TIY-ATL-ROR-2015-Sep/assignments/issues",
      :headers => @headers,
      :query => {state: "all"}
      )

    end


    def reopen_issue(id)
      Github.patch(
                "/repos/TIY-ATL-ROR-2015-Sep/assignments/issues/#{id}",
                :headers => @headers,
                :body    => ({ :state => "open"}).to_json
      )


    end


    def close_issue(id)
      Github.patch(
          "/repos/TIY-ATL-ROR-2015-Sep/assignments/issues/#{id}",
          :headers => @headers,
          :body    => ({ :state => "closed" }).to_json
      )
    end






  end
end