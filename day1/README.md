# day1

## Build from source (optional)

```
crystal build --release src/day1.cr  
crystal build --release src/day1b.cr
```

## Usage

Execute the binaries (fastest)

```
time ./day1 -i input.txt
time ./day1b -i input.txt 
```

Development mode

```
time crystal run src/day1.cr -- -i input.txt
time crystal run src/day1b.cr -- -i input.txt
```

## Results

```
./day1 -i input.txt
    0.00s user 0.00s system 85% cpu 0.008 total
./day1b -i input.txt
    0.00s user 0.00s system 88% cpu 0.010 total
```