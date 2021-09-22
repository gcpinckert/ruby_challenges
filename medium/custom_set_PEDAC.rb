=begin
PROBLEM: Create a custom set type

- Design an object that behaves like a set of *unique* elements
- The elements can be manipulated in several well defined ways
- For this problem, assume that all elements in a set are numbers
- The elements do not have to have any particular order

EXAMPLES TEST CASES:

Behavior of a CustomSet object:
  - can tell if it is empty of members
  - can tell if a given number is one of its members
  - can tell if it is a subset of another given CustomSet:
    - a set is a subset of another set if all the elements in the calling set
      are also in the set passed as argument
    - an empty set is a subset of an empty set
    - an empty set is a subset of a non-empty set
    - a non-empty set is not a subset of an empty set
    - if both sets have identical members, they are subsets of each other
    - if all members of a set are members in the given set, it is a subset
    - if a set contains any member(s) not in the given set, it is not a subset
  - can tell if it is a disjoint of another given CustomSet:
    - two sets are called disjoint if none of the members in either are shared
    - an empty set is a disjoint of an empty set
    - an empty set is a disjoint of a non-empty set
    - a non-empty set is a disjoint of an empty set
    - if any members of a set are in the given set, it is not a disjoint
    - if there are no shared members between sets, they are disjoints
  - can tell if it has equal value to another set (eql?):
    - two sets are equal only when they contain the same members
    - two empty sets are considered equal
    - an empty set and non empty set are not equal
    - if all members of the sets are the same (regardless of order) the are
      considered equal
    - if any member(s) of the sets are not the same (regardless of order) they
      are not considered equal
    - a set that contains duplicate members of the given set is considered to
      be equal, as long as all members represented are equivalent
  - can add a given member to itself:
    - if the given obj is not already included in the set, it is added
    - if the given obj is already included, a duplicate is not added
  - can return the *intersection* of itself and another given CustomSet:
    - intersection => a new set containing only members present in both sets
    - the intersection of an empty set and an empty set is an empty set
    - the intersection of an empty set and a non-empty set is an empty set
    - the intersection of a non-empty set with an empty set is an empty set
    - the intersection of two sets with no shared members is an empty set
    - the intersection of two sets with shared members is a set of shared 
      members, regardless of order, with no duplicates
  - can return the *difference* of itself and another given CustomSet:
    - difference => a new set that contains all members of calling set not
      present in set passed as argument
    - the difference of two empty sets is an empty set
    - the difference of an empty set and non-empty set is an empty set
    - the difference of a non-empty set with an empty set is the non-empty set
      * order matters here
    - the difference of two non-empty sets is a set containing the members of
      the calling set less any shared members from the given set
  - can return the *union* of itself and another given CustomSet:
    - union => a new set containing all members from either or both sets
    - the union of two empty sets is an empty set
    - the union of a non-empty set and an empty set is a set with members from
      the non-empty set *this works regardless of order (caller/argument)
    - the union of two empty sets is all members from both sets, with no
      duplicated members

DATA STRUCTURES:
- Internally, we can use a hash to preserve the mandate that all sets have
  unique members (a hash has unique set of keys)
- We can set a default arbitrary value to assign? or assign the ele as value?

ALGORITHM:

Define a CustomSet class

#initialize
  - takes a single optional argument, an array in which each element represents
    a member of the set being created
  - set a default value for the argument as an empty array
  - initialize a @set instance variable to an empty hash 
  - iterate over the given array, add each element as key in the hash
  - any duplicate elements will only be added once

#empty?
  - return true if the @set hash is empty, false otherwise

#contains?(possible_member)
  - return true if the argument is a key in @set, false otherwise

#subset?(other_set)
  - return true if all keys of @set in self are members in other_set
  - iterate over keys in @set
    - return false if current key is not represented in other Set
  - otherwise, return true

#disjoint?(other_set)
  - return true only if there are no shared members between sets
  - iterate over the keys in @set
    - return false if current key is included in other_set
  - otherwise, return true

#eql?(other_set)
  - return true only if all members of sets are the same (regardless of order)
  - true if self is a subset of other and other is a subset of self

#add(member)
  - add member as a key-value pair to @set
  - should return the CustomSet object, and not the member assigned
  - need to define a #== method so assert_equal works here?

#intersection(other_set)
  - initialize a new CustomSet obj to return
  - iterate over the keys in @set for self
    - if the current key is included in other_set, add it to the results set
  - return the results set

#difference(other_set)
  - initialize a new CustomSet obj to return
  - iterate over the keys in @set for self
    - add the current key to results set unless it is in other_set
  - return the results set

#union(other_set)
  - initialize a new results CustomSet to a copy of self
  - get the difference between other_set and self 
    - this returns a CustomSet of all members in other_set not in self
  - iterate over the difference CustomSet <- define an each method to do this
    - add the current member to the results CustomSet 
  - return the results CustomSet
=end
