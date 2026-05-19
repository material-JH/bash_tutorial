#!/usr/bin/env bash
set -euo pipefail
input=""
while [ "$#" -gt 0 ]; do
  case "$1" in
    -in|--input)
      input="${2:-}"
      shift 2
      ;;
    *)
      shift
      ;;
  esac
done
if [ -z "$input" ]; then
  echo "fake-pw.x error: missing -in input file" >&2
  exit 2
fi
if [ ! -f "$input" ]; then
  echo "fake-pw.x error: input file not found: $input" >&2
  exit 3
fi
echo "Program PWSCF fake example starts"
echo "Reading input: $input"
echo "Self-consistent Calculation"
echo "iteration # 1"
echo "total energy              =     -15.81234567 Ry"
echo "iteration # 2"
echo "total energy              =     -15.82345678 Ry"
echo "!    total energy              =     -15.82345678 Ry"
echo "JOB DONE."
