# local variable scope, especially how local variables interact with method invocations with blocks and method definitions
mutating vs non-mutating methods, pass-by-reference vs pass-by-value
working with collections (Array, Hash, String), and popular collection methods (each, map, select, etc). Review the two lessons on these topics thoroughly.
variables as pointers
puts vs return
false vs nil and the idea of "truthiness"
method definition and method invocation
implicit return value of method invocations and blocks
how the Array#sort method works
How to Answer the Assessment Questions
The questions in this assessment will typically be testing your knowledge and understanding on more than one level.


**When answering the questions, you should:**
* Explain your reasoning with reference to specific lines in the program. You can use line numbers to refer to specific lines of code where necessary.
* Answer with precision. For example, say "method declaration" or ",method invocation" as opposed to just "method" when the distinction is important.
* Highlight any specific syntactical conventions or technical observations where relevant.
* Identify the key fundamental concept or concepts being demonstrated in the question.


Examine the code example below. The last line outputs the String 'Hi' rather than the String 'Hello'. Explain what is happening here and identify the underlying principle that this demonstrates.
```ruby
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting
```
**Compare the following possible answers to this question:**
A) greeting is set to 'Hello' on line 1. greeting is set to 'Hi' on line 4. Line 8 outputs greeting, which is 'Hi'.

B) The local variable greeting is assigned to the String 'Hello' on line 1. Within the loop, greeting is then reassigned to the String Hi on line 4. The puts method is called on line 8 with the variable greeting passed to it as an argument; since greeting is now assigned to 'Hi', this is what is output.

C) The local variable greeting is assigned to the String 'Hello' on line 1. The do..end alongside the loop method invocation on lines 3 to 6 defines a block, within which greeting is reassigned to the String Hi on line 4. The puts method is called on line 8 with the variable greeting passed to it as an argument; since greeting is now assigned to 'Hi', this is what is output.

D) The local variable greeting is assigned to the String 'Hello' on line 1. The do..end alongside the loop method invocation on lines 3 to 6 defines a block, within which greeting is reassigned to the String Hi on line 4. The puts method is called on line 8 with the variable greeting passed to it as an argument; since greeting is now assigned to 'Hi', this is what is output. This example demonstrates local variable scoping rules in Ruby; specifically the fact that a local variable initialized outside of a block is accessible inside the block.

**While none of these answers is technically incorrect, they all answer the question with varying degrees of detail and precision.**
Answer 'A' describes what is happening in the code example, but does so in a fairly basic way with imprecise language. This wouldn't be a sufficient response to receive full points for any of the questions in the assessment.

Answer 'B' again describes what is happening, but with much greater precision of language. This would score higher than Answer 'A', but generally wouldn't be sufficient to receive full points for the majority of questions; most questions in the assessment are looking for something more, such as a specific piece of syntactical knowledge and perhaps identification of some fundamental concept.

Answer 'C', as well as precisely describing the example, identifies an important Ruby syntactical convention that is relevant to the example: the fact that the method invocation combined with do..end defines a block in Ruby. For some assessment questions this might be sufficient to receive full points, but many questions will expect you to demonstrate some deeper understanding of the fundamental concept that this illustrates.

Answer 'D' goes a step further than 'C' by explaining why this is important and the underlying principle that it demonstrates; i.e. the fact that method invocations with blocks in Ruby have particular scoping rules which affect whether or not the local variable can be referenced or reassigned. Based on the way that this particular question is phrased, answer 'D' would be the only answer of the four to receive full points in an actual assessment.


## Precision of Language
For example, let's take the following piece of code.
```ruby
def a_method
  puts "hello world"
end
```
If asked to describe the method, you might be tempted to say "the results of the method is hello world". This isn't wrong, but for a programmer, it's extremely imprecise and doesn't help us understand the method. If you had written that as an answer, you'd score a 5/10 on the question (50% is not a passing score).

The more precise answer would be "the method invocation outputs the string hello world, and returns nil". In programming, we are always concerned with the output and the return value and mutations to objects. We need to speak in those terms, and not use vague words like "results".


### Some Specifics
As well as requiring a general precision of language in your answers, for the purposes of the assessment there are a few areas where we would like you to refer to certain things in a very clear and fairly specific way; these are outlined below.

**Assignments**
Consider the following assignment statement:
```ruby
greeting = 'Hello'
```
Most of the Launch School material describes this statement as:

The greeting variable is assigned to the string 'Hello'.

However, there are places where we describe this code as:

The string 'Hello' is assigned to the greeting variable.

Both of these are acceptable in the assessment. Try to be consistent though -- if you aren't consistent, your meaning may be confused.

**Truthiness**
In the assessment we want you to be very clear about the distinction between truthy and the boolean true (and similarly the distinction between falsey and the boolean false).

In Ruby, every value apart from false and nil, evaluates as true in a boolean context. We can therefore say that in Ruby, every value apart from false and nil is truthy; we can also say that false and nil are falsey. This is not the same as saying every value apart from false and nil is true, or is equal to true. These may seem like subtle distinctions but they are important ones.

```ruby
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```
a is true and so 'Hello is truthy' is output" would be incorrect
a is equal to true and so 'Hello is truthy' is output" would be incorrect
a evaluates as true in the conditional statement and so 'Hello is truthy' is output" would be correct
a is truthy and so 'Hello is truthy' is output" would be correct

**To sum up:**
* Use "evaluates to true", "evaluates as true", or "is truthy" when discussing an expression that evaluates as true in a boolean context
* Do not use "is true" or "is equal to true" unless specifically discussing the boolean true
* Use "evaluates to false", "evaluates as false", or "is falsy" when discussing an expression that evaluates as false in a boolean context
* Do not use "is false" or "is equal to false" unless specifically discussing the boolean false
Method Definition and Method Invocation
* When discussing methods, particularly in terms of how blocks and methods interact with local variables, we want you to explain this in terms of method definition and method invocation. You can review this assignment for an outline of the mental model to use.