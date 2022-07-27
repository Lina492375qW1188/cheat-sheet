Apple has put away `/usr/include` in, e.g. MacOS 12.4.. This sometimes cause problems, e.g. when using `CPPPotential` in HOOMD-blue because HOOMD will look for `/usr/include/c++/v1/stdio.h`. 
In fact, MacOS does have the file, it's in `/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include`.
One way to add back it to `/usr/include` is to add a symbolic or soft link:
```
sudo ln -s /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include /usr/local
``` 
it can also be removed simply via
```
unlink /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include
```
