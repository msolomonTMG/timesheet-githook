# Timesheet Githook
Asks how long you worked on a commit then logs that amount of time to the corresponding JIRA ticket

## Example
![example](http://i.imgur.com/1qM2ILI.gif)

## Setup
### Clone the Gist
- Clone the [Timesheet-Githook Gist](https://gist.github.com/msolomonTMG/befb53eb3ceb23509d04) in the git hooks directory of your git project
  - For example, my file lives here: timesheet-githook/.git/hooks/post-commit
  - If you are using a submodules, go to the directory that you would like to use this hook for and run ``git rev-parse --git-dir`/hooks`` to get your installation path
- Example Steps
  - ``cd my-github-repository/.git/hooks``
  - ``wget https://gist.githubusercontent.com/msolomonTMG/befb53eb3ceb23509d04/raw/27520333339ef054b7ecf6ee5253d822131db9e9/post-commit``
  - Be sure to change the JIRA url if you are not from my organization :)

## Usage
- When you commit on a branch that has a JIRA ticket in the name and you do not log time through a [smart commit](https://confluence.atlassian.com/display/FISHEYE/Using+smart+commits#Usingsmartcommits-TransitionyourJIRAissues), a message will pop up asking how long that commit took to code.
- Answer the question in this format:
  - 1d (for one day)
  - 2h (for two hours)
  - 30m (for thirty minutes)
  - 1h 10m (for one hour and ten minutes)

## Features
- I welcome pull requests to make this better!
