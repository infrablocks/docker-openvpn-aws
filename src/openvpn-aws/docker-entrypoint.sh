#!/bin/bash

[ "$TRACE" = "yes" ] && set -x
set -e

exec "$@"
