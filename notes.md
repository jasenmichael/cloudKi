```bash
# to build
# from root
git submodule add -b -f master git@github.com:jasenmichael/cloudKi-modules.git modules
# from modules
git submodule add -b master https://github.com/jasenmichael/cloudKi-static-server-module static-server
git submodule add -b master https://github.com/jasenmichael/pm2-ui pm2-ui
git submodule add -b master https://github.com/jasenmichael/cloudKi-cloud-client-module cloud-client


git submodule update 
git submodule foreach git checkout master 
git submodule foreach git pull origin master

# cd static-server
# git pull origin master
# cd ../pm2-ui
# git pull origin master
# cd ../cloud-ui
# git pull origin master
# cd ../

# not needed on newer git v's
git submodule update --init --recursive

# init submodules needed after clone
git clone git@github.com:jasenmichael/CloudKi-modules.git modules
cd modules
git submodule update --init --recursive

```