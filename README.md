# Docker source image to convert PDFs into beautiful HTML

Suppose you have a PDF file ~/pdf/test.pdf, simply place on your pdf file path and type:

```
docker run -ti --rm -v ~/pdf:/pdf sergiomtzlosa/pdf2htmlex pdf2htmlEX --zoom 1.3 test.pdf test.html
```
would produce a single HTML file test.html in ~/pdf directory.

Run the docker container as local command
---------------------------------------

Set an alias in yout .bashrc file:
```
alias pdf2htmlEX='docker run -ti --rm -v `pwd`:/pdf sergiomtzlosa/pdf2htmlex pdf2htmlEX'
```

Use the alias on your bash prompt:
```
pdf2htmlEX -h
```
```
pdf2htmlEX --zoom 1.3 test.pdf
```

Inside the offline folder there is a way to create the image in a standalone way, you must obtain the Ubuntu Trusty base image using debootstap:

```
sudo apt-get install debootstrap
```
```
sudo debootstrap trusty trusty http://us.archive.ubuntu.com/ubuntu
```
```
sudo tar -f rootfs-trusty.tar.xz -C trusty -c .
```

Afterwards, you can build the image:

```
docker build -t pdf2htmlex .
```

Otherwise, use the full online building process from the master branch, just type:

```
docker build -t pdf2htmlex .
```

After building the image use the command above to convert PDF files into HTML.

You can also pull from the dockerhub repo:

```
docker pull sergiomtzlosa/pdf2htmlex:latest
```


Dockerhub: https://hub.docker.com/r/sergiomtzlosa/pdf2htmlex
