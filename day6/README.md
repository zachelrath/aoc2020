# day6

## Development mode

```
crystal run src/day6.cr -- -i input.txt
crystal run src/day6.cr -- -b -i input.txt
```

## Production / fast mode

```
crystal build --release src/day6.cr
time ./day6 -i input.txt
time ./day6 -b -i input.txt 
```

## Results

```
time ./day6 -i input.txt
    0.01s user 0.00s system 88% cpu 0.012 total
time ./day6 -b -i input.txt
    0.01s user 0.00s system 85% cpu 0.012 total
```