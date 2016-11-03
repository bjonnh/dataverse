FROM centos:6.6
MAINTAINER "Jonathan Bisson" <bjo@uic.edu>

RUN yum install -y sudo wget git sudo tar unzip which
RUN git clone https://github.com/bjonnh/dataverse.git -b bjo-dockerdevel --depth 1
ENV MAIL_SERVER localhost

COPY ./downloads/glassfish-4.1.zip /dataverse/downloads/glassfish-4.1.zip
COPY ./downloads/solr-4.6.0.tgz /dataverse/downloads/solr-4.6.0.tgz
COPY ./downloads/weld-osgi-bundle-2.2.10.Final-glassfish4.jar /dataverse/downloads/weld-osgi-bundle-2.2.10.Final-glassfish4.jar
COPY ./downloads/schemaSpy_5.0.0.jar /dataverse/downloads/schemaSpy_5.0.0.jar

RUN chmod +x /dataverse/scripts/vagrant/setup.sh
RUN /dataverse/scripts/vagrant/setup.sh

# The setup script isn't able to work with this folder configuration
#RUN /dataverse/scripts/vagrant/setup-solr.sh

ENV GLASSFISH_USER=glassfish
ENV GLASSFISH_USER_HOME=~glassfish
ENV SOLR_HOME=$GLASSFISH_USER_HOME/solr
RUN su $GLASSFISH_USER -s /bin/sh -c "mkdir $SOLR_HOME"
RUN su $GLASSFISH_USER -s /bin/sh -c "cp /dataverse/downloads/solr-4.6.0.tgz $SOLR_HOME"
RUN su $GLASSFISH_USER -s /bin/sh -c "cd $SOLR_HOME && tar xfz solr-4.6.0.tgz"
RUN su $GLASSFISH_USER -s /bin/sh -c "cp /dataverse/conf/solr/4.6.0/schema.xml $SOLR_HOME/solr-4.6.0/example/solr/collection1/conf/schema.xml"
ADD ./dockers/post_image/install.sh /dataverse/dock_install.sh
RUN chmod +x /dataverse/dock_install.sh
RUN /dataverse/dock_install.sh localhost

# The package is prebuilt so most of the maven packages are already downloaded
