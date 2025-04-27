-- DrawingObject type
type DrawingObject = {
    Remove: () -> (),
    Destroy: () -> (),
    Visible: boolean,
    Transparency: number,
    Color: Color3,
    Position: Vector2,
    Size: Vector2,
    Thickness: number?,
    Radius: number?,
    Filled: boolean?,
    Font: number?,
    Text: string?,
    Center: boolean?,
    Outline: boolean?,
    OutlineColor: Color3?,
    Image: string?,
    From: Vector2?,
    To: Vector2?,
    PointA: Vector2?,
    PointB: Vector2?,
    PointC: Vector2?,
    PointD: Vector2?,
}

-- WebSocketConnection type
type WebSocketConnection = {
    Send: (message: string) -> (),
    Close: () -> (),
    OnMessage: (message: string) -> (),
    OnClose: () -> (),
}

declare Drawing: {
    new: (className: "Circle" | "Square" | "Text" | "Image" | "Line" | "Quad" | "Triangle") -> DrawingObject,
    Fonts: {
        UI: number,
        System: number,
        Plex: number,
        Monospace: number,
    },
}

declare cache: {
    invalidate: (instance: Instance) -> (),
    iscached: (instance: Instance) -> boolean,
    replace: (oldInstance: Instance, newInstance: Instance) -> (),
}

declare crypt: {
    base64encode: (data: string) -> string,
    base64decode: (data: string) -> string,
    encrypt: (data: string, key: string, iv: string?, mode: string?) -> (string, string),
    decrypt: (data: string, key: string, iv: string, mode: string) -> string,
    generatebytes: (size: number) -> string,
    generatekey: () -> string,
    hash: (data: string, algorithm: string) -> string,
}

declare debug: {
    getconstant: (func: any, index: number) -> any,
    getconstants: (func: any) -> {any},
    getinfo: (func: any) -> any,
    getproto: (func: any, index: number, active: boolean?) -> any,
    getprotos: (func: any) -> {any},
    getstack: (level: number, index: number?) -> any,
    getupvalue: (func: any, index: number) -> any,
    getupvalues: (func: any) -> {any},
    setconstant: (func: any, index: number, value: any) -> (),
    setstack: (level: number, index: number, value: any) -> (),
    setupvalue: (func: any, index: number, value: any) -> (),
}

declare WebSocket: {
    connect: (url: string) -> WebSocketConnection,
}

declare WebSocketConnection: {
    Send: (message: string) -> (),
    Close: () -> (),
    OnMessage: (message: string) -> (),
    OnClose: () -> (),
}

declare function readfile(path: string): string
declare function listfiles(path: string): {string}
declare function writefile(path: string, data: string): ()
declare function makefolder(path: string): ()
declare function appendfile(path: string, data: string): ()
declare function isfile(path: string): boolean
declare function isfolder(path: string): boolean
declare function delfile(path: string): ()
declare function delfolder(path: string): ()
declare function loadfile(path: string, chunkname: string): ()
declare function dofile(path: string): ()

declare function isrbxactive(): boolean
declare function mouse1click(): ()
declare function mouse1press(): ()
declare function mouse1release(): ()
declare function mouse2click(): ()
declare function mouse2press(): ()
declare function mouse2release(): ()
declare function mousemoveabs(x: number, y: number): ()
declare function mousemoverel(x: number, y: number): ()
declare function mousescroll(pixels: number): ()

declare function getrawmetatable(object: any): any
declare function hookmetamethod(object: any, method: string, hook: (...any) -> any): (...any) -> any
declare function getnamecallmethod(): string
declare function isreadonly(object: any): boolean
declare function setrawmetatable(object: any, metatable: any): ()
declare function setreadonly(object: any, readonly: boolean): ()

declare function fireclickdetector(object: any, distance: number?, event: string?): ()
declare function getcallbackvalue(object: any, property: string): ((...any) -> any)?
declare function getconnections(signal: any): {any}
declare function getcustomasset(path: string, noCache: boolean): string
declare function gethiddenproperty(object: any, property: string): (any, boolean)
declare function gethui(): any
declare function getinstances(): {any}
declare function getnilinstances(): {any}
declare function isscriptable(object: any, property: string): boolean
declare function sethiddenproperty(object: any, property: string, value: any): boolean
declare function setrbxclipboard(data: string): boolean
declare function setscriptable(object: any, property: string, value: boolean): boolean

declare function checkcaller(): boolean
declare function clonefunction<T>(func: T): T
declare function getcallingscript(): any
declare function hookfunction<T>(func: T, hook: (...any) -> any): T
declare function iscclosure(func: (...any) -> any): boolean
declare function islclosure(func: (...any) -> any): boolean
declare function isexecutorclosure(func: (...any) -> any): boolean
declare function loadstring(source: string, chunkname: string?): (((...any) -> any)?, string?)
declare function newcclosure<T>(func: T): T

declare function rconsoleclear(): ()
declare function rconsolecreate(): ()
declare function rconsoledestroy(): ()
declare function rconsoleinput(): string
declare function rconsoleprint(text: string): ()
declare function rconsolesettitle(title: string): ()

declare function identifyexecutor(): (string, string)
declare function lz4compress(data: string): string
declare function lz4decompress(data: string, size: number): string
declare function messagebox(text: string, caption: string, flags: number): number
declare function queue_on_teleport(code: string): ()
declare function request(options: any): any
declare function setclipboard(text: string): ()
declare function setfpscap(fps: number): ()

declare function getgc(includeTables: boolean?): {any}
declare function getgenv(): {[string]: any}
declare function getloadedmodules(excludeCore: boolean?): {any}
declare function getrenv(): {[string]: any}
declare function getrunningscripts(): {any}
declare function getscriptbytecode(script: any): string
declare function getscriptclosure(script: any): (...any) -> any
declare function getscripthash(script: any): string
declare function getscripts(): {any}
declare function getsenv(script: any): {[string]: any}
declare function getthreadidentity(): number
declare function setthreadidentity(identity: number): ()
