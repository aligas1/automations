# install open ssh

# create empty txt file for y command
echo "Y
" > yes.txt

# install openssh 
sudo apt install openssh-client
sudo apt install openssh-server < yes.txt
rm yes.txt

# create empty txt for enter command
# generate public/private ssh key pair
echo "
" > enter.txt
ssh-keygen  < enter.txt

# ssh-copy-id localhost to authorized keys
cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys
rm enter.txt

# remove firewall permisions
sudo ufw allow ssh
