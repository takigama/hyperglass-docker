= The Quickest and Dirty Hyperglass LG Docker Container =

Pretty easy:

1) git clone https://github.com/takigama/hyperglass-docker.git
2) cd hyperglass-docker
3) docker built -t hyperglass .
2) STORAGE=/someplacetostorestuff
4) mkdir $STORAGE
5) docker run -d --name hyperglass --rm -v $STORAGE:/root/hyperglass/ hyperglass 
6) docker stop hyperglass
6) vi $STORAGE/hyperglass.yaml <---- configure
7) vi $STORAGE/devices.yaml <---- configure
8) vi $STORAGE/that other file i cant remember the name of.yaml <---- configure
9) docker run --it --rm --name hyperglass -v $STORAGE:/root/hyperglass/ hyperglass hyperglass build-ui
10) ... wait ....
11) docker run -d --name hyperglass -v $STORAGE:/root/hyperglass -p 80:8001 hyperglass

now browse to http://your_docker_machine:80 and life should be good (replace 80 with something else as needed


