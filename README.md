mkdir myDirName    #this is the name of your directory
cd /myDirName
git init
touch readME.md   #this is to create an initial file to push
git commit -m "enter commit message here"
git remote add origin git@github.com:YOUR_USERNAME/myDirName.git

curl -u USERNAME:PASSWORD https://api.github.com/user/repos -d\
 '{"name":"myDirName"}' #this will create the repo in github.

# if you haven't generated and SSH key for github access then follow these steps, otherwise you're good to push your shit to github.
eval $(ssh-agent -s)
ssh-keygen -t rsa -b 4096 -C "email@yourdomain.com" #this should be your github email address
## you'll be prompted to a couple of times. Press enter for the first prompt. choose a passphrase for the second prompt, or press enter twice for no passphrase
ssh-add ~/.ssh/id_rsa   #this is your private key
cat ~/.ssh/id_rsa.pub   # copy the output of this command. this is your SSH public key
curl -u USERNAME:PASSWORD https://api.github.com/user/keys -d '{"title":"KEY_NAME", "key":"YOUR_RSA_PUBLIC_KEY_HERE"}'   #the value you copied earlier and your keyname. I recommend using a combination of machine name and app (My-laptop (Git CLI)
git push -u origin master
