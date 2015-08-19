# Timesheet Githook
Asks how long you worked on a commit then logs that amount of time to the corresponding JIRA ticket

## Setup
- Save the post-commit file in the git hooks directory of your git project
  - For example, my file lives here: timesheet-githook/.git/hooks/post-commit

## Usage
- When you commit on a branch that has a JIRA ticket in the name and you do not log time through a [smart commit](https://confluence.atlassian.com/display/FISHEYE/Using+smart+commits#Usingsmartcommits-TransitionyourJIRAissues), a message will pop up asking how long that commit took to code.
- Answer the question in this format:
  - 1d (for one day)
  - 2h (for two hours)
  - 30m (for thirty minutes)
  - 1h 10m (for one hour and ten minutes)

