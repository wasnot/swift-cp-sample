import ScadeKit

class Task: EObject {
	@objc dynamic var name: String
	@objc dynamic var date: String
	@objc dynamic var tag: Int
	
	override init() {
		self.name = ""
		self.date = ""
		self.tag = -1
	}
	
	init(_ name:String) {
		self.name = name
		let d = Date()
		self.date = d.toString()
		self.tag = Int(d.timeIntervalSince1970)
	}
	
	func serialize() -> String {
		let b64name = self.name.data(using: .utf8)?.base64EncodedString() ?? ""
		return "\(b64name)|\(date)|\(tag)"
	}
	
	static func deserialize(_ string: String) -> Task? {
		let split = string.components(separatedBy: "|")
		if split.count != 3{
			return nil
		}
		let task = Task()
 		task.name = String(data: Data(base64Encoded: split[0])!, encoding: .utf8) ?? ""
 		task.date = split[1]
		task.tag = Int(split[2])!
		return task
	}
}

extension Date {
	func toString() -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "MM/dd HH:mm"
        return formatter.string(from: self)
	}
}
