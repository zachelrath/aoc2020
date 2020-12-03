# day1

## Installation

https://crystal-lang.org/install/

## Build from source (optional)

```
crystal build --release src/day2.cr  
crystal build --release src/day2b.cr
```

## Usage

Execute the binaries (fastest)

```
time ./day2 -i input.txt
time ./day2b -i input.txt 
```

Development mode

```
time crystal run src/day2.cr -- -i input.txt
time crystal run src/day2b.cr -- -i input.txt
```

## Results

```
./day2 -i input.txt
    0.00s user 0.00s system 89% cpu 0.010 total
```