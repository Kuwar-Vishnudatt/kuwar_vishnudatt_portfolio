'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "a0a8453e862e704846f41de7b6feb96d",
".git/config": "52b0de976920e435cb00a28000301491",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "29a2d65d2f71522c3ceff233611849eb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "ac77dfc5599358a15874c20b7533a53c",
".git/logs/refs/heads/master": "ac77dfc5599358a15874c20b7533a53c",
".git/logs/refs/remotes/origin/gh-pages": "8c1b0288dcbae1293694338b194dbe34",
".git/objects/04/e5efc15dc0c60ea2ffcc37c5bf25e96689f44d": "978222f47488835b92838c74cb5c684c",
".git/objects/07/6aa0fe4cbad582f0ab3746f1ad7d96d92adf93": "3978d06f89af5127f345951c9f3e8493",
".git/objects/0d/821cfb7f1fa44a1722aa571ce7ff00dd4b671d": "022086184222461cf1af84603a81c9e5",
".git/objects/0d/846c8d4e47a645a373889c8b2c499152924140": "7f8f3bbf2e35701a64b33210abfe6443",
".git/objects/0e/38182bceb5e7eb6c234e5c0f7542aa5d60d3a8": "faf35a2f0f957bc2d68f024706e5d93a",
".git/objects/0e/e3590f4d74c3a4e4621a8d048d01f13436ec7a": "25939fd9f3cb53628d90cf3f4f9a026a",
".git/objects/0f/72cace0f36613b9ef64912b96ee09ddee95fbc": "aaf388476aed3cb15c3a5105eac3607a",
".git/objects/14/43ce71548a20690b289fd3238a711f16d7d50a": "7f0cafeca866e25adc2bc91641bdfe7d",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/25/8b3eee70f98b2ece403869d9fe41ff8d32b7e1": "05e38b9242f2ece7b4208c191bc7b258",
".git/objects/2b/e39c7fd3da441ddac9bea54fd12621dd39960a": "24031b20667d22ca8dba4debe8b9eab5",
".git/objects/32/8d5c7cf15c3a7b7dff04f41ecd4a23c1684091": "4a35e9039076bf2ff880aa2974dda5d9",
".git/objects/3a/7795ce82e55d8f9c99e7beaa0c85141f8d2835": "8a5558c663d87709cb2353c1b35642f0",
".git/objects/43/e946e398d96aee466fa0aabb625f0889c3a4bd": "ac34520dee747f675e6e0a15c0bbd2be",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/46/e3f4aae2bc570cd70ced97dd67fc1ec33641d8": "275321123b21f37fc350ef83c2827df5",
".git/objects/47/7f6c884fc0a1e9c669dc08276f09e5bcf9d011": "cec3da8359913b301dab48904d902708",
".git/objects/48/33fcf9ba677d3df448c90e63368e50f8bfc8d6": "a5b926fccf641f8e2a09e52478c0d37a",
".git/objects/4f/d0e51f345ee398d4c56c9a2a36514cfdc54f3e": "d8e976b7b97437231f01681fc40815a3",
".git/objects/50/857a2f445a4c3f4da3179e57dbecec0498c9a5": "f52840f635d4a530447bd25bc6b67064",
".git/objects/5e/c072636ba790701a1e1ee8654323ed0e220c23": "0f5120a507e80d649ee1901267f5bc28",
".git/objects/61/5991ddc8ce9af2d17e4e89916b7602806eb485": "9b20b95476ff249bf1d28d3a5a8e5776",
".git/objects/67/91084eadfb9fb59e967f3014566791c6e1613a": "489ff39df0241ff73afced0386d73190",
".git/objects/69/1b2d6f2919f1e7ed64b6625b052784e1f22a1c": "aa4a7ae00fb4086795bffc46090c799e",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/87/2ff1888534f4bfaa5d5f1c7b4f96db8ae0df44": "0de86a7774a61b583c800348d6e7fb70",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8d/6cee4af599f378b7ad5d2f02e7810a503bc89a": "7e5b82de26ad4d559d672970e2774f18",
".git/objects/8d/c069cd7730108b19e438d09776e83f47471337": "81c67c57adecde62c4e1ab25f64dd7fa",
".git/objects/93/3fa562c215b52fea707b2ff9cc5e6294a3cc3e": "d9a5edb9d52d083181d16cae766914b5",
".git/objects/94/b52e13bf7919ae4ea7235d78019b592dde8611": "b79fa5ca1cdbf72f253763797850f314",
".git/objects/94/f905ff0e9436a7c6bd4073823764dfcb80a07f": "59a853c15a946c82d011b00019c35a18",
".git/objects/a9/0eb7770164858b5532285d4f6bf2613ceb9e54": "08ada1c9721598a91cde7786da7298c9",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/ba/8cb00dd5231f1a55de0205c16445926a696526": "be8592f9341c9b01b70890c8614c6cf7",
".git/objects/bb/3085876799532613a08c7ebe43f24f0cc46864": "1b6aa21800d948d5513c15e54d131215",
".git/objects/c0/83f90be10cf1e16a5e9486ac15a2d5f0dd2d6b": "2286b8567b2d7052c577809cf9c9da48",
".git/objects/c6/490c805ad0e76be5d31ba1269f13767f213d0d": "3dd420a637131782cc86adf10cdb050b",
".git/objects/c7/87358a483038df6a77724cad2384bdb1317323": "4f6df752ab4bec0ce47c0d1bfd9689e9",
".git/objects/c9/ab589a0630841f210601c95495f9ef49767f13": "56c813dbfef793b814c7825a819cb61b",
".git/objects/d6/8682f43f699a79945595993d872da59ca9ab95": "51b15c2a91f7ae189cc9940273d4c67f",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d6/f6493635c1d07f042bece33f2e6413694f22e4": "f51f3304ae43c79de3f3bbf5e5057715",
".git/objects/db/f680dc42b5fee7643346872e1a076cf3e49960": "b9454f019b9d3bab53d9df32a6d05f8a",
".git/objects/e0/48180a28d150e8cc4a899d0ea28dade4e8b221": "ce12dbb43842143c1efc43304a7789b4",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f4/a06df0382f0c0913586ded405b445b1bf168da": "379e0da67a11125f68092aa43ea3a534",
".git/objects/fd/1a6affb9e05f02a6b04fc70b0ede6755e23266": "d5257373cfdc8d2b080640d2ab19ab14",
".git/refs/heads/master": "493e4c59581c8b03aa3de876c7c5833b",
".git/refs/remotes/origin/gh-pages": "493e4c59581c8b03aa3de876c7c5833b",
"assets/AssetManifest.bin": "2cd0263aeb1a8534f58cb70bb81f88ed",
"assets/AssetManifest.bin.json": "a190ccd195f706bd99de2ad9012a0cd8",
"assets/AssetManifest.json": "57a9ad68c73efe51c285797092150913",
"assets/assets/screenshots/aviz1.png": "657d5458896c92aca14623e37ccf1c2a",
"assets/assets/screenshots/aviz2.png": "5f9de6443ce933e0e3f6871fc9d0ab67",
"assets/assets/screenshots/aviz3.png": "2c2a78a17dcbda637116719fe030288b",
"assets/assets/screenshots/aviz4.png": "55a4e4c24f2505e783bf1183c8801096",
"assets/assets/screenshots/aviz5.png": "61de372a16cf703f1fc7053a640ddb66",
"assets/assets/screenshots/aviz6.png": "e1121d32a88e9976c6e9094f02327b96",
"assets/assets/screenshots/hostel1.png": "2c72497db249f951e07e26452f36dfba",
"assets/assets/screenshots/hostel2.png": "61b26a04c28d5863f1db06c3096b5f66",
"assets/assets/screenshots/hostel3.png": "1dcc677a78b5cf39a1d45fb1d39a374a",
"assets/assets/screenshots/hostel4.png": "4f25175db4b71e4b1392b0dded9dfc8a",
"assets/assets/screenshots/hostel5.png": "7eb9355867e7cf4c00fcedea30a76ed6",
"assets/assets/screenshots/hostel6.png": "92c3e1cbcd9de496f09d1d826df949d4",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "f81a9ed5a13cf156f2463f74df02e348",
"assets/NOTICES": "d8659f44ff1789e2dc2d1cb46ec92cc6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "59a12ab9d00ae8f8096fffc417b6e84f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "73d40c314a8218e705d07c27fdbc4d31",
"/": "73d40c314a8218e705d07c27fdbc4d31",
"main.dart.js": "f07c0f1e6f422a56a50a607dfafcdfda",
"manifest.json": "4dd011e102429189fbc07078337caa96",
"version.json": "a2275c0dbd09a5f6ee1ab221b6f9a336"};
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
