import ScadeKit

class Todo: SCDApplication {

    let window = SCDLatticeWindow()
    let mainAdapter = MainPageAdapter()
    // メイン以外の画面を用意
    var addAdapter : AddPageAdapter?
    
    override func onFinishLaunching() {    
        mainAdapter.load("main.page")
        mainAdapter.show(window)
        
        // 起動後にlazyに初期化し登録する。
        addAdapter = AddPageAdapter()
        addAdapter?.load("add.page")
    }
}
