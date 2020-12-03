# day3

## Development mode

```
crystal run src/day3.cr -- -i input.txt
crystal run src/day3.cr -- -b -i input.txt
```

## Production / fast mode

```
crystal build --release src/day3.cr
time ./day3 -i input.txt
time ./day3 -b -i input.txt 
```

## Results

```
time ./day3 -i input.txt
    0.00s user 0.00s system 85% cpu 0.009 total
time ./day3 -b -i input.txt
    0.00s user 0.00s system 88% cpu 0.010 total
```