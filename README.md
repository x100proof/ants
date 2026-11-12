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

## License

MIT. See `LICENSE`.
