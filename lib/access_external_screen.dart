import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

class AccessExternalScreen extends StatefulWidget {
  final String title;

  const AccessExternalScreen({Key key, @required this.title}) : super(key: key);

  @override
  _AccessExternalScreenState createState() => _AccessExternalScreenState();
}

class _AccessExternalScreenState extends State<AccessExternalScreen> {
  Future<Directory> _tempDirectory;
  Future<Directory> _appSupportDirectory;
  Future<Directory> _appLibraryDirectory;
  Future<Directory> _appDocumentsDirectory;
  Future<Directory> _externalDocumentsDirectory;
  Future<List<Directory>> _externalStorageDirectories;
  Future<List<Directory>> _externalCacheDirectories;

  @override
  void initState() {
    super.initState();

    getPath();
  }

  Future<void> getPath() async {
    String paths;
    // getExternalStorageDirectories() will return list containing internal storage directory path
    // And external storage (SD card) directory path (if exists)
    paths = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);

    // setState(() {
    //   _exPath = paths; // [/storage/emulated/0, /storage/B3AE-4D28]
    // });

    // paths.forEach((element) {
    //   print("element => $element");
    // });
    print(paths);
  }

  void _requestTempDirectory() {
    setState(() {
      _tempDirectory = getTemporaryDirectory();
    });
  }

  Widget _buildDirectory(
      BuildContext context, AsyncSnapshot<Directory> snapshot) {
    Text text = const Text('');
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        text = Text('path: ${snapshot.data.path}');
      } else {
        text = const Text('path unavailable');
      }
    }
    return Padding(padding: const EdgeInsets.all(16.0), child: text);
  }

  Widget _buildDirectories(
      BuildContext context, AsyncSnapshot<List<Directory>> snapshot) {
    Text text = const Text('');
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        final String combined =
            snapshot.data.map((Directory d) => d.path).join(', ');
        text = Text('paths: $combined');
      } else {
        text = const Text('path unavailable');
      }
    }
    return Padding(padding: const EdgeInsets.all(16.0), child: text);
  }

  void _requestAppDocumentsDirectory() {
    setState(() {
      _appDocumentsDirectory = getApplicationDocumentsDirectory();
    });
  }

  void _requestAppSupportDirectory() {
    setState(() {
      _appSupportDirectory = getApplicationSupportDirectory();
    });
  }

  void _requestAppLibraryDirectory() {
    setState(() {
      _appLibraryDirectory = getLibraryDirectory();
    });
  }

  void _requestExternalStorageDirectory() {
    setState(() {
      _externalDocumentsDirectory = getExternalStorageDirectory();
    });
  }

  void _requestExternalStorageDirectories(StorageDirectory type) {
    setState(() {
      _externalStorageDirectories = getExternalStorageDirectories(type: type);
    });
  }

  void _requestExternalCacheDirectories() {
    setState(() {
      _externalCacheDirectories = getExternalCacheDirectories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('Get Temporary Directory'),
                onPressed: _requestTempDirectory,
              ),
            ),
            FutureBuilder<Directory>(
                future: _tempDirectory, builder: _buildDirectory),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('Get Application Documents Directory'),
                onPressed: _requestAppDocumentsDirectory,
              ),
            ),
            FutureBuilder<Directory>(
                future: _appDocumentsDirectory, builder: _buildDirectory),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('Get Application Support Directory'),
                onPressed: _requestAppSupportDirectory,
              ),
            ),
            FutureBuilder<Directory>(
                future: _appSupportDirectory, builder: _buildDirectory),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('Get Application Library Directory'),
                onPressed: _requestAppLibraryDirectory,
              ),
            ),
            FutureBuilder<Directory>(
                future: _appLibraryDirectory, builder: _buildDirectory),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: Text(Platform.isIOS
                    ? 'External directories are unavailable on iOS'
                    : 'Get External Storage Directory'),
                onPressed:
                    Platform.isIOS ? null : _requestExternalStorageDirectory,
              ),
            ),
            FutureBuilder<Directory>(
                future: _externalDocumentsDirectory, builder: _buildDirectory),
            Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: Text(Platform.isIOS
                      ? 'External directories are unavailable on iOS'
                      : 'Get External Storage Directories'),
                  onPressed: Platform.isIOS
                      ? null
                      : () {
                          _requestExternalStorageDirectories(
                            StorageDirectory.music,
                          );
                        },
                ),
              ),
            ]),
            FutureBuilder<List<Directory>>(
                future: _externalStorageDirectories,
                builder: _buildDirectories),
            Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: Text(Platform.isIOS
                      ? 'External directories are unavailable on iOS'
                      : 'Get External Cache Directories'),
                  onPressed:
                      Platform.isIOS ? null : _requestExternalCacheDirectories,
                ),
              ),
            ]),
            FutureBuilder<List<Directory>>(
                future: _externalCacheDirectories, builder: _buildDirectories),
          ],
        ),
      ),
    );
  }
}
