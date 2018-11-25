alias cd=userspace

userspace() {

clear

figlet -w 100 <Enter Your Main Text Here without the brackets used to indicate this placeholder>

echo Hello, $USER;date

echo __________________________________________________________________________$

uptime

echo __________________________________________________________________________$

builtin cd $1 && ls -i -CF

echo __________________________________________________________________________$

}
