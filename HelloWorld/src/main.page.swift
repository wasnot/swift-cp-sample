import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	@objc dynamic var labelText: String = "Hello World"
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		let button1 = self.page!.getWidgetByName("button1") as! SCDWidgetsButton
		button1.onClick.append(SCDWidgetsEventHandler{
			_ in 
			self.labelText = "Swift on Android rocks"
		})
	}
}
