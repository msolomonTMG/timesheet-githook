#! /bin/bash

set -e

echo "Installing timesheet-githook..."
pushd `git rev-parse --git-dir`/hooks > /dev/null

if [ -f post-commit ] || [ -L post-commit ]; then
    echo "A post-commit file already exists."
    read -p "Overwrite? [y/N] " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
    rm -f post-commit
fi

if [ -d timesheet-githook ]; then
    pushd timesheet-githook > /dev/null
    git pull origin
    popd > /dev/null
else
    git clone https://github.com/msolomonTMG/timesheet-githook.git
fi
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
