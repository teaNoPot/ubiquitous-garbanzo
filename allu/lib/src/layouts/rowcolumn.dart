import 'package:flutter/material.dart';

class RowColExample extends StatefulWidget {
  const RowColExample({Key? key}) : super(key: key);
  @override
  _RowColExampleState createState() => _RowColExampleState();
}

class _RowColExampleState extends State<RowColExample> {
  static final kElements = <Widget>[Box("1"), Box("2"), Box("3")];

  bool _isRow = true;
  MainAxisSize _mainAxisSize = MainAxisSize.max;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    final _appbarButtons = _getBottomBar();
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _appbarButtons,
    );
  }

  Widget _buildBody() => Container(
        color: Colors.transparent,
        child: _isRow
            ? Row(
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: _crossAxisAlignment,
                mainAxisSize: _mainAxisSize,
                children: kElements,
              )
            : Column(
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: _crossAxisAlignment,
                mainAxisSize: _mainAxisSize,
                children: kElements,
              ),
      );

  Widget _getBottomBar() {
    return Material(
        color: Theme.of(context).primaryColorLight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio<bool>(
                        value: true,
                        groupValue: this._isRow,
                        onChanged: (bool? value) {
                          if (value != null)
                            setState(() => this._isRow = value);
                        }),
                    const Text('Row'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio<bool>(
                        value: false,
                        groupValue: this._isRow,
                        onChanged: (bool? value) {
                          if (value != null)
                            setState(() => this._isRow = value);
                        }),
                    const Text('Column'),
                  ],
                ),
              ],
            ),
            ListTile(
                title: const Text('mainAxisSize: '),
                trailing: DropdownButton<MainAxisSize>(
                  value: _mainAxisSize,
                  onChanged: (MainAxisSize? newVal) {
                    if (newVal != null) {
                      setState((() => _mainAxisSize = newVal));
                    }
                  },
                  items: MainAxisSize.values
                      .map(
                        (MainAxisSize val) => DropdownMenuItem(
                          value: val,
                          child: Text(
                              val.toString().substring('MainAxisSize.'.length)),
                        ),
                      )
                      .toList(),
                )),
            ListTile(
                title: const Text('mainAxisAlignment: '),
                trailing: DropdownButton<MainAxisAlignment>(
                    value: _mainAxisAlignment,
                    onChanged: (MainAxisAlignment? newVal) {
                      if (newVal != null) {
                        setState(() => _mainAxisAlignment = newVal);
                      }
                    },
                    items: MainAxisAlignment.values
                        .map((MainAxisAlignment val) => DropdownMenuItem(
                            value: val,
                            child: Text(val
                                .toString()
                                .substring('MainAxisAlignment.'.length))))
                        .toList())),
            ListTile(
              title: const Text('crossAxisAlignment: '),
              trailing: DropdownButton<CrossAxisAlignment>(
                  value: _crossAxisAlignment,
                  onChanged: (CrossAxisAlignment? newVal) {
                    if (newVal != null) {
                      setState(() => _crossAxisAlignment = newVal);
                    }
                  },
                  items: CrossAxisAlignment.values
                      .map(
                        (CrossAxisAlignment val) => DropdownMenuItem(
                          value: val,
                          child: Text(
                            val
                                .toString()
                                .substring('CrossAxisAlignment.'.length),
                          ),
                        ),
                      )
                      .toList()),
            ),
          ],
        ));
  }
}

class Box extends StatelessWidget {
  String index;
  double boxSize = 100;

  Box(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: boxSize,
        height: boxSize,
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.blue),
        child: Text(index,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)));
  }
}
