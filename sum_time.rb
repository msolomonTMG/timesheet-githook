#!/usr/bin/env ruby
require 'json'
require 'rest-client'
require 'time'

def sum_time(worklogs)
  worklogs = JSON.parse(worklogs)

  total_seconds_logged = 0

  worklogs.each do |worklog|
    total_seconds_logged += worklog["timeSpentSeconds"]
  end

  # Convert the seconds of time spent into hours and minutes
  total_time = Time.at(total_seconds_logged).utc.strftime("%Hh %Mm")

  puts total_time
  exit
end

# Find all worklogs for this user today
url = "#{ENV['JIRA_URL']}/rest/tempo-timesheets/3/worklogs"
headers = { 
  :"Authorization" => "Basic #{ENV['JIRA_CREDENTIALS']}",
  :"Content-Type" => "application/json"
}

response = RestClient.get(url, headers){ |response, request, result, &block|
  case response.code
  when 401
    puts "unauthorized"
    exit
  else
    sum_time response
  end
}