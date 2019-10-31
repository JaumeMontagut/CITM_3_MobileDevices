
import 'package:exemples/model/song.dart';

class SongList {
  List<Song> _songs = [
    Song('Blas blas', 'Los Pequeniques', 1957),
    Song('Jir Jur', 'Blim Blam', 1960),
  ];

  List<Song> get songs => _songs;

  get numSongs => _songs.length;

  Song getSong(int index) => _songs[index];

  void addSong(Song s) {
    _songs.add(s);
  }
}

