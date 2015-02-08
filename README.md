# Amnesia Phoenix Benchmark

A 10,000 synchronous transaction benchmark of mnesia with a async process per transaction using the amnesia wrapper for mnesia.

See:

hello_phoenix/lib/trans_action.ex
and
hello_phoenix/web/controllers/page_controller.ex

for most relevant code


To start your new Phoenix application:

1. Install dependencies with `mix deps.get`
3. Start Amnesia with `mix install` (uninstall with `mix uninstall`)
2. Start Phoenix endpoint with `mix phoenix.server`
4. Watch 10k transactions being done with Task.async upon visiting `localhost:4000`
5. Check the console for benchmark and mnesia information

Now you can visit `localhost:4000` from your browser and wait a few seconds for it to load.
