require "sinatra/base"
require "httparty"
require "pry"

require "myhub/version"
require "myhub/github"

module Myhub
  class App < Sinatra::Base
    set :logging, true

    # Your code here ...

    get "/" do
      binding.pry
      api = Github.new
      #get stuff from github
      stuff=api.get_issues
      erb :index, locals: {issues: stuff}
    end


  post "/issue/reopen/:id" do
    api = Github.new
    api.reopen_issue(params["id"].to_i)
    "Cool Cool Cool"
  end


   post "/issue/close/:id" do
     api = Github.new
     api.close_issue(params["id"].to_i)
     "the issue is closed"
end

    run! if app_file == $0
  end
end

# put "/issue/:id" do
#   api = Github.new
#   if params["state"] == "reopen"
#     api.reopen_issue(params["id"].to_i)
#   elsif params["state"] == "close"
#     api.close_issue(params["id"].to_i)
#   end
# end