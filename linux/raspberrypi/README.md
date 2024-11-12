## frp
```bash
mkdir -p ~/TOOL/
cd ~/TOOL/
VER=0.51.2
NAME=frp_${VER}_linux_arm64
wget "https://github.com/fatedier/frp/releases/download/v${VER}/${NAME}.tar.gz"
tar zxvf ${NAME}.tar.gz
ln -s ${NAME} frp
```

## ssh
```bash
ssh-copy-id -p 6201 peng@sucicada.cf
ssh -p 6201 peng@sucicada.cf
```
