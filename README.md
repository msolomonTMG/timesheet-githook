# Timesheet Githook
Asks how long you worked on a commit then logs that amount of time to the corresponding JIRA ticket

## Example
![example](http://i.imgur.com/1qM2ILI.gif)

## Setup
### Clone the Post Commit Hook
- Steps
  1. Open your terminal and change directory to your github repository `` cd my-github-repository ``
  2. Run this command to change your directory to your git hooks folder (you need the back ticks) `` `git rev-parse --git-dir`/hooks ``
  3. Copy the git hook with this command `` wget https://raw.githubusercontent.com/msolomonTMG/timesheet-githook/master/post-commit && chmod +x post-commit ``
  - Be sure to change the JIRA url if you are not from my organization :)

## Usage
- When you commit on a branch that has a JIRA ticket in the name and you do not log time through a [smart commit](https://confluence.atlassian.com/display/FISHEYE/Using+smart+commits#Usingsmartcommits-TransitionyourJIRAissues), a message will pop up asking how long that commit took to code.
- Answer the question in this format:
  - 1d (for one day)
  - 2h (for two hours)
  - 30m (for thirty minutes)
  - 1h 10m (for one hour and ten minutes)

## Notes
- I welcome pull requests to make this better!
- I want an update to not show the message if the commit is a merge
  - [This stack overflow article](http://stackoverflow.com/questions/3824050/telling-if-a-git-commit-is-a-merge-revert-commit) seems like a good place to start for this
