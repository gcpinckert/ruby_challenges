=begin
PROBLEM: Write a singly linked list.

- Each element in the list contains data and a "next" field
- The "next" field points to the next element in the list
- Can represent sequences or "push down stacks" (last in, first out)
- Basically means each element in the list knows about itself and the element
  that comes after it (how is list ordered here?)
- Here we want to have elements that contain a RANGE OF DATA (i.e. 1-10)
  - These can be any arbitrary values
- We want the "next" field to be a pointer that directly references the next
  element in the list
- Write methods that:
  - reverses the linked list
  - converts the list to an array
  - converts an array to a linked list

EXAMPLES / TEST CASES:

Create an Element Class
- Element#initialize method
  - takes one or two arguments
  - first argument represents data to be stored in the element
  - additional argument represents next Element object in the list
    - note: more recent elements come before in our list structure
    - if there is no second argument provided use a nil default value

- Element#datum
  - takes no arguments, returns the data stored in calling element

- Element#tail?
  - takes no arguments
  - returns boolean; true if calling element is the last one in the list
  - the last element will have no element stored in the "next" field

- Element#next
  - takes no arguments
  - returns the Element stored in the "next" field for calling element
  - if there is no next element, return nil (only if calling ele is last)

Create a SimpleLinkedList class
- SimpleLinkedList#initialize
  - takes no arguments, but creates the list "container"

- SimpleLinkedList#push(data)
  - takes a single argument and adds it to the list as an Element instance
  - The argument is simple datum, so will have to create an Element here
  - note that we want this to be the FIRST ele in the list not the last

- SimpleLinkedList#size
  - returns the size of the calling list

- SimpleLinkedList#peek
  - returns ONLY the data value of the most recent element (head) in the list
  - note the Element instance itself, only the data it represents

- SimpleLinkedList#head
  - returns the Element instance at the head of the list (most recent)
  - does not remove it from the list
  - what to return if list is empty? (nil?)

- SimpleLinkedList#pop
  - removes (mutating) and returns the head (most recent) Element instance
  - this should remove the FIRST element in the list and not the last

- SimpleLinkedList#empty?
  - returns a boolean `true` if the list is empty, `false` otherwise

- SimpleLinkedList#reverse
  - returns the list in reverse order
  - do not mutate original calling list, return a new reversed list

- SimpleLinkedList::from_a(array)
  - class method takes a single argument, an array or nil
  - creates a new instance of SimpleLinkedList using array argument
  - if argument provided is nil, created an empty list

- SimpleLinkedList#to_a
  - converts the calling list into an array
  - each Element data should be an element in the returned array

DATA STRUCTURES:

Element class:
- Input: any kind of data object
- Output: an Element instance

SimpleLinkedList:
- Use an array of Element instances internally to create the list
- Note that Elements should be added to the list array differently than with
  a normal array, more recent elements first and older elements last

ALGORITHM:

Element class

#initialize(data, next_ele -> optional provide default value nil)
  - initialize instance variable data and save data argument
  - initialize instance variable next and save next_ele argument
#datum
  - return the value referenced by @data
#tail?
  - return true if next_ele is nil, false otherwise
#next
  - return the value referenced by next_ele

SimpleLinkedList class

#initialize
  - initialize the instance variable @list to an empty array
#push(datum)
  - create an Element instance with the given datum
    - is the list empty?
      - create the Element with no second argument
    - otherwise
      - create the Element with the first element in the list as second arg
  - add the Element to the BEGINNING of the @list array
#size
  - return the size of the array @list
#empty?
  - return true if the array @list is empty, false otherwise
#peek
  - return the value referenced by @datum in the first Element of @list
  - create guard clause in case list is empty (no ele to call datum on)
#head
  - return the reference to first ele in @list without removing it
  - return nil if the list is empty
#pop
  - remove the first ele in @list
  - return the datum for the removed element
::from_a(array argument or nil)
  - initialize a new SimpleLinkedList
  - if given argument is nil, return this right away
  - iterate through the array argument reversed (so list order is preserved)
    - for each datum, add it to the SimpleLinkedList as an element
  - return the list
#to_a
  - iterate through @list for transformation
    - get the datum for the current element
  - return the resulting transformed array
#reverse
  - initialize an array variable of the current linked list as an array
  - generate a new linked list from the resulting array, reversed
=end