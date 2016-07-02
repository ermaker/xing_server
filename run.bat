cd /d %~dp0

git stash -u
git pull --rebase=preserve origin HEAD
git stash pop

REM call bundle update xingAPI
REM call gem uninstall ffi -Ia
REM call gem install ffi --platform ruby

call bundle exec rake server >log.txt 2>log2.txt
