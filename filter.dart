Iterable<num> get_evens(Iterable<num> data) => data.where((element) => element % 2 == 0);
Iterable<num> get_odds(Iterable<num> data) => data.where((element) => element % 2 != 0);
