

WARNING: running fighack.sh will delete all docker containers on the host!!!!  
=====================================================
(Fig doesn't overwrite previous containers reliably, so fighack starts off by cleaning out all pre-existing containers)


assumptions:
-----------------------------------------------------
* running in linux environment
* run by user who has sudo permissions on the box
* docker is installed and in the path for root
* fig is installed and in the path for root

Steps to demo:
-----------------------------------------------------
* clone this repo 
* run fighack.sh in the dir it resides in (fig requires that fig.yml be in the working directory)


notes:
-----------------------------------------------------
* execution is via fighack instead of 'fig up' - docker2 is linked to docker1 and requires docker1 to be up and responding before it can run. 'fig up' starts docker1 and docker2 asynchronously, and docker1 is frequently takes too long to come up, and thus docker2 errors out and fig quits. Issuing 'fig build' successfully builds the containers.  Issuing a subsequent 'fig run docker2' will start docker2 and (because it's linked to docker1) docker1.  For whatever reason, docker2 will wait until docker1 loads to get link info reliably when started in this fashion... thus fighacker.sh.
* I kept reference to Chris Lea's ppa (some concern i've exposed access to it via public github repo)
* I left port 8000 exposed from docker1 to it's host 
** technically unecessary since docker2 communicates with docker1 over docker's internal subnet
** but it's handy to hit docker1 from an external browser to confirm it's behavior
** http://<docker1's host OS ip address>:8000/
