# The Quickest and Dirty Hyperglass LG Docker Container 

Pretty easy:

1) git clone https://github.com/takigama/hyperglass-docker.git
2) cd hyperglass-docker
3) docker build -t hyperglass .
4) STORAGE=/someplacetostorestuff
5) mkdir $STORAGE
6) docker run -d --name hyperglass --rm -v $STORAGE:/root/hyperglass/ hyperglass 
7) docker stop hyperglass
8) vi $STORAGE/hyperglass.yaml <---- configure
9) vi $STORAGE/devices.yaml <---- configure
10) vi $STORAGE/that other file i cant remember the name of.yaml <---- configure
11) docker run -it --rm --name hyperglass -v $STORAGE:/root/hyperglass/ hyperglass hyperglass build-ui
12) ... wait ....
13) docker run -d --name hyperglass -v $STORAGE:/root/hyperglass -p 80:8001 hyperglass

now browse to http://your_docker_machine:80 and life should be good (replace 80 with something else as needed

Based on the current version of hyperglass in pip - so the container itself could break and not build anymore
at any time...

Thanks go to thatmattlove for the hyperglass!


