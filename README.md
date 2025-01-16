# Multigrid comparison

This is a git repo to help us with comparing the changed 
assignment counts for the square and linear multigrids.

Please note that the figures may currently look strange as they
were run on test data.

## Setup

To setup the environment, run the following:

```bash
./setup.sh
```

This will install the required python packages, rust packages,
and the required julia packages.

## Running the simulations

To run the simulations, you should be able to just invoke the 
following script:

```bash
./run_all.sh
```

This will take a couple of hours to run (~2 on my desktop).