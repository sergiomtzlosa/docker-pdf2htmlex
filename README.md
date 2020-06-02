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

For detail instrucitons check the repository: 

https://github.com/sergiomtzlosa/docker-pdf2htmlEX
