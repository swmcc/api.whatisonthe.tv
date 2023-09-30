# API for whatisonthe.tv

## Overview

The backend service powering the `whatissonthe.tv` platform. This API
integrates with various data sources, most notably using the `tvdb_api` gem, to
provide you with real-time updates, in-depth information on TV shows, episodes
and genres.

## Getting Started

Clone the repository and bundle the required gems:

```bash git clone https://github.com/swmcc/api.whatisonthe.tv.git cd
api.whatisonthe.tv bundle install ```

To set up the database, run:

```bash rails db:create rails db:migrate ```

Amend the API_XXX enteries by referring to `.env.example`.

This is an on going project.
