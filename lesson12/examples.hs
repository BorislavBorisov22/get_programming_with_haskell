module Examples where

-- Patient info examples of custom types with data constructors

-- types
type FirstName = String
type LastName = String
type MiddleName = String
type Age = Int
type Height = Int
type Weight = Int
type PatientName = (FirstName,LastName)

data Name = Name FirstName LastName
          | NameWithMiddle FirstName MiddleName LastName
data Sex = Male | Female
data RhType = Pos | Neg
data ABOType = A | B | AB | O
data BloodType = BloodType ABOType RhType
data Patient' = PatientName Sex Int Int Int BloodType
-- use recoard syntax to set/get each attribute by name.
-- the order no longer matters!
data Patient = Patient { name :: Name, sex :: Sex
                       , age :: Int
                       , height :: Int
                       , weight :: Int
                       , bloodType :: BloodType }


-- support functions
sexInitial :: Sex -> Char
sexInitial Male = 'M'
sexInitial Female = 'F'

showSex :: Sex -> String
showSex Male = "Male"
showSex Female = "Female"

showAge :: Age -> String
showAge a = show a

showHeight :: Height -> String
showHeight h = show h ++ " in."

showWeight :: Weight -> String
showWeight w = show w ++ " lbs."

showName :: Name -> String
showName (Name f l) = f ++ " " ++ l
showName (NameWithMiddle f m l) = f ++ " " ++ m ++ " " ++ l

-- before we knew about custom types
-- patientInfo :: FirstName -> LastName -> Age -> Height -> String
-- patientInfo fname lname age height = name ++ " " ++ ageHeight
--   where name = lname ++ ", " ++ fname
--         ageHeight = "(" ++ show age ++ "yrs. " ++ show height ++ "in.)"
-- 
-- patientInfo' :: PatientName -> Age -> Height -> String
-- patientInfo' (firstName, lastName) age height = name ++ " " ++ ageHeight
--   where name = lastName ++ ", " ++ firstName
--         ageHeight = "(" ++ show age ++ "yrs. " ++ show height ++ "in.)"

-- for that to work, you must create a name and use that:
-- some_name = ("Craig", "Treptow")

-- passing a tuple in doesn't work
-- *Examples> craig' = patientInfo' ("Craig" "Treptow") 48 72
--
-- <interactive>:10:24: error:
--     • Couldn't match expected type ‘[Char] -> PatientName’
--                   with actual type ‘[Char]’
--     • The function ‘"Craig"’ is applied to one argument,
--       but its type ‘[Char]’ has none
--       In the first argument of ‘patientInfo'’, namely
--         ‘("Craig" "Treptow")’
--       In the expression: patientInfo' ("Craig" "Treptow") 48 72

showRh :: RhType -> String
showRh Pos = "+"
showRh Neg = "-"

showABO :: ABOType -> String
showABO A = "A"
showABO B = "B"
showABO AB = "AB"
showABO O = "O"

showBloodType :: BloodType -> String
showBloodType (BloodType abo rh)  = showABO abo ++ showRh rh

canDonateTo :: BloodType -> BloodType -> Bool
canDonateTo (BloodType O _) _               = True
canDonateTo _ (BloodType AB _)              = True
canDonateTo (BloodType A _) (BloodType A _) = True
canDonateTo (BloodType B _) (BloodType B _) = True
canDonateTo _ _                             = False --otherwise

-- create some data
johnDoe :: Patient
johnDoe = Patient (Name "John" "Doe") Male 30 74 200 (BloodType AB Pos)
janeSmith :: Patient
janeSmith = Patient (NameWithMiddle "Jane" "Elizabeth" "Smith") Female 30 74 200 (BloodType AB Neg)

jackieSmith :: Patient
jackieSmith = Patient {name = Name "Jackie" "Smith"
                      , age = 43
                      , sex = Female
                      , height = 62
                      , weight = 115
                      , bloodType = BloodType O Neg }

-- Q12.1
-- canDonateTo, but takes two patients rather than two blood types
-- I did not think of this/misunderstood the question
donorFor :: Patient -> Patient -> Bool
donorFor p1 p2 = canDonateTo (bloodType p1) (bloodType p2)

-- Q12.2
-- patientSummary
-- **************
-- Patient Name: Smith, John
-- Sex: Male
-- Age: 46
-- Height: 72 in.
-- Weight: 210 lbs.
-- Blood Type: AB+
-- **************

patientSummary :: Patient -> String
patientSummary p =
  "**************\n" ++
  "Patient Name: " ++ showName (name p) ++ "\n" ++
  "Sex: " ++ showSex (sex p) ++ "\n" ++
  "Age: " ++ showAge (age p) ++ "\n" ++
  "Height: " ++ showHeight (height p) ++ "\n" ++
  "Weight: " ++ showWeight (weight p) ++ "\n" ++
  "Blood Type: " ++ showBloodType (bloodType p) ++ "\n" ++
  "**************\n"

