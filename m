Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA43CA1013
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 02:37:53 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.6744.1758249466548353047
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 19:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MHs+ACCm;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-80e33b9e2d3so155395985a.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Sep 2025 19:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758249465; x=1758854265; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qUKvMi6lddwiKSMD9+W/7l4PfxXCEmag7I27B96p7NI=;
        b=MHs+ACCmr7MsYy/+sbPPJl4sHaF7E3ITwe6MQ0o0G3FwtoDP6GtIQCBQ1ejwO1oVIL
         EDL1Uf+nnl9EPvUBKjdCEq9yeI0iBH89IFN0ZW5WF12NmkOPK1BshTcQq2gz25oXCZTf
         dOh9pcZF9pR6JW+YF3vuP+Dbwv+Kwh2cy2IfB7i5m68tm7cDocTrl6TEYZ56WChaAiqp
         7RISdDvYxSNRS9vF9V699teEdh2Fva1bXF6/MEMSDYXOmJlrc4HQHD57mqAKm9QHBNbN
         YxoYC5/qRPXdSByjrerNiUNokR4A0l47H6808Sd7em9RWyZe6y8W4CKwwW4ZiHN/b/za
         swkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758249465; x=1758854265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUKvMi6lddwiKSMD9+W/7l4PfxXCEmag7I27B96p7NI=;
        b=xT11QO4z7RIajdJZpR93IXbjYTds/W6Z/1qCcMEoKx9vfT0c0sx8jDg8PRkK/jH49T
         ZltwvQ7VY40zaj4v8sIXYqqemj7BwEmLqlE+jFrK4JaFfUju00CH9T6OdSjZFwXXzAvL
         s3bRZnfHGJjogoS6qneYG50XW3uqeFK6Xo0r5Chx1H8kg8oY/xZs+1cUSHgVeJpApSsg
         dharaJ6xXfpkXz0blMoWRpk8sntTtA379Xt4zggaUsosWoPgnqdBcXPl+dZ7UDeT1Sm3
         IBK6I+7J7DKNLRQRGNYfMNDdgqPTcdq3F8tk7rRCXvu+SvpaeZFb+qwz3K50T03ntE2l
         zjIQ==
X-Gm-Message-State: AOJu0YxW83ANWdWs4ba/1R9Ob+X9jmW44xX3+OaDs0N8/Xl5TtmliFtV
	P3fLLoNcR6I+Egtj5eSLqS6hrN5byu7tFRaDOGMLXG1RAH/wIbT24BmkaEegh/o0HWY=
X-Gm-Gg: ASbGncs+Wr5SE1p1P2uNJ5cTIA9lrabMI3k3nd9nQbDHyTcTeuMVhqRc+SGq1eU4TKR
	CLi1vTP9TgtHq5g9jxAdFcYOuZoCkMXB6Tjiy97XrRg0yPkArystGwf3dNRQkofG5pNL9EOAGt3
	tj/DzPVFHKlG4VMJiLMgnfofL0+RrVD6wsw0fdmnFom6NkZu8QHtmMRighTpXDC7vQno/lRe40c
	oUXMETRKnynpYR9EYu+O4iYibPPYDY6VPCVR1MeJx3Ij3ex/S7SEBIbIScTA9XFHTZ96OUhSR/n
	kQf4EWIP3cqWwQSC7SKAi004JTpU83+Ez8E0nXSfkjHvCbfFpT9ScgzCsycdjjqRhiQSjfU/+gF
	F1etDxjsvxwbJTRJtbJOlEo91GUgdBsdfqheY4FgL+SBELvVg6GIAAWZIjR69wrggNWkzsSV/kR
	yMNW9iTVjwFnqUWbFR1NfkP88wIBp7JkRSuyGqXiaUFpYPrwm0bPQ=
X-Google-Smtp-Source: AGHT+IHeFKCFBIftTBDhXltZndlu6Skx+HndpOD5oMjI19FqtPH/K+t0h4cU0jXf4esC6QY/kQsoBA==
X-Received: by 2002:a05:620a:2996:b0:813:31ad:bf34 with SMTP id af79cd13be357-83bab4702f7mr240384885a.51.1758249465281;
        Thu, 18 Sep 2025 19:37:45 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8363198b184sm263389885a.51.2025.09.18.19.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 19:37:44 -0700 (PDT)
Date: Thu, 18 Sep 2025 22:37:43 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH] docker-moby: fix
 CVE-2024-41110
Message-ID: <aMzB92SypOpZS4BI@gmail.com>
References: <20250910141357.267108-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910141357.267108-1-hprajapati@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Sep 2025 02:37:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9404

In message: [meta-virtualization][scarthgap][PATCH] docker-moby: fix CVE-2024-41110
on 10/09/2025 Hitendra Prajapati wrote:

> Upstream-Status: Backport from https://github.com/moby/moby/commit/fc274cd2ff4cf3b48c91697fb327dd1fb95588fb && https://github.com/moby/moby/commit/a79fabbfe84117696a19671f4aa88b82d0f64fc1

It is much more useful to indicate which release those
commits are from.

I can't find a branch that contains them, so I'm not
inclined to take them. A quick check on the link shows
a message that agrees with my local git checks:

"This commit does not belong to any branch on this repository, and may belong to a fork outside of the repository."

A backport implies it is part of a release .. this doesn't appear to be the case here.

Bruce

> 
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  recipes-containers/docker/docker-moby_git.bb  |   2 +
>  .../docker/files/CVE-2024-41110-001.patch     | 173 ++++++++++++++++++
>  .../docker/files/CVE-2024-41110-002.patch     |  95 ++++++++++
>  3 files changed, 270 insertions(+)
>  create mode 100644 recipes-containers/docker/files/CVE-2024-41110-001.patch
>  create mode 100644 recipes-containers/docker/files/CVE-2024-41110-002.patch
> 
> diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
> index d274b002..565925e2 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -58,6 +58,8 @@ SRC_URI = "\
>          file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
>          file://CVE-2024-36620.patch;patchdir=src/import \
>          file://CVE-2024-36621.patch;patchdir=src/import \
> +        file://CVE-2024-41110-001.patch;patchdir=src/import \
> +        file://CVE-2024-41110-002.patch;patchdir=src/import \
>  	"
>  
>  DOCKER_COMMIT = "${SRCREV_moby}"
> diff --git a/recipes-containers/docker/files/CVE-2024-41110-001.patch b/recipes-containers/docker/files/CVE-2024-41110-001.patch
> new file mode 100644
> index 00000000..ed7c4628
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2024-41110-001.patch
> @@ -0,0 +1,173 @@
> +From fc274cd2ff4cf3b48c91697fb327dd1fb95588fb Mon Sep 17 00:00:00 2001
> +From: Jameson Hyde <jameson.hyde@docker.com>
> +Date: Mon, 26 Nov 2018 14:15:22 -0500
> +Subject: [PATCH] Authz plugin security fixes for 0-length content and path
> + validation Signed-off-by: Jameson Hyde <jameson.hyde@docker.com>
> +
> +fix comments
> +
> +(cherry picked from commit 9659c3a52bac57e615b5fb49b0652baca448643e)
> +Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
> +Signed-off-by: Eli Uriegas <eli.uriegas@docker.com>
> +
> +CVE: CVE-2024-41110
> +Upstream-Status: Backport [https://github.com/moby/moby/commit/fc274cd2ff4cf3b48c91697fb327dd1fb95588fb]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + pkg/authorization/authz.go           | 38 ++++++++++++++++++---
> + pkg/authorization/authz_unix_test.go | 49 ++++++++++++++++++++++++++--
> + 2 files changed, 80 insertions(+), 7 deletions(-)
> +
> +diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go
> +index 1eb44315dd..6450f504af 100644
> +--- a/pkg/authorization/authz.go
> ++++ b/pkg/authorization/authz.go
> +@@ -8,6 +8,8 @@ import (
> + 	"io"
> + 	"mime"
> + 	"net/http"
> ++	"net/url"
> ++	"regexp"
> + 	"strings"
> + 
> + 	"github.com/containerd/log"
> +@@ -53,10 +55,23 @@ type Ctx struct {
> + 	authReq *Request
> + }
> + 
> ++func isChunked(r *http.Request) bool {
> ++	//RFC 7230 specifies that content length is to be ignored if Transfer-Encoding is chunked
> ++	if strings.ToLower(r.Header.Get("Transfer-Encoding")) == "chunked" {
> ++		return true
> ++	}
> ++	for _, v := range r.TransferEncoding {
> ++		if 0 == strings.Compare(strings.ToLower(v), "chunked") {
> ++			return true
> ++		}
> ++	}
> ++	return false
> ++}
> ++
> + // AuthZRequest authorized the request to the docker daemon using authZ plugins
> + func (ctx *Ctx) AuthZRequest(w http.ResponseWriter, r *http.Request) error {
> + 	var body []byte
> +-	if sendBody(ctx.requestURI, r.Header) && r.ContentLength > 0 && r.ContentLength < maxBodySize {
> ++	if sendBody(ctx.requestURI, r.Header) && (r.ContentLength > 0 || isChunked(r)) && r.ContentLength < maxBodySize {
> + 		var err error
> + 		body, r.Body, err = drainBody(r.Body)
> + 		if err != nil {
> +@@ -109,7 +124,6 @@ func (ctx *Ctx) AuthZResponse(rm ResponseModifier, r *http.Request) error {
> + 	if sendBody(ctx.requestURI, rm.Header()) {
> + 		ctx.authReq.ResponseBody = rm.RawBody()
> + 	}
> +-
> + 	for _, plugin := range ctx.plugins {
> + 		log.G(context.TODO()).Debugf("AuthZ response using plugin %s", plugin.Name())
> + 
> +@@ -147,10 +161,26 @@ func drainBody(body io.ReadCloser) ([]byte, io.ReadCloser, error) {
> + 	return nil, newBody, err
> + }
> + 
> ++func isAuthEndpoint(urlPath string) (bool, error) {
> ++	// eg www.test.com/v1.24/auth/optional?optional1=something&optional2=something (version optional)
> ++	matched, err := regexp.MatchString(`^[^\/]+\/(v\d[\d\.]*\/)?auth.*`, urlPath)
> ++	if err != nil {
> ++		return false, err
> ++	}
> ++	return matched, nil
> ++}
> ++
> + // sendBody returns true when request/response body should be sent to AuthZPlugin
> +-func sendBody(url string, header http.Header) bool {
> ++func sendBody(inURL string, header http.Header) bool {
> ++	u, err := url.Parse(inURL)
> ++	// Assume no if the URL cannot be parsed - an empty request will still be forwarded to the plugin and should be rejected
> ++	if err != nil {
> ++		return false
> ++	}
> ++
> + 	// Skip body for auth endpoint
> +-	if strings.HasSuffix(url, "/auth") {
> ++	isAuth, err := isAuthEndpoint(u.Path)
> ++	if isAuth || err != nil {
> + 		return false
> + 	}
> + 
> +diff --git a/pkg/authorization/authz_unix_test.go b/pkg/authorization/authz_unix_test.go
> +index c9b18d96e9..275f1dd3d0 100644
> +--- a/pkg/authorization/authz_unix_test.go
> ++++ b/pkg/authorization/authz_unix_test.go
> +@@ -174,8 +174,8 @@ func TestDrainBody(t *testing.T) {
> + 
> + func TestSendBody(t *testing.T) {
> + 	var (
> +-		url       = "nothing.com"
> + 		testcases = []struct {
> ++			url         string
> + 			contentType string
> + 			expected    bool
> + 		}{
> +@@ -219,15 +219,58 @@ func TestSendBody(t *testing.T) {
> + 				contentType: "",
> + 				expected:    false,
> + 			},
> ++			{
> ++				url:         "nothing.com/auth",
> ++				contentType: "",
> ++				expected:    false,
> ++			},
> ++			{
> ++				url:         "nothing.com/auth",
> ++				contentType: "application/json;charset=UTF8",
> ++				expected:    false,
> ++			},
> ++			{
> ++				url:         "nothing.com/auth?p1=test",
> ++				contentType: "application/json;charset=UTF8",
> ++				expected:    false,
> ++			},
> ++			{
> ++				url:         "nothing.com/test?p1=/auth",
> ++				contentType: "application/json;charset=UTF8",
> ++				expected:    true,
> ++			},
> ++			{
> ++				url:         "nothing.com/something/auth",
> ++				contentType: "application/json;charset=UTF8",
> ++				expected:    true,
> ++			},
> ++			{
> ++				url:         "nothing.com/auth/test",
> ++				contentType: "application/json;charset=UTF8",
> ++				expected:    false,
> ++			},
> ++			{
> ++				url:         "nothing.com/v1.24/auth/test",
> ++				contentType: "application/json;charset=UTF8",
> ++				expected:    false,
> ++			},
> ++			{
> ++				url:         "nothing.com/v1/auth/test",
> ++				contentType: "application/json;charset=UTF8",
> ++				expected:    false,
> ++			},
> + 		}
> + 	)
> + 
> + 	for _, testcase := range testcases {
> + 		header := http.Header{}
> + 		header.Set("Content-Type", testcase.contentType)
> ++		if testcase.url == "" {
> ++			testcase.url = "nothing.com"
> ++		}
> + 
> +-		if b := sendBody(url, header); b != testcase.expected {
> +-			t.Fatalf("Unexpected Content-Type; Expected: %t, Actual: %t", testcase.expected, b)
> ++		if b := sendBody(testcase.url, header); b != testcase.expected {
> ++			t.Fatalf("sendBody failed: url: %s, content-type: %s; Expected: %t, Actual: %t", testcase.url, testcase.contentType, testcase.expected, b)
> + 		}
> + 	}
> + }
> +-- 
> +2.50.1
> +
> diff --git a/recipes-containers/docker/files/CVE-2024-41110-002.patch b/recipes-containers/docker/files/CVE-2024-41110-002.patch
> new file mode 100644
> index 00000000..7d8b572d
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2024-41110-002.patch
> @@ -0,0 +1,95 @@
> +From a79fabbfe84117696a19671f4aa88b82d0f64fc1 Mon Sep 17 00:00:00 2001
> +From: Jameson Hyde <jameson.hyde@docker.com>
> +Date: Sat, 1 Dec 2018 11:25:49 -0500
> +Subject: [PATCH] If url includes scheme, urlPath will drop hostname, which
> + would not match the auth check
> +
> +Signed-off-by: Jameson Hyde <jameson.hyde@docker.com>
> +(cherry picked from commit 754fb8d9d03895ae3ab60d2ad778152b0d835206)
> +Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
> +Signed-off-by: Eli Uriegas <eli.uriegas@docker.com>
> +
> +CVE: CVE-2024-41110
> +Upstream-Status: Backport [https://github.com/moby/moby/commit/a79fabbfe84117696a19671f4aa88b82d0f64fc1]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + pkg/authorization/authz.go           |  6 ++---
> + pkg/authorization/authz_unix_test.go | 35 ++++++++++++++++++++++++++++
> + 2 files changed, 38 insertions(+), 3 deletions(-)
> +
> +diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go
> +index 6450f504af..012aa7e487 100644
> +--- a/pkg/authorization/authz.go
> ++++ b/pkg/authorization/authz.go
> +@@ -57,11 +57,11 @@ type Ctx struct {
> + 
> + func isChunked(r *http.Request) bool {
> + 	//RFC 7230 specifies that content length is to be ignored if Transfer-Encoding is chunked
> +-	if strings.ToLower(r.Header.Get("Transfer-Encoding")) == "chunked" {
> ++	if strings.EqualFold(r.Header.Get("Transfer-Encoding"), "chunked") {
> + 		return true
> + 	}
> + 	for _, v := range r.TransferEncoding {
> +-		if 0 == strings.Compare(strings.ToLower(v), "chunked") {
> ++		if strings.EqualFold(v, "chunked") {
> + 			return true
> + 		}
> + 	}
> +@@ -163,7 +163,7 @@ func drainBody(body io.ReadCloser) ([]byte, io.ReadCloser, error) {
> + 
> + func isAuthEndpoint(urlPath string) (bool, error) {
> + 	// eg www.test.com/v1.24/auth/optional?optional1=something&optional2=something (version optional)
> +-	matched, err := regexp.MatchString(`^[^\/]+\/(v\d[\d\.]*\/)?auth.*`, urlPath)
> ++	matched, err := regexp.MatchString(`^[^\/]*\/(v\d[\d\.]*\/)?auth.*`, urlPath)
> + 	if err != nil {
> + 		return false, err
> + 	}
> +diff --git a/pkg/authorization/authz_unix_test.go b/pkg/authorization/authz_unix_test.go
> +index 275f1dd3d0..66b4d20452 100644
> +--- a/pkg/authorization/authz_unix_test.go
> ++++ b/pkg/authorization/authz_unix_test.go
> +@@ -259,6 +259,41 @@ func TestSendBody(t *testing.T) {
> + 				contentType: "application/json;charset=UTF8",
> + 				expected:    false,
> + 			},
> ++			{
> ++				url:         "www.nothing.com/v1.24/auth/test",
> ++				contentType: "application/json;charset=UTF8",
> ++				expected:    false,
> ++			},
> ++			{
> ++				url:         "https://www.nothing.com/v1.24/auth/test",
> ++				contentType: "application/json;charset=UTF8",
> ++				expected:    false,
> ++			},
> ++			{
> ++				url:         "http://nothing.com/v1.24/auth/test",
> ++				contentType: "application/json;charset=UTF8",
> ++				expected:    false,
> ++			},
> ++			{
> ++				url:         "www.nothing.com/test?p1=/auth",
> ++				contentType: "application/json;charset=UTF8",
> ++				expected:    true,
> ++			},
> ++			{
> ++				url:         "http://www.nothing.com/test?p1=/auth",
> ++				contentType: "application/json;charset=UTF8",
> ++				expected:    true,
> ++			},
> ++			{
> ++				url:         "www.nothing.com/something/auth",
> ++				contentType: "application/json;charset=UTF8",
> ++				expected:    true,
> ++			},
> ++			{
> ++				url:         "https://www.nothing.com/something/auth",
> ++				contentType: "application/json;charset=UTF8",
> ++				expected:    true,
> ++			},
> + 		}
> + 	)
> + 
> +-- 
> +2.50.1
> +
> -- 
> 2.50.1
> 

