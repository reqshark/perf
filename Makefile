.PHONY: perf bench net udp

ALL:
	npm i

# you probably already know, but if not, something to be aware of:
# `&` backgrounds the first `node local...` command, it'll wait for `node remote`
# that next node command runs in the foreground to print results and then exit
# both processes run corresponding endpoints and exit at about the same time
# if you get failures or no output, the first probably went all zombie, so you need to find it and kill it:
# $ ps aux | grep local
# $ kill [this argument is the process id number]
# for more tips check out: https://github.com/cyberwizardinstitute/workshops/blob/master/unix.markdown

# make commands orignally composed in this manner by Ron Korving for zeromq.node
# also improved by Michele Comignano for node-nanomsg

perf:
	node local_lat.js tcp://127.0.0.1:5555 1 100000& node remote_lat.js tcp://127.0.0.1:5555 1 100000 && wait
	node local_thr.js tcp://127.0.0.1:5556 1 100000& node remote_thr.js tcp://127.0.0.1:5556 1 100000 && wait

bench:
	node perf/local_lat.js tcp://127.0.0.1:5555 10 1000& node perf/remote_lat.js tcp://127.0.0.1:5555 10 1000 && wait
	node perf/local_thr.js tcp://127.0.0.1:5556 10 100000& node perf/remote_thr.js tcp://127.0.0.1:5556 10 100000 && wait

net:
	node net/local_lat.js tcp://127.0.0.1:45557 1 100000& node net/remote_lat.js tcp://127.0.0.1:45557 1 100000 && wait
	node net/local_thr.js tcp://127.0.0.1:45558 1 100000& node net/remote_thr.js tcp://127.0.0.1:45558 1 100000 && wait

udp:
	node udp/local_thr.js udp://localhost:5559 6000 10000& node udp/remote_thr.js udp://localhost:5559 6000 10000 && wait
