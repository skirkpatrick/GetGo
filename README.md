#GetGo

A simple, poorly written, hacked-together script to install Google Go in one command!

##Usage

Optional:
Customize the `GOPATH` variable for wherever you want your workspace to be. This is essentially where all of your own Go source code and packages will go.

Just run the script and it'll do the rest for you. It's magical that way.

If you're exceptionally lazy (like me) and don't mind the default settings, you can

```sh
$ wget https://raw.github.com/skirkpatrick/GetGo/master/getgo.sh && source getgo.sh && rm getgo.sh
```

or, if you don't have wget (likely on a mac), just

```sh
$ curl https://raw.github.com/skirkpatrick/GetGo/master/getgo.sh >getgo.sh && source getgo.sh && rm getgo.sh
```

It'll ask you for your `sudo` password at some point. This is because Go itself is installed into `/usr/local`. You can change this if you know what you're doing by modifying the `INSTALL` variable.

##Why?

Laziness. I got tired of going through the same steps everytime I installed Go on a machine.
