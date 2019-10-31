class Counter {
  String word;
  int count = 0;

  Counter(this.word);
}

class CounterList {
  List<Counter> counters = [
    Counter('lo peta'),
    Counter('chachi'),
    Counter('acuyunant'),
    Counter('lo flipas'),
    Counter('òstia'),
    Counter('brutal'),
    Counter('que te cagas')
  ];

  void ResetAll() {
    for (Counter counter in counters) {
      setState() {
        counter.count = 0;
      }
    }
  }
}

//Every counter list will have the same values on start, i don't like that
