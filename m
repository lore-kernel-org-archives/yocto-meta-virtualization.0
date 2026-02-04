Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC35FE8B388
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 18:05:44 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1456.1770228336483656988
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Feb 2026 10:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=a2UJbRAt;
 spf=pass (domain: mvista.com, ip: 209.85.216.50, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3543b9f60e3so2873608a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Feb 2026 10:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1770228335; x=1770833135; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KW7uSxXV2/I+7yUIeT3nj6fAZccE/9Q/nL/aRsiJwcE=;
        b=a2UJbRAtm1ZG4TlnymPvQIQblesotMoSAY4YdVqvUWE1nArVFCYQcDMJqciTbcYf/q
         AWRULaesT6HGWRAHoq713nelhAjudYtxtB30ht5a0a+ksJFomwPV44q217xypgdeojj7
         3O6wxv+F9VUKPzdAVdr8TIFPEQe8/MSjzOMs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770228335; x=1770833135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KW7uSxXV2/I+7yUIeT3nj6fAZccE/9Q/nL/aRsiJwcE=;
        b=e2lok6QI+gHBJlHY6tPTAP1smLGFJrNs958Q8tu+/FuOHA80bELNy8RkwUCeJoTKnr
         dmUZl49IMQYdJd35/6oNCQWUlQRoiinRR7zadBF0HrlSu+al+9fYz0GYWHPv0fc3vcog
         AU5zfMuLpJsDZ3uTC6/Lh5OkKw0G7X2UY7PliFa1n/ThYZoZCsqyKfIgadXNOFLLbFD/
         uCwwg3sCNpYp7xKQ9ylN2wk46CZWVQrL3LCKYQ++q/cvV9YH3+LM+j9dxmNbGy4uBNGA
         uaVPYVgaMB31SRuU/VEpMWYEQpZaVtc7S3usEY39UEErVuBUTdQXZoQj2hU860XMbq48
         +A9w==
X-Gm-Message-State: AOJu0YyzBXcLazK7zW6R4STTlFM7ztV8MXZ2Atc/fRdhIxo8CTQ9IApq
	aekMiMmVRAJ5pAAWXJRc453bPGN7hqam6p7ZCukc9qrcFbz6ITGnGp9lUu56BOzfopiZHy+wair
	bmbmOvaE=
X-Gm-Gg: AZuq6aL3ThaUyLZrw1jw+opaR4WzFbfNKekgAYXWAPUioPlERjo0gPe0mfRA/UT+gQP
	zHpbRYgofExPg6ixyncvA3t8+lh7hlDHC0gOCgRWj0z90zsdTSQv0VVLvrv5PNbS6ms6zDGLpYN
	ak6XlY8AhWQu4jsT3tI8Byh3z+zMyE9xZ8LUPREBriOx8SDHpQ8YFwNhsgkMH6/I8AZdNwBumEG
	mE0cztV8mnSZNewLHaEudZYhEINOFZIYwSYlwAmHGqniBUJN8JIi0pWHRsoHI59Wu0kwHfGjJYs
	y+FUZ9t9bq1OR1jd+xuYfBi6frWd0Rc7BbiVuGoMEk8aLG3HrQB58pDGnXpREA7DFIY0h+b9roD
	bTg6ZnLkFmtYPGTXbT3GB0Nfjaq9oVn7EZbwNrhGmcLypylhcOu0DozaEgA2EKqZ8wtDUzMuFqY
	jN3MXK1QfaMuf3g2APvYQ0NvthIDleWKlceiYZwqfnkJLfvmXbXYit
X-Received: by 2002:a17:90a:c2ce:b0:34c:6108:bf32 with SMTP id 98e67ed59e1d1-3548720ae04mr3283644a91.34.1770228335086;
        Wed, 04 Feb 2026 10:05:35 -0800 (PST)
Received: from siddharth-latitude-3420.mvista.com ([2409:4041:aecb:63ac:8dc9:6ec2:670d:4951])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3549c1d4f19sm13897a91.9.2026.02.04.10.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:05:33 -0800 (PST)
From: Siddharth <sdoshi@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [meta-virtualization][scarthgap][PATCH] docker-moby: Security fix for CVE-2024-41110
Date: Wed,  4 Feb 2026 23:35:23 +0530
Message-Id: <20260204180523.368701-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Feb 2026 18:05:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9556

From: Siddharth Doshi <sdoshi@mvista.com>

The patches are taken from LTS branch 20.10 of moby.

Upstream-Status: Backport from [https://github.com/moby/moby/commit/88c4b7690840044ce15489699294ec7c5dadf5dd]

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 recipes-containers/docker/docker-moby_git.bb  |   2 +
 .../docker/files/CVE-2024-41110_1.patch       | 177 ++++++++++++++++++
 .../docker/files/CVE-2024-41110_2.patch       |  99 ++++++++++
 3 files changed, 278 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2024-41110_1.patch
 create mode 100644 recipes-containers/docker/files/CVE-2024-41110_2.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index d274b002..c28749dd 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -58,6 +58,8 @@ SRC_URI = "\
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
         file://CVE-2024-36620.patch;patchdir=src/import \
         file://CVE-2024-36621.patch;patchdir=src/import \
+        file://CVE-2024-41110_1.patch;patchdir=src/import \
+        file://CVE-2024-41110_2.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2024-41110_1.patch b/recipes-containers/docker/files/CVE-2024-41110_1.patch
new file mode 100644
index 00000000..7f74348a
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2024-41110_1.patch
@@ -0,0 +1,177 @@
+From 88c4b7690840044ce15489699294ec7c5dadf5dd Mon Sep 17 00:00:00 2001
+From: Jameson Hyde <jameson.hyde@docker.com>
+Date: Mon, 26 Nov 2018 14:15:22 -0500
+Subject: [PATCH] Authz plugin security fixes for 0-length content and path
+ validation Signed-off-by: Jameson Hyde <jameson.hyde@docker.com>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+fix comments
+
+(cherry picked from commit 9659c3a52bac57e615b5fb49b0652baca448643e)
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit 2ac8a479c53d9b8e67c55f1e283da9d85d2b3415)
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+
+Upstream-Status: Backport from [https://github.com/moby/moby/commit/88c4b7690840044ce15489699294ec7c5dadf5dd]
+CVE: CVE-2024-41110
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ pkg/authorization/authz.go           | 38 ++++++++++++++++++---
+ pkg/authorization/authz_unix_test.go | 49 ++++++++++++++++++++++++++--
+ 2 files changed, 80 insertions(+), 7 deletions(-)
+
+diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go
+index 1eb44315dd..4c2e90b251 100644
+--- a/pkg/authorization/authz.go
++++ b/pkg/authorization/authz.go
+@@ -8,6 +8,8 @@ import (
+ 	"io"
+ 	"mime"
+ 	"net/http"
++	"net/url"
++	"regexp"
+ 	"strings"
+ 
+ 	"github.com/containerd/log"
+@@ -53,10 +55,23 @@ type Ctx struct {
+ 	authReq *Request
+ }
+ 
++func isChunked(r *http.Request) bool {
++	// RFC 7230 specifies that content length is to be ignored if Transfer-Encoding is chunked
++	if strings.ToLower(r.Header.Get("Transfer-Encoding")) == "chunked" {
++		return true
++	}
++	for _, v := range r.TransferEncoding {
++		if 0 == strings.Compare(strings.ToLower(v), "chunked") {
++			return true
++		}
++	}
++	return false
++}
++
+ // AuthZRequest authorized the request to the docker daemon using authZ plugins
+ func (ctx *Ctx) AuthZRequest(w http.ResponseWriter, r *http.Request) error {
+ 	var body []byte
+-	if sendBody(ctx.requestURI, r.Header) && r.ContentLength > 0 && r.ContentLength < maxBodySize {
++	if sendBody(ctx.requestURI, r.Header) && (r.ContentLength > 0 || isChunked(r)) && r.ContentLength < maxBodySize {
+ 		var err error
+ 		body, r.Body, err = drainBody(r.Body)
+ 		if err != nil {
+@@ -109,7 +124,6 @@ func (ctx *Ctx) AuthZResponse(rm ResponseModifier, r *http.Request) error {
+ 	if sendBody(ctx.requestURI, rm.Header()) {
+ 		ctx.authReq.ResponseBody = rm.RawBody()
+ 	}
+-
+ 	for _, plugin := range ctx.plugins {
+ 		log.G(context.TODO()).Debugf("AuthZ response using plugin %s", plugin.Name())
+ 
+@@ -147,10 +161,26 @@ func drainBody(body io.ReadCloser) ([]byte, io.ReadCloser, error) {
+ 	return nil, newBody, err
+ }
+ 
++func isAuthEndpoint(urlPath string) (bool, error) {
++	// eg www.test.com/v1.24/auth/optional?optional1=something&optional2=something (version optional)
++	matched, err := regexp.MatchString(`^[^\/]+\/(v\d[\d\.]*\/)?auth.*`, urlPath)
++	if err != nil {
++		return false, err
++	}
++	return matched, nil
++}
++
+ // sendBody returns true when request/response body should be sent to AuthZPlugin
+-func sendBody(url string, header http.Header) bool {
++func sendBody(inURL string, header http.Header) bool {
++	u, err := url.Parse(inURL)
++	// Assume no if the URL cannot be parsed - an empty request will still be forwarded to the plugin and should be rejected
++	if err != nil {
++		return false
++	}
++
+ 	// Skip body for auth endpoint
+-	if strings.HasSuffix(url, "/auth") {
++	isAuth, err := isAuthEndpoint(u.Path)
++	if isAuth || err != nil {
+ 		return false
+ 	}
+ 
+diff --git a/pkg/authorization/authz_unix_test.go b/pkg/authorization/authz_unix_test.go
+index c9b18d96e9..275f1dd3d0 100644
+--- a/pkg/authorization/authz_unix_test.go
++++ b/pkg/authorization/authz_unix_test.go
+@@ -174,8 +174,8 @@ func TestDrainBody(t *testing.T) {
+ 
+ func TestSendBody(t *testing.T) {
+ 	var (
+-		url       = "nothing.com"
+ 		testcases = []struct {
++			url         string
+ 			contentType string
+ 			expected    bool
+ 		}{
+@@ -219,15 +219,58 @@ func TestSendBody(t *testing.T) {
+ 				contentType: "",
+ 				expected:    false,
+ 			},
++			{
++				url:         "nothing.com/auth",
++				contentType: "",
++				expected:    false,
++			},
++			{
++				url:         "nothing.com/auth",
++				contentType: "application/json;charset=UTF8",
++				expected:    false,
++			},
++			{
++				url:         "nothing.com/auth?p1=test",
++				contentType: "application/json;charset=UTF8",
++				expected:    false,
++			},
++			{
++				url:         "nothing.com/test?p1=/auth",
++				contentType: "application/json;charset=UTF8",
++				expected:    true,
++			},
++			{
++				url:         "nothing.com/something/auth",
++				contentType: "application/json;charset=UTF8",
++				expected:    true,
++			},
++			{
++				url:         "nothing.com/auth/test",
++				contentType: "application/json;charset=UTF8",
++				expected:    false,
++			},
++			{
++				url:         "nothing.com/v1.24/auth/test",
++				contentType: "application/json;charset=UTF8",
++				expected:    false,
++			},
++			{
++				url:         "nothing.com/v1/auth/test",
++				contentType: "application/json;charset=UTF8",
++				expected:    false,
++			},
+ 		}
+ 	)
+ 
+ 	for _, testcase := range testcases {
+ 		header := http.Header{}
+ 		header.Set("Content-Type", testcase.contentType)
++		if testcase.url == "" {
++			testcase.url = "nothing.com"
++		}
+ 
+-		if b := sendBody(url, header); b != testcase.expected {
+-			t.Fatalf("Unexpected Content-Type; Expected: %t, Actual: %t", testcase.expected, b)
++		if b := sendBody(testcase.url, header); b != testcase.expected {
++			t.Fatalf("sendBody failed: url: %s, content-type: %s; Expected: %t, Actual: %t", testcase.url, testcase.contentType, testcase.expected, b)
+ 		}
+ 	}
+ }
+-- 
+2.44.4
+
diff --git a/recipes-containers/docker/files/CVE-2024-41110_2.patch b/recipes-containers/docker/files/CVE-2024-41110_2.patch
new file mode 100644
index 00000000..48f21b52
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2024-41110_2.patch
@@ -0,0 +1,99 @@
+From 8fc313c00169d14f1712d5661306d9e0c8838257 Mon Sep 17 00:00:00 2001
+From: Jameson Hyde <jameson.hyde@docker.com>
+Date: Sat, 1 Dec 2018 11:25:49 -0500
+Subject: [PATCH 2/2] If url includes scheme, urlPath will drop hostname, which
+ would not match the auth check
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Jameson Hyde <jameson.hyde@docker.com>
+(cherry picked from commit 754fb8d9d03895ae3ab60d2ad778152b0d835206)
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit 5282cb25d09db924fa92fdb8fb7a9bd20bb845b7)
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+
+Upstream-Status: Backport from [https://github.com/moby/moby/commit/7ff423cc1c991d8dc0a7b5d1d93e1cf3efaac169]
+CVE: CVE-2024-41110
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ pkg/authorization/authz.go           |  6 ++---
+ pkg/authorization/authz_unix_test.go | 35 ++++++++++++++++++++++++++++
+ 2 files changed, 38 insertions(+), 3 deletions(-)
+
+diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go
+index 4c2e90b251..d568a2b597 100644
+--- a/pkg/authorization/authz.go
++++ b/pkg/authorization/authz.go
+@@ -57,11 +57,11 @@ type Ctx struct {
+ 
+ func isChunked(r *http.Request) bool {
+ 	// RFC 7230 specifies that content length is to be ignored if Transfer-Encoding is chunked
+-	if strings.ToLower(r.Header.Get("Transfer-Encoding")) == "chunked" {
++	if strings.EqualFold(r.Header.Get("Transfer-Encoding"), "chunked") {
+ 		return true
+ 	}
+ 	for _, v := range r.TransferEncoding {
+-		if 0 == strings.Compare(strings.ToLower(v), "chunked") {
++		if strings.EqualFold(v, "chunked") {
+ 			return true
+ 		}
+ 	}
+@@ -163,7 +163,7 @@ func drainBody(body io.ReadCloser) ([]byte, io.ReadCloser, error) {
+ 
+ func isAuthEndpoint(urlPath string) (bool, error) {
+ 	// eg www.test.com/v1.24/auth/optional?optional1=something&optional2=something (version optional)
+-	matched, err := regexp.MatchString(`^[^\/]+\/(v\d[\d\.]*\/)?auth.*`, urlPath)
++	matched, err := regexp.MatchString(`^[^\/]*\/(v\d[\d\.]*\/)?auth.*`, urlPath)
+ 	if err != nil {
+ 		return false, err
+ 	}
+diff --git a/pkg/authorization/authz_unix_test.go b/pkg/authorization/authz_unix_test.go
+index 275f1dd3d0..66b4d20452 100644
+--- a/pkg/authorization/authz_unix_test.go
++++ b/pkg/authorization/authz_unix_test.go
+@@ -259,6 +259,41 @@ func TestSendBody(t *testing.T) {
+ 				contentType: "application/json;charset=UTF8",
+ 				expected:    false,
+ 			},
++			{
++				url:         "www.nothing.com/v1.24/auth/test",
++				contentType: "application/json;charset=UTF8",
++				expected:    false,
++			},
++			{
++				url:         "https://www.nothing.com/v1.24/auth/test",
++				contentType: "application/json;charset=UTF8",
++				expected:    false,
++			},
++			{
++				url:         "http://nothing.com/v1.24/auth/test",
++				contentType: "application/json;charset=UTF8",
++				expected:    false,
++			},
++			{
++				url:         "www.nothing.com/test?p1=/auth",
++				contentType: "application/json;charset=UTF8",
++				expected:    true,
++			},
++			{
++				url:         "http://www.nothing.com/test?p1=/auth",
++				contentType: "application/json;charset=UTF8",
++				expected:    true,
++			},
++			{
++				url:         "www.nothing.com/something/auth",
++				contentType: "application/json;charset=UTF8",
++				expected:    true,
++			},
++			{
++				url:         "https://www.nothing.com/something/auth",
++				contentType: "application/json;charset=UTF8",
++				expected:    true,
++			},
+ 		}
+ 	)
+ 
+-- 
+2.44.4
+
-- 
2.34.1


