cd /d %~dp0

git stash -u
git pull --rebase=preserve origin HEAD
git stash pop

call bundle update xingAPI
echo TEST
call bundle exec ruby -rffi -e '' 2>NUL || call gem uninstall ffi -Ia && call gem install ffi --platform ruby

echo TEST
call bundle exec rake server >log.txt 2>log2.txt
echo TEST
