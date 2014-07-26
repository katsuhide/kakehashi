# README

## セットアップ
### はじめに
* kakehashiをforkしてclone
* bundle install
* install postgres
* postgresを起動
* rake db:migrate
* rake db:seed
* spring rails server
* これで起動
* twitter.rakeを使う場合はtwitter api keyの登録をする

### Twitter API Keyの登録
こんな感じで環境変数にTwitter API Keyに登録する

	# Twitter
	export CONSUMER_KEY='XXXX','XXXXX'
	export CONSUMER_SECRET='XXXXX','XXXXX'
	export ACCESS_TOKEN='XXXXXX','XXXXXX'
	export ACCESS_TOKEN_SECRET='XXXXX','XXXXX'

Twitter API Keyの登録は[こちら](https://dev.twitter.com)
