class Filter {
  Iterable<num> data;
  Filter({required this.data});

  Iterable<num> get even => this.data.where((i) => i % 2 == 0);
  Iterable<num> get odd => this.data.where((i) => i % 2 != 0);
}
