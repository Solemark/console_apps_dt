Iterable<num> getEvens(Iterable<num> data) => data.where((element) => element % 2 == 0);
Iterable<num> getOdds(Iterable<num> data) => data.where((element) => element % 2 != 0);
