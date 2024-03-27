#Credit: HoyHin
#setup.sh NGROK_AUTH_TOKEN


#install eve
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
  | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok

#configure ngrok and start it
ngrok config add-authtoken 2XFrlRXy7iQBYRoayFVOmT64Kdj_7LXWFgZAgmvpSj6mogedb 
ngrok tcp 5900 --region=ap &
