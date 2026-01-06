sha256sum install.sh > install.sh.sha256
gpg --full-generate-key
gpg --list-keys
gpg --detach-sign install.sh.sha256 
gpg --local-user <LOCAL_USER> --detach-sign install.sh.sha256 
sha256sum -c install.sh.sha256
gpg --verify install.sh.sha256.sig install.sh.sha256
echo "echo NAPAD" >> install.sh
sha256sum -c install.sh.sha256
./install.sh 