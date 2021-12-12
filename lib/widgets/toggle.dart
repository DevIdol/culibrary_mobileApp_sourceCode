import 'package:flutter/material.dart';

add(_iconColor, _isVisible, press) {
  return SizedBox(
    height: 40,
    child: Visibility(
      visible: _isVisible,
      child: FloatingActionButton(
        backgroundColor: _iconColor,
        tooltip: 'Add',
        heroTag: 'Add',
        onPressed: press,
        child: const Icon(Icons.add),
      ),
    ),
  );
}

delete(_iconColor, _isVisible, press) {
  return SizedBox(
    height: 40,
    child: Visibility(
      visible: _isVisible,
      child: FloatingActionButton(
        backgroundColor: _iconColor,
        onPressed: press,
        tooltip: 'Delete All',
        heroTag: 'Delete All',
        child: const Icon(Icons.delete),
      ),
    ),
  );
}

toggle(_iconColor, _isVisible, animate, _animation) {
  return SizedBox(
    height: 40,
    child: Visibility(
      visible: _isVisible,
      child: FloatingActionButton(
          backgroundColor: _iconColor,
          onPressed: animate,
          tooltip: 'Toggle',
          heroTag: 'Toggle',
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animation,
          )),
    ),
  );
}
