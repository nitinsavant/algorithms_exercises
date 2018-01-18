// Given a list of people with their birth and death years, determine the year at which the population was the highest.

const person1 = { 'birth': 1986, 'death': 1992 };
const person2 = { 'birth': 1984, 'death': 1990 };
const person3 = { 'birth': 1990, 'death': 1994 };
const person4 = { 'birth': 1990, 'death': 1996 };
const person5 = { 'birth': 1993, 'death': 1995 };

const people = [person1, person2, person3, person4, person5];

let counter = {};

for (let i = 0; i < people.length; i++) {
  let person = people[i];
  for (let year = person.birth; year <= person.death; year++) {
    if (!counter[year]) { counter[year] = 0 };
    counter[year]++;
  }
}

let highestPopulation = 0;

for (let year in counter) {
  highestPopulation = Math.max(counter[year], highestPopulation);
}

console.log(highestPopulation);

// Time complexity:
// 1st step: O(P * L), where P is # people, L is max life span of a person
// 2nd step: O(Y), where Y is # years in history
// Total: O(P * L + Y)
