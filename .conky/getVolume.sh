#!/bin/bash
amixer sget PCM | tail -n 1 | gawk '{print $5}' | tr -d [%]
