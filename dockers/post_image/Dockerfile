FROM bjo/pre_dataverse
MAINTAINER "Jonathan Bisson" <bjo@uic.edu>
ADD ./dockers/post_image/start.sh /dataverse/docker-start.sh
RUN chmod +x /dataverse/docker-start.sh
ADD ./dockers/post_image/rebuild-dataverse.sh /dataverse/docker-rebuild-dataverse.sh
RUN chmod +x /dataverse/docker-rebuild-dataverse.sh
# Lets update the repository
RUN /dataverse/docker-rebuild-dataverse.sh
RUN /dataverse/dock_install.sh localhost
CMD /dataverse/docker-start.sh
