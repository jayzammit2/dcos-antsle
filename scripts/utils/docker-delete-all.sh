# Utility to stop and clean up docker processes. Not needed for the install but can be handy when troubleshooting

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
