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

For example, you can now run `eon ruby`. This will print all the reverse dependencies
of the `ruby` package; i.e. all nodes of the dependency tree in order, with the root — `ruby` — listed first.
