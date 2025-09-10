Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31650CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 14:14:32 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.19057.1757513663089156648
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 07:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Q48VKw9S;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7722c8d2694so5819720b3a.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Sep 2025 07:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1757513662; x=1758118462; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gIUAXxGh0fHHwJHPFgE/SGGFLrajDlubyzzM7m6HE9g=;
        b=Q48VKw9SG5EstBCbdIbhOUH+/EsyOJB687c4v8+WM0HOuoTSxmewzYVUcX/0WXuhhq
         /pMjfwPM1fvFTvO+yY6XtDMelqLn9I/ygT4uwfrsiIlnB3e253JTtNFg/WqWJDTIUSFl
         pwhsfGQz9ZRxi37ZoIY+1rFNC0bOe7pTKI+Ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757513662; x=1758118462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIUAXxGh0fHHwJHPFgE/SGGFLrajDlubyzzM7m6HE9g=;
        b=QQvQyDoXiJ5/KkkDEBSbqtZeGnVPufbp5vHJXYmEfSCCXheBOh5Cu7+YRmvvejA9VX
         0tvSmN/XycNuyhTj33pnX+2h3IeWlpA8SCx2d+Zr5ureMJe4L73mWIOHXBn3sHVeLJHV
         WxNX0IQWuKeuZhwjDCjeDw1r4EnauyCLkyZNuLzAJDLA3sS8sZMFZGhTtNGB8mXECJ6E
         CgcdY4VTViUnoNc0btxIytrFAfIn1nymybbSkKnyGJcUITUoOGqv2dXwqE9ixKFXDedx
         Ea/X4J/wvhpaguojHg1l7Qm4EoxtbJYCiXr/339kvADGnJxgZONbLG5niUZ85j4ceLAF
         C6/Q==
X-Gm-Message-State: AOJu0YzQKF50EjdvK773H2KTUTaqybCkYrtXJ7S1vBImeCmUw9oe/cVH
	QyGLfNWUTJy4c5B323Vv3Gn3d9QiVsT7c04hY800OECLmlgPKUltbj3ChGelZ2UzzJtn2HIXdfW
	Pq8PB
X-Gm-Gg: ASbGnctojyxVdTZsAJN72ibKvuMk7bq15do68HTn3ftSTbk3E7dvI8QNbT3KSlWh3hP
	p96fO3TMPLO+vcxXuAas8BI0YhGKrwxAurSv2Y0Qen7bOHGI8LowqdnY/fCoe5LvimCz87mtQtI
	cYsn0k1CjEnq7n9rx8PwAFOHJwexvGqxwZkj6Wc0sH6+om0qkjWbJHufD4haHkXN8SM/4OyCtrJ
	6BswIqAWqN4Yj2o9vAAQlU6ppNM2ILtl3ZepWf2fD2xH7oIiLJ4PoAdvGhZ3kpF3unXkys0nCfF
	m3gw2PzA55FSpGbYZZA3vnC+LtkADCnNw4CliaZdYTKaVk1UWDklMgIirthyNjm2zxDl3Q9JK/O
	REc1RvZ93ECmR2ARSHZo9JQKncGLRt8Xz
X-Google-Smtp-Source: AGHT+IEMk3YDDkcFnBud02L5gHAgu8+Ax0dAKkN85x0bV9GFy79Q7lo1CJhw/sfMElwrHh3QV04uQg==
X-Received: by 2002:a05:6a20:6a06:b0:245:fdeb:d273 with SMTP id adf61e73a8af0-2533d5fec8dmr23786251637.4.1757513662005;
        Wed, 10 Sep 2025 07:14:22 -0700 (PDT)
Received: from MVIN00016 ([150.129.170.191])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662f9e95sm5386849b3a.98.2025.09.10.07.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 07:14:21 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-virtualization][scarthgap][PATCH] docker-moby: fix CVE-2024-41110
Date: Wed, 10 Sep 2025 19:43:57 +0530
Message-ID: <20250910141357.267108-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Sep 2025 14:14:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9390

Upstream-Status: Backport from https://github.com/moby/moby/commit/fc274cd2ff4cf3b48c91697fb327dd1fb95588fb && https://github.com/moby/moby/commit/a79fabbfe84117696a19671f4aa88b82d0f64fc1

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 recipes-containers/docker/docker-moby_git.bb  |   2 +
 .../docker/files/CVE-2024-41110-001.patch     | 173 ++++++++++++++++++
 .../docker/files/CVE-2024-41110-002.patch     |  95 ++++++++++
 3 files changed, 270 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2024-41110-001.patch
 create mode 100644 recipes-containers/docker/files/CVE-2024-41110-002.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index d274b002..565925e2 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -58,6 +58,8 @@ SRC_URI = "\
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
         file://CVE-2024-36620.patch;patchdir=src/import \
         file://CVE-2024-36621.patch;patchdir=src/import \
+        file://CVE-2024-41110-001.patch;patchdir=src/import \
+        file://CVE-2024-41110-002.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2024-41110-001.patch b/recipes-containers/docker/files/CVE-2024-41110-001.patch
new file mode 100644
index 00000000..ed7c4628
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2024-41110-001.patch
@@ -0,0 +1,173 @@
+From fc274cd2ff4cf3b48c91697fb327dd1fb95588fb Mon Sep 17 00:00:00 2001
+From: Jameson Hyde <jameson.hyde@docker.com>
+Date: Mon, 26 Nov 2018 14:15:22 -0500
+Subject: [PATCH] Authz plugin security fixes for 0-length content and path
+ validation Signed-off-by: Jameson Hyde <jameson.hyde@docker.com>
+
+fix comments
+
+(cherry picked from commit 9659c3a52bac57e615b5fb49b0652baca448643e)
+Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
+Signed-off-by: Eli Uriegas <eli.uriegas@docker.com>
+
+CVE: CVE-2024-41110
+Upstream-Status: Backport [https://github.com/moby/moby/commit/fc274cd2ff4cf3b48c91697fb327dd1fb95588fb]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ pkg/authorization/authz.go           | 38 ++++++++++++++++++---
+ pkg/authorization/authz_unix_test.go | 49 ++++++++++++++++++++++++++--
+ 2 files changed, 80 insertions(+), 7 deletions(-)
+
+diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go
+index 1eb44315dd..6450f504af 100644
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
++	//RFC 7230 specifies that content length is to be ignored if Transfer-Encoding is chunked
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
+2.50.1
+
diff --git a/recipes-containers/docker/files/CVE-2024-41110-002.patch b/recipes-containers/docker/files/CVE-2024-41110-002.patch
new file mode 100644
index 00000000..7d8b572d
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2024-41110-002.patch
@@ -0,0 +1,95 @@
+From a79fabbfe84117696a19671f4aa88b82d0f64fc1 Mon Sep 17 00:00:00 2001
+From: Jameson Hyde <jameson.hyde@docker.com>
+Date: Sat, 1 Dec 2018 11:25:49 -0500
+Subject: [PATCH] If url includes scheme, urlPath will drop hostname, which
+ would not match the auth check
+
+Signed-off-by: Jameson Hyde <jameson.hyde@docker.com>
+(cherry picked from commit 754fb8d9d03895ae3ab60d2ad778152b0d835206)
+Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
+Signed-off-by: Eli Uriegas <eli.uriegas@docker.com>
+
+CVE: CVE-2024-41110
+Upstream-Status: Backport [https://github.com/moby/moby/commit/a79fabbfe84117696a19671f4aa88b82d0f64fc1]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ pkg/authorization/authz.go           |  6 ++---
+ pkg/authorization/authz_unix_test.go | 35 ++++++++++++++++++++++++++++
+ 2 files changed, 38 insertions(+), 3 deletions(-)
+
+diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go
+index 6450f504af..012aa7e487 100644
+--- a/pkg/authorization/authz.go
++++ b/pkg/authorization/authz.go
+@@ -57,11 +57,11 @@ type Ctx struct {
+ 
+ func isChunked(r *http.Request) bool {
+ 	//RFC 7230 specifies that content length is to be ignored if Transfer-Encoding is chunked
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
+2.50.1
+
-- 
2.50.1


