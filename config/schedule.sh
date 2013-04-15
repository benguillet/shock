#!/bin/zsh
export PATH=$HOME/.rbenv/shims:/usr/local/share/python:/usr/local/heroku/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/texbin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

cd /Users/tartopom/Dropbox/Projects/perso/shock && RAILS_ENV=development bundle exec rake earthquake:import --silent >> ~/Dropbox/Projects/perso/shock/log/import.log 2>&1
