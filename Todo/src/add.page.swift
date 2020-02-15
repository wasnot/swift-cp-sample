import ScadeKit

class AddPageAdapter: SCDLatticePageAdapter {

	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		let textbox1 = self.page!.getWidgetByName("textbox1") as! SCDWidgetsTextbox
		let buttonSave = self.page!.getWidgetByName("buttonSave") as! SCDWidgetsButton
		buttonSave.onClick.append(SCDWidgetsEventHandler{
			_ in
			TaskCollection.append(Task(textbox1.text))
			self.navigation!.go("main.page")
		})
		let buttonCancel = self.page!.getWidgetByName("buttonCancel") as! SCDWidgetsButton
		buttonCancel.onClick.append(SCDWidgetsEventHandler{
			_ in
			self.navigation!.go("main.page")
		})
		self.page?.onEnter.append(SCDWidgetsEnterEventHandler{_ in textbox1.text = ""})
	}
}
