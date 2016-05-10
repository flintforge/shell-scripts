#!/bin/bash
# Date:<2016/05/10 13:58:52>
# author : phil estival <infos@caern.net>

# find from directory $1, files matching $2, containing pattern $3

# check for proper numbers of arguments or give explanations
# $# number of arguments given
# $0 the name of this calling program
# the named parameter : a path and an expression
args_are 3 $# $0 "path" "'file pattern'" "expression(s)" || exit

# look into the result of the search for an expression
find $1 -iname "$2"  -exec grep $3 -H -n {} \; | hilite $red $3
