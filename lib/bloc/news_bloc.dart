import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:virtusa_assignment2/api/Network.dart';
import 'package:virtusa_assignment2/models/NewsResponse.dart';

class NewsBloc {
  Network _network = new Network("");
  final _newFetcher = BehaviorSubject<List<Articles>>();

  Observable<List<Articles>> get newsStream => _newFetcher.stream;

  fetchNews() async {
    List<Articles> newsList = await _network.getNews();
    print('Bloc News List--${newsList.length}');
    _newFetcher.sink.add(newsList);
  }

  dispose() {
    _newFetcher.close();
  }
}

final weatherBloc = NewsBloc();
