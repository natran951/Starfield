OddballParticle yee = new OddballParticle(250,250,(Math.random()*360),(Math.random()*2+6),color(255,0,0));
JumboParticle yeee = new JumboParticle(250,250,0,(Math.random()*2+6),color(0,0,255));
Particle[] yeet = new Particle[250];

void setup() {
	size(500,500);
	frameRate(30);

	for (int i = 0; i < yeet.length; i++) {
		yeet[i] = new NormalParticle(750,750,(Math.random()*360),(Math.random()*2+6),color(255));
	}
}

void draw() {
	background(0);
	fill(0);
	ellipse(250,250,5,5);
	yee.move();
	yee.show();
	yeee.move();
	yeee.show();
	for (int i = 0; i < yeet.length; i++) {
		yeet[i].show();
		yeet[i].move();
	}
	
}

class NormalParticle implements Particle{
	double myX, myY, myAngle, mySpeed;
	float mySize;
	int myColor;
	NormalParticle(double x, double y, double angle, double spd, int colr) {
		myX = x;
		myY = y;
		myAngle = angle*PI/180*(-1); //radianz
		mySpeed = spd;
		myColor = colr;
		mySize = 2;
	}

	public void move() {
		myX += mySpeed * cos((float)(myAngle));
		myY += mySpeed * sin((float)(myAngle));
		mySize += 0.05;
		//mySpeed += 0.01;
		if (myX < 0 || myX > 500) {
			myX = (int)(Math.random()*10+245);
			myY = (int)(Math.random()*10+245);
			myAngle = (Math.random()*360);
			mySpeed = (Math.random()*3+9);
			mySize = 2;
		}
		else if (myY < 0 || myY > 500) {
			myX = 250;
			myY = 250;
			myAngle = (int)(Math.random()*360);
			mySpeed = (Math.random()*3+9);
			mySize = 2;
		}
	}

	public void show() {
		fill(myColor);
		ellipse((float)(myX),(float)(myY),mySize,mySize);
	}
}

interface Particle{
	public void move();
	public void show();
}

class OddballParticle implements Particle { //uses an interface
	double myX, myY, myAngle, mySpeed;
	int myColor;
	OddballParticle(double x, double y, double angle, double spd, int colr) {
		myX = x;
		myY = y;
		myAngle = angle*PI/180*(-1); //radianz
		mySpeed = spd;
		myColor = colr;
	}

	public void move() {
		mySpeed = (Math.random()*9+1);
		myX += mySpeed * cos((float)(myAngle));
		myY += mySpeed * sin((float)(myAngle));
		if (myX < 0 || myX > 500) {
			myX = 250;
			myY = 250;
			myAngle = (Math.random()*360);
			mySpeed = (Math.random()*5+5);
		}
		else if (myY < 0 || myY > 500) {
			myX = 250;
			myY = 250;
			myAngle = (Math.random()*360);
			mySpeed = (Math.random()*5+0.25);
		}
	}
	public void show() {
		fill(myColor);
		ellipse((float)(myX),(float)(myY),12.5,12.5);
	}
}

class JumboParticle extends NormalParticle { //uses inheritance
	JumboParticle(double x, double y, double angle, double spd, int colr) {
		super(x,y,angle,spd,colr);
		/*
		myX = x; //250
		myY = y; //250
		myAngle = angle*PI/180*(-1); //radianz
		mySpeed = spd;
		myColor = colr;
		mySize = 2;
		*/
		myX = 250+200*sin((float)(myAngle));
		myY = 250+200*cos((float)(myAngle));
	}

	public void show() {
		fill(myColor);
		ellipse((float)(myX),(float)(myY),25,25);
	}
	public void move() {
		myX = 250+200*sin((float)(myAngle));
		myY = 250+200*cos((float)(myAngle));
		myAngle += PI/60;
	}
}
