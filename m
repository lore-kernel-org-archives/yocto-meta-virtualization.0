Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B28ECD6CD
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 17:20:48 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24673.1770830444609486532
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 09:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VKqAvwDZ;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: sdoshi@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-824af5e5c81so19486b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Feb 2026 09:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1770830443; x=1771435243; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ciTx3hvLiYO/aPaxcvaEEzqd3JjcYDRBZ8++Nkw062Q=;
        b=VKqAvwDZcsBLXcinC65bavSmvAguUDcPpU/XzYbMunMRJAfmqNWax2sUOr/wTOFFWx
         Y2XokN69fHLytfwXexupUVdrl9VaEgkrvVS3SPBp2GU0xmftEWqrSD2h8nsk6mv7E5kK
         bMWVHCayzqO+KaimFstvTZ5YhklTCYrpRX73Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770830443; x=1771435243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciTx3hvLiYO/aPaxcvaEEzqd3JjcYDRBZ8++Nkw062Q=;
        b=iMU38fcezee6ZZ3Dp/YGVZy6FE+eytiFNP50BPz/MRQfywoQBlqF8LK4WqxtfGcnMG
         Aj/e288zHkQNhbiGwv5mpyc3ju+Ji/hL0p8U57Z3Fa2czkzQTb2jMq5eES1RqyM5PooP
         QWj+2DIXJgUWdljg5EfZfgWsU131ZexYrn0qmZLtQ2EVrEb0Rj3kSzMW/whJDBFQUKl6
         ai52vaBwG8p1uHYkwMKnpsklYK8yBzwvgORz1fd5da7mFdeW8XHH5YEZkV3jq7X1nI7c
         miQmxtmtZtNblIKJ29EH/XxHAejZ4l0bDwUQdovDWr7I6kEWxSh6OuwmUc2u8E3k5U/4
         uorQ==
X-Gm-Message-State: AOJu0YwBcAKmhfpAoat1rk3a9c/wJhTo1nSd8ubGSkkjLhkek5IRIqoU
	IKIBAbeEXfmyNjWqwUtEl8CDIEP+X4PyM8w5O56lcF2+OjIoe/FcAtJMUadSeomg0DohLDL5JG2
	gd+tD
X-Gm-Gg: AZuq6aJ3tYd2+Y3nRvJNYbZbZ4eGGWjcQM8IyN8FIrRDMz6bp+kE6jP2RIHK3Mx2n1A
	90OYwmEFcO4Onctr6HM9E/0o0IZyX91AG6aiZ0lzDNyz2X9QkSa/oKHrnrg9wR8ZPNN9qDTMKJz
	qurLnuSdEI93dfoLwB7ClIsL+V9W6tlFDCaCe6rmFUaYpIHwuTg8nT3h3RDNQQ3S6ZB9Qt3xE85
	wA3zRcDTs4UR/EOHFm3FnZcOPxdRMsVkdLd5dFPbUJE0kEj0DLQl8dQAyrKCx3YhK1E/YrWfTvh
	QF1mdLwqbjRoSDv8n/uf+7/5idjIAdtYVZKgpzPAh3b2Fl9s+uq2G0BMkCNg53d36SUwavz7GOI
	TL1AVUjWa/H0EsBdmIIpaAYwaVx6gMhGl/VkAtVcqWOjesUzS6G/whlw2OSgzwN8pekRdsG31q3
	jc9U/+oJvqxY5cvVkrbftWwJYoCGMoOcMB
X-Received: by 2002:a05:6a00:1a0b:b0:824:93e4:2de1 with SMTP id d2e1a72fcca58-8249fc58aefmr2138138b3a.30.1770830443095;
        Wed, 11 Feb 2026 09:20:43 -0800 (PST)
Received: from localhost.localdomain ([117.228.65.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3bd3bdsm2677406b3a.18.2026.02.11.09.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 09:20:42 -0800 (PST)
From: Siddharth <sdoshi@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [meta-virtualization][scarthgap][PATCHv2] docker-moby: Security fix for CVE-2024-41110
Date: Wed, 11 Feb 2026 22:50:34 +0530
Message-Id: <20260211172034.356576-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Feb 2026 17:20:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9578

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
index 1331930e..b1b2cbb5 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -59,6 +59,8 @@ SRC_URI = "\
         file://CVE-2024-36620.patch;patchdir=src/import \
         file://CVE-2024-36621.patch;patchdir=src/import \
         file://CVE-2024-29018.patch;patchdir=src/import \
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


