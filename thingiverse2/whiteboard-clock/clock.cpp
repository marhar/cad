double const tau = 2 * std::acos(-1);

// Gives the length of one side of a triangle given the other two and the angle between those.
double cosine_rule(double side_1, double side_2, double opposite_angle) {
	return std::sqrt(side_1*side_1 + side_2*side_2 - 2*side_1*side_2*std::cos(opposite_angle));
}

// Note: Gives only one intersection: The one left of A->B.
bool circles_intersection(
	const double a_x, const double a_y, const double a_r,
	const double b_x, const double b_y, const double b_r,
	double & i_x, double & i_y
) {
	const double d_x = b_x - a_x, d_y = b_y - a_y;
	const double d = std::sqrt(d_x*d_x + d_y*d_y);
	const double x = (d - b_r*b_r/d + a_r*a_r/d) / 2;
	const double s = a_r*a_r - x*x;
	if (s < 0) {
		i_x = i_y = std::numeric_limits<double>::signaling_NaN();
		return false;
	}
	const double y = std::sqrt(s);
	i_x = (x*d_x - y*d_y) / d + a_x;
	i_y = (x*d_y + y*d_x) / d + a_y;
	return true;
}

bool servo_coordinates(
	double const X_x, double const X_y,
	double & left_servo, double & right_servo
) {
	// A: Left servo axis
	// B: Right servo axis
	// C: Left joint
	// D: Right joint
	// E: Pen joint
	// X: Pen
	// O: Origin
	//  ________________
	// |     X          |
	// |      )E        |
	// |     /   \      |
	// |   /       \    |  ________________   _______
	// |  C         D   | |      1  1      | |       |
	// |   \       /    | |      |  |      | | y     |
	// |    \     /     | |      |  |      | | |     |
	// |     A O B      | | 0----A  B----0 | | O---x |
	// |________________| |________________| |_______|
	//  Point names        Servo values       Axis

	left_servo = right_servo = std::numeric_limits<double>::signaling_NaN();

	if (X_y < 50) return false;

	double const AB = 22;
	double const AC = 50, BD = 50;
	double const CE = 50, DE = 50;
	double const EX = 13;
	double const XEC = 3.0 / 8.0 * tau;

	double const A_x = -AB/2, A_y = 0;
	double const B_x = +AB/2, B_y = 0;

	double const CX = cosine_rule(CE, EX, XEC);
	double C_x, C_y;
	if (!circles_intersection(A_x, A_y, AC, X_x, X_y, CX, C_x, C_y)) return false;

	double E_x, E_y;
	circles_intersection(X_x, X_y, EX, C_x, C_y, CE, E_x, E_y);

	double D_x, D_y;
	if (!circles_intersection(E_x, E_y, DE, B_x, B_y, BD, D_x, D_y)) return false;

	 left_servo = std::atan2(C_y - A_y, A_x - C_x) / (tau / 4);
	right_servo = std::atan2(D_y - B_y, D_x - B_x) / (tau / 4);
	return true;
}
