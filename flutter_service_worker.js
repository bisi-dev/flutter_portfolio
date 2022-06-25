'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js_13.part.js": "402e34fca1fee86078c27d064fb7d93b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"main.dart.js_6.part.js": "b0fa3b2c936fa602bd21f827a4737e31",
"main.dart.js_9.part.js": "937e1b95554609c496ba26ebeda97a25",
"index.html": "152e2a4cf69611d81e010ef24c560a0a",
"/": "152e2a4cf69611d81e010ef24c560a0a",
"main.dart.js_7.part.js": "e032a29e22f112e1c66b8f48bdfb5fe2",
"main.dart.js_11.part.js": "33bb1d05b34fa391e1aa40c9b112a56b",
"flutter.js": "3688efe0a39e59781b4f95efbd6b5b62",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"manifest.json": "13ddf24d3b456361c493c6d9b94d1a7c",
"version.json": "c420e205d8eac4ccea99913b4a50bfa7",
"js/script.js": "78a542622828230f1017babd0a11d018",
"js/flutter.js": "eb3eb08f4b624459e465a7bce40e7511",
"js/paystack.js": "24dd8e673d42f49e9d561817dc8bd710",
"loader.css": "e01608558202734381707a4459e89808",
"main.dart.js_2.part.js": "04069cb69e1d1a5a95cd54c93df3fc44",
"main.dart.js_10.part.js": "82c7d1ffbe6f32e23ae0929ee4bffb2a",
"assets/FontManifest.json": "ba456e3538bf38a0b00784e2d261ddac",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/AssetManifest.json": "1b6f00ea494a96f03b2b0f3579b8b149",
"assets/assets/logo-google-play.png": "e4708167701b9e47951d4570fad07e2c",
"assets/assets/logo-gskinner.png": "c12c20a67884500a58ab47af20365c27",
"assets/assets/logo-white.png": "c47e66025d6f892be6ab4661eeb9aa0d",
"assets/assets/logo.png": "5057133047b9b665e5eeaeac1fbdbef2",
"assets/assets/blank.png": "690376686e6a94748e4d88d37ce11961",
"assets/packages/getwidget/icons/google.png": "596c5544c21e9d6cb02b0768f60f589a",
"assets/packages/getwidget/icons/twitter.png": "caee56343a870ebd76a090642d838139",
"assets/packages/getwidget/icons/youtube.png": "1bfda73ab724ad40eb8601f1e7dbc1b9",
"assets/packages/getwidget/icons/linkedin.png": "822742104a63a720313f6a14d3134f61",
"assets/packages/getwidget/icons/line.png": "da8d1b531d8189396d68dfcd8cb37a79",
"assets/packages/getwidget/icons/facebook.png": "293dc099a89c74ae34a028b1ecd2c1f0",
"assets/packages/getwidget/icons/pinterest.png": "d52ccb1e2a8277e4c37b27b234c9f931",
"assets/packages/getwidget/icons/whatsapp.png": "30632e569686a4b84cc68169fb9ce2e1",
"assets/packages/getwidget/icons/slack.png": "19155b848beeb39c1ffcf743608e2fde",
"assets/packages/getwidget/icons/dribble.png": "1e36936e4411f32b0e28fd8335495647",
"assets/packages/getwidget/icons/wechat.png": "ba10e8b2421bde565e50dfabc202feb7",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"assets/packages/flutter_paystack/assets/images/paystack.png": "0b8db920412edd7d8b40e7e7e01ac439",
"assets/packages/flutter_paystack/assets/images/jcb.png": "82658437070a16f35238c2f989a00c2a",
"assets/packages/flutter_paystack/assets/images/visa.png": "a8b02279da904c1f40e041b20cbaf49c",
"assets/packages/flutter_paystack/assets/images/mastercard.png": "6aecef820a950ef57140f79e07da916a",
"assets/packages/flutter_paystack/assets/images/verve.png": "d9e7f9a5b6987ec61b7c2d0bd7db1271",
"assets/packages/flutter_paystack/assets/images/american_express.png": "fac1ed63030230003fa52ee8f98aa8dc",
"assets/packages/flutter_paystack/assets/images/dinners_club.png": "24450426cbb1e5b657356b6cca621956",
"assets/packages/flutter_paystack/assets/images/discover.png": "c3a58509fe14ba54b0ca0ff29ee5619d",
"assets/packages/flutter_paystack/assets/images/otp.png": "99aa2d23b63c65db7565622ce17ef3e9",
"assets/packages/flutter_paystack/assets/images/dob.png": "33734b76a856e9b07934793d83a14cae",
"assets/packages/flutter_paystack/assets/images/successful.png": "bd7cfa16ecd2b480ca4875fbf8d6f9e2",
"assets/packages/flutter_paystack/assets/images/paystack_icon.png": "5b143d4fa4eb48496adc052b89849025",
"assets/packages/flutter_paystack_app/assets/item.png": "f03c7c3c587a97e58807bdd1bc91bd73",
"assets/packages/flutter_showcase/assets/github.png": "3e54ed15b9cd877c5223f5ecf64579df",
"assets/packages/flutter_showcase/assets/flutter_white.png": "91cbceb6f4b8345f509ba4cde4bdcee5",
"assets/packages/flutter_showcase/assets/flutter_black.png": "3e4d716d500f9d0b927f55c48379289a",
"assets/packages/flutter_showcase/assets/flutter_original.png": "cf171b29e3b2c0cb9a12223f952da7c6",
"assets/packages/flutter_showcase/assets/dart.png": "f3ae419dc11ddc054a8725e2cbab4939",
"assets/packages/flutter_showcase/assets/flutter.png": "d21f1eecaeaab081ba7efec1721c0712",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/packages/mymedicinemobile/assets/images/front_logo.png": "f0418cbf5fbcfc409a880e8874aa5d8c",
"assets/packages/mymedicinemobile/assets/images/faded_logo.png": "45a90529e642cbdcd3308b72cfe69879",
"assets/packages/mymedicinemobile/assets/images/front1.png": "427d611b2ea59b95b590129eae0eee28",
"assets/packages/mymedicinemobile/assets/images/front3.png": "dd1ea524be604db6e29c917e49c2eba2",
"assets/packages/mymedicinemobile/assets/images/front2.png": "3a7c6da1df9a795dc1a905b9fc1c448a",
"assets/packages/mymedicinemobile/assets/images/newlogo.png": "f4d4df53923a41ca35e69d863b1985ec",
"assets/packages/mymedicinemobile/assets/images/front4.png": "62852356400efa34c06b053bd24f9b41",
"assets/packages/mymedicinemobile/assets/fonts/PoppinsThin-rO2B.otf": "74caa079d574bb7188d428ad42d6436c",
"assets/packages/mymedicinemobile/assets/fonts/PoppinsRegular-B2Bw.otf": "4d08a266e9df28d02f852f51e735d44b",
"assets/packages/mymedicinemobile/assets/fonts/PoppinsSemibold-8l8n.otf": "5542c28b6a1f42191f7a0070d02695eb",
"assets/packages/mymedicinemobile/assets/fonts/PoppinsMedium-1JPv.otf": "cb612f082fd8bf1aea7c6c7df5041d2b",
"assets/packages/mymedicinemobile/assets/fonts/PoppinsBold-GdJA.otf": "8f633e7631fa5e34cb91f72a4ea00707",
"assets/packages/mymedicinemobile/assets/svg/mymedicines.svg": "c90385e2d928db659d8f36b56edc53a8",
"assets/packages/mymedicinemobile/assets/svg/back_arrow.svg": "c90780aadf4926e01a5067b857f2f1c7",
"assets/packages/defiscan/assets/images/settings.png": "ed85154418b25ac7506e08025482230e",
"assets/packages/defiscan/assets/images/ethereum-min.gif": "9a4a5e66ecc7696b5587cd257a113f90",
"assets/packages/defiscan/assets/images/bitcoin-min.gif": "496b5e4ea7934a3282f473c2d2ad5181",
"assets/packages/defiscan/assets/images/logo.png": "60cec2af1dcc9672cafb5f088f7ff427",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "4b6a9b7c20913279a3ad3dd9c96e155b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dffd9504fcb1894620fa41c700172994",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "00bb2b684be61e89d1bc7d75dee30b58",
"assets/NOTICES": "2c666f6375cc3a32a3f86d124327aa3d",
"main.dart.js_5.part.js": "d55ba73299635345511d86c5bd1604b1",
"main.dart.js": "e97f6908dfa53991babce42ec025468f",
"main.dart.js_1.part.js": "87f8311d8868e2aea8864977cddf0e06",
"main.dart.js_8.part.js": "7644462ac4580faf74bb3d1aa7d36042",
"main.dart.js_3.part.js": "dc9933d398f56872c1371d345f45ac7a",
"main.dart.js_12.part.js": "ea28db234cadfffcaec4e401ad812cb9",
"main.dart.js_4.part.js": "4085968249a85be21a53441cd4465860"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
