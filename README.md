# eon

**eon** is a wrapper for eopkg and solbuild intended to make it easier to maintain packages
for [Solus](https://getsol.us).

Right now it simply recursively collects reverse dependencies (i.e. dependent packages).
I intend to extend this to automate the entire process of updating a package, from
checking for new versions to building the package and and all dependents.

## Installation
Install the system-level dependencies:

```console
sudo eopkg it ghc-devel haskell-cabal-install
```

Then clone this repository and run:

```console
cabal update && cabal install
```

You can add `~/.cabal/bin` directory, noted in the output of the above command, to
your PATH to be able to use eon anywhere.

## Usage
### `eon depends-on <packages>`
Recursively collect the reverse dependencies (dependents) of the package(s) specified.

For example, invoking `eon depends-on ruby` will print all the packages which depend on `ruby`,
in order of closeness (i.e. with `ruby` listed first).
