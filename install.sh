#! /bin/bash

set -e

echo "Installing timesheet-githook..."
pushd `git rev-parse --git-dir`/hooks > /dev/null
git clone https://github.com/msolomonTMG/timesheet-githook.git
ln -s timesheet-githook/post-commit post-commit
chmod +x post-commit timesheet-githook/sum_time.rb

pushd timesheet-githook > /dev/null
bundle=$(which bundle)
if [ ! -z "$bundle" ] && [ ! -x "$bundle" ]; then
    echo "Installing Ruby Bundler..."
    sudo gem install bundler
fi
bundle install
popd > /dev/null

popd > /dev/null
echo "Done!"
