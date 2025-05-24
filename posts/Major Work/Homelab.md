
# Homelab

While working at [Ystumtec](Ystumtec.html) I received a donation of some old PCs from a friend of the boss, they were all old and dusty the youngest being 10ish years old, however one had at one point been someones gaming rig, so it had good specs for the time Intel (i5-4670K NVIDIA GTX 970 16GB RAM) and a very nice set of hard drive caddys with built in cabling, so I after stripping all the other PCs for parts I figured I'd convert this one into a home server and get into homelabbing.

## Initial inspiration

While at FOSDEM 2025, I attend a talk by the team at [Immich](https://immich.app/), I'd already been starting to distance myself from Google by moving to proton for my mail, and as the talk had made their setup look so easy I was inspired to go home and setup an instance for myself. Then a few weeks later I found out Ystumtec was shutting down and I'd need to go job hunting, so I figured a deep dive into setting everything up properly would be both a fun project, and help flesh out my CV a bit.

## Docker

Having no experiance with hosting any kind of service or homelabbing before, I didn't really know what there was in terms of different technologies, but I knew Immich needed Docker, and had heard a lot of talk about it from some friends, so I figured it can't be that hard and that I could probably get it to work for myself. I was only half wrong.

Over the course of a month I did a lot of messing around, making mistakes, breaking things that had worked for a few days, reinstalling my OS a few times and pestering my friends for help, I wound up with a fairly functional homelab that I'm proud enough of to even host services for friends on.

## Full setup

To briefly list all the services and my setup all of which is in Docker containers:

- Nginx reverse proxy
- [Cv website](https://bobyn.uk)
- [Aber webring](https://aberwebr.ing/)
- Immich (Google photos replacement)
- Nextcloud (ecosystem that replaces Google drive and docs)
- Watchtower (automatic updates)
- Audiobookshelf (streaming audiobooks I own)
- Jellyfin (streaming music I own)
- Feishin (Spotify stlye GUI for Jellyfin)
- Memos (Markdown based notes management system)
- Portainer (Web GUI for management)

The above services are not just used by myself, but friends and family, even my own mother who only just about knows how to use a smartphone uses my Immich instance for her photos now.

## What I learnt

In this project I learnt a LOT about docker, how to manage services, docker compose files, dockerfiles for generating my own images for the webring and CV site, howto manage backups, general linux tricks and most importantly the weight of responsibly maintaining services other people use and rely on.