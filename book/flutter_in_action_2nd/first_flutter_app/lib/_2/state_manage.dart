import 'package:flutter/material.dart';

class StateManageRoute extends StatelessWidget {
  const StateManageRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateManage'),
      ),
      body: Center(
        child: Column(
          children: const [TapboxA(), ParentWidgetB(), ParentWidgetC()],
        ),
      ),
    );
  }
}

// TapboxA 管理自身状态.

//------------------------- TapboxA ----------------------------------

class TapboxA extends StatefulWidget {
  const TapboxA({Key? key}) : super(key: key);

  @override
  State<TapboxA> createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}

// ParentWidgetB 为 TapboxB 管理状态.

//------------------------ ParentWidgetB --------------------------------

class ParentWidgetB extends StatefulWidget {
  const ParentWidgetB({Key? key}) : super(key: key);

  @override
  State<ParentWidgetB> createState() => _ParentWidgetBState();
}

class _ParentWidgetBState extends State<ParentWidgetB> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapboxB(
      active: _active,
      onChanged: _handleTapboxChanged,
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  const TapboxB({Key? key, this.active = false, required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}

//---------------------------- ParentWidgetC ----------------------------
class ParentWidgetC extends StatefulWidget {
  const ParentWidgetC({Key? key}) : super(key: key);

  @override
  State<ParentWidgetC> createState() => _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapboxC(active: _active, onChanged: handleTapboxChanged);
  }
}

//----------------------------- TapboxC ------------------------------

class TapboxC extends StatefulWidget {
  const TapboxC({Key? key, bool this.active = false, required this.onChanged})
      : super(key: key);

  final active;
  final ValueChanged<bool> onChanged;

  @override
  State<TapboxC> createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(widget.active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),),
        ),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: widget.active?Colors.lightGreen[700]:Colors.grey[600],
          border: _highlight?Border.all(color: Colors.teal,width: 10):null
        ),
      ),
    );
  }
}
