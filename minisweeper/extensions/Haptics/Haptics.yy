{
    "id": "fbf87ebf-5be2-48c6-893c-dbdd9cb8e01a",
    "modelName": "GMExtension",
    "mvc": "1.2",
    "name": "Haptics",
    "IncludedResources": [
        "Objects\\obj_haptics_demo",
        "Rooms\\rm_haptics_demo"
    ],
    "androidPermissions": [
        "android.permission.VIBRATE"
    ],
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "Haptics",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 8,
    "date": "2017-54-12 10:05:27",
    "description": "",
    "exportToGame": true,
    "extensionName": "",
    "files": [
        {
            "id": "06e85c54-db7b-4a02-b111-4e68002c5c2a",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 2097160,
            "filename": "Haptics.ext",
            "final": "",
            "functions": [
                {
                    "id": "7010c0ca-21cc-437b-a22a-3eab6fc2c963",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "Vibrate",
                    "help": "Haptics_Vibrate(milliseconds)",
                    "hidden": false,
                    "kind": 11,
                    "name": "Haptics_Vibrate",
                    "returnType": 2
                },
                {
                    "id": "5557e99a-1f15-4170-b445-925dc9eccd55",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "Init",
                    "help": "Haptics_Init()",
                    "hidden": false,
                    "kind": 11,
                    "name": "Haptics_Init",
                    "returnType": 2
                },
                {
                    "id": "a20f1e3b-36dc-46a8-8691-64bb3d3b23aa",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "Pattern2",
                    "help": "Haptics_Pattern2(vibrate1_ms, pause1_ms, vibrate2_ms)",
                    "hidden": false,
                    "kind": 11,
                    "name": "Haptics_Pattern2",
                    "returnType": 2
                },
                {
                    "id": "1c527633-9c03-4a5e-b326-07c3cbe87801",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 5,
                    "args": [
                        2,
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "Pattern3",
                    "help": "Haptics_Pattern3(vibrate1_ms, pause1_ms, vibrate2_ms, pause2_ms, vibrate3_ms)",
                    "hidden": false,
                    "kind": 11,
                    "name": "Haptics_Pattern3",
                    "returnType": 2
                },
                {
                    "id": "9b389593-b791-424b-8fb6-23b65a635520",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 7,
                    "args": [
                        2,
                        2,
                        2,
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "Pattern4",
                    "help": "Haptics_Pattern4(vibrate1_ms, pause1_ms, vibrate2_ms, pause2_ms, vibrate3_ms, pause3_ms, vibrate4_ms)",
                    "hidden": false,
                    "kind": 11,
                    "name": "Haptics_Pattern4",
                    "returnType": 2
                },
                {
                    "id": "32009e54-c51c-4428-ba17-6ababb4c43d0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "HasVibrator",
                    "help": "Haptics_HasVibrator()",
                    "hidden": false,
                    "kind": 11,
                    "name": "Haptics_HasVibrator",
                    "returnType": 2
                },
                {
                    "id": "b0fac7de-806b-48b3-a471-849d234b7ada",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "VibrateIntensity",
                    "help": "Haptics_VibrateIntensity(milliseconds, intensity)",
                    "hidden": false,
                    "kind": 4,
                    "name": "Haptics_VibrateIntensity",
                    "returnType": 2
                },
                {
                    "id": "f5a22042-bb84-4c87-a223-00e54491ffbe",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        1
                    ],
                    "externalName": "PatternString",
                    "help": "Haptics_PatternString(pattern_string)",
                    "hidden": false,
                    "kind": 4,
                    "name": "Haptics_PatternString",
                    "returnType": 2
                }
            ],
            "init": "Haptics_Init",
            "kind": 4,
            "order": [
                "5557e99a-1f15-4170-b445-925dc9eccd55",
                "32009e54-c51c-4428-ba17-6ababb4c43d0",
                "7010c0ca-21cc-437b-a22a-3eab6fc2c963",
                "b0fac7de-806b-48b3-a471-849d234b7ada",
                "a20f1e3b-36dc-46a8-8691-64bb3d3b23aa",
                "1c527633-9c03-4a5e-b326-07c3cbe87801",
                "9b389593-b791-424b-8fb6-23b65a635520",
                "f5a22042-bb84-4c87-a223-00e54491ffbe"
            ],
            "origname": "extensions\\Haptics.ext",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": null,
    "iosplistinject": "",
    "license": "Free to use, also for commercial games.",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "options": null,
    "optionsFile": "options.json",
    "packageID": "com.gamephase.haptics",
    "productID": "",
    "sourcedir": "",
    "supportedTargets": 8,
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": null,
    "tvosdelegatename": null,
    "tvosmaccompilerflags": null,
    "tvosmaclinkerflags": null,
    "tvosplistinject": null,
    "version": "1.1.0"
}