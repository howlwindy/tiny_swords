import 'dart:io';

const directoriesAssets = {
  "gameImages": "assets/images/game",
};
const directoriesGens = {'assets': 'lib/gens/assets.g.dart'};

Future<List<String>> _filenames(String path) async {
  var filenames = (await Directory(path).list().toList())
      .map((filename) => '"${filename.path.split("/").last}"')
      .toList();
  return filenames;
}

Future<void> genAssetsFilenames() async {
  var contents = '';
  for (var directory in directoriesAssets.entries) {
    final filenames = await _filenames(directory.value);
    contents += 'const ${directory.key} = $filenames;\n';
  }
  await File(directoriesGens['assets']!).writeAsString(contents);
}

void main() async {
  await genAssetsFilenames();
}
