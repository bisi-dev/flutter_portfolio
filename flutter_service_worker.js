'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "9252aa45072ba9b4c5a56ad75a358be0",
"/": "9252aa45072ba9b4c5a56ad75a358be0",
"main.dart.js_2.part.js": "fba091cc3bc99a0f0cd64b01daad2564",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"main.dart.js_4.part.js": "bee8c69d939a707b66ee9d04d6d9eb77",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "f53c0906f454af29b25e30ec61d73313",
"version.json": "c420e205d8eac4ccea99913b4a50bfa7",
"main.dart.js_3.part.js": "277f97432f812f1db6d56fcad71d49a5",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"manifest.json": "13ddf24d3b456361c493c6d9b94d1a7c",
"main.dart.js_7.part.js": "9356f7607b33a2510f424b55a852848b",
"main.dart.js_6.part.js": "1fc6ef2f07a43bc9b36c58f31562c29a",
"loader.css": "e01608558202734381707a4459e89808",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/fonts/MaterialIcons-Regular.otf": "a7f13e31f787c477311ebd6ad602ff21",
"assets/AssetManifest.bin": "9fc1d77b03d982bbeca2d21beeadc6fc",
"assets/AssetManifest.json": "9db1852769af81f670d9ceb272b410a1",
"assets/NOTICES": "4edaf88fea305149f6c1b430bacc2ddd",
"assets/FontManifest.json": "d8d967988b5bfd38356e6beeac90c471",
"assets/packages/defiscan/assets/json/blockchain.json": "d360ce6074851752aa71b01d53c4a7ef",
"assets/packages/defiscan/assets/json/error.json": "f5750e193ba0ce2cdbd7f8d28c02be94",
"assets/packages/defiscan/assets/images/logo.png": "60cec2af1dcc9672cafb5f088f7ff427",
"assets/packages/defiscan/assets/images/ethereum-min.gif": "9a4a5e66ecc7696b5587cd257a113f90",
"assets/packages/defiscan/assets/images/settings.png": "ed85154418b25ac7506e08025482230e",
"assets/packages/defiscan/assets/images/logo_light.png": "cb7f0193b150fa48e8c9c8939cceb97f",
"assets/packages/defiscan/assets/images/logo_dark.png": "60cec2af1dcc9672cafb5f088f7ff427",
"assets/packages/defiscan/assets/images/bitcoin-min.gif": "496b5e4ea7934a3282f473c2d2ad5181",
"assets/packages/defiscan/lib/i18n/fr.json": "7ba18aee591c4542d111f6fd097c60a1",
"assets/packages/defiscan/lib/i18n/en.json": "7bd6585ae52eaa0a3189977dc769e200",
"assets/packages/flutter_showcase/assets/flutter_original.png": "cf171b29e3b2c0cb9a12223f952da7c6",
"assets/packages/flutter_showcase/assets/flutter.png": "d21f1eecaeaab081ba7efec1721c0712",
"assets/packages/flutter_showcase/assets/flutter_white.png": "91cbceb6f4b8345f509ba4cde4bdcee5",
"assets/packages/flutter_showcase/assets/flutter_black.png": "3e4d716d500f9d0b927f55c48379289a",
"assets/packages/flutter_showcase/assets/github.png": "3e54ed15b9cd877c5223f5ecf64579df",
"assets/packages/flutter_showcase/assets/dart.png": "f3ae419dc11ddc054a8725e2cbab4939",
"assets/packages/mymedicinemobile/assets/fonts/PoppinsThin-rO2B.otf": "74caa079d574bb7188d428ad42d6436c",
"assets/packages/mymedicinemobile/assets/fonts/PoppinsRegular-B2Bw.otf": "4d08a266e9df28d02f852f51e735d44b",
"assets/packages/mymedicinemobile/assets/fonts/PoppinsBold-GdJA.otf": "8f633e7631fa5e34cb91f72a4ea00707",
"assets/packages/mymedicinemobile/assets/fonts/PoppinsSemibold-8l8n.otf": "5542c28b6a1f42191f7a0070d02695eb",
"assets/packages/mymedicinemobile/assets/fonts/PoppinsMedium-1JPv.otf": "cb612f082fd8bf1aea7c6c7df5041d2b",
"assets/packages/mymedicinemobile/assets/images/front1.png": "427d611b2ea59b95b590129eae0eee28",
"assets/packages/mymedicinemobile/assets/images/front2.png": "3a7c6da1df9a795dc1a905b9fc1c448a",
"assets/packages/mymedicinemobile/assets/images/faded_logo.png": "45a90529e642cbdcd3308b72cfe69879",
"assets/packages/mymedicinemobile/assets/images/front3.png": "dd1ea524be604db6e29c917e49c2eba2",
"assets/packages/mymedicinemobile/assets/images/front4.png": "62852356400efa34c06b053bd24f9b41",
"assets/packages/mymedicinemobile/assets/images/newlogo.png": "f4d4df53923a41ca35e69d863b1985ec",
"assets/packages/mymedicinemobile/assets/images/front_logo.png": "f0418cbf5fbcfc409a880e8874aa5d8c",
"assets/packages/mymedicinemobile/assets/svg/back_arrow.svg": "c90780aadf4926e01a5067b857f2f1c7",
"assets/packages/mymedicinemobile/assets/svg/mymedicines.svg": "c90385e2d928db659d8f36b56edc53a8",
"assets/packages/localization/test/assets/lang2/en_US.json": "b389499c34b7ee2ec98c62fe49e08fa0",
"assets/packages/localization/test/assets/lang2/pt_BR.json": "08e9b784a138126822761beec7614524",
"assets/packages/localization/test/assets/lang/en_US.json": "18804652fbce3b62aacb6cce6f572f3c",
"assets/packages/localization/test/assets/lang/pt_BR.json": "f999b93065fe17d355d1ac5dcc1ff830",
"assets/packages/parceldrop/assets/png/logo.png": "dacf8c0b6088005a76fbf242e4e81775",
"assets/packages/parceldrop/assets/svg/onboarding-3.svg": "d7fdd72f976a137b874729c6d9656c99",
"assets/packages/parceldrop/assets/svg/onboarding-2.svg": "98d735333032b2e9af3bd63f4f5e25e1",
"assets/packages/parceldrop/assets/svg/arrow-right.svg": "05e0930ba48035cc228561661c648827",
"assets/packages/parceldrop/assets/svg/onboarding-1.svg": "53e7b85f214efbca50b5c6aa46f78396",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "658b490c9da97710b01bd0f8825fce94",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d7791ef376c159f302b8ad90a748d2ab",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5070443340d1d8cceb516d02c3d6dee7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "c01b413764d633ac8de674617dac1850",
"assets/packages/aella/assets/svg/logo_full.svg": "42874fe3286e2a6a10f644550994ddfa",
"assets/assets/logo.png": "5057133047b9b665e5eeaeac1fbdbef2",
"assets/assets/logo-white.png": "c47e66025d6f892be6ab4661eeb9aa0d",
"assets/assets/logo-google-play.png": "e4708167701b9e47951d4570fad07e2c",
"assets/assets/logo-app-store.png": "bd744672260004cfb5f859e7bcfda458",
"assets/assets/blank.png": "690376686e6a94748e4d88d37ce11961",
"assets/assets/logo-gskinner.png": "c12c20a67884500a58ab47af20365c27",
"main.dart.js_5.part.js": "c7ee06af2b5928db0ef18654f229ab96",
"main.dart.js_1.part.js": "b8df2c536e0596e31edb15df27340bcc",
"main.dart.js_8.part.js": "f59e021e56ed40cc66146610a5eef49a",
"main.dart.js_10.part.js": "7de90e5516543b3ebe311fd86debab6d",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
