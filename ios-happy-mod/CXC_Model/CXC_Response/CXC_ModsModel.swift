
import Foundation
import RealmSwift

struct ModsModelCodable: Codable {
    var types: [ModsType]
    
    enum CodingKeysMods: String, CodingKey {
        case typesMods = "mods"
    }
    
    enum CodingKeysApps: String, CodingKey {
        case typesApps = "HappyMod"
    }
    
    enum CodingKeysTopics: String, CodingKey {
        case typesTopics = "mods"
    }
    
    init(from decoder: Decoder) throws {
        let containerMods = try decoder.container(keyedBy: CodingKeysMods.self)
        let containerApps = try decoder.container(keyedBy: CodingKeysApps.self)
        let containerTopics = try decoder.container(keyedBy: CodingKeysTopics.self)
        
        var result: [ModsType] = []
        
        if let dict = try? containerMods.decode([String: [ModsModel_CXC]].self, forKey: .typesMods) {
            dict.forEach { (key, value) in
                result.append(ModsType(name: key, mods: value))
            }
        } else if let dict = try? containerApps.decode([String: [ModsModel_CXC]].self, forKey: .typesApps) {
            dict.forEach { (key, value) in
                result.append(ModsType(name: key, mods: value))
            }
        } else if let dict = try? containerTopics.decode([String: [ModsModel_CXC]].self, forKey: .typesTopics) {
            dict.forEach { (key, value) in
                result.append(ModsType(name: key, mods: value))
            }
        }
        self.types = result
    }
}

class ModsType: Object, Codable {
    
    @Persisted var contentType: Int
    
    @Persisted(primaryKey: true) var name: String = ""
    @Persisted var mods = List<ModsModel_CXC>()
    
    
    override init() {
        super.init()
    }
    
    convenience init(name: String = "", mods: [ModsModel_CXC] = []) {
        self.init()
        self.name = name
        self.mods.append(objectsIn: mods)
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        
    }
}

class ModsModel_CXC: Object, Codable {
    @Persisted var isFavorite: Bool
    @Persisted var contentType: Int
    
    @Persisted(primaryKey: true) var name: String = ""
    @Persisted var modDescription: String = ""
    @Persisted var image: String = ""
    @Persisted var filePath: String = ""
    @Persisted var new: Bool = false
    @Persisted var top: Bool = false
    @Persisted var lastAdded: Bool = false
    
    enum CodingKeysMods: String, CodingKey {
        case name = "h5k617"
        case description = "o11v"
        case image = "_to5"
        case filePath = "r0qmswrxs-l"
        case new = "new"
        case top = "top"
        case lastAdded = "lastAdded"
    }
    
    enum CodingKeysApp: String, CodingKey {
        case name = "d1u"
        case description = "i7u8uo3q"
        case image = "plex_e"
        case filePath = "dj6n-l"
        case new = "new"
        case top = "top"
        case lastAdded = "lastAdded"
    }
    
    enum CodingKeysTopics: String, CodingKey {
        case name = "h5k617"
        case description = "o11v"
        case image = "_to5"
        case new = "new"
        case top = "top"
        case lastAdded = "lastAdded"
    }
    
    override init() {
        super.init()
    }
    
    convenience init(isFavorite: Bool, contentType: Int, name: String, modDescription: String, image: String, filePath: String, new: Bool, top: Bool, lastAdded: Bool) {
        self.init()
        self.isFavorite = isFavorite
        self.contentType = contentType
        self.name = name
        self.modDescription = modDescription
        self.image = image
        self.filePath = filePath
        self.new = new
        self.top = top
        self.lastAdded = lastAdded
    }
    
    required convenience init(from decoder: Decoder) throws {
        
        self.init()
        
        let containerMods = try decoder.container(keyedBy: CodingKeysMods.self)
        let containerTopics = try decoder.container(keyedBy: CodingKeysTopics.self)
        let containerApps = try decoder.container(keyedBy: CodingKeysApp.self)
        
        if let name = try? containerMods.decode(String.self, forKey: .name) {
            self.name = name
        } else if let name = try? containerTopics.decode(String.self, forKey: .name) {
            self.name = name
        } else if let name = try? containerApps.decode(String.self, forKey: .name) {
            self.name = name
        }
        
        if let description = try? containerMods.decode(String.self, forKey: .description) {
            self.modDescription = description
        } else if let description = try? containerTopics.decode(String.self, forKey: .description) {
            self.modDescription = description
        } else if let description = try? containerApps.decode(String.self, forKey: .description) {
            self.modDescription = description
        }
        
        if let image = try? containerMods.decode(String.self, forKey: .image) {
            self.image = image
        } else if let image = try? containerTopics.decode(String.self, forKey: .image) {
            self.image = image
        } else if let image = try? containerApps.decode(String.self, forKey: .image) {
            self.image = image
        }
        
        if let filePath = try? containerMods.decode(String.self, forKey: .filePath) {
            self.filePath = filePath
        } else if let filePath = try? containerApps.decode(String.self, forKey: .filePath) {
            self.filePath = filePath
        }
        
        if let new = try? containerMods.decode(Bool.self, forKey: .new) {
            self.new = new
        } else if let new = try? containerTopics.decode(Bool.self, forKey: .new) {
            self.new = new
        } else if let new = try? containerApps.decode(Bool.self, forKey: .new) {
            self.new = new
            
            if let top = try? containerMods.decode(Bool.self, forKey: .top) {
                self.top = top
            } else if let top = try? containerTopics.decode(Bool.self, forKey: .top) {
                self.top = top
            } else if let top = try? containerApps.decode(Bool.self, forKey: .top) {
                self.top = top
            }
            
            if let lastAdded = try? containerMods.decode(Bool.self, forKey: .lastAdded) {
                self.lastAdded = lastAdded
            } else if let lastAdded = try? containerTopics.decode(Bool.self, forKey: .lastAdded) {
                self.lastAdded = lastAdded
            } else if let lastAdded = try? containerApps.decode(Bool.self, forKey: .lastAdded) {
                self.lastAdded = lastAdded
            }
        }
    }
}
