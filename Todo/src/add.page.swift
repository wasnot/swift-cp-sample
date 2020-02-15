import ScadeKit

class AddPageAdapter: SCDLatticePageAdapter {

    override func load(_ path: String) {        
        super.load(path)
        
        let textbox1 = self.page!.getWidgetByName("textbox1") as! SCDWidgetsTextbox
        
        // saveボタンの処理
        let buttonSave = self.page!.getWidgetByName("buttonSave") as! SCDWidgetsButton
        buttonSave.onClick.append(SCDWidgetsEventHandler{
            _ in
            // TextBoxのtextを取得し、それを元にTaskを作成して追加。
            // Android 日本語IMEだとテキストボックスの中身が全て取得できない不具合がある.
            TaskCollection.append(Task(textbox1.text))
            // メインページへ戻る
            self.navigation!.go("main.page")
        })
        
        // cancelボタンの処理
        let buttonCancel = self.page!.getWidgetByName("buttonCancel") as! SCDWidgetsButton
        buttonCancel.onClick.append(SCDWidgetsEventHandler{
            _ in
            // メインページへ戻る
            self.navigation!.go("main.page")
        })
        
        // この画面に入るたびにtextboxのtextを初期化
        self.page?.onEnter.append(SCDWidgetsEnterEventHandler{_ in textbox1.text = ""})
    }
}
