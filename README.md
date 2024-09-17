# emsc-lru
An LRU object written in CXX that can be used via JS

## Overview
- `web/` contains all of the files that will be used to render website
- `test/` contains code to run a local server, use `npm run dev` to start this server
- `app/` contains CXX code
- `scripts/` contains scripts called by `flake.nix` to setup dev environment

## Setup Your Dev Environment
The recommended way to start coding on this project is to use:
- nix
- direnv
- VSCode, and download the `clangd` extension

```sh
git clone https://github.com/walicar/emsc-lru
code wlru
direnv allow
```

## Build and Run Project
```sh
npm i
make
npm run dev
```
