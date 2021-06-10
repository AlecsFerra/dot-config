setInterval(() => {
    var ss = Cc["@mozilla.org/content/style-sheet-service;1"].getService(Ci.nsIStyleSheetService);
    var io = Cc["@mozilla.org/network/io-service;1"].getService(Ci.nsIIOService);
    var ds = Cc["@mozilla.org/file/directory_service;1"].getService(Ci.nsIProperties);
      
    // Get the chrome directory in the current profile
    var chromepath = ds.get("UChrm", Ci.nsIFile);

    // Specific file: userChrome.css or userContent.css
    chromepath.append("userChrome.css");

    // Morph to a file URI
    var chromefile = io.newFileURI(chromepath);

    // Unregister the sheet
    if(ss.sheetRegistered(chromefile, ss.USER_SHEET)){
      ss.unregisterSheet(chromefile, ss.USER_SHEET);
    }

    // Reload the sheet
    ss.loadAndRegisterSheet(chromefile, ss.USER_SHEET);
	console.log("update")
}, 1000)
