wget https://ipinfo.io/ip -o tmp_ip
if [ $? -ne 0 ]; then
	echo "Could not get public ip, going to have a bit of a cry..."
	exit -1
fi

mv tmp_ip ip
if [ -z $(git diff) ]; then
	echo "Ip is the same, no update needed"
	exit 0
fi

git add ip
git commit -m "updated ip"
# git push origin
