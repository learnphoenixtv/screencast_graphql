# Screencast

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Distillery

To build a production Distillery release:

```
$ MIX_ENV=prod mix do ecto.create, ecto.migrate
$ MIX_ENV=prod mix release --env prod
$ PORT=4000 _build/prod/rel/screencast/bin/screencast foreground
```

Then visit <http://localhost:4000/graphql> to play with it.

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
