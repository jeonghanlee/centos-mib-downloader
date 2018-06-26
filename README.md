# centos-mib-downloader

For CentOS doesn't have the snmp-mibs-downloader, which exists in Debian environment [1]. I would like to have several mib files in CentOS system without maintaining them by myself while I am working on the EPICS snmp support seriously. 

It uses the proposed and similar ESS EPICS Environment building system also. 



## Build commands

```
make init
make vars
make install
make clean
```

## Run

```
sudo download-mibs
```

Please check

* /var/lib/snmp/mibs
* /usr/share/snmp/mibs/{iana,ietf}


## Notice

It uses Debian smistrip file instead of CentOS package one, because smistrip is different from Debian in CentOS, libsmi as follows:

* CentOS 
```
$ smistrip -V
smistrip 0.4.8

$ smistrip -h
Usage: smistrip [-Vhn] [-i dir] [-d dir] [-m module] file1 [file2 [...]]
-V         show version and license information
-h         show usage information
-n         do not write module files
-i dir     try to read files from directory dir
-d dir     write module to directory dir
-m module  strip only the specified module
file1 ...  input files to parse (RFCs, I-Ds, ...)
```

* Debian 8
```
$ smistrip -V
smistrip 0.4.8

$ smistrip -h
Usage: smistrip [-Vvhna] [-i dir] [-d dir] [-s suffix] [-m modules] file1 [file2 [...]]
-V         show version and license information
-v         verbose
-h         show usage information
-n         do not write module files
-a         strip blank lines more aggressively
-i dir     try to read files from directory dir
-d dir     write module to directory dir
-x suffix  append suffix to the module file name
-m modules strip only the specified modules. For a list of modules
           use : as a separator
file1 ...  input files to parse (RFCs, I-Ds, ...)
```

## Reference
[1] https://salsa.debian.org/debian/snmp-mibs-downloader