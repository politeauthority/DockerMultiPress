wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
rm ./latest.tar.gz
rm -rf ./wordpress/wp-content/themes/*

cd ./wordpress/wp-content/themes
git init
git remote add -f origin \
 https://77769abf84e1c7de499d21a296fa88b7d8f9cf7a@github.com/ActiveWebsite/Blog-Themes.git
git config core.sparsecheckout true 

echo Slifer-Vail-Valley >> .git/info/sparse-checkout
echo Slifer-Summit-County >> .git/info/sparse-checkout
echo "__plugins/" >> .git/info/sparse-checkout
git fetch origin docker
git pull origin docker
rm -rf ../plugins/*
cp -r __plugins/* ../plugins/
cd ../../
git clone -b docker https://github.com/politeauthority/WpBooj.git ./wp-content/plugins/WpBooj
