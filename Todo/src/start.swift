import ScadeKit

class Todo: SCDApplication {

	let window = SCDLatticeWindow()
	let mainAdapter = MainPageAdapter()
	var addAdapter : AddPageAdapter?
	
	override func onFinishLaunching() {	
		mainAdapter.load("main.page")
		mainAdapter.show(window)
		
        addAdapter = AddPageAdapter()
		addAdapter?.load("add.page")
	}
}
