Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.60635.1595870036436124419
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jul 2020 10:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06RHDXc3005607
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Jul 2020 10:13:43 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Mon, 27 Jul 2020
 10:13:23 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20885)	id 0FA5290030F;
 Mon, 27 Jul 2020 10:13:23 -0700 (PDT)
From: sakib.sajal@windriver.com
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] kubernetes: fix CVE-2020-8559
Date: Mon, 27 Jul 2020 10:13:16 -0700
Message-ID: <20200727171316.103263-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Backported fix to resolve CVE-2020-8559.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...turn-proxied-redirects-to-the-client.patch | 149 ++++++++++++++++++
 .../kubernetes/kubernetes_git.bb              |   1 +
 2 files changed, 150 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/0001-Don-t-return-proxied-redirects-to-the-client.patch

diff --git a/recipes-containers/kubernetes/kubernetes/0001-Don-t-return-proxied-redirects-to-the-client.patch b/recipes-containers/kubernetes/kubernetes/0001-Don-t-return-proxied-redirects-to-the-client.patch
new file mode 100644
index 0000000..c4552cd
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/0001-Don-t-return-proxied-redirects-to-the-client.patch
@@ -0,0 +1,149 @@
+From 469c439ea18cb6cc58e36357b9ead15d68122341 Mon Sep 17 00:00:00 2001
+From: Tim Allclair <tallclair@google.com>
+Date: Wed, 17 Jun 2020 11:09:02 -0700
+Subject: [PATCH] Don't return proxied redirects to the client
+
+Upstream-Status: Backport [469c439ea18cb6cc58e36357b9ead15d68122341]
+CVE: CVE-2020-8559
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+
+---
+ .../k8s.io/apimachinery/pkg/util/net/http.go  |  2 +-
+ .../apimachinery/pkg/util/net/http_test.go    | 12 ++---
+ .../pkg/util/proxy/upgradeaware.go            | 10 ++++
+ .../pkg/util/proxy/upgradeaware_test.go       | 47 ++++++++++++++++++-
+ 4 files changed, 62 insertions(+), 9 deletions(-)
+
+diff --git a/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http.go b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http.go
+index 7449cbb0a01..7b64e68157e 100644
+--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http.go
++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http.go
+@@ -446,7 +446,7 @@ redirectLoop:
+ 
+ 		// Only follow redirects to the same host. Otherwise, propagate the redirect response back.
+ 		if requireSameHostRedirects && location.Hostname() != originalLocation.Hostname() {
+-			break redirectLoop
++			return nil, nil, fmt.Errorf("hostname mismatch: expected %s, found %s", originalLocation.Hostname(), location.Hostname())
+ 		}
+ 
+ 		// Reset the connection.
+diff --git a/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http_test.go b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http_test.go
+index da483c3563b..2fd3675d4fd 100644
+--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http_test.go
++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/net/http_test.go
+@@ -330,13 +330,13 @@ func TestConnectWithRedirects(t *testing.T) {
+ 		redirects:   []string{"/1", "/2", "/3", "/4", "/5", "/6", "/7", "/8", "/9", "/10"},
+ 		expectError: true,
+ 	}, {
+-		desc:              "redirect to different host are prevented",
+-		redirects:         []string{"http://example.com/foo"},
+-		expectedRedirects: 0,
++		desc:        "redirect to different host are prevented",
++		redirects:   []string{"http://example.com/foo"},
++		expectError: true,
+ 	}, {
+-		desc:              "multiple redirect to different host forbidden",
+-		redirects:         []string{"/1", "/2", "/3", "http://example.com/foo"},
+-		expectedRedirects: 3,
++		desc:        "multiple redirect to different host forbidden",
++		redirects:   []string{"/1", "/2", "/3", "http://example.com/foo"},
++		expectError: true,
+ 	}, {
+ 		desc:              "redirect to different port is allowed",
+ 		redirects:         []string{"http://HOST/foo"},
+diff --git a/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go b/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
+index d007c10b506..39c79be81bd 100644
+--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
+@@ -298,6 +298,16 @@ func (h *UpgradeAwareHandler) tryUpgrade(w http.ResponseWriter, req *http.Reques
+ 		rawResponse = headerBytes
+ 	}
+ 
++	// If the backend did not upgrade the request, return an error to the client. If the response was
++	// an error, the error is forwarded directly after the connection is hijacked. Otherwise, just
++	// return a generic error here.
++	if backendHTTPResponse.StatusCode != http.StatusSwitchingProtocols && backendHTTPResponse.StatusCode < 400 {
++		err := fmt.Errorf("invalid upgrade response: status code %d", backendHTTPResponse.StatusCode)
++		klog.Errorf("Proxy upgrade error: %v", err)
++		h.Responder.Error(w, req, err)
++		return true
++	}
++
+ 	// Once the connection is hijacked, the ErrorResponder will no longer work, so
+ 	// hijacking should be the last step in the upgrade.
+ 	requestHijacker, ok := w.(http.Hijacker)
+diff --git a/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware_test.go b/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware_test.go
+index 710fc6a9c21..c1dfb029d93 100644
+--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware_test.go
++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware_test.go
+@@ -512,7 +512,7 @@ func (r *noErrorsAllowed) Error(w http.ResponseWriter, req *http.Request, err er
+ 	r.t.Error(err)
+ }
+ 
+-func TestProxyUpgradeErrorResponse(t *testing.T) {
++func TestProxyUpgradeConnectionErrorResponse(t *testing.T) {
+ 	var (
+ 		responder   *fakeResponder
+ 		expectedErr = errors.New("EXPECTED")
+@@ -560,7 +560,7 @@ func TestProxyUpgradeErrorResponse(t *testing.T) {
+ 
+ func TestProxyUpgradeErrorResponseTerminates(t *testing.T) {
+ 	for _, intercept := range []bool{true, false} {
+-		for _, code := range []int{200, 400, 500} {
++		for _, code := range []int{400, 500} {
+ 			t.Run(fmt.Sprintf("intercept=%v,code=%v", intercept, code), func(t *testing.T) {
+ 				// Set up a backend server
+ 				backend := http.NewServeMux()
+@@ -620,6 +620,49 @@ func TestProxyUpgradeErrorResponseTerminates(t *testing.T) {
+ 	}
+ }
+ 
++func TestProxyUpgradeErrorResponse(t *testing.T) {
++	for _, intercept := range []bool{true, false} {
++		for _, code := range []int{200, 300, 302, 307} {
++			t.Run(fmt.Sprintf("intercept=%v,code=%v", intercept, code), func(t *testing.T) {
++				// Set up a backend server
++				backend := http.NewServeMux()
++				backend.Handle("/hello", http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
++					http.Redirect(w, r, "https://example.com/there", code)
++				}))
++				backendServer := httptest.NewServer(backend)
++				defer backendServer.Close()
++				backendServerURL, _ := url.Parse(backendServer.URL)
++				backendServerURL.Path = "/hello"
++
++				// Set up a proxy pointing to a specific path on the backend
++				proxyHandler := NewUpgradeAwareHandler(backendServerURL, nil, false, false, &fakeResponder{t: t})
++				proxyHandler.InterceptRedirects = intercept
++				proxyHandler.RequireSameHostRedirects = true
++				proxy := httptest.NewServer(proxyHandler)
++				defer proxy.Close()
++				proxyURL, _ := url.Parse(proxy.URL)
++
++				conn, err := net.Dial("tcp", proxyURL.Host)
++				require.NoError(t, err)
++				bufferedReader := bufio.NewReader(conn)
++
++				// Send upgrade request resulting in a non-101 response from the backend
++				req, _ := http.NewRequest("GET", "/", nil)
++				req.Header.Set(httpstream.HeaderConnection, httpstream.HeaderUpgrade)
++				require.NoError(t, req.Write(conn))
++				// Verify we get the correct response and full message body content
++				resp, err := http.ReadResponse(bufferedReader, nil)
++				require.NoError(t, err)
++				assert.Equal(t, fakeStatusCode, resp.StatusCode)
++				resp.Body.Close()
++
++				// clean up
++				conn.Close()
++			})
++		}
++	}
++}
++
+ func TestDefaultProxyTransport(t *testing.T) {
+ 	tests := []struct {
+ 		name,
+-- 
+2.20.1
+
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index d28e6a2..156e083 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.18;name=k
            git://github.com/kubernetes/release;branch=master;name=kubernetes-release;destsuffix=git/release \
            file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
            file://0001-cross-don-t-build-tests-by-default.patch \
+           file://0001-Don-t-return-proxied-redirects-to-the-client.patch \
           "
 
 DEPENDS += "rsync-native \
-- 
2.17.1

