cd /d %~dp0

git stash -u
git pull --rebase=preserve origin HEAD
git stash pop

bundle update xingAPI
bundle exec rake server >log.txt 2>log2.txt
