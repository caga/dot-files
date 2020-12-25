#!/bin/bash
killall -q lemonbar
killall -q limonAyar

limonayar | lemonbar -p -g 1440x32+0+0 -F "#FFFFFFFF" -B"#FF222222" -U"#268bd2" -u 3 -o -4 -f "Source Code"-10 |$SHELL
