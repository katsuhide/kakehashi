#!/bin/bash

set -ex

# Ruby

## rbenv
[[ ! -d .rbenv ]] && git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
[[ ! -d .rbenv/plugins ]] && git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
[[ ! -f .bash_profile ]] && touch ~/.bash_profile
grep -q -e "PATH.*rbenv" ~/.bash_profile || \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
grep -q -e "rbenv init" ~/.bash_profile || echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile

## gem
[[ ! -f ~/.gemrc ]] && echo 'gem: --no-rdoc --no-ri' > ~/.gemrc

## ruby
ruby_version="2.1.2"
rbenv versions | grep -q $ruby_version || \
    ( rbenv install $ruby_version && rbenv global $ruby_version )
gem list | awk '{print $1}' | grep -xq bundler || gem install bundler