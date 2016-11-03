#!/bin/bash
service httpd start
service shibd start
service postgresql start
su $GLASSFISH_USER -s /bin/sh -c "cd $SOLR_HOME/solr-4.6.0/example && java -jar start.jar &"
sh -c "$GLASSFISH_USER_HOME/glassfish4/bin/asadmin start-domain domain1"
tail -F /var/log/httpd/access_log
