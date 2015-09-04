#!/usr/bin/env ruby
require 'json'
require 'rest-client'
require 'time'

def sum_time(response)

  response = JSON.parse(response)

  issues = response["issues"]
  total_seconds_logged = 0

  #set today
  time_now = Time.new()
  # set beginning of today
  today_start =  Time.new(time_now.year,time_now.month,time_now.day)
  # set ending of today
  today_end =  today_start + 86399

  issues.each do |issue|
    # If there are more than 20 worklogs for this issue, query the worklogs for this issue only to get them all
    # This is a limitation of JIRA (see https://ecosystem.atlassian.net/browse/ACJIRA-72)
    if issue["fields"]["worklog"]["total"] > 20
      issue_key = issue["key"]
      url = "#{ENV['JIRA_URL']}/rest/api/2/issue/#{issue_key}/worklog"
      this_issue_worklogs = JSON.parse( RestClient.get(url, headers) )
      worklogs = this_issue_worklogs["worklogs"]
    else
      worklogs = issue["fields"]["worklog"]["worklogs"]
    end

    # If the worklog's author is this user and the update time is from today, add the time spent to the total time spent today
    worklogs.each do |worklog|
      worklog_update_time = Time.parse(worklog["updated"])
      if worklog["author"]["key"] == ENV['USERNAME'] && (today_start..today_end).cover?(worklog_update_time)
       total_seconds_logged += worklog["timeSpentSeconds"]
      end
    end
  end

  # Convert the seconds of time spent into hours and minutes
  total_time = Time.at(total_seconds_logged).utc.strftime("%Hh %Mm")

  puts total_time
  exit

end

# Find all issues that are assigned to this user and have a worklog date of today
url = "#{ENV['JIRA_URL']}/rest/api/2/search?jql=assignee=#{ENV['USERNAME']}%20and%20worklogDate=startOfDay()&fields=worklog"
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