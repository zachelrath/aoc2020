# day1

## Installation

https://crystal-lang.org/install/

## Build from source (optional)

```
crystal build --release src/day2.cr
```

## Usage

Execute the binaries (fastest)

```
# Part a
time ./day2 -i input.txt
# Part b
time ./day2 -b -i input.txt 
```

Development mode

```
time crystal run src/day2.cr -- -i input.txt
time crystal run src/day2.cr -- -b -i input.txt
```

## Results

```
time ./day2 -i input.txt
    0.00s user 0.00s system 85% cpu 0.009 total
time ./day2 -b -i input.txt
    0.00s user 0.00s system 88% cpu 0.010 total
```