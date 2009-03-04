package bartek{	import jiglib.geometry.JSphere;			import org.papervision3d.objects.primitives.Sphere;			import jiglib.geometry.JPlane;			import org.papervision3d.objects.primitives.Plane;			import jiglib.geometry.JBox;	import jiglib.math.JMatrix3D;	import jiglib.math.JNumber3D;	import jiglib.physics.PhysicsSystem;		import org.papervision3d.cameras.CameraType;	import org.papervision3d.materials.WireframeMaterial;	import org.papervision3d.materials.utils.MaterialsList;	import org.papervision3d.objects.primitives.Cube;	import org.papervision3d.view.BasicView;		import flash.display.StageAlign;	import flash.display.StageQuality;	import flash.display.StageScaleMode;	import flash.events.Event;	import flash.utils.getTimer;		/**	 * @author bartekd	 */	public class HelloPhysics extends BasicView {		private var cube:Cube;		private var jBox:JBox;				private var physicsSpeed:Number = 5;		private var deltaTime:Number = 0;        private var currentTime:uint;		private var newTime:uint;		private var plane:Plane;		private var jPlane:JPlane;		private var cube2:Cube;		private var jBox2:JBox;		private var sphere:Sphere;		private var jsphere:JSphere;		public function HelloPhysics() {			stage.quality = StageQuality.LOW;			stage.scaleMode = StageScaleMode.NO_SCALE;			stage.align = StageAlign.TOP_LEFT;			stage.showDefaultContextMenu = false;			stage.stageFocusRect = false;						currentTime = getTimer();						super(800, 600, true, false, CameraType.TARGET);						camera.x = -1000;						var mb:MaterialsList = new MaterialsList();			mb.addMaterial(new WireframeMaterial(),"all");			cube = new Cube(mb, 150, 150, 150, 1, 1, 1);			scene.addChild(cube);			jBox2 = new JBox(cube, true, 150, 150, 150);			jBox2.setMass(.1);			jBox2.addWorldForce(new JNumber3D(0,-10,0), new JNumber3D(0,0,0));			var cr:JMatrix3D = JMatrix3D.rotationX(Math.PI / 4);			jBox2.moveTo(new JNumber3D(0, 800, 0), cr); // start position			PhysicsSystem.getInstance().addBody(jBox2);					cube2 = new Cube(mb, 150, 150, 150, 1, 1, 1);			scene.addChild(cube2);			jBox = new JBox(cube2, true, 150, 150, 150);			cr = JMatrix3D.rotationZ(Math.PI / 4);			jBox.moveTo(new JNumber3D(0, 400, 0), cr); // start position			jBox.addWorldForce(new JNumber3D(0,10,0), new JNumber3D(0,0,0));			PhysicsSystem.getInstance().addBody(jBox);							sphere = new Sphere(new WireframeMaterial(), 75);			scene.addChild(sphere);			jsphere = new JSphere(sphere, true, 75);			jsphere.moveTo(new JNumber3D(0, 1000, 0), JMatrix3D.IDENTITY);			PhysicsSystem.getInstance().addBody(jsphere);						plane = new Plane(new WireframeMaterial(), 1800, 1800);			scene.addChild(plane);			jPlane = new JPlane(plane);			jPlane.setMovable(false);			var or:JMatrix3D = JMatrix3D.rotationX(Math.PI / 2);//			jPlane.SetOrientation(or);			jPlane.moveTo(new JNumber3D(0, -200, 0), or);			PhysicsSystem.getInstance().addBody(jPlane);									startRendering();		}				protected override function onRenderTick(event:Event = null):void {			newTime = getTimer();	        deltaTime = ((newTime - currentTime) / 1000) * physicsSpeed;	        currentTime = newTime;	        PhysicsSystem.getInstance().integrate(deltaTime);						super.onRenderTick(event);		}	}}