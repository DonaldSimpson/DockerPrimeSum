# donaldsimpson/primesum


## About 
This Docker image uses kimwalisch/primesum from https://github.com/kimwalisch/primesum
to compute the sum of the primes below a (user specified) integer as quickly as possible
I use this for perf and load testing in Docker


## Includes
- CentOS 7 base
- Developer Tools installed via YUM
- PrimeSum ADD'ed from https://dl.bintray.com/kimwalisch/primesum/primesum-1.0.tar.gz
- build, test, install
- tini init process installed from https://github.com/krallin/tini


## Usage info:
docker run -it psumtest primesum


## Example usage:
- default: docker run -it donaldsimpson/primesum
  will  perform: primesum 1e14 --threads=4 --time

- user args: docker run -it donaldsimpson/primesum primesum 1e14 --time 
  will sum the primes below 10^14

[www.donaldsimpson.co.uk]http://www.donaldsimpson.co.uk - *Donald Simpson*


