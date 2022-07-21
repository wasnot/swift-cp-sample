import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

    // バインディングするための変数を定義
    @objc dynamic var labelText: String = "Hello World"
    
    // 画面初回構成時に呼ばれるメソッド
    override func load(_ path: String) {        
        super.load(path)
        let button1 = self.page!.getWidgetByName("button1") as! SCDWidgetsButton
        button1.onClick.append(SCDWidgetsEventHandler{
            _ in
            // ラベル自体ではなくバインディングした変数を変更する
            self.labelText = "Swift on Android rocks"
            
            
            // ラベルインスタンスを取得してテキストプロパティを変更
//            let label = self.page!.getWidgetByName("label1") as! SCDWidgetsLabel            
//            label.text = "Swift on Android rocks"
        })
    }
}
