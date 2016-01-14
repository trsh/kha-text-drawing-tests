package;

import kha.System;

class Main {
	public static function main() {
		System.init("Unknown", 600, 600, function () {
			new Unknown();
		});
	}
}
