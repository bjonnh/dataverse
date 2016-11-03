docker build -t bjo/pre_dataverse -f dockers/pre_image/Dockerfile .
docker build -t bjo/dataverse -f dockers/post_image/Dockerfile .
