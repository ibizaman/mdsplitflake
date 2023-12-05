# MDSplit flake

This is an example of packaging a python application with flakes. To get the help output of the [`mdsplit`](https://github.com/markusstraub/mdsplit) command line interface, just run:

```bash
$ nix run github:ibizaman/mdsplitflake -- --help
usage: mdsplit [-h] [-e ENCODING] [-l {1,2,3,4,5,6}] [-t] [-o OUTPUT] [-f] [-v] [input]

Split markdown files into chapters at a given heading level.

[...]
```

You don't even need to clone this repo!

The packaging heavy lifting is done by [pyproject.nix](https://nix-community.github.io/pyproject.nix/), go to that link to see what else you can do.
