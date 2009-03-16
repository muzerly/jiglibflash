package bartek {
	import jiglib.geometry.JSphere;
	import jiglib.physics.RigidBody;
	import jiglib.plugin.papervision3d.Papervision3DPhysics;
	import jiglib.plugin.papervision3d.Pv3dMesh;
	
	import org.papervision3d.cameras.CameraType;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.objects.primitives.Sphere;
	import org.papervision3d.view.BasicView;
	
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;	

	/**
				
				// This is how to access the engine specific mesh/do3d
			
			// Here's how to create a sphere without the shortcut method:
			var manualSphere:Sphere = new Sphere(new WireframeMaterial(0xff0000), 30, 6, 6);
			scene.addChild(manualSphere);
			var jmanualSphere:RigidBody = new JSphere(new Pv3dMesh(manualSphere), 30);
			jmanualSphere.y = 700 + Math.random() * 3000;
			physics.addBody(jmanualSphere);
			// = more code, but this is necessary for custom objects (ex. Collada)