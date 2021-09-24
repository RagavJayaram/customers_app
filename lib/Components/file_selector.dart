import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:platform/platform.dart';

class FileSelector extends StatefulWidget {
  static Platform platform;

  @override
  _FileSelectorState createState() => _FileSelectorState();
}

class _FileSelectorState extends State<FileSelector> {
  String _fileName;
  List<PlatformFile> _paths;
  String _directoryPath;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '')?.split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
    });
  }

  void _selectFolder() {
    FilePicker.platform.getDirectoryPath().then((value) {
      setState(() => _directoryPath = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
        shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
        Radius.circular(18.0),
    ),),
      child:Container(
        width: 350,
        decoration: BoxDecoration(

          border: Border.all(
            color: Colors.purple,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                'Attach Documents',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: DropdownButton(
                  hint: const Text('LOAD PATH FROM'),
                  value: _pickingType,
                  items: <DropdownMenuItem>[
                    DropdownMenuItem(
                      child: const Text('FROM AUDIO'),
                      value: FileType.audio,
                    ),
                    DropdownMenuItem(
                      child: const Text('FROM IMAGE'),
                      value: FileType.image,
                    ),
                    DropdownMenuItem(
                      child: const Text('FROM VIDEO'),
                      value: FileType.video,
                    ),
                    DropdownMenuItem(
                      child: const Text('FROM MEDIA'),
                      value: FileType.media,
                    ),
                    DropdownMenuItem(
                      child: const Text('FROM ANY'),
                      value: FileType.any,
                    ),
                    DropdownMenuItem(
                      child: const Text('CUSTOM FORMAT'),
                      value: FileType.custom,
                    ),
                  ],
                  onChanged: (value) => setState(() {
                    _pickingType = value;
                    if (_pickingType != FileType.custom) {
                      _controller.text = _extension = '';
                    }
                  })),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 100.0),
              child: _pickingType == FileType.custom
                  ? TextFormField(
                maxLength: 15,
                autovalidateMode: AutovalidateMode.always,
                controller: _controller,
                decoration: InputDecoration(labelText: 'File extension'),
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.none,
              )
                  : const SizedBox(),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 200.0),
              child: SwitchListTile.adaptive(
                title: Text('Multiple', textAlign: TextAlign.right),
                onChanged: (bool value) => setState(() => _multiPick = value),
                value: _multiPick,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.purple[800],

                    onPressed: () => _openFileExplorer(),
                    child: const Text("Open file picker",style: TextStyle(color: Colors.white),),
                  ),
                  RaisedButton(
                    color: Colors.purple[800],
                    onPressed: () => _selectFolder(),
                    child: const Text("Pick folder",style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
            Builder(
              builder: (BuildContext context) => _loadingPath
                  ? Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: const CircularProgressIndicator(),
              )
                  : _directoryPath != null
                  ? ListTile(
                title: const Text('Directory path'),
                subtitle: Text(_directoryPath),
              )
                  : _paths != null
                  ? Container(
                padding: const EdgeInsets.only(bottom: 30.0),
                height: MediaQuery.of(context).size.height * 0.50,
                child: Scrollbar(
                    child: ListView.separated(
                      itemCount: _paths != null && _paths.isNotEmpty
                          ? _paths.length
                          : 1,
                      itemBuilder: (BuildContext context, int index) {
                        final bool isMultiPath =
                            _paths != null && _paths.isNotEmpty;
                        final String name = 'File $index: ' +
                            (isMultiPath
                                ? _paths
                                .map((e) => e.name)
                                .toList()[index]
                                : _fileName ?? '...');
                        final path = _paths
                            .map((e) => e.path)
                            .toList()[index]
                            .toString();

                        return ListTile(
                          title: Text(
                            name,
                          ),
                          subtitle: Text(path),
                        );
                      },
                      separatorBuilder:
                          (BuildContext context, int index) =>
                      const Divider(),
                    )),
              )
                  : const SizedBox(),
            ),
          ],
        ),
      ) ,
    );

  }
}
