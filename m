Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137C9CD4F24
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 15:11:16 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9952.1778685069669135189
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 May 2026 08:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=H9lhtrZW;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11817; q=dns/txt;
  s=iport01; t=1778685069; x=1779894669;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BGVx7UZWUQWM+V/yaE47MPC5t/8rtILtrYUjNbyeK5o=;
  b=H9lhtrZWY1oSqGhNN3/TPm0WA2bkBB7GdjJp/t8Pz7VLXXMgp0G8rsu/
   sXv1fDbO6PDNBlHJ93qUZVdiYACJMCSHCn8tEP1OkKhs0X8RjrvPju7Ma
   4uOdFrki2l+d3Co1fZnI8IUgSV6tXyR27B6clPu/piosVFuDQhQm2qW0R
   R5IirN8r80qJgQKQZsVvXQ+2enWisETA2Wq65PLThTK6mvjPKObqE0qWM
   qZ3zfuGHR42/utK2RUHn3UENQH9SIVCpgdVWHI4KJQt7Ss3gCp50ckL3t
   RtKZQjgET38abDIqfuW0PrWIaQnKkrV2LexORrlRCIvHtC0A626Dtvtt/
   A==;
X-CSE-ConnectionGUID: okvFetppQiSTr+VNCaD7cA==
X-CSE-MsgGUID: tU2XgvLzTpaQt9GQAFu3qA==
X-IPAS-Result: =?us-ascii?q?A0A8AADzkgRq/5P/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?gUBAQsBglZyX0JJA4RUj1OCIZ4dgX8PAQEBD0QNBAEBhQYCjTICJjYHDgECB?=
 =?us-ascii?q?AMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgEpDwEWXAMBAgMCJ?=
 =?us-ascii?q?gItIxgJgwIBgnMCARGyfHqBMoEBg2gCQ1DbKAELFAGBCi4BhT6DGgGFAlsYA?=
 =?us-ascii?q?YR7JxsbgXKBFYE7UIFdgQWBUQsCAhiBDQYLhAOCRyIEgiKBDoFdHox9SIECH?=
 =?us-ascii?q?ANZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPhczWBsHBYFLggVyaoEChF94IywDT?=
 =?us-ascii?q?oFDAwsYDUgRLDcUGwQ9AW4Hij8dD4F6NgEVZRMBKgEJgQ8bNUQGCA6TEhExj?=
 =?us-ascii?q?2OCIYE1n1kKKIN0jB6VOhozhASBV5I+klILmHuCAIk2glOWAFCEaIFvBTCBW?=
 =?us-ascii?q?XAVgyIJShkPjioOC4NghRPDSCQ1AgkDLwEBBwIHAgsDC4FokAABJ4FVAQE?=
IronPort-Data: A9a23:WORSgas8SWjOyKhnIYJVFpb5I+fnVAVfMUV32f8akzHdYApBsoF/q
 tZmKTvXPKuJZzH0f9BxO9jgpEhTscLVmN4wHFds/HgzESpGgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYzdJ5xYuajhKs//a80s21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw/eVpL2xS7
 eQhKQsxdFO9ocm/7O2wY7w57igjBJGD0II3oHpsy3TdSP0hW52GGv2M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtIYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoPRFZULxhzB/
 Qoq+UzlP0sqO8K72wad+0uw18D2tA3mA5s7QejQGvlCxQf7KnYoIBgbSVL+v/ijllO3X9NNI
 lAV/SwGqakp6FftX972QxqgunmGsxUAHd1KHIUHBBql0KHY5UOdQ2MDVDMEMYRgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaYkD58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:xvbTNq6hVTKZ3bVJpQPXwZCBI+orL9Y04lQ7vn2ZHyYlCvBwWf
 re/8jztCWE8Qr5PUtLpTnuAsa9qB/nm6KdpLNhWItKPzOW3ldATrsSj7cKmAeQYREWn9Q1vc
 oNT0E9MqyVMbEdt6fHCWGDeOrIq+P3l5xA692/815dCTtERoslxx5hYzzrZ3FedU19KrcSUL
 KB+8x9qyC4f3MMYq2AdwI4t+ionay4qLvWJSQoKjRiwi+0th+MwIPbNT/d/jp2aUI9/V8hm1
 K15zAQMM+YwoaGIhy37R6k03xP8uGRt+drNYi3peU+bhPWpDuZXagJYczygNisytvfmGrDlr
 P30msd15Qa0QKvQomtyyGdpTXd7A==
X-Talos-CUID: 9a23:26xTOWPRXTsivO5DXyp52kMIAtgcc0bh1jTuBWSxJTliYejA
X-Talos-MUID: 9a23:PNHCNAXEO5cb8ljq/CPR3gFtKuN637ynMVxcvqwvldTfLAUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,232,1770595200"; 
   d="scan'208";a="738860213"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 May 2026 15:11:08 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 6A80618000262
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 13 May 2026 15:11:08 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 16ED1CDE20D; Wed, 13 May 2026 08:11:08 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][scarthgap][PATCH 2/2] docker-moby: Fix CVE-2026-34040
Date: Wed, 13 May 2026 08:10:58 -0700
Message-ID: <20260513151104.3119869-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 May 2026 15:11:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9795

From: Deepak Rathore <deeratho@cisco.com>

The upstream fix [3] & [4] referenced in the Debian security
advisory [5] is present in the v25.0 branch, which aligns with the
scarthgap branch so pick the corresponding commit [1] & [2] to apply
the CVE fix.

[1] https://github.com/moby/moby/commit/553e8214614ee0d65ee309f148a8e865634cc291
[2] https://github.com/moby/moby/commit/4d0135c2d25b89ecc62a15277f20177150195695
[3] https://github.com/moby/moby/commit/6d311e0d8d4174a6347942db78c553fb7dc3762e
[4] https://github.com/moby/moby/commit/db7dadaca041953430d1e2144088c311b78b96d7
[5] https://security-tracker.debian.org/tracker/CVE-2026-34040

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 26dce276..eb493a43 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -57,6 +57,8 @@ SRC_URI = "\
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
 		file://CVE-2026-33997.patch;patchdir=src/import \
+		file://CVE-2026-34040_p1.patch;patchdir=src/import \
+		file://CVE-2026-34040_p2.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2026-34040_p1.patch b/recipes-containers/docker/files/CVE-2026-34040_p1.patch
new file mode 100644
index 00000000..9fb96ab0
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-34040_p1.patch
@@ -0,0 +1,215 @@
+From b2ff8a60155731641418d1a8b9efaf9e044e1971 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pawe=C5=82=20Gronowski?= <pawel.gronowski@docker.com>
+Date: Mon, 16 Feb 2026 14:15:24 +0100
+Subject: [PATCH 1/2] pkg/authz: Reject requests exceeding body size limit
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Previously, the authorization system would silently skip body inspection when
+request bodies exceeded the maximum size limit (1MiB).
+
+The authorization plugins would receive an empty body for inspection
+while the actual large payload would still be processed by the Docker
+daemon, allowing malicious requests to circumvent plugin-based security
+controls.
+
+CVE: CVE-2026-34040
+Upstream-Status: Backport [https://github.com/moby/moby/commit/553e8214614ee0d65ee309f148a8e865634cc291]
+
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit 7a767b27fd1238c89a5cc926c39e27d3bcf58e35)
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit 553e8214614ee0d65ee309f148a8e865634cc291)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ pkg/authorization/authz.go           | 56 ++++++-----------
+ pkg/authorization/authz_unix_test.go | 93 +++++++++++++++++++---------
+ 2 files changed, 83 insertions(+), 66 deletions(-)
+
+diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go
+index d568a2b597..3bc30f61cf 100644
+--- a/pkg/authorization/authz.go
++++ b/pkg/authorization/authz.go
+@@ -55,28 +55,31 @@ type Ctx struct {
+ 	authReq *Request
+ }
+ 
+-func isChunked(r *http.Request) bool {
+-	// RFC 7230 specifies that content length is to be ignored if Transfer-Encoding is chunked
+-	if strings.EqualFold(r.Header.Get("Transfer-Encoding"), "chunked") {
+-		return true
+-	}
+-	for _, v := range r.TransferEncoding {
+-		if strings.EqualFold(v, "chunked") {
+-			return true
+-		}
+-	}
+-	return false
+-}
+-
+ // AuthZRequest authorized the request to the docker daemon using authZ plugins
+ func (ctx *Ctx) AuthZRequest(w http.ResponseWriter, r *http.Request) error {
+ 	var body []byte
+-	if sendBody(ctx.requestURI, r.Header) && (r.ContentLength > 0 || isChunked(r)) && r.ContentLength < maxBodySize {
+-		var err error
+-		body, r.Body, err = drainBody(r.Body)
+-		if err != nil {
++	if sendBody(ctx.requestURI, r.Header) {
++		// Wrap the original request body in a buffered reader so we can inspect
++		// the prefix without consuming bytes from the downstream reader.
++		// `Peek(maxBodySize + 1)` is used as a size check:
++		//   - err == nil means at least maxBodySize+1 bytes are buffered/available,
++		//     so the payload exceeds the plugin limit and is rejected.
++		//   - otherwise, `peeked` contains the complete body bytes currently available
++		//     (for short bodies this is the full payload), and reads from r.Body still
++		//     stream the original body unchanged.
++		bufBody := bufio.NewReaderSize(r.Body, maxBodySize+1)
++		r.Body = ioutils.NewReadCloserWrapper(bufBody, r.Body.Close)
++
++		peeked, err := bufBody.Peek(maxBodySize + 1)
++		if err == nil {
++			// Successfully peeked maxBodySize+1 bytes, so body is too large
++			// TODO: Allows plugin to opt in
++			return fmt.Errorf("request body too large for authorization plugin: size exceeds %d bytes", maxBodySize)
++		} else if err != io.EOF {
+ 			return err
+ 		}
++
++		body = peeked
+ 	}
+ 
+ 	var h bytes.Buffer
+@@ -142,25 +145,6 @@ func (ctx *Ctx) AuthZResponse(rm ResponseModifier, r *http.Request) error {
+ 	return nil
+ }
+ 
+-// drainBody dump the body (if its length is less than 1MB) without modifying the request state
+-func drainBody(body io.ReadCloser) ([]byte, io.ReadCloser, error) {
+-	bufReader := bufio.NewReaderSize(body, maxBodySize)
+-	newBody := ioutils.NewReadCloserWrapper(bufReader, func() error { return body.Close() })
+-
+-	data, err := bufReader.Peek(maxBodySize)
+-	// Body size exceeds max body size
+-	if err == nil {
+-		log.G(context.TODO()).Warnf("Request body is larger than: '%d' skipping body", maxBodySize)
+-		return nil, newBody, nil
+-	}
+-	// Body size is less than maximum size
+-	if err == io.EOF {
+-		return data, newBody, nil
+-	}
+-	// Unknown error
+-	return nil, newBody, err
+-}
+-
+ func isAuthEndpoint(urlPath string) (bool, error) {
+ 	// eg www.test.com/v1.24/auth/optional?optional1=something&optional2=something (version optional)
+ 	matched, err := regexp.MatchString(`^[^\/]*\/(v\d[\d\.]*\/)?auth.*`, urlPath)
+diff --git a/pkg/authorization/authz_unix_test.go b/pkg/authorization/authz_unix_test.go
+index 66b4d20452..c726e5f79a 100644
+--- a/pkg/authorization/authz_unix_test.go
++++ b/pkg/authorization/authz_unix_test.go
+@@ -139,36 +139,69 @@ func TestResponseModifier(t *testing.T) {
+ 	}
+ }
+ 
+-func TestDrainBody(t *testing.T) {
+-	tests := []struct {
+-		length             int // length is the message length send to drainBody
+-		expectedBodyLength int // expectedBodyLength is the expected body length after drainBody is called
+-	}{
+-		{10, 10},                           // Small message size
+-		{maxBodySize - 1, maxBodySize - 1}, // Max message size
+-		{maxBodySize * 2, 0},               // Large message size (skip copying body)
+-
+-	}
+-
+-	for _, test := range tests {
+-		msg := strings.Repeat("a", test.length)
+-		body, closer, err := drainBody(io.NopCloser(bytes.NewReader([]byte(msg))))
+-		if err != nil {
+-			t.Fatal(err)
+-		}
+-		if len(body) != test.expectedBodyLength {
+-			t.Fatalf("Body must be copied, actual length: '%d'", len(body))
+-		}
+-		if closer == nil {
+-			t.Fatal("Closer must not be nil")
+-		}
+-		modified, err := io.ReadAll(closer)
+-		if err != nil {
+-			t.Fatalf("Error must not be nil: '%v'", err)
+-		}
+-		if len(modified) != len(msg) {
+-			t.Fatalf("Result should not be truncated. Original length: '%d', new length: '%d'", len(msg), len(modified))
+-		}
++type recordingPlugin struct {
++	recordedRequest Request
++}
++
++func (p *recordingPlugin) Name() string { return "recording-plugin" }
++
++func (p *recordingPlugin) AuthZRequest(authReq *Request) (*Response, error) {
++	p.recordedRequest = *authReq
++	p.recordedRequest.RequestBody = bytes.Clone(authReq.RequestBody)
++	return &Response{Allow: true}, nil
++}
++
++func (p *recordingPlugin) AuthZResponse(_ *Request) (*Response, error) {
++	return &Response{Allow: true}, nil
++}
++
++func TestAuthZRequestBodyWithinLimit(t *testing.T) {
++	payload := strings.Repeat("a", maxBodySize)
++	plugin := &recordingPlugin{}
++	ctx := NewCtx([]Plugin{plugin}, "user", "tls", http.MethodPost, "/containers/create")
++
++	req := httptest.NewRequest(http.MethodPost, "http://example.com/containers/create", strings.NewReader(payload))
++	req.Header.Set("Content-Type", "application/json")
++
++	if err := ctx.AuthZRequest(httptest.NewRecorder(), req); err != nil {
++		t.Fatalf("AuthZRequest failed: %v", err)
++	}
++
++	if string(plugin.recordedRequest.RequestBody) != payload {
++		t.Fatalf("expected full request body to be sent to plugin, got length %d, expected %d", len(plugin.recordedRequest.RequestBody), len(payload))
++	}
++
++	remaining, err := io.ReadAll(req.Body)
++	if err != nil {
++		t.Fatalf("failed to read request body after authz: %v", err)
++	}
++	if string(remaining) != payload {
++		t.Fatalf("request body should be preserved for downstream readers")
++	}
++}
++
++func TestAuthZRequestBodyOverLimit(t *testing.T) {
++	payload := strings.Repeat("a", maxBodySize+1)
++	plugin := &recordingPlugin{}
++	ctx := NewCtx([]Plugin{plugin}, "user", "tls", http.MethodPost, "/containers/create")
++
++	req := httptest.NewRequest(http.MethodPost, "http://example.com/containers/create", strings.NewReader(payload))
++	req.Header.Set("Content-Type", "application/json")
++
++	err := ctx.AuthZRequest(httptest.NewRecorder(), req)
++	if err == nil {
++		t.Fatal("expected AuthZRequest to reject body over max size")
++	}
++	if !strings.Contains(err.Error(), "request body too large for authorization plugin") {
++		t.Fatalf("unexpected error: %v", err)
++	}
++
++	remaining, readErr := io.ReadAll(req.Body)
++	if readErr != nil {
++		t.Fatalf("failed to read request body after authz error: %v", readErr)
++	}
++	if string(remaining) != payload {
++		t.Fatalf("request body should still be preserved after over-limit check")
+ 	}
+ }
+ 
+-- 
+2.44.4
+
diff --git a/recipes-containers/docker/files/CVE-2026-34040_p2.patch b/recipes-containers/docker/files/CVE-2026-34040_p2.patch
new file mode 100644
index 00000000..00a264f0
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-34040_p2.patch
@@ -0,0 +1,39 @@
+From f24fa983ccaa393b64724292a49270ab46b49c06 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pawe=C5=82=20Gronowski?= <pawel.gronowski@docker.com>
+Date: Mon, 16 Feb 2026 14:16:06 +0100
+Subject: [PATCH 2/2] pkg/authz: Increase body limit to 4 MiB
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Some endpoint could potentially use a body request than 1 MiB without
+malicious intent.
+
+CVE: CVE-2026-34040
+Upstream-Status: Backport [https://github.com/moby/moby/commit/4d0135c2d25b89ecc62a15277f2017715019569]
+
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit ec76e941838797fc762185c556c152f0a032d387)
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit 4d0135c2d25b89ecc62a15277f20177150195695)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ pkg/authorization/authz.go | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go
+index 3bc30f61cf..e9221307a7 100644
+--- a/pkg/authorization/authz.go
++++ b/pkg/authorization/authz.go
+@@ -16,7 +16,7 @@ import (
+ 	"github.com/docker/docker/pkg/ioutils"
+ )
+ 
+-const maxBodySize = 1048576 // 1MB
++const maxBodySize = 4 * 1024 * 1024 // 4MiB
+ 
+ // NewCtx creates new authZ context, it is used to store authorization information related to a specific docker
+ // REST http session
+-- 
+2.44.4
+
-- 
2.35.6


