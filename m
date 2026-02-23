Return-Path: <felix@piedallu.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1365EC110B
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 16:36:16 +0000 (UTC)
Received: from 6.mo579.mail-out.ovh.net (6.mo579.mail-out.ovh.net [46.105.43.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39494.1771864573465393282
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 08:36:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@piedallu.me header.s=mailkey header.b=PGWBOd5n;
 spf=softfail (domain: piedallu.me, ip: 46.105.43.252, mailfrom: felix@piedallu.me)
Received: from mxplan8.mail.ovh.net (unknown [10.109.249.37])
	by mo579.mail-out.ovh.net (Postfix) with ESMTPS id 4fKRLg2WJ8z5vvn;
	Mon, 23 Feb 2026 16:36:11 +0000 (UTC)
Received: from piedallu.me (37.59.142.105) by mxplan8.mail.ovh.net
 (172.16.2.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Mon, 23 Feb
 2026 17:36:10 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-105G006ca373c47-20b1-4662-90ed-3ae8e33925b3,
                    2C24A2C219CBC5CDE540945932125BCC2609A321) smtp.auth=postmaster@piedallu.me
X-OVh-ClientIp: 82.66.229.222
Received: from [127.0.1.1] (92-184-100-178.mobile.fr.orangecustomers.net [92.184.100.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by piedallu.me (Postfix) with ESMTPSA id BA9C016A068D;
	Mon, 23 Feb 2026 17:36:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=piedallu.me;
	s=mailkey; t=1771864566;
	bh=5AlcFn8eYv0nK88w8qG04qmziG6jMXiE23VZQ97VGyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PGWBOd5nr39tNFJr/j1EuFeqwITAHYxuOiaiGoM5A24DLTb1OCj9+DEChqAnpyf4E
	 zTjwQnCnhMnjXrLjlSmxmK0Dxih6N7I2czBXQJW0N9twWiUsp1rCjeUVH+vOPO9K8L
	 6rrHoZgIiqcyUsjmjf6+tU8EKHYaIetSQRY4jcdk=
From: felix@piedallu.me
Date: Mon, 23 Feb 2026 17:35:55 +0100
Subject: [PATCH v2 1/4] Revert "docker-moby: Security fix for
 CVE-2024-41110"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-ID: <20260223-upstream-update-docker-moby-v2-1-5bc0d679d988@non.se.com>
References: <20260223-upstream-update-docker-moby-v2-0-5bc0d679d988@non.se.com>
In-Reply-To: <20260223-upstream-update-docker-moby-v2-0-5bc0d679d988@non.se.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: =?utf-8?q?F=C3=A9lix_Pi=C3=A9dallu?= <felix.piedallu@non.se.com>, 
 pascal.eberhard@se.com
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771864566; l=11301;
 i=felix.piedallu@non.se.com; s=20250606; h=from:subject:message-id;
 bh=AeOeoQOLQQLbWpsPaMgZBoX5iAY3xTBIJYmeTfe9oIU=;
 b=D8rQgtqIzGgI/eBZYQqwPVBZqR3nEvNzjpLWkYEseKXcwO9ZvWWgzKHxWMPBTv6cj1MAZfpBu
 klMXEwUo0HtCpqvZWQvdgI7FvFp5wDBXfLsRifpqZIDE3JeJh9TKpMk
X-Developer-Key: i=felix.piedallu@non.se.com; a=ed25519;
 pk=Xe1dw6DIV7hmFbzuJfvaioG+S30kGix0QpIi5qPg99w=
X-MailScanner-ID: BA9C016A068D.A528E
X-MailScanner: Found to be clean
X-MailScanner-From: felix@piedallu.me
X-Ovh-Tracer-GUID: b8cc7bd1-a0d2-476d-b1da-e26dde2aea77
X-Ovh-Tracer-Id: 9365798379177150685
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTF7IAh+ILfUuMMip/syJIXeXuZlKfJ9GZq7HSnb3OC3hX3Jtzw32QB8GkB2cJqa1XHz/cbKGAu38m1VLbFd5Z2mggaj9jgWWDJ6B15a2BtS8YYxwC3gx1zEBMFDuWJCnS87t52TbiTvo0KzjZh9xP14jCIJBmIBAakfzZX9fqSoqVghemDhDc2mMUYLGHvKA92Awadlt84TYXbYwbj6WSR9OVIqKNBYDK48ooFMRYSLusE7wpOb3/Hvv+m5zP8Xa228ed2pgjR2ZBDR/6cj/WivJUiNXIGQ7bk+G8OODdXUufhzSjmGvgDal2Mv86PRnbxoK+/dlZccFON7ehfTnZSXXKPU1MrgY6mYX2kLvWqLt/1uguBXwtpbd9Wkl6TAO5fZKhVH1EVRdZF+BwNVVpYUxGskqunbSv0GPFLH1yZ7ksw2DBsdH6QVASX8xvxPp2oj+yjo+SL7TxrsgQbOy3Kml62zjKx0p4oteampgztx9tr8Qt1NzH1M/6AAf/xnf+klVFfpOD5Pv1MoH/aDC0pm7a6SB1z9UqXc8Jfjx67NOU4siYMdMyHleI+XjNWvET55U5ZoK4Kl4nh2ZiXqRkstdjvQ7TRfYcqYOpPFypoqlsYv55D/M4FOajYjUKT+lJCIGnHlsG9UslhcSNrMiFlBT1g9QUgbmwQWv8ZOXa0Eaw
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Feb 2026 16:36:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9607

From: F=C3=A9lix Pi=C3=A9dallu <felix.piedallu@non.se.com>

This reverts commit 78abd77b8695705e6e55266745c838bb665486de.

Security fixes are backported in v25.0.9.
---
 recipes-containers/docker/docker-moby_git.bb       |   2 -
 .../docker/files/CVE-2024-41110_1.patch            | 177 ---------------=
------
 .../docker/files/CVE-2024-41110_2.patch            |  99 ------------
 3 files changed, 278 deletions(-)

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-conta=
iners/docker/docker-moby_git.bb
index b1b2cbb5..1331930e 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -59,8 +59,6 @@ SRC_URI =3D "\
         file://CVE-2024-36620.patch;patchdir=3Dsrc/import \
         file://CVE-2024-36621.patch;patchdir=3Dsrc/import \
         file://CVE-2024-29018.patch;patchdir=3Dsrc/import \
-        file://CVE-2024-41110_1.patch;patchdir=3Dsrc/import \
-        file://CVE-2024-41110_2.patch;patchdir=3Dsrc/import \
 	"
=20
 DOCKER_COMMIT =3D "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2024-41110_1.patch b/rec=
ipes-containers/docker/files/CVE-2024-41110_1.patch
deleted file mode 100644
index 7f74348a..00000000
--- a/recipes-containers/docker/files/CVE-2024-41110_1.patch
+++ /dev/null
@@ -1,177 +0,0 @@
-From 88c4b7690840044ce15489699294ec7c5dadf5dd Mon Sep 17 00:00:00 2001
-From: Jameson Hyde <jameson.hyde@docker.com>
-Date: Mon, 26 Nov 2018 14:15:22 -0500
-Subject: [PATCH] Authz plugin security fixes for 0-length content and pa=
th
- validation Signed-off-by: Jameson Hyde <jameson.hyde@docker.com>
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-fix comments
-
-(cherry picked from commit 9659c3a52bac57e615b5fb49b0652baca448643e)
-Signed-off-by: Pawe=C5=82 Gronowski <pawel.gronowski@docker.com>
-(cherry picked from commit 2ac8a479c53d9b8e67c55f1e283da9d85d2b3415)
-Signed-off-by: Pawe=C5=82 Gronowski <pawel.gronowski@docker.com>
-
-Upstream-Status: Backport from [https://github.com/moby/moby/commit/88c4=
b7690840044ce15489699294ec7c5dadf5dd]
-CVE: CVE-2024-41110
-Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
----
- pkg/authorization/authz.go           | 38 ++++++++++++++++++---
- pkg/authorization/authz_unix_test.go | 49 ++++++++++++++++++++++++++--
- 2 files changed, 80 insertions(+), 7 deletions(-)
-
-diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go
-index 1eb44315dd..4c2e90b251 100644
---- a/pkg/authorization/authz.go
-+++ b/pkg/authorization/authz.go
-@@ -8,6 +8,8 @@ import (
- 	"io"
- 	"mime"
- 	"net/http"
-+	"net/url"
-+	"regexp"
- 	"strings"
-=20
- 	"github.com/containerd/log"
-@@ -53,10 +55,23 @@ type Ctx struct {
- 	authReq *Request
- }
-=20
-+func isChunked(r *http.Request) bool {
-+	// RFC 7230 specifies that content length is to be ignored if Transfer=
-Encoding is chunked
-+	if strings.ToLower(r.Header.Get("Transfer-Encoding")) =3D=3D "chunked"=
 {
-+		return true
-+	}
-+	for _, v :=3D range r.TransferEncoding {
-+		if 0 =3D=3D strings.Compare(strings.ToLower(v), "chunked") {
-+			return true
-+		}
-+	}
-+	return false
-+}
-+
- // AuthZRequest authorized the request to the docker daemon using authZ=
 plugins
- func (ctx *Ctx) AuthZRequest(w http.ResponseWriter, r *http.Request) er=
ror {
- 	var body []byte
--	if sendBody(ctx.requestURI, r.Header) && r.ContentLength > 0 && r.Cont=
entLength < maxBodySize {
-+	if sendBody(ctx.requestURI, r.Header) && (r.ContentLength > 0 || isChu=
nked(r)) && r.ContentLength < maxBodySize {
- 		var err error
- 		body, r.Body, err =3D drainBody(r.Body)
- 		if err !=3D nil {
-@@ -109,7 +124,6 @@ func (ctx *Ctx) AuthZResponse(rm ResponseModifier, r=
 *http.Request) error {
- 	if sendBody(ctx.requestURI, rm.Header()) {
- 		ctx.authReq.ResponseBody =3D rm.RawBody()
- 	}
--
- 	for _, plugin :=3D range ctx.plugins {
- 		log.G(context.TODO()).Debugf("AuthZ response using plugin %s", plugin=
.Name())
-=20
-@@ -147,10 +161,26 @@ func drainBody(body io.ReadCloser) ([]byte, io.Rea=
dCloser, error) {
- 	return nil, newBody, err
- }
-=20
-+func isAuthEndpoint(urlPath string) (bool, error) {
-+	// eg www.test.com/v1.24/auth/optional?optional1=3Dsomething&optional2=
=3Dsomething (version optional)
-+	matched, err :=3D regexp.MatchString(`^[^\/]+\/(v\d[\d\.]*\/)?auth.*`,=
 urlPath)
-+	if err !=3D nil {
-+		return false, err
-+	}
-+	return matched, nil
-+}
-+
- // sendBody returns true when request/response body should be sent to A=
uthZPlugin
--func sendBody(url string, header http.Header) bool {
-+func sendBody(inURL string, header http.Header) bool {
-+	u, err :=3D url.Parse(inURL)
-+	// Assume no if the URL cannot be parsed - an empty request will still=
 be forwarded to the plugin and should be rejected
-+	if err !=3D nil {
-+		return false
-+	}
-+
- 	// Skip body for auth endpoint
--	if strings.HasSuffix(url, "/auth") {
-+	isAuth, err :=3D isAuthEndpoint(u.Path)
-+	if isAuth || err !=3D nil {
- 		return false
- 	}
-=20
-diff --git a/pkg/authorization/authz_unix_test.go b/pkg/authorization/au=
thz_unix_test.go
-index c9b18d96e9..275f1dd3d0 100644
---- a/pkg/authorization/authz_unix_test.go
-+++ b/pkg/authorization/authz_unix_test.go
-@@ -174,8 +174,8 @@ func TestDrainBody(t *testing.T) {
-=20
- func TestSendBody(t *testing.T) {
- 	var (
--		url       =3D "nothing.com"
- 		testcases =3D []struct {
-+			url         string
- 			contentType string
- 			expected    bool
- 		}{
-@@ -219,15 +219,58 @@ func TestSendBody(t *testing.T) {
- 				contentType: "",
- 				expected:    false,
- 			},
-+			{
-+				url:         "nothing.com/auth",
-+				contentType: "",
-+				expected:    false,
-+			},
-+			{
-+				url:         "nothing.com/auth",
-+				contentType: "application/json;charset=3DUTF8",
-+				expected:    false,
-+			},
-+			{
-+				url:         "nothing.com/auth?p1=3Dtest",
-+				contentType: "application/json;charset=3DUTF8",
-+				expected:    false,
-+			},
-+			{
-+				url:         "nothing.com/test?p1=3D/auth",
-+				contentType: "application/json;charset=3DUTF8",
-+				expected:    true,
-+			},
-+			{
-+				url:         "nothing.com/something/auth",
-+				contentType: "application/json;charset=3DUTF8",
-+				expected:    true,
-+			},
-+			{
-+				url:         "nothing.com/auth/test",
-+				contentType: "application/json;charset=3DUTF8",
-+				expected:    false,
-+			},
-+			{
-+				url:         "nothing.com/v1.24/auth/test",
-+				contentType: "application/json;charset=3DUTF8",
-+				expected:    false,
-+			},
-+			{
-+				url:         "nothing.com/v1/auth/test",
-+				contentType: "application/json;charset=3DUTF8",
-+				expected:    false,
-+			},
- 		}
- 	)
-=20
- 	for _, testcase :=3D range testcases {
- 		header :=3D http.Header{}
- 		header.Set("Content-Type", testcase.contentType)
-+		if testcase.url =3D=3D "" {
-+			testcase.url =3D "nothing.com"
-+		}
-=20
--		if b :=3D sendBody(url, header); b !=3D testcase.expected {
--			t.Fatalf("Unexpected Content-Type; Expected: %t, Actual: %t", testca=
se.expected, b)
-+		if b :=3D sendBody(testcase.url, header); b !=3D testcase.expected {
-+			t.Fatalf("sendBody failed: url: %s, content-type: %s; Expected: %t, =
Actual: %t", testcase.url, testcase.contentType, testcase.expected, b)
- 		}
- 	}
- }
---=20
-2.44.4
-
diff --git a/recipes-containers/docker/files/CVE-2024-41110_2.patch b/rec=
ipes-containers/docker/files/CVE-2024-41110_2.patch
deleted file mode 100644
index 48f21b52..00000000
--- a/recipes-containers/docker/files/CVE-2024-41110_2.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 8fc313c00169d14f1712d5661306d9e0c8838257 Mon Sep 17 00:00:00 2001
-From: Jameson Hyde <jameson.hyde@docker.com>
-Date: Sat, 1 Dec 2018 11:25:49 -0500
-Subject: [PATCH 2/2] If url includes scheme, urlPath will drop hostname,=
 which
- would not match the auth check
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Jameson Hyde <jameson.hyde@docker.com>
-(cherry picked from commit 754fb8d9d03895ae3ab60d2ad778152b0d835206)
-Signed-off-by: Pawe=C5=82 Gronowski <pawel.gronowski@docker.com>
-(cherry picked from commit 5282cb25d09db924fa92fdb8fb7a9bd20bb845b7)
-Signed-off-by: Pawe=C5=82 Gronowski <pawel.gronowski@docker.com>
-
-Upstream-Status: Backport from [https://github.com/moby/moby/commit/7ff4=
23cc1c991d8dc0a7b5d1d93e1cf3efaac169]
-CVE: CVE-2024-41110
-Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
----
- pkg/authorization/authz.go           |  6 ++---
- pkg/authorization/authz_unix_test.go | 35 ++++++++++++++++++++++++++++
- 2 files changed, 38 insertions(+), 3 deletions(-)
-
-diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go
-index 4c2e90b251..d568a2b597 100644
---- a/pkg/authorization/authz.go
-+++ b/pkg/authorization/authz.go
-@@ -57,11 +57,11 @@ type Ctx struct {
-=20
- func isChunked(r *http.Request) bool {
- 	// RFC 7230 specifies that content length is to be ignored if Transfer=
-Encoding is chunked
--	if strings.ToLower(r.Header.Get("Transfer-Encoding")) =3D=3D "chunked"=
 {
-+	if strings.EqualFold(r.Header.Get("Transfer-Encoding"), "chunked") {
- 		return true
- 	}
- 	for _, v :=3D range r.TransferEncoding {
--		if 0 =3D=3D strings.Compare(strings.ToLower(v), "chunked") {
-+		if strings.EqualFold(v, "chunked") {
- 			return true
- 		}
- 	}
-@@ -163,7 +163,7 @@ func drainBody(body io.ReadCloser) ([]byte, io.ReadC=
loser, error) {
-=20
- func isAuthEndpoint(urlPath string) (bool, error) {
- 	// eg www.test.com/v1.24/auth/optional?optional1=3Dsomething&optional2=
=3Dsomething (version optional)
--	matched, err :=3D regexp.MatchString(`^[^\/]+\/(v\d[\d\.]*\/)?auth.*`,=
 urlPath)
-+	matched, err :=3D regexp.MatchString(`^[^\/]*\/(v\d[\d\.]*\/)?auth.*`,=
 urlPath)
- 	if err !=3D nil {
- 		return false, err
- 	}
-diff --git a/pkg/authorization/authz_unix_test.go b/pkg/authorization/au=
thz_unix_test.go
-index 275f1dd3d0..66b4d20452 100644
---- a/pkg/authorization/authz_unix_test.go
-+++ b/pkg/authorization/authz_unix_test.go
-@@ -259,6 +259,41 @@ func TestSendBody(t *testing.T) {
- 				contentType: "application/json;charset=3DUTF8",
- 				expected:    false,
- 			},
-+			{
-+				url:         "www.nothing.com/v1.24/auth/test",
-+				contentType: "application/json;charset=3DUTF8",
-+				expected:    false,
-+			},
-+			{
-+				url:         "https://www.nothing.com/v1.24/auth/test",
-+				contentType: "application/json;charset=3DUTF8",
-+				expected:    false,
-+			},
-+			{
-+				url:         "http://nothing.com/v1.24/auth/test",
-+				contentType: "application/json;charset=3DUTF8",
-+				expected:    false,
-+			},
-+			{
-+				url:         "www.nothing.com/test?p1=3D/auth",
-+				contentType: "application/json;charset=3DUTF8",
-+				expected:    true,
-+			},
-+			{
-+				url:         "http://www.nothing.com/test?p1=3D/auth",
-+				contentType: "application/json;charset=3DUTF8",
-+				expected:    true,
-+			},
-+			{
-+				url:         "www.nothing.com/something/auth",
-+				contentType: "application/json;charset=3DUTF8",
-+				expected:    true,
-+			},
-+			{
-+				url:         "https://www.nothing.com/something/auth",
-+				contentType: "application/json;charset=3DUTF8",
-+				expected:    true,
-+			},
- 		}
- 	)
-=20
---=20
-2.44.4
-

--=20
2.52.0


