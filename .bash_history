htop
#1645090964
doom sync
#1645091893
htop
#1645100282
ps aux | rg gnome
#1645100760
ps -o pid,user,%mem,command ax | sort -b -k3 -r
#1645100799
ps aux | rg gnome
#1645100811
sudo pmap 8887
#1645100989
htop
#1645101156
cd /
#1645101163
cd etc
#1645101166
rg dvorak
#1645101193
cd default/
#1645101199
cat keyboard 
#1645101218
cd ..
#1645101223
rg  XKBVARIANT
#1645101250
htop
#1645112217
sudo swapoff 
#1645112227
sudo swapoff -a
#1645090689
yarn dev
#1645090677
yarn dev
#1645090665
redis-server 
#1645090656
screen
#1645112608
htop
#1645112693
docker stop $(docker ps -aq)
#1645112705
htop
#1645112940
killall sway
#1645112968
htop
#1645113301
pkill sway
#1645113375
pkill i3
#1645113400
htop
#1645113407
sway --help
#1645113420
sway -C
#1645113527
i3-sensible-terminal 
#1645113559
dmenu
#1645113588
wofi
#1645113625
wofi --help
#1645113644
wofi show
#1645113686
wofi --show=drun
#1645113754
dmenu
#1645113766
dmenu_run
#1645113780
pkill dmenu
#1645114260
pkill sway
#1645114307
htop
#1645114320
pkill gnome-shell
#1645114369
htop
#1645176211
cd
#1645176214
cd /tmp
#1645176224
cd git/voady-api/
#1645176233
cd git/voady-company/
#1645383264
htop
#1645176226
yarn dev
#1645394480
yarn generate
#1645394493
yarn dev
#1645397782
yarn generate
#1645429380
npm i -g graphql-language-service-server
#1645434991
yarn dev
#1645435920
yarn generate
#1645437577
yarn dev
#1645439037
yarn generate
#1645439810
yarn dev
#1645441641
db-migrate up
exit
#1645176236
yarn dev
#1645454241
sudo swapoff -a
#1645454246
htop
#1645441653
yarn dev
#1645476833
yarn generate
#1645477062
db-migrate up
#1645477611
yarv dev
#1645477087
yarn dev
#1645533433
yarn generate
#1645536242
cd .dotfiles/
#1645536243
git status
#1645536256
cd ..
#1645536264
cd .dotfiles/
#1645536271
ls -la
#1645477615
yarn dev
#1645533442
yarn dev
#1645176217
redis-server 
#1645130392
screen
#1645565053
cd /tmp
#1645565064
cd git/voady-api/
#1645565131
db-migrate create rental-chair-invoicing-settings --sql-file
#1645565508
yarn generate
#1645604185
cd git/voady-company/
#1645605371
htop
#1645605381
sudo swapoff -a
#1645604176
yarn dev
#1645610474
db-migrate down
#1645611293
db-migrate up
#1645611305
yarn generate
#1645611317
yarn dev
#1645612237
db-migrate down
#1645612657
db-migrate up
#1645612878
-- BEGIN
#1645612878
-- DECLARE n INT DEFAULT 0;
#1645612878
-- DECLARE i INT DEFAULT 0;
#1645612878
-- Select COUNT(*) FROM Company INTO n;
#1645612878
-- SET i=0;
#1645612878
-- WHILE i<n DO
#1645612878
--   INSERT INTO `RentalChairInvoicingItem` (`id`, `createdAt`, `updatedAt`, `title`, `unit`, `itemSum`, `company`)
#1645612878
--   VALUES
#1645612878
--   (UUID(), NOW(), NOW(), "Hyra", "kr", "5000", (Select id FROM Company LIMIT i,1)) ;
#1645612878
--   SET i = i + 1;
#1645612878
-- END WHILE;
#1645612878
-- END;
#1645612886
db-migrate up
#1645612934
db-migrate down
#1645612945
db-migrate up
#1645615149
yarn dev
#1645620559
htop
#1645620580
docker stop $(docker ps -aq)
#1645622177
db-migrate up
#1645622187
docker ps
#1645622198
docker start voady-api-mysql-db-1 
#1645622209
docker start voady-api-prisma-1 
#1645622212
docker ps
#1645622219
db-migrate up
#1645623614
db-migrate down
#1645624170
db-migrate up
#1645626646
db-migrate down
#1645626671
db-migrate up
#1645626685
db-migrate down
#1645626763
db-migrate up
#1645627483
db-migrate down
#1645627486
db-migrate up
#1645627712
db-migrate down
#1645627716
db-migrate up
#1645627770
yarn generate
#1645627794
yarn dev
#1645604193
yarn dev
#1645565055
redis-server 
#1645690424
htop
#1645719262
docker stop $(docker ps -aq)
#1645719279
htop
#1645735013
cd dev/fulcro-app/
#1645735015
yarn install
#1645735027
npx shadow-cljs server
#1645735158
clj -A:dev -J-Dtrace -J-Dguardrails.enabled=true
#1645743780
cd
#1645743784
cd .config
#1645743789
ls -la
#1645743794
cd
#1645743803
cd .dotfiles/
#1645743813
stow
#1645743881
stow .
#1645743885
cd
#1645743889
cd .config
#1645743898
ls -a
#1645743905
ls -la
#1645743915
cd clj-kondo/
#1645771757
cd
#1645771760
cd .config
#1645771777
cd
#1645771780
la
#1645771805
rm n
#1645771815
rm -rf .vim
#1645771875
htop
#1645738713
clj -M:dev -J-Dtrace -J-Dguardrails.enabled=true
#1645771888
htop
#1645772006
nvim
#1645772125
cd
#1645772133
cd .dotfiles/.config/
#1645772138
mkdir nvim
#1645772140
cd nvim
#1645776331
cd /tmp
#1645776337
cd
#1645776343
cd git/voady-api/
#1645776365
cd
#1645776373
cd git/voady-company/
#1645776435
docker pps
#1645776440
docker ps
#1645782935
htop
#1645776353
yarn dev
#1645776333
redis-server 
#1645783238
htop
#1645783749
db-migrate up
#1645793509
nvim --version
#1645793533
which nvim
#1645793558
which vim
#1645793564
which vi
#1645804128
nvim
#1645804196
cd
#1645804217
cd .dotfiles/.config/nvim/
#1645804223
touch init.lua
#1645804234
neovide init.lua 
#1645804269
cat init.lua 
#1645804274
nvim init.lua 
#1645804284
cd
#1645804288
cd .local/
#1645804292
fd lunar
#1645804307
cd share
#1645804318
rm -rf nvim/
#1645804328
rm -rf lunarvim
#1645804338
rm -rf lunarvim.bak/
#1645804542
cd
#1645804546
cd .config/
#1645804548
fd neo
#1645804557
fd vide
#1645804562
fd neovide
#1645804565
cd
#1645804568
neovide
#1645804774
which neovide
#1645804776
neovide
#1645804784
which neovied
#1645804788
which neovide
#1645804793
/var/lib/snapd/snap/bin/neovide
#1645804807
neovide
#1645804822
rg neovide
#1645804832
neovide
#1645776376
yarn dev
#1645783783
yarn dev
#1645805009
htop
#1645735123
screen
#1645805044
htop
#1645805198
docker stop $(docker ps -aq)
#1645805260
which neovide
#1645805264
neovide
#1645805270
cd
#1645805273
which neovide
#1645805276
neovide
#1645805343
cd .config/nvim/
#1645805345
tree
#1645805353
cat init.vim-first-go 
#1645805365
nvim ini
#1645805378
nvim init.vim-first-go 
#1645805407
cd
#1645805418
cd .dotfiles/.config/
#1645805422
cd nvim/
#1645805429
cd
#1645805433
cd .config/
#1645805440
rm -rf nvim
#1645805442
cd
#1645805445
cd .dotfiles/
#1645805448
stow .
#1645805450
cd
#1645805454
cd .config/nvim
#1645805500
neovide
#1645805510
snap install neovide
#1645805547
which neovide
#1645805549
neovide
#1645805560
/var/lib/snapd/snap/bin/neovide
#1645805611
nvim init.lua 
#1645878945
pwd
#1645879061
nvim
#1645879076
nvim
#1645879240
mkdir .dotfiles/.config/sway
#1645879263
cp /etc/sway/config .dotfiles/.config/sway
#1645879270
cd .dot
#1645879279
cd .dotfiles/
#1645879281
stow .
#1645879283
cd
#1645879288
cd .config/sway/
#1645879291
ls -l
#1645879296
ls -la
#1645879298
cd ..
#1645879303
ls -la
#1645879395
pwd
#1645879715
which bb
#1645879749
bb --version
#1645879802
cd /usr/
#1645879804
fd bb
#1645879809
fd babashka
#1645879813
fd bb
#1645879870
which bb
#1645879880
which kitty
#1645879899
/usr/bin/bb --version
#1645879919
sudo rm /usr/local/bin/bb
#1645879967
pwd
#1645880016
cd .config/sway/
#1645880057
which swaylock
#1645880069
pamac --help
#1645880077
pamac install swaylock
#1645880020
nvim config 
#1645882010
htop
#1645882033
gnome-sotf
#1645882040
gnome-software 
#1645882058
pamac search htop
#1645882066
pamac install htop
#1645882079
htop
#1645882118
sudo reboot
#1645882268
htop
#1645882277
docker stop $(docker ps -aq)
#1645882292
htop
#1645882409
docker stop $(docker ps -aq)
#1645882421
htop
#1645884635
which spotify
#1645884743
htop
#1645884788
flatpak run com.spotify.Client --enable-features=UseOzonePlatform --ozone-platform=wayland
#1645884832
flatpak run com.spotify.Client
#1645885009
pamac search pavucontrol
#1645885023
pamac install pavucontrol
#1645885350
mkdir .dotfiles/.config/foot
#1645885354
cd .config
#1645885358
fd foot
#1645885365
pamac search fd
#1645885371
pamac install fd
#1645885384
fd foot
#1645885437
cd ..
#1645885443
cd .dotfiles/
#1645885450
cd .confih
#1645885454
pwd
#1645885462
cd ..
#1645885466
cd foot
#1645885472
cd .config/
#1645885475
cd foot
#1645885510
cp /usr/share/foot/foot.ini .
#1645885515
cd ..
#1645885521
stow .
#1645885529
pamac search stow
#1645885539
pamac install stow
#1645885598
cd
#1645885601
cd .conf
#1645885605
cd .config/
#1645885608
ls -la
#1645885634
cd 
#1645885638
cd .dotfiles/
#1645885640
stow .
#1645885646
cd .conf
#1645885650
cd .config/
#1645885654
tre
#1645885656
tree
#1645885663
cd
#1645885668
cd .config/
#1645885669
tree
#1645885674
cd foot
#1645885679
cd ..
#1645885681
ls -la
#1645885693
cd foot
#1645885764
pwd
#1645885767
tree
#1645885771
cd git
#1645885774
tree -d
#1645885776
cd
#1645885781
nvim
#1645886364
pwd
#1645885697
nvim foot.ini 
#1645885190
nvim config
#1645886474
cd .config/nvim/
#1645886498
cd .config/sway/
#1645886501
nviw config 
#1645886765
which pactl
#1645887125
htop
#1645884714
google-chrome-stable -enable-features=UseOzonePlatform -ozone-platform=wayland
#1645887453
pamac search discord
#1645887461
pamac install discord
#1645887924
htop
#1645889474
htop
#1645889503
pkill bitwarden
#1645886508
nvim config 
#1645886481
nvim init.lua 
#1645892777
htop
#1645892790
docker ps
#1645892792
htop
#1645916537
nmtui
#1645921656
cd .config/sway
#1645921661
rg gaps
#1645921666
rg toogle
#1645921673
rg float
#1645921704
exi
#1645921721
nvim config 
#1645921838
htop
#1645949504
nmi
#1645949506
nvim
#1645949907
pamac search packer
#1645949924
pamac search nvim packer
#1645950128
cd .dotfiles/.config/nvim
#1645950130
la
#1645950142
mkdir lua
#1645950146
cd lua
#1645950163
touch plugins.lua
#1645950188
nvim plugins.lua 
#1645950334
cd ..
#1645950341
nvim init.lua 
#1645950696
nvim
#1645950724
pamac search neovide
#1645950743
pamac install neovide-bin
#1645950702
nvim init.lua 
#1645950917
nvim lua/plugins.lua 
#1645951095
fzf
#1645951142
nvim lua/plugins.lua 
#1645951254
nvim init.lua 
#1645952311
nvim
#1645952316
exi
#1645952439
nvim
#1645951272
nvim
#1645953245
which emacs
#1645953255
cd .local/bin
#1645953259
la
#1645954576
nvim
#1645954592
exi
#1645954690
nvim
#1645976172
htop
#1645953274
./emacs
#1645976187
htop
#1645976208
docker ps
#1645995329
htop
#1645995896
nvim
#1645995920
cd .config/nvim
#1645995923
cd lua
#1645995927
cd ..
#1645995933
cd lua
#1645995962
touch keybindings.lua
#1645997124
cd .config/
#1645997130
cd sway
#1645997139
nvim conf
#1645997149
nvim config 
#1645998949
nvmi
#1645998951
nvim
#1645999749
nmi
#1645999750
nvim
#1646000269
nmi
#1646000270
nvim
#1646000407
pkill nvim
#1646000438
nvim
#1646001089
cd
#1646001100
cd git/voady-ap
#1646001211
cd git/voady-company/
#1646001103
nvim
#1646001218
nvim
#1646001698
cd git/voady-company/
#1646001713
nvim
#1646002302
htop
#1646029746
pamac search python venv
#1646030227
nvim --version
#1646036188
swaymsg -t get_outputs
#1646036231
which output
#1646036321
swaymsg -t get_outputs
#1646036469
google-chrome-stable -enable-features=UseOzonePlatform -ozone-platform=wayland &
#1646036494
htop
#1646036252
nvim .config/sway/config
#1646036655
screen
#1646036661
which tmux
#1646036672
which emacs
#1646036684
emacs &
#1646036709
cd /tmp
#1646036715
redis-server 
#1646036664
tmux
#1646036843
cd /tmp
#1646036901
cd git/voady-api
#1646036904
yarn dev
#1646036921
docker start voady-api-mysql-db-1 
#1646036925
docker start voady-api-prisma-1 
#1646036938
cd git/voady-company/
#1646036975
htop
#1646037108
cd git/voady-api
#1646037169
cd .config/nvim
#1646037204
flatpak run com.spotify.Client
#1646037112
nvim
#1646037923
git statu
#1646037930
git status
#1646037229
nvim init.lua 
#1646038028
cd
#1646038041
cd git/voady-company/
#1646038045
git status
#1646038213
cd .config/nvim
#1646038055
nvim
#1646038452
htop
#1646038216
nvim
#1646041744
cd ..
#1646041745
nvim
#1646041760
cd nv im
#1646041762
cd nvim
#1646041968
nvim
#1646042037
nvim .tmux.conf
#1646042080
tmux source-file ~/.tmux.conf  
#1646041770
nvim
#1646042695
which telegram
#1646042735
flatpak run org.telegram.desktop 
#1646043011
htop
#1646044503
pwd
#1646044555
cd git/voady-company/
#1646044584
cd src/views/Reports/Accounting/
#1646044585
hls
#1646044588
la
#1646044590
tree
#1646044776
htop
#1646045314
which zsh
#1646045328
chsh -s /bin/zsh
#1646045337
zsh
#1646037938
nvim
#1646036988
yarn dev
#1646036928
yarn dev
#1646036856
redis-server 
#1646042050
tmux attach
#1646044212
flatpak run com.slack.Slack 
exit
which shell
exit
exit
#1646126995
google-chrome-stable -enable-features=UseOzonePlatform -ozone-platform=wayland 
which
which npm
nvim
nvim .bashrc
exit
which npm
exit 
fig doctor
exit
which node
exit
echo "version=$([[ -z '${{ github.event.inputs.tag }}' ]] && echo dev-$(git rev-parse --short HEAD)-$(date +%s) || echo ${{ github.event.inputs.tag }})"
echo "version=$([[ -z '' ]] && echo dev-$(git rev-parse --short HEAD)-$(date +%s) || echo )"
echo "version=$([[ -z 'aoeu' ]] && echo dev-$(git rev-parse --short HEAD)-$(date +%s) || echo au)"
