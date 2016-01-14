package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.Image;
import kha.Scaler;
import kha.Assets;
import kha.Color;

class Unknown {

	var backbuffer: Image;

	public function new() {

		backbuffer = Image.createRenderTarget(600, 600);

		Assets.loadEverything(function () {
			System.notifyOnRender(render);
			Scheduler.addTimeTask(update, 0, 1 / 60);
		});
	}

	function update(): Void {

	}

	function render(frame: Framebuffer): Void {
		var g = backbuffer.g2;

		g.begin(0xff5dade2);
		//g.clear();
		g.color = Color.White;

		g.font = Assets.fonts.LiberationSans_Regular;
		g.fontSize = 60;
		g.drawString("Info button 60px [OK]", 80, 100);

		g.fontSize = 20;
		g.drawString("Info button 20px [OK]", 100, 200);

		g.fontSize = 18;
		g.drawString("Info button 18px [the f'f and t's get blurry, not sharp at all :()]", 100, 250);

		g.fontSize = 14;
		g.drawString("Info button 14px [Seems the text start to wanish?]", 100, 300);

		g.end();

		frame.g2.begin();
		Scaler.scale(backbuffer, frame, System.screenRotation);
		frame.g2.end();
	}
}
