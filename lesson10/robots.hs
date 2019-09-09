module Robots where

robot (name,attack,hp)  = \message -> message (name,attack,hp)

name (n,_,_) = n
attack (_,a,_) = a
hp (_,_,hp) = hp

getName aRobot = aRobot name
getAttack aRobot = aRobot attack
getHP aRobot = aRobot hp

setName aRobot newName = aRobot (\(n,a,h) -> robot (newName,a,h))
setAttack aRobot newAttack = aRobot (\(n,a,h) -> robot (n,newAttack,h))
setHP aRobot newHP = aRobot (\(n,a,h) -> robot (n,a,newHP))

printRobot aRobot = aRobot (\(n,a,h) -> n ++
                                        " attack:" ++ (show a) ++
                                        " hp:"++ (show h))

damage aRobot attackDamage = aRobot (\(n,a,h) ->
                                     robot (n,a,h-attackDamage))

fight aRobot defender = damage defender attack
  where attack = if getHP aRobot > 10
                 then getAttack aRobot
                 else 0


-- killerRobot = robot ("Kill3r",25,200)
-- Taking an existing robot, modifying it and returning a new one
-- is just like Javascript's prototype OOP. In JS, instances of objects
-- are created by modifying the prototype object

-- nicerRobot = setName killerRobot "kitty"
-- gentlerRobot = setAttack killerRobot 5
-- softerRobot = setHP killerRobot 50

