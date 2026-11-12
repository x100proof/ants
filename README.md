# Ant Colony

A calm, no-controls ant farm for small children. It's a cross-section of an
underground colony with a strip of meadow above, and nobody can lose.

What happens on its own:

- Black worker ants forage for seeds, berries, crumbs and leaf bits on the
  surface and carry them down to one of two food stores.
- The queen (she wears a little crown) lays eggs in her chamber. Workers carry
  the eggs to one of two nurseries.
- Eggs become larvae. Hungry larvae show a thought bubble, and nurses bring them
  food from the nearest store. Fed larvae spin cocoons and hatch into new pale
  ants, who darken as they grow up and go to work. Young ants stay near the
  nurseries.
- The queen gets hungry too, and the workers feed her.
- Each larva and the queen fancies one particular food, shown in their thought
  bubble, and only that food makes them happy (hearts and a little bounce). They
  change their mind after every meal. Now and then a nurse brings the wrong food:
  it gets turned down with a shake and a ✗, and the nurse takes it back.
  Foragers hunt for foods that someone wants but the stores have run out of.
- Every so often, red ants walk in from the side of the screen to raid the food.
  Black ants gang up on each raider, and health bars appear over everyone in the
  fight. Each bite takes away some health. A red bite is much stronger than a
  black one, so it takes several black ants to beat one red ant. A badly bitten
  black ant goes home to rest and heal (the colony never loses an ant in a
  fight). A beaten red ant is carried to the graveyard.
- Old ants eventually die too. Workers carry the bodies up to a bare patch of
  earth on the right, where they slowly fade into the soil.
- Day turns to night and back again.
- The weather drifts slowly between sunny, cloudy, rain and thunderstorms with
  lightning. When a thunderstorm comes, every ant hurries inside and stays there,
  and no red ants come raiding until it passes.

Sound: gentle background music, plus rain, wind and thunder. The music turns
into a slower, softer minor version of the same tune when it rains or storms.
Browsers only allow sound after you interact with the page, so the first click or
tap anywhere (or a key press) starts it, and a "Click for music" button
invites that. The speaker button in the corner mutes and unmutes for the rest
of the visit. All of it is synthesised in the browser, so there are
no audio files. On a PC there's also a full-screen button.

On phones and tablets the scene always draws in landscape: if the device is held
upright, the picture is drawn sideways, so you just turn it. Tapping the screen
goes full screen and locks landscape where the browser allows it. Creatures and
food are drawn larger on phones.

It's a single `index.html` with vanilla Canvas 2D and no dependencies. Every
shape is drawn as a vector path at device resolution.

## Play

Download `index.html` and open it in any modern browser. There's nothing to
install, no build step, and no network access needed.

Add `?speed=N` to the URL to fast-forward the simulation (for example
`index.html?speed=10`). `?weather=storm` (or `sunny`, `cloudy`, `rain`)
chooses the starting weather. Adding `?phone` shows the phone-sized creatures on
a desktop.

## Deploy

It's a static file, so any web host will do (GitHub Pages, Netlify, an S3 bucket,
nginx, Apache…). To copy it into a document root:

```sh
./deploy.sh /path/to/docroot
```

A minimal nginx server block:

```nginx
server {
    listen 80;
    server_name your.domain;
    root /path/to/docroot;
    index index.html;
}
```

## Debug log (optional)

While it runs, the game collects errors, warnings, notable events (weather
changes, raids, storms) and a state snapshot every 15 seconds. It also runs
built-in health checks: ants that stop moving, ants outside during a storm,
bodies left unburied, larvae left hungry, and a population that gets too low.
About once a minute, and straight away after an error, it POSTs these as JSON
to `api/log` relative to the page. If nothing handles that path on your server,
the requests just fail quietly and the game is unaffected.

- Add `?nolog` to the URL to turn logging off.
- In the browser console, `antsDebug.report('what happened')` sends everything
  immediately.
- `deploy.sh` stamps the build time into the deployed copy, so each log says
  which version produced it.

To collect the logs, point that path at anything that stores POST bodies. For
example, with nginx:

```nginx
location = /api/log {
    limit_except POST { deny all; }
    client_max_body_size 64k;
    proxy_pass http://127.0.0.1:PORT/your-log-receiver;
}
```

## License

MIT. See `LICENSE`.
