# agnostep-wall

## The goal

Setting your wallpaper on every AGNoStep flavour. This is a module of [AGNoStep](../../../agnostep) project.

With different ways to show or hide the background, depending on the Window Manager and the Workspace Manager, it could be hard to set the wallpaper in each case.

So We try to provide a way to manage it in every case.

> [!CAUTION]
> This is a work in progress (alpha stage) tied to the 3rd release of AGNoStep.

## The collections

Agnostep-wall provides three sets of pictures of my own, taken at my country, The French *Margeride Mountains*, more known as a part of the historical *Gevaudan*.

- MARGERIDE,
- AUTUMN,
- WINTER.

## How to Install

### Dependencies

- Of course, we need a GNUstep System and its Desktop, like [AGNoStep](../../../agnostep) one.
- `feh` to set the background in any case.

### Steps

In a TTY console or in a shell window of Terminal:

```console
cd SOURCES
git clone https://github.com/pcardona34/agnostep-wall
cd agnostep-wall/install
bash ./set_the_wall.sh
```

## Using

All is already set with `.xinitrc` / `.xsession` of [agnostep-desktop](../../../agnostep-desktop).

If you try install on another GNUstep compliant desktop, you must add the code below after launching the Window Manager and before launching the Workspace Manager:

```bash

### Launch of the Window Manager 
/usr/bin/wmaker &

### Wallpaper
BG=/home/patrick/GNUstep/Library/Wallpapers/fond_agnostep.jpg
ALTERNATE_BG=/home/patrick/GNUstep/Library/Wallpapers/current.jpg
if [ -f ${ALTERNATE_BG} ];then
    SELECTED=${ALTERNATE_BG}
else
    if [ -f ${BG} ];then
        SELECTED=${BG}
    fi
fi
if [ -n "${SELECTED}" ];then
    feh --bg-fill ${SELECTED} &
fi

### Workspace Manager
exec openapp GWorkspace
```
