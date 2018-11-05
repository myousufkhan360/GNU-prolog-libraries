/*=====================================================
This PROLOG PROGRAM is USED for PARSING a LIST CONSISTING of COMMA SEPARATED
SEQUENCE of ENGLISH WORDS and then DISPLAYING the RESULT of PARSING to the USER.
The SEQUENCE of WORDS is PASSED as a PROLOG LIST to a PREDICATE that initiates the
PARSING.
=====================================================*/
:- include(nouns_x).
:- include(adjectives_x).
:- include(verbs_x).

/*------------------------------------------------------------------------
The following PREDICATES can be USED for DISPLAYING SOME or ALL
of the NOUNS, ADJECTIVES, or VERBS in the DATABASE. After DISPLAY
 of EACH ITEM, the USER SHOULD PRESS the ';' key (stands for 'or') to
DISPLAY the NEXT ITEM or RETURN to TERMINATE the DISPLAY of
ITEMS. 
*/

nouns(X) :- is_noun(X), write(X), nl.
adjectives(X) :- is_adjv(X), write(X), nl.
verbs(X) :- is_verb(X), write(X), nl.
/*-----------------------------------------------------------------------*/
/*-------------------------------------------------------------------*/
is_a_noun(L, Un) :- L = [N | Un], is_noun(N).
is_a_noun([A | Rest], Un) :- is_adjv(A), Rest = [N | Un], is_noun(N).

is_q_noun(L, Un) :- is_a_noun(L, Un).
is_q_noun([a | Rest], Un) :- is_a_noun(Rest, Un).
is_q_noun([the | Rest], Un) :- is_a_noun(Rest, Un).
					
msg_valid :- write('Sentence is valid').
is_sentence(L) :- is_q_noun(L, Un), Un = [V | []], is_verb(V), msg_valid.
is_sentence(L) :- is_q_noun(L, Un_a),  
		Un_a = [V | Un_b], is_verb(V), is_q_noun(Un_b, []), msg_valid. 
/*=================================================================
The following PREDICATE is VERY IMPORTANT in this PROLOG PROGRAM becauase
it INITIATES the PARSING of the SENTENCE. The PREDICATE DEFINED for INPUTTING
the SENTENCE is CALLED in the BODY of the FOLLOWING PREDICATE. Then the 
SENTENCE is MATCHED with RELEVENT PREDICATES. */
parse_s :- prompt_s, get_input(L), is_sentence(L).
/*==================================================================*/

/*===============VERY IMPORTANT-INPUT====================
The following predicates are used for INPUTTING a sentence in the form
of a LIST of WORDS.  */  
prompt_s :- write('Enter the words of a sentence as a List (surrounded by [, ].'), nl,
			write('Place a . after ]  '), nl.
get_input(L) :- read(L).

/*=======================================================*/