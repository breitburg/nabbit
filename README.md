<img src="https://user-images.githubusercontent.com/25728414/166331170-8351df11-7cd6-4c79-9383-07195cae02b2.png" align="right" alt="A thief" />

# Nabbit

Download titles, updates and DLCs directly from Nintendo eShop.
Content can be installed on the console using any [WUP Installer](https://wiki.gbatemp.net/wiki/WUP_Installer) you have.

> You can look up available key sites [here](https://titlekeys.ovh).

## Usage

Use `search` command to browse storefront library.
As a result it will display a list of results, each of result has an ID, ticket availability, name and region. ID can be used to download content.

```console
$ nabbit search -q "Nintendo Land" -r EUR
0005000010102100 ● Nintendo Land (EUR)
0005000E10102100 ● Nintendo Land (EUR)
```

## Build

You will need to install [Dart](https://dart.dev/get-dart) to compile from sources.

Compile standalone self-contained executable file:

```console
$ dart compile exe bin/nabbit.dart -o nabbit
Info: Compiling with sound null safety
```
