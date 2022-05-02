![A thief](https://mario.wiki.gallery/images/thumb/2/2e/NSMBUDX_Nabbit.png/250px-NSMBUDX_Nabbit.png)

# Nabbit

Download titles, updates and DLCs directly from Nintendo eShop. App requires title keys site to run
  
> You can look up available key sites [here](https://titlekeys.ovh)

```console
$ nabbit search --query "mario" --region EUR
0005000010106E00 ○ Super Mario Bros. (JPN)
000500001010ED00 ● MARIO KART 8 (EUR)
0005000010114300 ○ Mario & Yoshi (USA)
0005000010145D00 ● SUPER MARIO 3D WORLD (USA)
000500001014B800 ● New SUPER MARIO BROS. U (EUR)
```

## Build

You will need to install [Dart SDK](https://dart.dev/get-dart) to compile Nabbit from sources.

```console
$ dart pub get
Got dependencies!
```

Compile standalone self-contained executable file:

```console
$ dart compile exe bin/nabbit.dart -o nabbit
Info: Compiling with sound null safety
```
