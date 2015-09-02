#!/usr/bin/env ruby
require 'json'
require 'rest-client'
require 'time'

url = "#{ENV['JIRA_URL']}/rest/api/2/search?jql=assignee = #{ENV['USERNAME']} and worklogDate = startOfDay()&fields=worklog"
headers = { 
	:"Authorization" => "Basic #{ENV['JIRA_CREDENTIALS']}",
	:"Content-Type" => "application/json"
}
response = JSON.parse( RestClient.get(url, headers) )
issues = response["issues"]
total_seconds_logged = 0

#set today
time_now = Time.new()
# set beginning of today
today_start =  Time.new(time_now.year,time_now.month,time_now.day)
# set ending of today
today_end =  today_start + 86399

issues.each do |issue|
	if issue["fields"]["worklog"]["total"] > 20
		# We need to query this issue separately
		issue_key = issue["key"]
		url = "#{ENV['JIRA_URL']}/rest/api/2/issue/#{issue_key}/worklog"
		this_issue_worklogs = JSON.parse( RestClient.get(url, headers) )
		worklogs = this_issue_worklogs["worklogs"]
	else
		worklogs = issue["fields"]["worklog"]["worklogs"]
	end

	worklogs.each do |worklog|
		worklog_update_time = Time.parse(worklog["updated"])
		if worklog["author"]["key"] == ENV['USERNAME'] && (today_start..today_end).cover?(worklog_update_time)
			total_seconds_logged += worklog["timeSpentSeconds"]
		end
	end
end

total_time = Time.at(total_seconds_logged).utc.strftime("%Hh %Mm")

puts total_time
