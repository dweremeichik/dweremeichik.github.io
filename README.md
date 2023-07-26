# Static Builder

To build run `mix static.build` or simply `mix` (static.build is set as the default task).

## Structure

* Linked content belongs in the `links` directory.
* Content belongs in the `src` directory.
* `root.html.eex` is the site's main "shell".
* All content is built to the `docs` directory.
