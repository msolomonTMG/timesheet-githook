# Timesheet Githook
Asks how long you worked on a commit then logs that amount of time to the corresponding JIRA ticket. Feel free to log issues or send PRs. Here is the [blog post](http://mike-solomon.com/timesheet-githook) if you'd like a walkthrough of the code or if you would like to leave comments, suggestions or share experiences.

## Example
![example](http://i.imgur.com/s4v8eKS.gif)

## Setup
1. Open your terminal
2. cd to your github repo
3. enter this command: `curl -sSL https://raw.githubusercontent.com/msolomonTMG/timesheet-githook/master/install.sh | bash`

## Usage
- When you commit on a branch that has a JIRA ticket in the name and you do not log time through a [smart commit](https://confluence.atlassian.com/display/FISHEYE/Using+smart+commits#Usingsmartcommits-TransitionyourJIRAissues), a message will pop up asking how long that commit took to code.
- Answer the question in this format:
  - 1d (for one day)
  - 2h (for two hours)
  - 30m (for thirty minutes)
  - 1h 10m (for one hour and ten minutes)

## Notes
- I welcome pull requests to make this better!
