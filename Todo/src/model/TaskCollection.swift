import ScadeKit

class TaskCollection : EObject {
    var tasks : [Task] = []
    
    override init() {}

    init(tasks:[Task]) {
        self.tasks = tasks
    }
}

// SCDRuntime.saveDocumentを利用した永続化例. ただし、こちらはうまく永続化されず、アプリ起動中にしか保持されなかった.
extension TaskCollection {
    private static func loadCollection1() -> TaskCollection {
        let _collection = SCDRuntime.loadDocument("taskcollection") as? TaskCollection
        let collection: TaskCollection
        if _collection == nil {
            print("cannot loaded.")
            collection = TaskCollection()
        } else {
            collection = _collection!
            print("loaded \(collection.tasks.count)")
        }
        return collection
    }
    
    static func saveTasks1(_ tasks: [Task]) {
        let collection = loadCollection1()
        collection.tasks = tasks
        SCDRuntime.saveDocument("taskcollection", document: collection)
    }
    
    static func loadTasks1() -> [Task] {
        return loadCollection1().tasks
    }
    
    static func append1(_ task: Task) {
        let collection = loadCollection1()
        collection.tasks.append(task)
        SCDRuntime.saveDocument("taskcollection", document: collection)
    }
}

// SCDRuntime.saveFile/loadContentを使用した永続化. iOSシミュレータだと永続化でいない不具合が存在.
extension TaskCollection {
    private static let filename = "tasktext"
    
    private static func loadCollection() -> TaskCollection {
        let text = SCDRuntime.loadContent(filename)
        let collection = TaskCollection()
        let tasktext = text?.components(separatedBy: "\n") ?? []
        collection.tasks = tasktext.map {Task.deserialize($0)} .compactMap{$0}
        return collection
    }
    
    private static func saveCollection(_ collection: TaskCollection) {
        let tasktext = collection.tasks.map { $0.serialize() }.joined(separator: "\n")
        SCDRuntime.saveFile(filename, content: tasktext)
    }
    
    static func saveTasks(_ tasks: [Task]) {
        let collection = loadCollection()
        collection.tasks = tasks
        saveCollection(collection)
    }
    
    static func loadTasks() -> [Task] {
        return loadCollection().tasks
    }
    
    static func append(_ task: Task) {
        let collection = loadCollection()
        collection.tasks.append(task)
        saveCollection(collection)
    }
}
