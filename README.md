# Ant Colony

A calm, no-controls ant farm for small children. It's a cross-section of an
underground colony with a strip of meadow above, and nobody can lose.

What happens on its own:

- Black worker ants forage for seeds, berries, crumbs and leaf bits on the
  surface and carry them down to the food store.
- The queen (she wears a little crown) lays eggs. Workers carry the eggs to the
  nursery.
- Eggs become larvae. Hungry larvae show a thought bubble, and nurses bring them
  food from the store. Fed larvae spin cocoons and hatch into new pale ants, who
  darken as they grow up and go to work. Young ants stay near the nursery.
- The queen gets hungry too, and the workers feed her.
- Every so often, red ants raid the colony. The nearest black ants rush over,
  there's a dusty scuffle, and the red ants run away.
- Old ants eventually die. A worker carries the body up to a bare patch of earth
  on the right, where it slowly fades into the soil.
- Day turns to night and back again.

It's a single `index.html` with vanilla Canvas 2D and no dependencies. Every
shape is drawn as a vector path at device resolution.

## Play

Download `index.html` and open it in any modern browser. There's nothing to
install, no build step, and no network access needed.

Add `?speed=N` to the URL to fast-forward the simulation (for example
`index.html?speed=10`).

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
