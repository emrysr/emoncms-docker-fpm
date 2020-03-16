# docker-compose file intended for use with balena os deployment

log in to balena cloud and get the remote address to add:

eg:
```
git remote add balena gh_emrysr@git.balena-cloud.com:gh_emrysr/emoncms.git
```
(only allows push if your local public key associated to your balena account)

push committed changes to all devices associated to your balena "application":
```
git push balena 
```

test the "Public device URL" to see if emoncms works
