#include "color.hpp"


namespace lampproject {

//
// lighterColor
//

QColor
lighterColor( const QColor & c, int b )
{
	if( b <= 0 )
		return c;

	int h = 0;
	int s = 0;
	int v = 0;
	int a = 0;

	QColor hsv = c.toHsv();
	hsv.getHsv( &h, &s, &v, &a );

	v += b;

	if( v > 255 )
	{
		s -= v - 255;

		if( s < 0 ) s = 0;

		v = 255;
	}

	hsv.setHsv( h, s, v, a );

	return hsv.convertTo( c.spec() );
}


//
// darkerColor
//

QColor
darkerColor( const QColor & c, int b )
{
	if( b <= 0 )
		return c;

	int h = 0;
	int s = 0;
	int v = 0;
	int a = 0;

	QColor hsv = c.toHsv();
	hsv.getHsv( &h, &s, &v, &a );

	v -= b;

	hsv.setHsv( h, s, v, a );

	return hsv.convertTo( c.spec() );
}

} /* namespace QtMWidgets */
