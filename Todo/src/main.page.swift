import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {
    
    // listにBindingするための変数
    @objc dynamic var tasks : [Task] = []
    
    // page adapter initialization
    override func load(_ path: String) {        
        super.load(path)
        
        // 追加ボタンの処理
        let buttonAdd = self.page!.getWidgetByName("buttonAdd") as! SCDWidgetsButton
        buttonAdd.onClick.append(SCDWidgetsEventHandler{
            _ in
            // 追加ページへの遷移
            self.navigation!.go("add.page")
            })
        
        // 完了ボタンの処理
        let buttonComplete = self.page!.getWidgetByName("buttonComplete") as! SCDWidgetsButton
        buttonComplete.onClick.append(SCDWidgetsEventHandler{
            ev in
            let button = ev?.target as? SCDWidgetsButton
            // tagを利用して削除する
            self.tasks = self.tasks.filter{ $0.tag != button?.tag }
            TaskCollection.saveTasks(self.tasks)
            })
        
        // 画面遷移で入ってきた時に呼ばれるイベントへの登録
        self.page?.onEnter.append(SCDWidgetsEnterEventHandler{
            _ in
            // 画面遷移から戻った時にもデータから読み出す
            self.tasks = TaskCollection.loadTasks()
            })

        // 初回load時にデータから読み出す
        self.tasks = TaskCollection.loadTasks()
    }
}
