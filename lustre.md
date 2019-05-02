# Lustre

## Structure et modules
```
node Module1(Y,Z: int) returns (X:int);
var S: int;
let
  S = Z + Y;
  X = (Y * 2) + Z;
tel
```

## Flots
* `pre`: valeur précédente
* `->`: init, une première valeur puis la suite
* `b = 1 -> 1 + pre b`

## Horloges
* `a when b`: b flot boolean (combinaisons seulement sur la m horloge)
* `current a`: dernière valeur de `a` échantillonnée

## Exemples

### Abro
```
node EDGE(X: bool) returns (Y: bool);
let
  Y = false -> X and not (pre X);
tel

node ABRO(A,B,R: bool) returns (O: bool);
var seenA, seenB: bool;
let
  O = EDGE(seenA and seenB);
  seenA = false -> not R and (A or pre (seenA));
  seenB = false -> not R and (B or pre (seenB));
tel
```

### Fibonacci
```
node Fibonacci() returns (f: int);
let
  f = 1 -> pre (1 -> f + pre f);
tel
```
