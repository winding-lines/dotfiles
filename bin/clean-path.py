#! /usr/bin/env python
# Remove anaconda environments from path.
# Usage:
#    export PATH=`~/bin/clean-path.py`

import os
import re
import sys

prefix=""

if "CONDA_PREFIX" in os.environ:
    prefix = os.environ["CONDA_PREFIX"] + "/envs";

if "CONDA_EXE" in os.environ:
    parts = os.environ["CONDA_EXE"].split("/")[0:-2] + ['envs']
    prefix = "/".join(parts)

if not prefix:
    print("| Cannot figure out conda prefix, no changing PATH", file=sys.stderr)
    print(os.environ["PATH"])
    sys.exit(0)

existing = os.environ["PATH"].split(":")
filtered = list(filter(lambda x: not x.startswith(prefix), existing))
print(f"| Removed path entries: {set(existing) - set(filtered)}\n", file=sys.stderr)

print(":".join(filtered))
