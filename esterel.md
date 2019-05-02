# Esterel

## Structure et modules
```
module M:
  input I: integer;
  output O;
  [...]
end module
```

```
module Main:
  input I: integer;
  output O1, O2;
  signal I2 in
    run M1/M [ signal O1/O ]
    || run M2/M [signal O2/O, I2/I ]
  end signal
end module
```

Parallèlisme: `[ await I1 || await I2 ]; emit O` (on attends que les deux soient finis)

## Emission et reception
* `emit O` ou `emit OINT(1)` (signal valué), `sustain O`
* `await I`, `await n I`, `I?` (dernière valeur)

## Variables
* `var n := 0 : integer in [...] end var`
* `n := n + 1`

## Conditions
* `present [I1 and I2] or [not I3] then [...] end present`
* `if b then [...] end if`

## Boucles
* `loop [...] end loop` (ne pas oublier le `pause`)
* `every I do [...] end every` (on peut utiliser `every tick`)
* `loop [...] each I` pareil

## Préemption
* `abort [...] when I`
* `trap T in [...] exit T [...] end trap` levée d'exception

## Fonctions, procédures et tâches
### Synchrone
* `procedure Increment(T) (int);`, `function Init ():T;`: déclarations de fonctions externes (synchrones, donc rapides !)
* `var X := Init () : T in [...]`
* `call Increment(X) (1)`

### Asynchrone
* `task Compute(Traj) (Coords);` déclaration de tâche asynchrone
* `exec Compute(T) (?Current) return R; emit O(T)` exécution asynchrone
