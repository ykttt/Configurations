
emerge ccache aria2 flaggie eselect-repoistory

ln -sf ../../portage/make.conf /etc/portage/make.conf


ln -sf ../x11/xprofile ~/.xprofile
ln -sf ../x11/Xresources ~/.Xresources
ln -sf ../x11/xorg.conf /etc/X11/xorg.conf

ln -sf ../../shell/zshrc ~/.zshrc
ln -sf ../../shell/zprofile ~/.zprofile

ln -sf ../../../../../externalConfigrations ~/.config

emerge --sync
emerge -tauvDN @world

emerge -a macchina fcitx alacritty feh firefox-bin git nvim ranger sddm
emerge -a AdGuardHome-bin
emerge -a zathura krita
emerge -a libreoffice-bin

cd ../../../../../miscPackages/dwm
make clean install
cd ../../../../../miscPackages/dwmblocks-async
make clean install
