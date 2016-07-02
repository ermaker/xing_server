cd /d %~dp0
bundle update xingAPI
bundle exec rake server >log.txt 2>log2.txt
