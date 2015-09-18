if [ ! -d /opt/rt-n56u/trunk ] ; then
   git init /opt/rt-n56u
   git remote add origin https://bitbucket.org/padavan/rt-n56u.git
   git pull origin master
else
   cd /opt/rt-n56u
   git pull
fi
   
