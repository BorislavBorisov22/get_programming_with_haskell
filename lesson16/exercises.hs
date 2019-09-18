module Exercises where

type FirstName = String
type LastName = String
type MiddleName = String

data Name = Name FirstName LastName
   | NameWithMiddle FirstName MiddleName LastName
data Author = Author Name
data Artist = Person Name | Band String

data Creator = AuthorCreator Author | ArtistCreator Artist

data Book = Book {
     author    :: Creator
   , isbn      :: String
   , bookTitle :: String
   , bookYear  :: Int
   , bookPrice :: Double
   }

data VinylRecord = VinylRecord {
     artist        :: Creator
   , recordTitle   :: String
   , recordYear    :: Int
   , recordPrice   :: Double
   }

data CollectibleToy = CollectibleToy {
     name :: String
   , descrption :: String
   , toyPrice :: Double
   }

data Pamphlet = Pamphlet {
     title :: String
   , pamphletDescrption :: String
   , contact :: Double
   , pamphletPrice   :: Double
   }

data StoreItem = BookItem Book
 | RecordItem VinylRecord
 | ToyItem CollectibleToy
 | PamphletItem Pamphlet

price :: StoreItem -> Double
price (BookItem book) = bookPrice book
price (RecordItem record) = recordPrice record
price (ToyItem toy) = toyPrice toy
price (PamphletItem pamphlet) = pamphletPrice pamphlet

--Q16.1
--Create Pamphlet type, add it to StoreItem, and modify price to work with it
--Changes made above

--Q16.2
--Create Shape type that includes Circle, Square, and Rectangle
--Write functions to compute perimeter and area

data Circle = Circle {
     radius :: Double
   }

data Square = Square {
     sideLength :: Double
   }

data Rectangle = Rectangle {
     rectangleLength :: Double
   , rectangleWidth  :: Double
   }

data Shape = CircleShape Circle
 | SquareShape Square
 | RectangleShape Rectangle

perimiter :: Shape -> Double
perimiter (CircleShape circle) = 3.14 * (2.0 * radius circle)
perimiter (SquareShape square) = sideLength square * 4.0
perimiter (RectangleShape rectangle) = (rectangleLength rectangle * 2.0) + (rectangleWidth rectangle * 2.0)

area (CircleShape circle) = 3.14 * (radius circle * radius circle)
area (SquareShape square) = sideLength square * sideLength square
area (RectangleShape rectangle) = rectangleLength rectangle * rectangleWidth rectangle

c :: Shape
c = CircleShape (Circle 23.5)

-- perimiter c
-- 147.58

-- area c
-- 1734.065


