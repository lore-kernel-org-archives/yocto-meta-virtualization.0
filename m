Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94054C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 17:27:06 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.52275.1723483622936318654
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Aug 2024 10:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BFyfeHXU;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7a1e31bc1efso285362585a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Aug 2024 10:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723483622; x=1724088422; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+sHuDmku8F+0kdhXg1m9mE1ttOjloNbPyq0IA0GviaI=;
        b=BFyfeHXUg1wdt5ct0gVskCqUvAP4ED6u6a4NlUVBNVgz5Fups0czgKN7fBv2QzZjHS
         Zre7rLFRXyXLbHDnTNuTe4oNEdmMFK+etZHg5TT7CVZvwSonIE7WJSGu3xXlAOAOWd2T
         6DU7mhOuI7bULD9tFsSP1fIkBqHIvDLCV8PhykGKkgSYfHZsqrcdeWaZZH8s87jikhHu
         JWgAM2d2uTj79UKN4eXD5T6/ap5bgwBqV+w+T0qoLjEZtvrgRBy7fMaQINZdnPKrdd+7
         GJB2rIHWcuCFhutFgd2JPkY732jwS6YjLQ/bRILxEgGCNyYJVJhhf8JNjF2FllTSPuuD
         OzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723483622; x=1724088422;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+sHuDmku8F+0kdhXg1m9mE1ttOjloNbPyq0IA0GviaI=;
        b=I9Zx/RTgAJu1jFOr/Q66sxVuoyQxTCW1EGwJDusiEq2rq8WEYuEbzHJ8w2/2SxClCv
         x67Xf+5oxVMxAFhRyxTSDVPNfr/1jTcOQQBKRvQSOwiFAlfu8U1AXCnkYT3gVc/DZhTF
         WKl/q9Itk4Rym0vj62Ga3HH3dfCYQZhPirz6O7ErAzCOQu2fXdpbf8bUBgHeDtPXDxSV
         mFl/2CCW4BgU12N66KqzvEGfN0oauVXGIZi/eKcWW4xJV8PkNxqi5QVpdn7vUjDdHApU
         ABKdOFdCAxUOo+OI+50VCDOrx4gRMwwJyPmQv7YLSJr84E+9Fr2LbhVnQ9iNncqT2yxi
         2x3g==
X-Gm-Message-State: AOJu0YwvUqwPV+zT0rS/LUz2n3Z2rDzWZR9v1TzP7HGNzWJ27yztjWtJ
	YDGyMK8TBJeBug4/xrskgvfzybSIgZcmr5C/yEOpmGQcF1ergrKg
X-Google-Smtp-Source: AGHT+IHRkq43xkCUQo77NKv+WSXXXLrWeV/PP3zfJHf4aIgTbCzo008cmFznLWQvQWPkpiUyYmRPhw==
X-Received: by 2002:a05:620a:4547:b0:79f:606:5be8 with SMTP id af79cd13be357-7a4e15b8e82mr103283485a.46.1723483621724;
        Mon, 12 Aug 2024 10:27:01 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d62683sm264885185a.26.2024.08.12.10.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 10:27:01 -0700 (PDT)
Date: Mon, 12 Aug 2024 17:26:59 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: archana.polampalli@windriver.com
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][scarthgap][PATCH 1/1] docker-moby: fix
 CVE-2024-41110
Message-ID: <ZrpF4z0kSFu1jXNm@gmail.com>
References: <17E7DAAD2DCE80AD.13344@lists.yoctoproject.org>
 <DM8PR11MB5703A77B073D06D6F51C319684852@DM8PR11MB5703.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM8PR11MB5703A77B073D06D6F51C319684852@DM8PR11MB5703.namprd11.prod.outlook.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Aug 2024 17:27:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8860

In message: Re: [meta-virtualization][scarthgap][PATCH 1/1] docker-moby: fix CVE-2024-41110
on 12/08/2024 Polampalli, Archana via lists.yoctoproject.org wrote:

> Reminder!!

And a reminder that I only typically do updates and merging
in specific windows during a development cycle, that includes
CVEs.

Also, it doesn't look like you checked for a new 25.x -stable
version. I took a glance and it looks like upstream has dealt
with the issue on the 25.0 branch.

It is almost always preferable to update to a -stable to pickup a fix,
versus cherry picking a patch.

Bruce

> 
> Regards,
> Archana
> ________________________________
> From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.yoctoproject.org> on behalf of Polampalli, Archana via lists.yoctoproject.org <archana.polampalli=windriver.com@lists.yoctoproject.org>
> Sent: Friday, August 2, 2024 13:33
> To: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.yoctoproject.org>
> Subject: [meta-virtualization][scarthgap][PATCH 1/1] docker-moby: fix CVE-2024-41110
> 
> From: Archana Polampalli <archana.polampalli@windriver.com>
> 
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  recipes-containers/docker/docker-moby_git.bb  |   1 +
>  .../docker/files/CVE-2024-41110.patch         | 176 ++++++++++++++++++
>  2 files changed, 177 insertions(+)
>  create mode 100644 recipes-containers/docker/files/CVE-2024-41110.patch
> 
> diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
> index 0abb0b3f..706101d1 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -56,6 +56,7 @@ SRC_URI = "\
>          file://0001-libnetwork-use-GO-instead-of-go.patch \
>          file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
>          file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
> +        file://CVE-2024-41110.patch;patchdir=src/import \
>          "
> 
>  DOCKER_COMMIT = "${SRCREV_moby}"
> diff --git a/recipes-containers/docker/files/CVE-2024-41110.patch b/recipes-containers/docker/files/CVE-2024-41110.patch
> new file mode 100644
> index 00000000..6dd56a08
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2024-41110.patch
> @@ -0,0 +1,176 @@
> +From ccfe0a41d438053ee54f0478d3a77b090e40c379 Mon Sep 17 00:00:00 2001
> +From: Jameson Hyde <jameson.hyde@docker.com>
> +Date: Mon, 26 Nov 2018 14:15:22 -0500
> +Subject: [PATCH] Authz plugin security fixes for 0-length content and path
> + validation Signed-off-by: Jameson Hyde <jameson.hyde@docker.com>
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +fix comments
> +
> +(cherry picked from commit 9659c3a52bac57e615b5fb49b0652baca448643e)
> +Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
> +(cherry picked from commit 2ac8a479c53d9b8e67c55f1e283da9d85d2b3415)
> +Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
> +
> +CVE: CVE-2024-41110
> +Upstream-Status: Backport [https://github.com/moby/moby/commit/ccfe0a41d438053ee54f0478d3a77b090e40c379]
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + pkg/authorization/authz.go           | 38 ++++++++++++++++++---
> + pkg/authorization/authz_unix_test.go | 49 ++++++++++++++++++++++++++--
> + 2 files changed, 80 insertions(+), 7 deletions(-)
> +
> +diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go
> +index 1eb44315dd..4c2e90b251 100644
> +--- a/pkg/authorization/authz.go
> ++++ b/pkg/authorization/authz.go
> +@@ -8,6 +8,8 @@ import (
> +       "io"
> +       "mime"
> +       "net/http"
> ++      "net/url"
> ++      "regexp"
> +       "strings"
> +
> +       "github.com/containerd/log"
> +@@ -53,10 +55,23 @@ type Ctx struct {
> +       authReq *Request
> + }
> +
> ++func isChunked(r *http.Request) bool {
> ++      // RFC 7230 specifies that content length is to be ignored if Transfer-Encoding is chunked
> ++      if strings.ToLower(r.Header.Get("Transfer-Encoding")) == "chunked" {
> ++              return true
> ++      }
> ++      for _, v := range r.TransferEncoding {
> ++              if 0 == strings.Compare(strings.ToLower(v), "chunked") {
> ++                      return true
> ++              }
> ++      }
> ++      return false
> ++}
> ++
> + // AuthZRequest authorized the request to the docker daemon using authZ plugins
> + func (ctx *Ctx) AuthZRequest(w http.ResponseWriter, r *http.Request) error {
> +       var body []byte
> +-      if sendBody(ctx.requestURI, r.Header) && r.ContentLength > 0 && r.ContentLength < maxBodySize {
> ++      if sendBody(ctx.requestURI, r.Header) && (r.ContentLength > 0 || isChunked(r)) && r.ContentLength < maxBodySize {
> +               var err error
> +               body, r.Body, err = drainBody(r.Body)
> +               if err != nil {
> +@@ -109,7 +124,6 @@ func (ctx *Ctx) AuthZResponse(rm ResponseModifier, r *http.Request) error {
> +       if sendBody(ctx.requestURI, rm.Header()) {
> +               ctx.authReq.ResponseBody = rm.RawBody()
> +       }
> +-
> +       for _, plugin := range ctx.plugins {
> +               log.G(context.TODO()).Debugf("AuthZ response using plugin %s", plugin.Name())
> +
> +@@ -147,10 +161,26 @@ func drainBody(body io.ReadCloser) ([]byte, io.ReadCloser, error) {
> +       return nil, newBody, err
> + }
> +
> ++func isAuthEndpoint(urlPath string) (bool, error) {
> ++      // eg www.test.com/v1.24/auth/optional?optional1=something&optional2=something<http://www.test.com/v1.24/auth/optional?optional1=something&optional2=something> (version optional)
> ++      matched, err := regexp.MatchString(`^[^\/]+\/(v\d[\d\.]*\/)?auth.*`, urlPath)
> ++      if err != nil {
> ++              return false, err
> ++      }
> ++      return matched, nil
> ++}
> ++
> + // sendBody returns true when request/response body should be sent to AuthZPlugin
> +-func sendBody(url string, header http.Header) bool {
> ++func sendBody(inURL string, header http.Header) bool {
> ++      u, err := url.Parse(inURL)
> ++      // Assume no if the URL cannot be parsed - an empty request will still be forwarded to the plugin and should be rejected
> ++      if err != nil {
> ++              return false
> ++      }
> ++
> +       // Skip body for auth endpoint
> +-      if strings.HasSuffix(url, "/auth") {
> ++      isAuth, err := isAuthEndpoint(u.Path)
> ++      if isAuth || err != nil {
> +               return false
> +       }
> +
> +diff --git a/pkg/authorization/authz_unix_test.go b/pkg/authorization/authz_unix_test.go
> +index c9b18d96e9..275f1dd3d0 100644
> +--- a/pkg/authorization/authz_unix_test.go
> ++++ b/pkg/authorization/authz_unix_test.go
> +@@ -174,8 +174,8 @@ func TestDrainBody(t *testing.T) {
> +
> + func TestSendBody(t *testing.T) {
> +       var (
> +-              url       = "nothing.com"
> +               testcases = []struct {
> ++                      url         string
> +                       contentType string
> +                       expected    bool
> +               }{
> +@@ -219,15 +219,58 @@ func TestSendBody(t *testing.T) {
> +                               contentType: "",
> +                               expected:    false,
> +                       },
> ++                      {
> ++                              url:         "nothing.com/auth",
> ++                              contentType: "",
> ++                              expected:    false,
> ++                      },
> ++                      {
> ++                              url:         "nothing.com/auth",
> ++                              contentType: "application/json;charset=UTF8",
> ++                              expected:    false,
> ++                      },
> ++                      {
> ++                              url:         "nothing.com/auth?p1=test",
> ++                              contentType: "application/json;charset=UTF8",
> ++                              expected:    false,
> ++                      },
> ++                      {
> ++                              url:         "nothing.com/test?p1=/auth",
> ++                              contentType: "application/json;charset=UTF8",
> ++                              expected:    true,
> ++                      },
> ++                      {
> ++                              url:         "nothing.com/something/auth",
> ++                              contentType: "application/json;charset=UTF8",
> ++                              expected:    true,
> ++                      },
> ++                      {
> ++                              url:         "nothing.com/auth/test",
> ++                              contentType: "application/json;charset=UTF8",
> ++                              expected:    false,
> ++                      },
> ++                      {
> ++                              url:         "nothing.com/v1.24/auth/test",
> ++                              contentType: "application/json;charset=UTF8",
> ++                              expected:    false,
> ++                      },
> ++                      {
> ++                              url:         "nothing.com/v1/auth/test",
> ++                              contentType: "application/json;charset=UTF8",
> ++                              expected:    false,
> ++                      },
> +               }
> +       )
> +
> +       for _, testcase := range testcases {
> +               header := http.Header{}
> +               header.Set("Content-Type", testcase.contentType)
> ++              if testcase.url == "" {
> ++                      testcase.url = "nothing.com"
> ++              }
> +
> +-              if b := sendBody(url, header); b != testcase.expected {
> +-                      t.Fatalf("Unexpected Content-Type; Expected: %t, Actual: %t", testcase.expected, b)
> ++              if b := sendBody(testcase.url, header); b != testcase.expected {
> ++                      t.Fatalf("sendBody failed: url: %s, content-type: %s; Expected: %t, Actual: %t", testcase.url, testcase.contentType, testcase.expected, b)
> +               }
> +       }
> + }
> +--
> +2.40.0
> --
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8859): https://lists.yoctoproject.org/g/meta-virtualization/message/8859
> Mute This Topic: https://lists.yoctoproject.org/mt/107681589/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


