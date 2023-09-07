docker build . -t harbor.dotglitch.dev/library/vx-site:$version

# Push the new docker image
docker push harbor.dotglitch.dev/library/vx-site:$version
