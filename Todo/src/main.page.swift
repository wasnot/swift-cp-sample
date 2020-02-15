import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {
	
	@objc dynamic var tasks : [Task] = []
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
//		self.setupDogs()
		self.tasks = TaskCollection.loadTasks()
		
		let buttonAdd = self.page!.getWidgetByName("buttonAdd") as! SCDWidgetsButton
		buttonAdd.onClick.append(SCDWidgetsEventHandler{
			_ in
			self.navigation!.go("add.page")
			})
		
		self.page?.onEnter.append(SCDWidgetsEnterEventHandler{
			_ in
			self.tasks = TaskCollection.loadTasks()
			})
		
		let buttonComplete = self.page!.getWidgetByName("buttonComplete") as! SCDWidgetsButton
		buttonComplete.onClick.append(SCDWidgetsEventHandler{
			ev in
			let button = ev?.target as? SCDWidgetsButton
			self.tasks = self.tasks.filter{ $0.tag != button?.tag }
			TaskCollection.saveTasks(self.tasks)
			})
	}
	
	func setupDogs() {
		tasks.append(Task("Milk"))
		tasks.append(Task("Meat"))
		tasks.append(Task("Egg"))
	}
}
