# pragma version 0.4.0
# @license MIT

# State variable , initialize to default value (0)  
my_favorite_number: public(uint256) # 0

struct Person:
    name: String[100]
    favorite_number: uint256
    

my_name: public(String[100])

list_of_numbers: public(uint256[5]) # [0,0,0,0,0]

list_of_people: public(Person[5])

index: public(uint256)

name_to_favorite_number: public(HashMap[String[100], uint256])

#Constructor
@deploy
def __init__(number: uint256):
    self.my_favorite_number = number
    self.index = 0
    self.my_name = "Irfan"

@external # this is decorator
def store(new_number: uint256):
    self.my_favorite_number = new_number #self. here is refering to the state variable

@external
@view
def retrive() -> uint256:
    return self.my_favorite_number

@external
def add_person(name: String[100], favorite_number: uint256):
    # Add favorite number to the numbers list
    self.list_of_numbers[self.index] = favorite_number

    #Add the person to the person's list
    new_person: Person = Person(name =name, favorite_number = favorite_number)
    self.list_of_people[self.index] = new_person

    #Add the person to the hashmap
    self.name_to_favorite_number[name]= favorite_number

    self.index = self.index + 1