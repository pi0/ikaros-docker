## IKaros Docker
Docker build scripts for IKaros project

## How to install
```bash
# Pull Docker
docker pull pooya/ikaros

# Then you can run ikaros with this command:
docker run --rm pooya/ikaros

# Test WebUI
docker run --rm pooya/ikaros -w /ikaros/Examples/example.ikc
```

- Default build directory is: _/ikaros_

## The Ikaros Project

The Ikaros projected started in early 2001 and its goal is to develop an open infrastructure for system level modeling of the brain including databases of experimental data, computational models and functional brain data. The system makes heavy use of the emerging standards for Internet based information and makes all information accessible through an open web-based interface.

The main components of the IKAROS systems are:

-  A platform independent simulation kernel
-  A set of computational brain models
-  A set of I/O modules for interfacing with data files and peripheral such as robots or video cameras
-  Tools for building systems of interconnected models
-  A plug-in architecture that allows new models to be added to the system
-  A database with data from learning experiments that can be used for validation of the computational models.

Further information on the project can be found at: [http://www.ikaros-project.org]
source code is available from GitHub: [][http://github.com/ikaros-project/ikaros]


## Usage
```
docker run --rm pooya/ikaros [-W#][-p][-t][-T][-b#][-r#][-v][-q][-x][-X][-m][-l][-i][-a][file]
-w#   WebUI
-W#   WebUI: debug mode, list requests
-p    profile
-t    threaded
-T    list thread allocation
-b#   run one item in batch
-B    batch mode
-r#   real time mode; # is time per tick in milliseconds
-s#   stop after # ticks
-v    verbose mode
-q    quiet mode
-x    list xml after parsing/combination
-X    debug xml parser
-n    look for NANs in outputs
-m    list modules and connections
-c    list installed classes
-l    list scheduling
-i    list installed functionality sockets, timer etc, type of target system
-a    list all; implies -m -l and -T (if -t is set)
-z#   seed random number generator
```

## Examples:
```
Assuming the current path is the /Bin in the Ikaros directory,
an example can be run like this:

        docker run --rm pooya/ikaros /ikaros/Examples/example.ikc

Use the w-option to also start the WebUI:

        docker run --rm pooya/ikaros -w /ikaros/Examples/example.ikc

This example will wait for a request from the Web browser at
the default port (8000).
```
