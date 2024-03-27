#Credit: HoyHin
#setup.sh NGROK_AUTH_TOKEN


#install everyting
sudo apt update
sudo apt install ufw
sudo su
ufw allow 21115:21119/tcp
ufw allow 8000/tcp
ufw allow 21116/udp
sudo ufw enable
wget https://raw.githubusercontent.com/techahold/rustdeskinstall/master/install.sh
chmod +x install.sh
./install.sh
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
  | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
./hbbs
./hbbr
cat ./id_ed25519.pub

#configure ngrok and start it
ngrok config add-authtoken 2XFrlRXy7iQBYRoayFVOmT64Kdj_7LXWFgZAgmvpSj6mogedb 
ngrok http 8080=ap &
