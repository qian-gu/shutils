# shutils

A collection of useful shell scripts.

## Summary

- [rename.sh](scripts/rename.sh): rename `$pattern` with `$replacement` for all files with a specific
suffix, for example, rename `hello_world.md` to `hello-world.md`
- [substitute.sh](scripts/substitute.sh): replace `$pattern` with `$replacement` for all files contain
`$keyword`
- [capitalize.sh](scripts/capitalize.sh): capitalize filename for all files with a specific suffix
- [lowercase.sh](scripts/lowercase.sh): lowercase filename for all files with a specific suffix
## Setup

```bash
# clone this repo and add to path
git clone git@github.com:qian-gu/shutils.git
source setup.sh
```

## Usage

`cd` to working directory, and type `<script.sh> -h` for help information.

## Examples

```bash
# rename all .md file, replace _ with -
reanme.sh -s md -p _ -s -
# substitute all _ with - for all files contain slug
substitute.sh -k slug -p _ -s -
# capitalize all .md filename
capitalize.sh -s md
# lowercase all .md filename
lowercase.sh -s md
```

## License

[MIT](LICENSE)
