/// Maximum width of column
const double maxColWidth = 500;

/// Return appropriate columnWidth based on screen size,
/// with max of `maxWidth`'s value.
double getColumnWidthForThisScreen(double _screenWidth, double _maxColWidth) {
  double columnWidth = .8 * _screenWidth;
  if (_screenWidth >= 768) {
    columnWidth = .35 * _screenWidth;
  }
  return columnWidth > _maxColWidth ? _maxColWidth : columnWidth;
}
