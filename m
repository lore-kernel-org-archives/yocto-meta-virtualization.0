Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28290.1793858423852812673
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 22:00:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CbSK8X1N;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12052; q=dns/txt;
  s=iport01; t=1793858423; x=1795068023;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hNfJK6F9kgaIDTmYEr2dlzG2n5cGpy05DyzHh+cQQpM=;
  b=CbSK8X1NXNdm6OjmfCvNtpPl3bcK3mUCrpFxhAOmoJoBxaVJtJ+jA4Mz
   8zwND7NdNO/7Yh4oorsFk6DArE1qgnY1RsIy3yQq0tV8QzAzTpSimACgE
   DVFv2B4rws+Ft3IDLyJI7y/m7GEIW2fdnuHzX9SpRCmKSTjdLymwY6XD2
   s78wPvZq29XLL73rZTRgCrlSPNEAgF7Z97cqeoqCqxr4cwDTzBYJaB8me
   M2RdO3TtDe6kN/hH3JycMOrPBdee15EMfuv5Dj0ePbMLH+KMnM94oq2Ic
   gxh8NJfMhCWukgr+gFzNU3UWkmhWS1KxPLiPj/VVi1reHPH168e+L0QDM
   w==;
X-CSE-ConnectionGUID: kNtRFgiMQvit5mcfDzI3mQ==
X-CSE-MsgGUID: 4p0NXk7MQk+WKDCBy3bwsQ==
X-IPAS-Result: =?us-ascii?q?A0AaAABsGuxq/44QJK1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YUJJA4RUiBuHOIIhniSBfg8BAQEPRA0EAQGFBQKOHQImNAkOA?=
 =?us-ascii?q?QIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgEpDwEWXAMBA?=
 =?us-ascii?q?gMCJgItIxgBCIMCAYJ0AxG8P3qBMoEBhH7bMwELFAGBCi4BhT+DHwGFA10YA?=
 =?us-ascii?q?YR9JxsbgXKBFYE7UYFdgQWBUQsCAhiBDQYLhASCSCIEgiKBDIFaHot1gQUCg?=
 =?us-ascii?q?VKGcUiBAhwDWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XL1gbBgWBHYEegRKBB?=
 =?us-ascii?q?12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmP?=
 =?us-ascii?q?xUMZAsaBWEIAg0McjkQMB4kLwUcJkAbChgYDUgRLDcVGQQ9AW4Hki+CWzYBF?=
 =?us-ascii?q?WUTASoBCYEPGzVEBggOkxIRMo9kgh6BOJ9cCiiDeIwklToaM4QEgVeSQpJUC?=
 =?us-ascii?q?5h9ggGJNoJTlgFQhGmBaDyBWXAVgyIJShkPjisOC4NgzkI8NQIJAy8BAQcCB?=
 =?us-ascii?q?wIMAwuBaJAAASeBVgEB?=
IronPort-Data: A9a23:oXQseapjt7EPTtNlUkYpyiBgB+5eBmJIZBIvgKrLsJaIsI4StFCzt
 garIBmCa/eIYWD8LognYd+18UlX7cCGmNZhGgpoqys0ESgXpOPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8E835pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uVRHVtg+
 v09ES4Mck2GjOya0pPgT9A506zPLOGzVG8eknhkyTecCbMtRorOBv2Xo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtNYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUozbHpQNwxjJ+
 Qoq+UylGkk8BN/A7AOGsU2PqsTljHjxR5krQejQGvlCxQf7KnYoIBgbSVL+v/ijllO3X9NNI
 lAV/SwGqakp6FftX972QxqgunmGsxUAHd1KHIUHBBqlw67Q5UOdQ2MDVDMEMIFgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaY0D58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:2GZrfqq2JJM80LGo+yYZ90oaV5odeYIsimQD101hICG9Ffbo8v
 xG/c5rtyMc5wx+ZJhNo7290cq7MBDhHOBOgLX5VI3KNGKNhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjizEht7t2uqUuEimpRGsZd0zs=
X-Talos-CUID: 9a23:OMGLdWE63BRgUJaqqmJk0lIuNM8kV0TDzWuNJkS2JXRIE7isHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A6PqQ3Q5sbNe2dpLq9uLoerz7xow0+/yIOENStKw?=
 =?us-ascii?q?F+PanGQdaKmyXky+OF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="893905697"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 06:00:21 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id 5473518000153
	for <meta-virtualization@lists.yoctoproject.org>; Thu,  5 Nov 2026 06:00:21 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 4E402CC1295; Thu,  5 Nov 2026 11:30:19 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 1/5] docker-moby: Fix CVE-2026-34040
Date: Thu,  5 Nov 2026 11:30:02 +0530
Message-Id: <20261105060006.1286469-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 06:00:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10145
Content-Type: text/plain; charset="utf-8"

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream Docker 29.x backports for
CVE-2026-34040. It rejects authorization requests whose body exceeds the
inspection limit, then increases the supported inspection limit to 4 MiB.
The request-body limit fix commits are referenced in [1] and [2], and the
public CVE advisory is referenced in [3].

[1] https://github.com/moby/moby/commit/7a402982117c20280152adbd16f020835f541665
[2] https://github.com/moby/moby/commit/f302d066877d3717869655ebd12fab47d49ca611
[3] https://github.com/moby/moby/security/advisories/GHSA-x744-4wpc-v9h2

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 recipes-containers/docker/docker-moby_git.bb  |   2 +
 .../docker/files/CVE-2026-34040_p1.patch      | 209 ++++++++++++++++++
 .../docker/files/CVE-2026-34040_p2.patch      |  36 +++
 3 files changed, 247 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2026-34040_p1.patch
 create mode 100644 recipes-containers/docker/files/CVE-2026-34040_p2.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index a512219a..7561215c 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -57,6 +57,8 @@ SRC_URI = "\
         file://CVE-2026-41568.patch;patchdir=src/import \
         file://CVE-2026-42306_p1.patch;patchdir=src/import \
         file://CVE-2026-42306_p2.patch;patchdir=src/import \
+        file://CVE-2026-34040_p1.patch;patchdir=src/import \
+        file://CVE-2026-34040_p2.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2026-34040_p1.patch b/recipes-containers/docker/files/CVE-2026-34040_p1.patch
new file mode 100644
index 00000000..63f50944
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-34040_p1.patch
@@ -0,0 +1,209 @@
+From 048989b4dca317967755c484ca94157c5a68d0a0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pawe=C5=82=20Gronowski?= <pawel.gronowski@docker.com>
+Date: Mon, 16 Feb 2026 14:15:24 +0100
+Subject: [PATCH] pkg/authz: Reject requests exceeding body size limit
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
+Upstream-Status: Backport [https://github.com/moby/moby/commit/7a402982117c20280152adbd16f020835f541665]
+
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit 7a767b27fd1238c89a5cc926c39e27d3bcf58e35)
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit 7a402982117c20280152adbd16f020835f541665)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ pkg/authorization/authz.go           | 56 +++++++-----------
+ pkg/authorization/authz_unix_test.go | 87 +++++++++++++++++++---------
+ 2 files changed, 80 insertions(+), 63 deletions(-)
+
+diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go
+index 7f85fa4c4a..a5b94d6bb7 100644
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
+index 5f4902dad4..9107b4c08a 100644
+--- a/pkg/authorization/authz_unix_test.go
++++ b/pkg/authorization/authz_unix_test.go
+@@ -140,36 +140,69 @@ func TestResponseModifier(t *testing.T) {
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
+ 
++	req := httptest.NewRequest(http.MethodPost, "http://example.com/containers/create", strings.NewReader(payload))
++	req.Header.Set("Content-Type", "application/json")
++
++	if err := ctx.AuthZRequest(httptest.NewRecorder(), req); err != nil {
++		t.Fatalf("AuthZRequest failed: %v", err)
+ 	}
+ 
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
diff --git a/recipes-containers/docker/files/CVE-2026-34040_p2.patch b/recipes-containers/docker/files/CVE-2026-34040_p2.patch
new file mode 100644
index 00000000..4ccdf597
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-34040_p2.patch
@@ -0,0 +1,36 @@
+From c31b7dfc88d0a7d2107e72a4675ab52df193973a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pawe=C5=82=20Gronowski?= <pawel.gronowski@docker.com>
+Date: Mon, 16 Feb 2026 14:16:06 +0100
+Subject: [PATCH] pkg/authz: Increase body limit to 4 MiB
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Some endpoint could potentially use a body request than 1 MiB without
+malicious intent.
+
+CVE: CVE-2026-34040
+Upstream-Status: Backport [https://github.com/moby/moby/commit/f302d066877d3717869655ebd12fab47d49ca611]
+
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit ec76e941838797fc762185c556c152f0a032d387)
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit f302d066877d3717869655ebd12fab47d49ca611)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ pkg/authorization/authz.go | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go
+index a5b94d6bb7..b635e01733 100644
+--- a/pkg/authorization/authz.go
++++ b/pkg/authorization/authz.go
+@@ -16,7 +16,7 @@ import (
+ 	"github.com/moby/moby/v2/pkg/ioutils"
+ )
+ 
+-const maxBodySize = 1048576 // 1MB
++const maxBodySize = 4 * 1024 * 1024 // 4MiB
+ 
+ // NewCtx creates new authZ context, it is used to store authorization information related to a specific docker
+ // REST http session
-- 
2.35.6

