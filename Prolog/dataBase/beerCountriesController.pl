:-use_module(db/beerCountries).

contains([X|_],X).
contains([_|Tail],X):-contains(Tail,X).
:-op(500,xfx,contains).

typeIs(Beer,Type):-country(_,_,Y),Y contains brewery(_,Z,_),Z contains beer(Beer,Type).
:-op(500,xfx,typeIs).

drinksTheMostBeer(X):-country(X,Y1,_),not((country(_,Y2,_),Y2>Y1)).
:-op(500,xf,drinksTheMostBeer).

beersIn(0,[]).
beersIn(N,[brewery(_,Beers,_)|Tail]):-beersIn(K,Tail),length(Beers,H),N is K+H.
:-op(500,xfx,beersIn).

breweriesOf(L,N):-country(N,_,L).
:-op(500,xfx, breweriesOf).

hasMostBeers(X):-country(X,_,Y1),not((country(_,_,Y2),Beers1 beersIn Y1, Beers2 beersIn Y2,Beers2>Beers1)).
:-op(500,xf, hasMostBeers).