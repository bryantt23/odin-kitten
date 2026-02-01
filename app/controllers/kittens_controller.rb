class KittensController < ApplicationController
  def new
    @kitten=Kitten.new(name: "mittens", age: 2, cuteness: 8, softness: 10)
  end

  def create
    @kitten="you can create here"
  end

  def show
    @kitten=Kitten.new(name: "mittens", age: 2, cuteness: 8, softness: 10)
  end

  def index
    @kitten1=Kitten.new(name: "mittens", age: 2, cuteness: 8, softness: 10)
    @kitten2=Kitten.new(name: "puss", age: 12, cuteness: 7, softness: 5)
    @kitten3=Kitten.new(name: "garfield", age: 9, cuteness: 3, softness: 3)

    @kittens=[ @kitten1, @kitten2, @kitten3 ]
  end

  def update
  end

  def destroy
    @kitten="you can destroy here"
  end

  def edit
    @kitten="you can edit here"
  end
end
