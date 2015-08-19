# Timesheet Githook
Asks how long you worked on a commit then logs that amount of time to the corresponding JIRA ticket

## Example
![example](http://i.imgur.com/1qM2ILI.gif)

## Setup
### Clone the [Gist](https://gist.github.com/msolomonTMG/befb53eb3ceb23509d04)
- Steps
  1. ``cd my-github-repository/.git/hooks``
  2. ``git rev-parse --git-dir`/hooks``
  3. ``wget https://gist.githubusercontent.com/msolomonTMG/befb53eb3ceb23509d04/raw/27520333339ef054b7ecf6ee5253d822131db9e9/post-commit && chmod +x post-commit``
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
