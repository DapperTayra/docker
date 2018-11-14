#sudo docker-compose up --build machinelearning
pushd MyImage 
sudo docker build -t myimage .
popd

