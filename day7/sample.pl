
:- discontiguous bag/1.
:- discontiguous contain/2.

bag(light_red).
contain(light_red, bright_white).
contain(light_red, muted_yellow).

bag(dark_orange).
contain(dark_orange, bright_white).
contain(dark_orange, muted_yellow).

bag(bright_white).
contain(bright_white, shiny_gold).

bag(muted_yellow).
contain(muted_yellow, shiny_gold).
contain(muted_yellow, faded_blue).

bag(shiny_gold).
contain(shiny_gold, dark_olive).
contain(shiny_gold, vibrant_plum).

bag(dark_olive).
contain(dark_olive, faded_blue).
contain(dark_olive, dotted_black).

bag(vibrant_plum).
contain(vibrant_plum, faded_blue).
contain(vibrant_plum, dotted_black).

bag(faded_blue).
bag(dotted_black).


/* RULES */
contain_recursive(X, Y) :- contain(X, Y).
contain_recursive(X, Y) :- contain(X, Via),
                    contain_recursive(Via, Y).

part1 :-
    setof(X, contain_recursive(X, shiny_gold), Answers),
    length(Answers, NumAnswers),
    write(NumAnswers).

/* Part 1 - find bags which may contain "shiny gold" */
/*
part1 :- 
    open('output.txt',write,Out),
    write(Out,Answers),
    close(Out).
    */

