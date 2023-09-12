#!/bin/sh

[ -z "$SS_AGENT_PID" ] || eval "$(ssh_agent -k)"