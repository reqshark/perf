> *The more sand has escaped from the hourglass of our life, the clearer we should see through it.*

> Niccolo Machiavelli

# nanømsg style performance benchmarks

conduct throughput observation and latency analysis on your endpoint to endpoint transport limits.

we use a `make` command with a generic configuration, just a starting point of about 100,000 small node buffers.

we examine typical `udp` Datagram throughput top-ends by extending this buffer envelope size to `6000` bytes.

let's collect nanomg style benchmarks for comparing various node modules!



some of the available modules among this repertoire include:
* node-nanomsg
* udp *(node core)*
* net *(node core)*

# setup

```bash
$ git clone https://github.com/reqshark/perf.git && cd perf && make
```

# run

run nanomsg:
```bash
$ make perf
```
run the udp module:
```bash
$ make udp
```
run the net module:
```bash
$ make net
```

for more info how to bulid your own custom comparisons check out: [running benchmarks](https://github.com/JustinTulloss/zeromq.node#running-benchmarks)

you are *strongly* encouraged to fork and tweak the Makefile's bench and then run:
```bash
$ make bench
```
:)

*<sub><strong>compatibility:</strong> node versions `v0.10` up through `io.js` latest</sub>*

### Contributing

PRs for more benchmarks please! Play around with the Makefile and add directories for new modules in your PR! Don't forget to add new make commands and list them at the top `.PHONY`

Issues are more than welcome!

### MIT
