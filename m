Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.639.1576026649365738408
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 17:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OHdreIab;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B800E01146; Tue, 10 Dec 2019 17:10:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.208.65 listed in list.dnswl.org]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36694E010DA
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 17:10:43 -0800 (PST)
Received: by mail-ed1-f65.google.com with SMTP id r21so7196155edq.0
        for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 17:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dwvjqx1Xk6I6GWPXaJMEiXmmW8ySbxGhF2ezhe631Ew=;
        b=OHdreIab9nUXkNrI5nsP1wJ5XbF8MHrY224a3FJ6CUz2mfhSggR4Jbs8CjU7wH9cpV
         /H0iMvA1adUHkEgH0HR5c9OmnM4l2g9sgjmkLTimnaxbWg/AUkq16eg7INz7dP5zzYu/
         bnrJTEprIez4EsQLHJLkwKlka7Z3Abn11Aao1CImgsDfkTTx0y1EXX2aMth+h6plAn/I
         Bc3bTw5/a5nRRtHbifizqZdf+3hfu705Hu9ksRx/FEldPPaLT0s60wqHlLIOxphzWk+g
         SxlKfC1pnqu7hwhNbwCuPfaqoIKwoMOK5BamKdJu2yngIDOKW7MEpKYHmsb3oN0HlYA3
         yfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dwvjqx1Xk6I6GWPXaJMEiXmmW8ySbxGhF2ezhe631Ew=;
        b=ahRHg3aXU3QJ1lkxCxqHn1JYRAUKm1hkGC9lkbnjcX5sxDP8CkDjvrrh5JhbwVFj6V
         OZwjUywSYUEn5TtXJDMaaP9jri63r+UbR/JyycL7j22qTzmCVFkiFPqJYDKPZ/QZ6SjG
         LORTaGqEcZDtrKBPXfd87fDppeniRRqriY6miHaV8ueb2NgMNjpL1myrLH5D/GHsgDMw
         pCVqA5uNWMNF2DvBdKWU6xlvlEjM16VFIMqxyFZkLi2gMWQEjTD3oV6s68FOw5Uk1dHJ
         mXTTVCt6M8AAq4Ad3tc/R49CzLPASEMRWeksb1y5+RHnToljvzTV1CfhX1oY6N1Zgqjc
         rkZw==
X-Gm-Message-State: APjAAAX6l3eJ9iJCwIZeB9LF6sVeJr7Gi44p5fcSQodJN5MlwhVSs4DL
	WekTW+idvzp5f7Js5ommbfpstAVkkxopY0VrkXA=
X-Google-Smtp-Source: APXvYqzUaAfwvZfB6TlZyPuL/nd13dxFGYBR+mS/sQOZeygY9bpVCLHGqFkC9UOf/qCaLKpylsgZwhNWdV2FKDmpcio=
X-Received: by 2002:aa7:ca54:: with SMTP id j20mr543921edt.179.1576026641345;
 Tue, 10 Dec 2019 17:10:41 -0800 (PST)
MIME-Version: 1.0
References: <20191209081100.17430-1-Qi.Chen@windriver.com> <1E2B2391-309B-4469-91F6-584291361490@linux.intel.com>
In-Reply-To: <1E2B2391-309B-4469-91F6-584291361490@linux.intel.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 10 Dec 2019 20:10:29 -0500
Message-ID: <CADkTA4O_r2KxQz3R1ED5piQR-uJWzbAXFEEoe-Yfo9QdUvBRNA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH V2 1/2] go: add back 1.12 version to avoid compilation failure
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: Chen Qi <Qi.Chen@windriver.com>, 
	meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 10, 2019 at 8:08 PM Tim Orling
<timothy.t.orling@linux.intel.com> wrote:
>
> Kubernetes 1.17 is now released which can be built with go1.13.4+
> https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.17.md#dependencies
>

Thanks Tim!

I'm doing the 1.17 upgrade now, and will revert/drop the go 1.12 patch
once I've tested the build.

Bruce

> I have just now submitted a patch to oe-core to upgrade to go1.13.5
> https://patchwork.openembedded.org/patch/167900/
>
> On Dec 9, 2019, at 12:10 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
>
> go 1.12 was removed from oe-core, but currently k8s cannot
> be built successfully with go 1.13. See link below.
>
>  https://github.com/kubernetes/kubernetes/issues/82531
>
> We need to wait for k8s to support go 1.13 and update it
> to latest release, as well as its depedencies. Before this
> is done, add back go 1.12 and use it.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
> recipes-containers/kubernetes/go-1.12.inc     |  24 ++
> ...ow-CC-and-CXX-to-have-multiple-words.patch |  31 ++
> ...o1.12-security-net-textproto-don-t-n.patch | 163 ++++++++++
> ...ent-based-hash-generation-less-pedan.patch | 218 ++++++++++++++
> ...-to-be-overridden-in-the-environment.patch |  48 +++
> ...4-ld-add-soname-to-shareable-objects.patch |  45 +++
> ...de-CC-when-building-dist-and-go_boot.patch |  37 +++
> ...dist-separate-host-and-target-builds.patch | 282 ++++++++++++++++++
> ...d-go-make-GOROOT-precious-by-default.patch | 106 +++++++
> ...008-use-GOBUILDMODE-to-set-buildmode.patch |  37 +++
> ...place-glibc-dynamic-linker-with-musl.patch | 112 +++++++
> recipes-containers/kubernetes/go-common.inc   |  32 ++
> .../kubernetes/go-cross-canadian.inc          |  66 ++++
> .../kubernetes/go-cross-canadian_1.12.bb      |   2 +
> recipes-containers/kubernetes/go-cross.inc    |  62 ++++
> .../kubernetes/go-cross_1.12.bb               |   2 +
> recipes-containers/kubernetes/go-crosssdk.inc |  50 ++++
> .../kubernetes/go-crosssdk_1.12.bb            |   2 +
> recipes-containers/kubernetes/go-native.inc   |  55 ++++
> .../kubernetes/go-native_1.12.bb              |   2 +
> recipes-containers/kubernetes/go-runtime.inc  |  96 ++++++
> .../kubernetes/go-runtime_1.12.bb             |   2 +
> recipes-containers/kubernetes/go-target.inc   |  54 ++++
> recipes-containers/kubernetes/go_1.12.bb      |  14 +
> 24 files changed, 1542 insertions(+)
> create mode 100644 recipes-containers/kubernetes/go-1.12.inc
> create mode 100644 recipes-containers/kubernetes/go-1.12/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> create mode 100644 recipes-containers/kubernetes/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
> create mode 100644 recipes-containers/kubernetes/go-1.12/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> create mode 100644 recipes-containers/kubernetes/go-1.12/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> create mode 100644 recipes-containers/kubernetes/go-1.12/0004-ld-add-soname-to-shareable-objects.patch
> create mode 100644 recipes-containers/kubernetes/go-1.12/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> create mode 100644 recipes-containers/kubernetes/go-1.12/0006-cmd-dist-separate-host-and-target-builds.patch
> create mode 100644 recipes-containers/kubernetes/go-1.12/0007-cmd-go-make-GOROOT-precious-by-default.patch
> create mode 100644 recipes-containers/kubernetes/go-1.12/0008-use-GOBUILDMODE-to-set-buildmode.patch
> create mode 100644 recipes-containers/kubernetes/go-1.12/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
> create mode 100644 recipes-containers/kubernetes/go-common.inc
> create mode 100644 recipes-containers/kubernetes/go-cross-canadian.inc
> create mode 100644 recipes-containers/kubernetes/go-cross-canadian_1.12.bb
> create mode 100644 recipes-containers/kubernetes/go-cross.inc
> create mode 100644 recipes-containers/kubernetes/go-cross_1.12.bb
> create mode 100644 recipes-containers/kubernetes/go-crosssdk.inc
> create mode 100644 recipes-containers/kubernetes/go-crosssdk_1.12.bb
> create mode 100644 recipes-containers/kubernetes/go-native.inc
> create mode 100644 recipes-containers/kubernetes/go-native_1.12.bb
> create mode 100644 recipes-containers/kubernetes/go-runtime.inc
> create mode 100644 recipes-containers/kubernetes/go-runtime_1.12.bb
> create mode 100644 recipes-containers/kubernetes/go-target.inc
> create mode 100644 recipes-containers/kubernetes/go_1.12.bb
>
> diff --git a/recipes-containers/kubernetes/go-1.12.inc b/recipes-containers/kubernetes/go-1.12.inc
> new file mode 100644
> index 0000000..ed14b17
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-1.12.inc
> @@ -0,0 +1,24 @@
> +require go-common.inc
> +
> +GO_BASEVERSION = "1.12"
> +GO_MINOR = ".9"
> +PV .= "${GO_MINOR}"
> +FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> +
> +SRC_URI += "\
> +    file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
> +    file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch \
> +    file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
> +    file://0004-ld-add-soname-to-shareable-objects.patch \
> +    file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
> +    file://0006-cmd-dist-separate-host-and-target-builds.patch \
> +    file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
> +    file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
> +    file://0001-release-branch.go1.12-security-net-textproto-don-t-n.patch \
> +"
> +SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
> +
> +SRC_URI[main.md5sum] = "6132109d4050da349eadc9f7b0304ef4"
> +SRC_URI[main.sha256sum] = "ab0e56ed9c4732a653ed22e232652709afbf573e710f56a07f7fdeca578d62fc"
> diff --git a/recipes-containers/kubernetes/go-1.12/0001-allow-CC-and-CXX-to-have-multiple-words.patch b/recipes-containers/kubernetes/go-1.12/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> new file mode 100644
> index 0000000..4442858
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-1.12/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> @@ -0,0 +1,31 @@
> +From 7cc519aa5f84cf8fc7ac8c10fc69aa8040330ea0 Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Mon, 19 Feb 2018 08:49:33 -0800
> +Subject: [PATCH] allow CC and CXX to have multiple words
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Matt Madison <matt@madison.systems>
> +
> +---
> + src/cmd/go/internal/envcmd/env.go | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
> +index afadbad..cedbfbf 100644
> +--- a/src/cmd/go/internal/envcmd/env.go
> ++++ b/src/cmd/go/internal/envcmd/env.go
> +@@ -85,11 +85,11 @@ func MkEnv() []cfg.EnvVar {
> +
> + cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
> + if env := strings.Fields(os.Getenv("CC")); len(env) > 0 {
> +- cc = env[0]
> ++ cc = strings.Join(env, " ")
> + }
> + cxx := cfg.DefaultCXX(cfg.Goos, cfg.Goarch)
> + if env := strings.Fields(os.Getenv("CXX")); len(env) > 0 {
> +- cxx = env[0]
> ++ cxx = strings.Join(env, " ")
> + }
> + env = append(env, cfg.EnvVar{Name: "CC", Value: cc})
> + env = append(env, cfg.EnvVar{Name: "CXX", Value: cxx})
> diff --git a/recipes-containers/kubernetes/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch b/recipes-containers/kubernetes/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
> new file mode 100644
> index 0000000..7b39dbd
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
> @@ -0,0 +1,163 @@
> +From 265b691ac440bfb711d8de323346f7d72e620efe Mon Sep 17 00:00:00 2001
> +From: Filippo Valsorda <filippo@golang.org>
> +Date: Thu, 12 Sep 2019 12:37:36 -0400
> +Subject: [PATCH] [release-branch.go1.12-security] net/textproto: don't
> + normalize headers with spaces before the colon
> +
> +RFC 7230 is clear about headers with a space before the colon, like
> +
> +X-Answer : 42
> +
> +being invalid, but we've been accepting and normalizing them for compatibility
> +purposes since CL 5690059 in 2012.
> +
> +On the client side, this is harmless and indeed most browsers behave the same
> +to this day. On the server side, this becomes a security issue when the
> +behavior doesn't match that of a reverse proxy sitting in front of the server.
> +
> +For example, if a WAF accepts them without normalizing them, it might be
> +possible to bypass its filters, because the Go server would interpret the
> +header differently. Worse, if the reverse proxy coalesces requests onto a
> +single HTTP/1.1 connection to a Go server, the understanding of the request
> +boundaries can get out of sync between them, allowing an attacker to tack an
> +arbitrary method and path onto a request by other clients, including
> +authentication headers unknown to the attacker.
> +
> +This was recently presented at multiple security conferences:
> +https://portswigger.net/blog/http-desync-attacks-request-smuggling-reborn
> +
> +net/http servers already reject header keys with invalid characters.
> +Simply stop normalizing extra spaces in net/textproto, let it return them
> +unchanged like it does for other invalid headers, and let net/http enforce
> +RFC 7230, which is HTTP specific. This loses us normalization on the client
> +side, but there's no right answer on the client side anyway, and hiding the
> +issue sounds worse than letting the application decide.
> +
> +Fixes CVE-2019-16276
> +
> +Change-Id: I6d272de827e0870da85d93df770d6a0e161bbcf1
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/549719
> +Reviewed-by: Brad Fitzpatrick <bradfitz@google.com>
> +(cherry picked from commit 1280b868e82bf173ea3e988be3092d160ee66082)
> +Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/558776
> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
> +
> +CVE: CVE-2019-16276
> +
> +Upstream-Status: Backport [https://github.com/golang/go/commit/6e6f4aaf70c8b1cc81e65a26332aa9409de03ad8]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/net/http/serve_test.go       |  4 ++++
> + src/net/http/transport_test.go   | 27 +++++++++++++++++++++++++++
> + src/net/textproto/reader.go      | 10 ++--------
> + src/net/textproto/reader_test.go | 13 ++++++-------
> + 4 files changed, 39 insertions(+), 15 deletions(-)
> +
> +diff --git a/src/net/http/serve_test.go b/src/net/http/serve_test.go
> +index 6eb0088a96..89bfdfbb82 100644
> +--- a/src/net/http/serve_test.go
> ++++ b/src/net/http/serve_test.go
> +@@ -4748,6 +4748,10 @@ func TestServerValidatesHeaders(t *testing.T) {
> + {"foo\xffbar: foo\r\n", 400},                         // binary in header
> + {"foo\x00bar: foo\r\n", 400},                         // binary in header
> + {"Foo: " + strings.Repeat("x", 1<<21) + "\r\n", 431}, // header too large
> ++ // Spaces between the header key and colon are not allowed.
> ++ // See RFC 7230, Section 3.2.4.
> ++ {"Foo : bar\r\n", 400},
> ++ {"Foo\t: bar\r\n", 400},
> +
> + {"foo: foo foo\r\n", 200},    // LWS space is okay
> + {"foo: foo\tfoo\r\n", 200},   // LWS tab is okay
> +diff --git a/src/net/http/transport_test.go b/src/net/http/transport_test.go
> +index 5c329543e2..5e5438a708 100644
> +--- a/src/net/http/transport_test.go
> ++++ b/src/net/http/transport_test.go
> +@@ -5133,3 +5133,30 @@ func TestTransportIgnores408(t *testing.T) {
> + }
> + t.Fatalf("timeout after %v waiting for Transport connections to die off", time.Since(t0))
> + }
> ++
> ++func TestInvalidHeaderResponse(t *testing.T) {
> ++ setParallel(t)
> ++ defer afterTest(t)
> ++ cst := newClientServerTest(t, h1Mode, HandlerFunc(func(w ResponseWriter, r *Request) {
> ++ conn, buf, _ := w.(Hijacker).Hijack()
> ++ buf.Write([]byte("HTTP/1.1 200 OK\r\n" +
> ++ "Date: Wed, 30 Aug 2017 19:09:27 GMT\r\n" +
> ++ "Content-Type: text/html; charset=utf-8\r\n" +
> ++ "Content-Length: 0\r\n" +
> ++ "Foo : bar\r\n\r\n"))
> ++ buf.Flush()
> ++ conn.Close()
> ++ }))
> ++ defer cst.close()
> ++ res, err := cst.c.Get(cst.ts.URL)
> ++ if err != nil {
> ++ t.Fatal(err)
> ++ }
> ++ defer res.Body.Close()
> ++ if v := res.Header.Get("Foo"); v != "" {
> ++ t.Errorf(`unexpected "Foo" header: %q`, v)
> ++ }
> ++ if v := res.Header.Get("Foo "); v != "bar" {
> ++ t.Errorf(`bad "Foo " header value: %q, want %q`, v, "bar")
> ++ }
> ++}
> +diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
> +index 2c4f25d5ae..1a5e364cf7 100644
> +--- a/src/net/textproto/reader.go
> ++++ b/src/net/textproto/reader.go
> +@@ -493,18 +493,12 @@ func (r *Reader) ReadMIMEHeader() (MIMEHeader, error) {
> + return m, err
> + }
> +
> +- // Key ends at first colon; should not have trailing spaces
> +- // but they appear in the wild, violating specs, so we remove
> +- // them if present.
> ++ // Key ends at first colon.
> + i := bytes.IndexByte(kv, ':')
> + if i < 0 {
> + return m, ProtocolError("malformed MIME header line: " + string(kv))
> + }
> +- endKey := i
> +- for endKey > 0 && kv[endKey-1] == ' ' {
> +- endKey--
> +- }
> +- key := canonicalMIMEHeaderKey(kv[:endKey])
> ++ key := canonicalMIMEHeaderKey(kv[:i])
> +
> + // As per RFC 7230 field-name is a token, tokens consist of one or more chars.
> + // We could return a ProtocolError here, but better to be liberal in what we
> +diff --git a/src/net/textproto/reader_test.go b/src/net/textproto/reader_test.go
> +index f85fbdc36d..b92fdcd3c7 100644
> +--- a/src/net/textproto/reader_test.go
> ++++ b/src/net/textproto/reader_test.go
> +@@ -188,11 +188,10 @@ func TestLargeReadMIMEHeader(t *testing.T) {
> + }
> + }
> +
> +-// Test that we read slightly-bogus MIME headers seen in the wild,
> +-// with spaces before colons, and spaces in keys.
> ++// TestReadMIMEHeaderNonCompliant checks that we don't normalize headers
> ++// with spaces before colons, and accept spaces in keys.
> + func TestReadMIMEHeaderNonCompliant(t *testing.T) {
> +- // Invalid HTTP response header as sent by an Axis security
> +- // camera: (this is handled by IE, Firefox, Chrome, curl, etc.)
> ++ // These invalid headers will be rejected by net/http according to RFC 7230.
> + r := reader("Foo: bar\r\n" +
> + "Content-Language: en\r\n" +
> + "SID : 0\r\n" +
> +@@ -202,9 +201,9 @@ func TestReadMIMEHeaderNonCompliant(t *testing.T) {
> + want := MIMEHeader{
> + "Foo":              {"bar"},
> + "Content-Language": {"en"},
> +- "Sid":              {"0"},
> +- "Audio Mode":       {"None"},
> +- "Privilege":        {"127"},
> ++ "SID ":             {"0"},
> ++ "Audio Mode ":      {"None"},
> ++ "Privilege ":       {"127"},
> + }
> + if !reflect.DeepEqual(m, want) || err != nil {
> + t.Fatalf("ReadMIMEHeader =\n%v, %v; want:\n%v", m, err, want)
> diff --git a/recipes-containers/kubernetes/go-1.12/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch b/recipes-containers/kubernetes/go-1.12/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> new file mode 100644
> index 0000000..66b8561
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-1.12/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> @@ -0,0 +1,218 @@
> +From 47db69e20ed66fb62b01affd83d829654b829893 Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Mon, 19 Feb 2018 08:50:59 -0800
> +Subject: [PATCH] cmd/go: make content-based hash generation less pedantic
> +
> +Go 1.10's build tool now uses content-based hashes to
> +determine when something should be built or re-built.
> +This same mechanism is used to maintain a built-artifact
> +cache for speeding up builds.
> +
> +However, the hashes it generates include information that
> +doesn't work well with OE, nor with using a shared runtime
> +library.
> +
> +First, it embeds path names to source files, unless
> +building within GOROOT.  This prevents the building
> +of a package in GOPATH for later staging into GOROOT.
> +
> +This patch adds support for the environment variable
> +GOPATH_OMIT_IN_ACTIONID.  If present, path name
> +embedding is disabled.
> +
> +Second, if cgo is enabled, the build ID for cgo-related
> +packages will include the current value of the environment
> +variables for invoking the compiler (CC, CXX, FC) and
> +any CGO_xxFLAGS variables.  Only if the settings used
> +during a compilation exactly match, character for character,
> +the values used for compiling runtime/cgo or any other
> +cgo-enabled package being imported, will the tool
> +decide that the imported package is up-to-date.
> +
> +This is done to help ensure correctness, but is overly
> +simplistic and effectively prevents the reuse of built
> +artifacts that use cgo (or shared runtime, which includes
> +runtime/cgo).
> +
> +This patch filters out all compiler flags except those
> +beginning with '-m'.  The default behavior can be restored
> +by setting the CGO_PEDANTIC environment variable.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Matt Madison <matt@madison.systems>
> +
> +---
> + src/cmd/go/internal/envcmd/env.go |  2 +-
> + src/cmd/go/internal/work/exec.go  | 63 ++++++++++++++++++++++---------
> + 2 files changed, 46 insertions(+), 19 deletions(-)
> +
> +diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
> +index cedbfbf..5763a0d 100644
> +--- a/src/cmd/go/internal/envcmd/env.go
> ++++ b/src/cmd/go/internal/envcmd/env.go
> +@@ -128,7 +128,7 @@ func ExtraEnvVars() []cfg.EnvVar {
> + func ExtraEnvVarsCostly() []cfg.EnvVar {
> + var b work.Builder
> + b.Init()
> +- cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{})
> ++ cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{}, false)
> + if err != nil {
> + // Should not happen - b.CFlags was given an empty package.
> + fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
> +diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
> +index 12e1527..e41bfac 100644
> +--- a/src/cmd/go/internal/work/exec.go
> ++++ b/src/cmd/go/internal/work/exec.go
> +@@ -174,6 +174,8 @@ func (b *Builder) Do(root *Action) {
> + wg.Wait()
> + }
> +
> ++var omitGopath = os.Getenv("GOPATH_OMIT_IN_ACTIONID") != ""
> ++
> + // buildActionID computes the action ID for a build action.
> + func (b *Builder) buildActionID(a *Action) cache.ActionID {
> + p := a.Package
> +@@ -190,7 +192,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
> + // but it does not hide the exact value of $GOPATH.
> + // Include the full dir in that case.
> + // Assume b.WorkDir is being trimmed properly.
> +- if !p.Goroot && !strings.HasPrefix(p.Dir, b.WorkDir) {
> ++ if !p.Goroot && !omitGopath && !strings.HasPrefix(p.Dir, b.WorkDir) {
> + fmt.Fprintf(h, "dir %s\n", p.Dir)
> + }
> + fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
> +@@ -201,13 +203,13 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
> + }
> + if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
> + fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
> +- cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p)
> +- fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(), cppflags, cflags, ldflags)
> ++ cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
> ++ fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(true), cppflags, cflags, ldflags)
> + if len(p.CXXFiles)+len(p.SwigFiles) > 0 {
> +- fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(), cxxflags)
> ++ fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(true), cxxflags)
> + }
> + if len(p.FFiles) > 0 {
> +- fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(), fflags)
> ++ fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(true), fflags)
> + }
> + // TODO(rsc): Should we include the SWIG version or Fortran/GCC/G++/Objective-C compiler versions?
> + }
> +@@ -2096,33 +2098,33 @@ var (
> + // gccCmd returns a gcc command line prefix
> + // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
> + func (b *Builder) GccCmd(incdir, workdir string) []string {
> +- return b.compilerCmd(b.ccExe(), incdir, workdir)
> ++ return b.compilerCmd(b.ccExe(false), incdir, workdir)
> + }
> +
> + // gxxCmd returns a g++ command line prefix
> + // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
> + func (b *Builder) GxxCmd(incdir, workdir string) []string {
> +- return b.compilerCmd(b.cxxExe(), incdir, workdir)
> ++ return b.compilerCmd(b.cxxExe(false), incdir, workdir)
> + }
> +
> + // gfortranCmd returns a gfortran command line prefix.
> + func (b *Builder) gfortranCmd(incdir, workdir string) []string {
> +- return b.compilerCmd(b.fcExe(), incdir, workdir)
> ++ return b.compilerCmd(b.fcExe(false), incdir, workdir)
> + }
> +
> + // ccExe returns the CC compiler setting without all the extra flags we add implicitly.
> +-func (b *Builder) ccExe() []string {
> +- return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch))
> ++func (b *Builder) ccExe(filtered bool) []string {
> ++ return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch), filtered)
> + }
> +
> + // cxxExe returns the CXX compiler setting without all the extra flags we add implicitly.
> +-func (b *Builder) cxxExe() []string {
> +- return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, cfg.Goarch))
> ++func (b *Builder) cxxExe(filtered bool) []string {
> ++ return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, cfg.Goarch), filtered)
> + }
> +
> + // fcExe returns the FC compiler setting without all the extra flags we add implicitly.
> +-func (b *Builder) fcExe() []string {
> +- return b.compilerExe(os.Getenv("FC"), "gfortran")
> ++func (b *Builder) fcExe(filtered bool) []string {
> ++ return b.compilerExe(os.Getenv("FC"), "gfortran", filtered)
> + }
> +
> + // compilerExe returns the compiler to use given an
> +@@ -2131,11 +2133,14 @@ func (b *Builder) fcExe() []string {
> + // of the compiler but can have additional arguments if they
> + // were present in the environment value.
> + // For example if CC="gcc -DGOPHER" then the result is ["gcc", "-DGOPHER"].
> +-func (b *Builder) compilerExe(envValue string, def string) []string {
> ++func (b *Builder) compilerExe(envValue string, def string, filtered bool) []string {
> + compiler := strings.Fields(envValue)
> + if len(compiler) == 0 {
> + compiler = []string{def}
> + }
> ++ if filtered {
> ++ return append(compiler[0:1], filterCompilerFlags(compiler[1:])...)
> ++ }
> + return compiler
> + }
> +
> +@@ -2285,8 +2290,23 @@ func envList(key, def string) []string {
> + return strings.Fields(v)
> + }
> +
> ++var filterFlags = os.Getenv("CGO_PEDANTIC") == ""
> ++
> ++func filterCompilerFlags(flags []string) []string {
> ++ var newflags []string
> ++ if !filterFlags {
> ++ return flags
> ++ }
> ++ for _, flag := range flags {
> ++ if strings.HasPrefix(flag, "-m") {
> ++ newflags = append(newflags, flag)
> ++ }
> ++ }
> ++ return newflags
> ++}
> ++
> + // CFlags returns the flags to use when invoking the C, C++ or Fortran compilers, or cgo.
> +-func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, ldflags []string, err error) {
> ++func (b *Builder) CFlags(p *load.Package, filtered bool) (cppflags, cflags, cxxflags, fflags, ldflags []string, err error) {
> + defaults := "-g -O2"
> +
> + if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
> +@@ -2304,6 +2324,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
> + if ldflags, err = buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
> + return
> + }
> ++ if filtered {
> ++ cppflags = filterCompilerFlags(cppflags)
> ++ cflags = filterCompilerFlags(cflags)
> ++ cxxflags = filterCompilerFlags(cxxflags)
> ++ fflags = filterCompilerFlags(fflags)
> ++ ldflags = filterCompilerFlags(ldflags)
> ++ }
> +
> + return
> + }
> +@@ -2319,7 +2346,7 @@ var cgoRe = regexp.MustCompile(`[/\\:]`)
> +
> + func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
> + p := a.Package
> +- cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p)
> ++ cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p, false)
> + if err != nil {
> + return nil, nil, err
> + }
> +@@ -2679,7 +2706,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
> +
> + // Run SWIG on one SWIG input file.
> + func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
> +- cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p)
> ++ cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p, false)
> + if err != nil {
> + return "", "", err
> + }
> diff --git a/recipes-containers/kubernetes/go-1.12/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/recipes-containers/kubernetes/go-1.12/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> new file mode 100644
> index 0000000..b6ca40e
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-1.12/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> @@ -0,0 +1,48 @@
> +From 5c32c38bf19b24f0aadd78012d17ff5caa82151e Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Sat, 17 Feb 2018 05:24:20 -0800
> +Subject: [PATCH] allow GOTOOLDIR to be overridden in the environment
> +
> +to allow for split host/target build roots
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Matt Madison <matt@madison.systems>
> +
> +---
> + src/cmd/dist/build.go          | 4 +++-
> + src/cmd/go/internal/cfg/cfg.go | 7 +++++--
> + 2 files changed, 8 insertions(+), 3 deletions(-)
> +
> +Index: go/src/cmd/dist/build.go
> +===================================================================
> +--- go.orig/src/cmd/dist/build.go
> ++++ go/src/cmd/dist/build.go
> +@@ -228,7 +228,9 @@ func xinit() {
> + workdir = xworkdir()
> + xatexit(rmworkdir)
> +
> +- tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
> ++ if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
> ++ tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
> ++ }
> + }
> +
> + // compilerEnv returns a map from "goos/goarch" to the
> +Index: go/src/cmd/go/internal/cfg/cfg.go
> +===================================================================
> +--- go.orig/src/cmd/go/internal/cfg/cfg.go
> ++++ go/src/cmd/go/internal/cfg/cfg.go
> +@@ -116,7 +116,11 @@ func init() {
> + // variables. This matches the initialization of ToolDir in
> + // go/build, except for using GOROOT rather than
> + // runtime.GOROOT.
> +- build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
> ++ if s := os.Getenv("GOTOOLDIR"); s != "" {
> ++ build.ToolDir = filepath.Clean(s)
> ++ } else {
> ++ build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
> ++ }
> + }
> + }
> +
> diff --git a/recipes-containers/kubernetes/go-1.12/0004-ld-add-soname-to-shareable-objects.patch b/recipes-containers/kubernetes/go-1.12/0004-ld-add-soname-to-shareable-objects.patch
> new file mode 100644
> index 0000000..004a33a
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-1.12/0004-ld-add-soname-to-shareable-objects.patch
> @@ -0,0 +1,45 @@
> +From 55eb8c95a89f32aec16b7764e78e8cf75169dc81 Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Sat, 17 Feb 2018 06:26:10 -0800
> +Subject: [PATCH] ld: add soname to shareable objects
> +
> +so that OE's shared library dependency handling
> +can find them.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Matt Madison <matt@madison.systems>
> +
> +---
> + src/cmd/link/internal/ld/lib.go | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
> +index 220aab3..703925f 100644
> +--- a/src/cmd/link/internal/ld/lib.go
> ++++ b/src/cmd/link/internal/ld/lib.go
> +@@ -1135,6 +1135,7 @@ func (ctxt *Link) hostlink() {
> + argv = append(argv, "-Wl,-z,relro")
> + }
> + argv = append(argv, "-shared")
> ++ argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
> + if ctxt.HeadType != objabi.Hwindows {
> + // Pass -z nodelete to mark the shared library as
> + // non-closeable: a dlclose will do nothing.
> +@@ -1146,6 +1147,8 @@ func (ctxt *Link) hostlink() {
> + argv = append(argv, "-Wl,-z,relro")
> + }
> + argv = append(argv, "-shared")
> ++ argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
> ++
> + case BuildModePlugin:
> + if ctxt.HeadType == objabi.Hdarwin {
> + argv = append(argv, "-dynamiclib")
> +@@ -1154,6 +1157,7 @@ func (ctxt *Link) hostlink() {
> + argv = append(argv, "-Wl,-z,relro")
> + }
> + argv = append(argv, "-shared")
> ++ argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
> + }
> + }
> +
> diff --git a/recipes-containers/kubernetes/go-1.12/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/recipes-containers/kubernetes/go-1.12/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> new file mode 100644
> index 0000000..ace8de9
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-1.12/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> @@ -0,0 +1,37 @@
> +From 1bf15aa8fb773604b2524cfdab493fa4d8fa9285 Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Sat, 17 Feb 2018 06:32:45 -0800
> +Subject: [PATCH] make.bash: override CC when building dist and go_bootstrap
> +
> +for handling OE cross-canadian builds.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Matt Madison <matt@madison.systems>
> +
> +---
> + src/make.bash | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/make.bash b/src/make.bash
> +index 78882d9..25943d0 100755
> +--- a/src/make.bash
> ++++ b/src/make.bash
> +@@ -163,7 +163,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
> + exit 1
> + fi
> + rm -f cmd/dist/dist
> +-GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> ++CC="${BUILD_CC:-${CC}}" GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> +
> + # -e doesn't propagate out of eval, so check success by hand.
> + eval $(./cmd/dist/dist env -p || echo FAIL=true)
> +@@ -194,7 +194,7 @@ fi
> + # Run dist bootstrap to complete make.bash.
> + # Bootstrap installs a proper cmd/dist, built with the new toolchain.
> + # Throw ours, built with Go 1.4, away after bootstrap.
> +-./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
> ++CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
> + rm -f ./cmd/dist/dist
> +
> + # DO NOT ADD ANY NEW CODE HERE.
> diff --git a/recipes-containers/kubernetes/go-1.12/0006-cmd-dist-separate-host-and-target-builds.patch b/recipes-containers/kubernetes/go-1.12/0006-cmd-dist-separate-host-and-target-builds.patch
> new file mode 100644
> index 0000000..0c0d5da
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-1.12/0006-cmd-dist-separate-host-and-target-builds.patch
> @@ -0,0 +1,282 @@
> +From fe0fcaf43ef3aab81541dad2a71b46254dc4cf6a Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Sat, 17 Feb 2018 10:03:48 -0800
> +Subject: [PATCH] cmd/dist: separate host and target builds
> +
> +Change the dist tool to allow for OE-style cross-
> +and cross-canadian builds:
> +
> + - command flags --host-only and --target only are added;
> +   if one is present, the other changes mentioned below
> +   take effect, and arguments may also be specified on
> +   the command line to enumerate the package(s) to be
> +   built.
> +
> + - for OE cross builds, go_bootstrap is always built for
> +   the current build host, and is moved, along with the supporting
> +   toolchain (asm, compile, etc.) to a separate 'native_native'
> +   directory under GOROOT/pkg/tool.
> +
> + - go_bootstrap is not automatically removed after the build,
> +   so it can be reused later (e.g., building both static and
> +   shared runtime).
> +
> +Note that for --host-only builds, it would be nice to specify
> +just the "cmd" package to build only the go commands/tools,
> +the staleness checks in the dist tool will fail if the "std"
> +library has not also been built.  So host-only builds have to
> +build everything anyway.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Matt Madison <matt@madison.systems>
> +
> +more dist cleanup
> +
> +---
> + src/cmd/dist/build.go | 153 ++++++++++++++++++++++++++++++------------
> + 1 file changed, 111 insertions(+), 42 deletions(-)
> +
> +Index: go/src/cmd/dist/build.go
> +===================================================================
> +--- go.orig/src/cmd/dist/build.go
> ++++ go/src/cmd/dist/build.go
> +@@ -39,6 +39,7 @@ var (
> + goldflags        string
> + workdir          string
> + tooldir          string
> ++ build_tooldir string
> + oldgoos          string
> + oldgoarch        string
> + exe              string
> +@@ -50,6 +51,7 @@ var (
> +
> + rebuildall   bool
> + defaultclang bool
> ++ crossBuild   bool
> +
> + vflag int // verbosity
> + )
> +@@ -231,6 +233,8 @@ func xinit() {
> + if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
> + tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
> + }
> ++ build_tooldir = pathf("%s/pkg/tool/native_native", goroot)
> ++
> + }
> +
> + // compilerEnv returns a map from "goos/goarch" to the
> +@@ -260,7 +264,6 @@ func compilerEnv(envName, def string) ma
> + if gohostos != goos || gohostarch != goarch {
> + m[gohostos+"/"+gohostarch] = m[""]
> + }
> +- m[""] = env
> + }
> +
> + for _, goos := range okgoos {
> +@@ -487,8 +490,10 @@ func setup() {
> + // We keep it in pkg/, just like the object directory above.
> + if rebuildall {
> + xremoveall(tooldir)
> ++ xremoveall(build_tooldir)
> + }
> + xmkdirall(tooldir)
> ++ xmkdirall(build_tooldir)
> +
> + // Remove tool binaries from before the tool/gohostos_gohostarch
> + xremoveall(pathf("%s/bin/tool", goroot))
> +@@ -1155,11 +1160,29 @@ func cmdbootstrap() {
> +
> + var noBanner bool
> + var debug bool
> ++ var hostOnly bool
> ++ var targetOnly bool
> ++ var toBuild = []string { "std", "cmd" }
> ++
> + flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
> + flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap process")
> + flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print banner")
> ++ flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host binaries, not target")
> ++ flag.BoolVar(&targetOnly, "target-only", targetOnly, "build only target binaries, not host")
> +
> +- xflagparse(0)
> ++ xflagparse(-1)
> ++
> ++ if (hostOnly && targetOnly) {
> ++ fatalf("specify only one of --host-only or --target-only\n")
> ++ }
> ++ crossBuild = hostOnly || targetOnly
> ++ if flag.NArg() > 0 {
> ++ if crossBuild {
> ++ toBuild = flag.Args()
> ++ } else {
> ++ fatalf("package names not permitted without --host-only or --target-only\n")
> ++ }
> ++ }
> +
> + if debug {
> + // cmd/buildid is used in debug mode.
> +@@ -1207,8 +1230,13 @@ func cmdbootstrap() {
> + xprintf("\n")
> + }
> +
> +- gogcflags = os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now
> +- goldflags = os.Getenv("GO_LDFLAGS")
> ++ // For split host/target cross/cross-canadian builds, we don't
> ++ // want to be setting these flags until after we have compiled
> ++ // the toolchain that runs on the build host.
> ++ if ! crossBuild {
> ++ gogcflags = os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now
> ++ goldflags = os.Getenv("GO_LDFLAGS")
> ++ }
> + goBootstrap := pathf("%s/go_bootstrap", tooldir)
> + cmdGo := pathf("%s/go", gobin)
> + if debug {
> +@@ -1237,7 +1265,11 @@ func cmdbootstrap() {
> + xprintf("\n")
> + }
> + xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
> +- os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> ++ if crossBuild {
> ++ os.Setenv("CC", defaultcc[""])
> ++ } else {
> ++ os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> ++ }
> + goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
> + if debug {
> + run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
> +@@ -1274,50 +1306,84 @@ func cmdbootstrap() {
> + }
> + checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
> +
> +- if goos == oldgoos && goarch == oldgoarch {
> +- // Common case - not setting up for cross-compilation.
> +- timelog("build", "toolchain")
> +- if vflag > 0 {
> +- xprintf("\n")
> ++ if crossBuild {
> ++ gogcflags = os.Getenv("GO_GCFLAGS")
> ++ goldflags = os.Getenv("GO_LDFLAGS")
> ++ tool_files, _ := filepath.Glob(pathf("%s/*", tooldir))
> ++ for _, f := range tool_files {
> ++ copyfile(pathf("%s/%s", build_tooldir, filepath.Base(f)), f, writeExec)
> ++ xremove(f)
> ++ }
> ++ os.Setenv("GOTOOLDIR", build_tooldir)
> ++ goBootstrap = pathf("%s/go_bootstrap", build_tooldir)
> ++ if hostOnly {
> ++ timelog("build", "host toolchain")
> ++ if vflag > 0 {
> ++ xprintf("\n")
> ++ }
> ++ xprintf("Building %s for host, %s/%s.\n", strings.Join(toBuild, ","), goos, goarch)
> ++ goInstall(goBootstrap, toBuild...)
> ++ checkNotStale(goBootstrap, toBuild...)
> ++ // Skip cmdGo staleness checks here, since we can't necessarily run the cmdGo binary
> ++
> ++ timelog("build", "target toolchain")
> ++ if vflag > 0 {
> ++ xprintf("\n")
> ++ }
> ++ } else if targetOnly {
> ++ goos = oldgoos
> ++ goarch = oldgoarch
> ++ os.Setenv("GOOS", goos)
> ++ os.Setenv("GOARCH", goarch)
> ++ os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> ++ xprintf("Building %s for target, %s/%s.\n", strings.Join(toBuild, ","), goos, goarch)
> ++ goInstall(goBootstrap, toBuild...)
> ++ checkNotStale(goBootstrap, toBuild...)
> ++ // Skip cmdGo staleness checks here, since we can't run the target's cmdGo binary
> + }
> +- xprintf("Building packages and commands for %s/%s.\n", goos, goarch)
> + } else {
> +- // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
> +- // Finish GOHOSTOS/GOHOSTARCH installation and then
> +- // run GOOS/GOARCH installation.
> +- timelog("build", "host toolchain")
> +- if vflag > 0 {
> +- xprintf("\n")
> ++
> ++ if goos == oldgoos && goarch == oldgoarch {
> ++ // Common case - not setting up for cross-compilation.
> ++ timelog("build", "toolchain")
> ++ if vflag > 0 {
> ++ xprintf("\n")
> ++ }
> ++ xprintf("Building packages and commands for %s/%s.\n", goos, goarch)
> ++ } else {
> ++ // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
> ++ // Finish GOHOSTOS/GOHOSTARCH installation and then
> ++ // run GOOS/GOARCH installation.
> ++ timelog("build", "host toolchain")
> ++ if vflag > 0 {
> ++ xprintf("\n")
> ++ }
> ++ xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
> ++ goInstall(goBootstrap, "std", "cmd")
> ++ checkNotStale(goBootstrap, "std", "cmd")
> ++ checkNotStale(cmdGo, "std", "cmd")
> ++
> ++ timelog("build", "target toolchain")
> ++ if vflag > 0 {
> ++ xprintf("\n")
> ++ }
> ++ goos = oldgoos
> ++ goarch = oldgoarch
> ++ os.Setenv("GOOS", goos)
> ++ os.Setenv("GOARCH", goarch)
> ++ os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> ++ xprintf("Building packages and commands for target, %s/%s.\n", goos, goarch)
> + }
> +- xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
> + goInstall(goBootstrap, "std", "cmd")
> + checkNotStale(goBootstrap, "std", "cmd")
> + checkNotStale(cmdGo, "std", "cmd")
> +
> +- timelog("build", "target toolchain")
> +- if vflag > 0 {
> +- xprintf("\n")
> +- }
> +- goos = oldgoos
> +- goarch = oldgoarch
> +- os.Setenv("GOOS", goos)
> +- os.Setenv("GOARCH", goarch)
> +- os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> +- xprintf("Building packages and commands for target, %s/%s.\n", goos, goarch)
> +- }
> +- targets := []string{"std", "cmd"}
> +- if goos == "js" && goarch == "wasm" {
> +- // Skip the cmd tools for js/wasm. They're not usable.
> +- targets = targets[:1]
> +- }
> +- goInstall(goBootstrap, targets...)
> +- checkNotStale(goBootstrap, targets...)
> +- checkNotStale(cmdGo, targets...)
> +- if debug {
> +- run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
> +- run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
> +- checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
> +- copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
> ++ if debug {
> ++ run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
> ++ run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
> ++ checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
> ++ copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
> ++ }
> + }
> +
> + // Check that there are no new files in $GOROOT/bin other than
> +@@ -1335,7 +1401,11 @@ func cmdbootstrap() {
> + }
> +
> + // Remove go_bootstrap now that we're done.
> +- xremove(pathf("%s/go_bootstrap", tooldir))
> ++ // Except that for split host/target cross-builds, we need to
> ++ // keep it.
> ++ if ! crossBuild {
> ++ xremove(pathf("%s/go_bootstrap", tooldir))
> ++ }
> +
> + // Print trailing banner unless instructed otherwise.
> + if !noBanner {
> diff --git a/recipes-containers/kubernetes/go-1.12/0007-cmd-go-make-GOROOT-precious-by-default.patch b/recipes-containers/kubernetes/go-1.12/0007-cmd-go-make-GOROOT-precious-by-default.patch
> new file mode 100644
> index 0000000..29ef947
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-1.12/0007-cmd-go-make-GOROOT-precious-by-default.patch
> @@ -0,0 +1,106 @@
> +From 7cc60b3887be2d5674b9f5d422d022976cf205e5 Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Fri, 2 Mar 2018 06:00:20 -0800
> +Subject: [PATCH] cmd/go: make GOROOT precious by default
> +
> +The go build tool normally rebuilds whatever it detects is
> +stale.  This can be a problem when GOROOT is intended to
> +be read-only and the go runtime has been built as a shared
> +library, since we don't want every application to be rebuilding
> +the shared runtime - particularly in cross-build/packaging
> +setups, since that would lead to 'abi mismatch' runtime errors.
> +
> +This patch prevents the install and linkshared actions from
> +installing to GOROOT unless overridden with the GOROOT_OVERRIDE
> +environment variable.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Matt Madison <matt@madison.systems>
> +
> +---
> + src/cmd/go/internal/work/action.go |  3 +++
> + src/cmd/go/internal/work/build.go  |  5 +++++
> + src/cmd/go/internal/work/exec.go   | 25 +++++++++++++++++++++++++
> + 3 files changed, 33 insertions(+)
> +
> +Index: go/src/cmd/go/internal/work/action.go
> +===================================================================
> +--- go.orig/src/cmd/go/internal/work/action.go
> ++++ go/src/cmd/go/internal/work/action.go
> +@@ -600,6 +600,9 @@ func (b *Builder) addTransitiveLinkDeps(
> + if p1 == nil || p1.Shlib == "" || haveShlib[filepath.Base(p1.Shlib)] {
> + continue
> + }
> ++ if goRootPrecious && (p1.Standard || p1.Goroot) {
> ++ continue
> ++ }
> + haveShlib[filepath.Base(p1.Shlib)] = true
> + // TODO(rsc): The use of ModeInstall here is suspect, but if we only do ModeBuild,
> + // we'll end up building an overall library or executable that depends at runtime
> +Index: go/src/cmd/go/internal/work/build.go
> +===================================================================
> +--- go.orig/src/cmd/go/internal/work/build.go
> ++++ go/src/cmd/go/internal/work/build.go
> +@@ -147,6 +147,7 @@ See also: go install, go get, go clean.
> + }
> +
> + const concurrentGCBackendCompilationEnabledByDefault = true
> ++var goRootPrecious bool = true
> +
> + func init() {
> + // break init cycle
> +@@ -160,6 +161,10 @@ func init() {
> +
> + AddBuildFlags(CmdBuild)
> + AddBuildFlags(CmdInstall)
> ++
> ++ if x := os.Getenv("GOROOT_OVERRIDE"); x != "" {
> ++ goRootPrecious = false
> ++ }
> + }
> +
> + // Note that flags consulted by other parts of the code
> +Index: go/src/cmd/go/internal/work/exec.go
> +===================================================================
> +--- go.orig/src/cmd/go/internal/work/exec.go
> ++++ go/src/cmd/go/internal/work/exec.go
> +@@ -436,6 +436,23 @@ func (b *Builder) build(a *Action) (err
> + return fmt.Errorf("missing or invalid binary-only package; expected file %q", a.Package.Target)
> + }
> +
> ++ if goRootPrecious && (a.Package.Standard || a.Package.Goroot) {
> ++ _, err := os.Stat(a.Package.Target)
> ++ if err == nil {
> ++ a.built = a.Package.Target
> ++ a.Target = a.Package.Target
> ++ a.buildID = b.fileHash(a.Package.Target)
> ++ a.Package.Stale = false
> ++ a.Package.StaleReason = "GOROOT-resident package"
> ++ return nil
> ++ }
> ++ a.Package.Stale = true
> ++ a.Package.StaleReason = "missing or invalid GOROOT-resident package"
> ++ if b.IsCmdList {
> ++ return nil
> ++ }
> ++ }
> ++
> + if err := b.Mkdir(a.Objdir); err != nil {
> + return err
> + }
> +@@ -1438,6 +1455,14 @@ func BuildInstallFunc(b *Builder, a *Act
> + return nil
> + }
> +
> ++ if goRootPrecious && a.Package != nil {
> ++ p := a.Package
> ++ if p.Standard || p.Goroot {
> ++ err := fmt.Errorf("attempting to install package %s into read-only GOROOT", p.ImportPath)
> ++ return err
> ++ }
> ++ }
> ++
> + if err := b.Mkdir(a.Objdir); err != nil {
> + return err
> + }
> diff --git a/recipes-containers/kubernetes/go-1.12/0008-use-GOBUILDMODE-to-set-buildmode.patch b/recipes-containers/kubernetes/go-1.12/0008-use-GOBUILDMODE-to-set-buildmode.patch
> new file mode 100644
> index 0000000..225cf43
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-1.12/0008-use-GOBUILDMODE-to-set-buildmode.patch
> @@ -0,0 +1,37 @@
> +From 0e0c247f0caec23528889ff09d98348cba9028f1 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Fri, 26 Oct 2018 15:02:32 +0800
> +Subject: [PATCH] use GOBUILDMODE to set buildmode
> +
> +While building go itself, the go build system does not support
> +to set `-buildmode=pie' from environment.
> +
> +Add GOBUILDMODE to support it which make PIE executables the default
> +build mode, as PIE executables are required as of Yocto
> +
> +Refers: https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI
> +Upstream-Status: Denied [upstream choose antoher solution: `17a256b
> +cmd/go: -buildmode=pie for android/arm']
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + src/cmd/go/internal/work/build.go | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +Index: go/src/cmd/go/internal/work/build.go
> +===================================================================
> +--- go.orig/src/cmd/go/internal/work/build.go
> ++++ go/src/cmd/go/internal/work/build.go
> +@@ -223,7 +223,11 @@ func AddBuildFlags(cmd *base.Command) {
> +
> + cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
> + cmd.Flag.Var(buildCompiler{}, "compiler", "")
> +- cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default", "")
> ++ if bm := os.Getenv("GOBUILDMODE"); bm != "" {
> ++ cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", bm, "")
> ++ } else {
> ++ cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default", "")
> ++ }
> + cmd.Flag.Var(&load.BuildGcflags, "gcflags", "")
> + cmd.Flag.Var(&load.BuildGccgoflags, "gccgoflags", "")
> + cmd.Flag.StringVar(&cfg.BuildMod, "mod", "", "")
> diff --git a/recipes-containers/kubernetes/go-1.12/0009-ld-replace-glibc-dynamic-linker-with-musl.patch b/recipes-containers/kubernetes/go-1.12/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
> new file mode 100644
> index 0000000..840cf4b
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-1.12/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
> @@ -0,0 +1,112 @@
> +From 35ea4be34e94912b00837e0f7c7385f2e98fe769 Mon Sep 17 00:00:00 2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Sun, 18 Feb 2018 08:24:05 -0800
> +Subject: [PATCH] ld: replace glibc dynamic linker with musl
> +
> +Rework of patch by Khem Raj <raj.khem@gmail.com>
> +for go 1.10.  Should be applied conditionally on
> +musl being the system C library.
> +
> +Upstream-Status: Inappropriate [Real fix should be portable across libcs]
> +
> +Signed-off-by: Matt Madison <matt@madison.systems>
> +
> +---
> + src/cmd/link/internal/amd64/obj.go  | 2 +-
> + src/cmd/link/internal/arm/obj.go    | 2 +-
> + src/cmd/link/internal/arm64/obj.go  | 2 +-
> + src/cmd/link/internal/mips/obj.go   | 2 +-
> + src/cmd/link/internal/mips64/obj.go | 2 +-
> + src/cmd/link/internal/ppc64/obj.go  | 2 +-
> + src/cmd/link/internal/s390x/obj.go  | 2 +-
> + src/cmd/link/internal/x86/obj.go    | 2 +-
> + 8 files changed, 8 insertions(+), 8 deletions(-)
> +
> +--- a/src/cmd/link/internal/amd64/obj.go
> ++++ b/src/cmd/link/internal/amd64/obj.go
> +@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {
> + PEreloc1:         pereloc1,
> + TLSIEtoLE:        tlsIEtoLE,
> +
> +- Linuxdynld:     "/lib64/ld-linux-x86-64.so.2",
> ++ Linuxdynld:     "/lib64/ld-musl-x86-64.so.1",
> + Freebsddynld:   "/libexec/ld-elf.so.1",
> + Openbsddynld:   "/usr/libexec/ld.so",
> + Netbsddynld:    "/libexec/ld.elf_so",
> +--- a/src/cmd/link/internal/arm/obj.go
> ++++ b/src/cmd/link/internal/arm/obj.go
> +@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
> + Machoreloc1:      machoreloc1,
> + PEreloc1:         pereloc1,
> +
> +- Linuxdynld:     "/lib/ld-linux.so.3", // 2 for OABI, 3 for EABI
> ++ Linuxdynld:     "/lib/ld-musl-armhf.so.1",
> + Freebsddynld:   "/usr/libexec/ld-elf.so.1",
> + Openbsddynld:   "/usr/libexec/ld.so",
> + Netbsddynld:    "/libexec/ld.elf_so",
> +--- a/src/cmd/link/internal/arm64/obj.go
> ++++ b/src/cmd/link/internal/arm64/obj.go
> +@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
> + Gentext:          gentext,
> + Machoreloc1:      machoreloc1,
> +
> +- Linuxdynld: "/lib/ld-linux-aarch64.so.1",
> ++ Linuxdynld: "/lib/ld-musl-aarch64.so.1",
> +
> + Freebsddynld:   "XXX",
> + Openbsddynld:   "XXX",
> +--- a/src/cmd/link/internal/mips/obj.go
> ++++ b/src/cmd/link/internal/mips/obj.go
> +@@ -60,7 +60,7 @@ func Init() (*sys.Arch, ld.Arch) {
> + Gentext:          gentext,
> + Machoreloc1:      machoreloc1,
> +
> +- Linuxdynld: "/lib/ld.so.1",
> ++ Linuxdynld: "/lib/ld-musl-mipsle.so.1",
> +
> + Freebsddynld:   "XXX",
> + Openbsddynld:   "XXX",
> +--- a/src/cmd/link/internal/mips64/obj.go
> ++++ b/src/cmd/link/internal/mips64/obj.go
> +@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
> + Gentext:          gentext,
> + Machoreloc1:      machoreloc1,
> +
> +- Linuxdynld:     "/lib64/ld64.so.1",
> ++ Linuxdynld:     "/lib64/ld-musl-mips64le.so.1",
> + Freebsddynld:   "XXX",
> + Openbsddynld:   "XXX",
> + Netbsddynld:    "XXX",
> +--- a/src/cmd/link/internal/ppc64/obj.go
> ++++ b/src/cmd/link/internal/ppc64/obj.go
> +@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {
> + Machoreloc1:      machoreloc1,
> +
> + // TODO(austin): ABI v1 uses /usr/lib/ld.so.1,
> +- Linuxdynld: "/lib64/ld64.so.1",
> ++ Linuxdynld: "/lib64/ld-musl-powerpc64le.so.1",
> +
> + Freebsddynld:   "XXX",
> + Openbsddynld:   "XXX",
> +--- a/src/cmd/link/internal/s390x/obj.go
> ++++ b/src/cmd/link/internal/s390x/obj.go
> +@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
> + Gentext:          gentext,
> + Machoreloc1:      machoreloc1,
> +
> +- Linuxdynld: "/lib64/ld64.so.1",
> ++ Linuxdynld: "/lib64/ld-musl-s390x.so.1",
> +
> + // not relevant for s390x
> + Freebsddynld:   "XXX",
> +--- a/src/cmd/link/internal/x86/obj.go
> ++++ b/src/cmd/link/internal/x86/obj.go
> +@@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {
> + Machoreloc1:      machoreloc1,
> + PEreloc1:         pereloc1,
> +
> +- Linuxdynld:   "/lib/ld-linux.so.2",
> ++ Linuxdynld:   "/lib/ld-musl-i386.so.1",
> + Freebsddynld: "/usr/libexec/ld-elf.so.1",
> + Openbsddynld: "/usr/libexec/ld.so",
> + Netbsddynld:  "/usr/libexec/ld.elf_so",
> diff --git a/recipes-containers/kubernetes/go-common.inc b/recipes-containers/kubernetes/go-common.inc
> new file mode 100644
> index 0000000..93a3d3b
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-common.inc
> @@ -0,0 +1,32 @@
> +SUMMARY = "Go programming language compiler"
> +DESCRIPTION = " The Go programming language is an open source project to make \
> + programmers more productive. Go is expressive, concise, clean, and\
> + efficient. Its concurrency mechanisms make it easy to write programs\
> + that get the most out of multicore and networked machines, while its\
> + novel type system enables flexible and modular program construction.\
> + Go compiles quickly to machine code yet has the convenience of\
> + garbage collection and the power of run-time reflection. It's a\
> + fast, statically typed, compiled language that feels like a\
> + dynamically typed, interpreted language."
> +
> +HOMEPAGE = " http://golang.org/"
> +LICENSE = "BSD-3-Clause"
> +
> +inherit goarch
> +
> +SRC_URI = "http://golang.org/dl/go${PV}.src.tar.gz;name=main"
> +S = "${WORKDIR}/go"
> +B = "${S}"
> +UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
> +
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +SSTATE_SCAN_CMD = "true"
> +
> +export GOROOT_OVERRIDE = "1"
> +export GOTMPDIR ?= "${WORKDIR}/go-tmp"
> +GOTMPDIR[vardepvalue] = ""
> +export CGO_ENABLED = "1"
> +
> +do_compile_prepend() {
> + BUILD_CC=${BUILD_CC}
> +}
> diff --git a/recipes-containers/kubernetes/go-cross-canadian.inc b/recipes-containers/kubernetes/go-cross-canadian.inc
> new file mode 100644
> index 0000000..945d0f9
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-cross-canadian.inc
> @@ -0,0 +1,66 @@
> +inherit cross-canadian
> +
> +DEPENDS = "go-native virtual/${HOST_PREFIX}go-crosssdk virtual/nativesdk-${HOST_PREFIX}go-runtime \
> +           virtual/${HOST_PREFIX}gcc-crosssdk virtual/nativesdk-libc \
> +           virtual/nativesdk-${HOST_PREFIX}compilerlibs"
> +PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> +
> +# it uses gcc on build machine during go-cross-canadian bootstrap, but
> +# the gcc version may be old and not support option '-fmacro-prefix-map'
> +# which is one of default values of DEBUG_PREFIX_MAP
> +DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
> +                    -fdebug-prefix-map=${STAGING_DIR_HOST}= \
> +                    -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
> +                    "
> +
> +export GOHOSTOS = "${BUILD_GOOS}"
> +export GOHOSTARCH = "${BUILD_GOARCH}"
> +export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
> +export GOTOOLDIR_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/${HOST_SYS}/go/pkg/tool/${BUILD_GOTUPLE}"
> +export GOROOT_FINAL = "${libdir}/go"
> +export CGO_CFLAGS = "${CFLAGS}"
> +export CGO_LDFLAGS = "${LDFLAGS}"
> +export GO_LDFLAGS = '-linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_HOST} ${SECURITY_NOPIE_CFLAGS} ${HOST_CC_ARCH} ${LDFLAGS}"'
> +
> +do_configure[noexec] = "1"
> +
> +do_compile() {
> + export CC_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gcc --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
> + export CXX_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gxx --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE} ${SECURITY_NOPIE_CFLAGS}"
> + cd src
> + ./make.bash --host-only --no-banner
> + cd ${B}
> +}
> +do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +
> +
> +make_wrapper() {
> + rm -f ${D}${bindir}/$2
> + cat <<END >${D}${bindir}/$2
> +#!/bin/sh
> +here=\`dirname \$0\`
> +native_goroot=\`readlink -f \$here/../../lib/${TARGET_SYS}/go\`
> +export GOARCH="${TARGET_GOARCH}"
> +export GOOS="${TARGET_GOOS}"
> +test -n "\$GOARM" || export GOARM="${TARGET_GOARM}"
> +test -n "\$GO386" || export GO386="${TARGET_GO386}"
> +test -n "\$GOMIPS" || export GOMIPS="${TARGET_GOMIPS}"
> +export GOTOOLDIR="\$native_goroot/pkg/tool/${HOST_GOTUPLE}"
> +test -n "\$GOROOT" || export GOROOT="\$OECORE_TARGET_SYSROOT/${target_libdir}/go"
> +\$here/../../lib/${TARGET_SYS}/go/bin/$1 "\$@"
> +END
> + chmod +x ${D}${bindir}/$2
> +}
> +
> +do_install() {
> + install -d ${D}${libdir}/go/pkg/tool
> + cp --preserve=mode,timestamps -R ${B}/pkg/tool/${HOST_GOTUPLE} ${D}${libdir}/go/pkg/tool/
> + install -d ${D}${bindir} ${D}${libdir}/go/bin
> + for f in ${B}/${GO_BUILD_BINDIR}/*
> + do
> + base=`basename $f`
> + install -m755 $f ${D}${libdir}/go/bin
> + make_wrapper $base ${TARGET_PREFIX}$base
> + done
> +}
> diff --git a/recipes-containers/kubernetes/go-cross-canadian_1.12.bb b/recipes-containers/kubernetes/go-cross-canadian_1.12.bb
> new file mode 100644
> index 0000000..7ac9449
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-cross-canadian_1.12.bb
> @@ -0,0 +1,2 @@
> +require go-cross-canadian.inc
> +require go-${PV}.inc
> diff --git a/recipes-containers/kubernetes/go-cross.inc b/recipes-containers/kubernetes/go-cross.inc
> new file mode 100644
> index 0000000..3d344a7
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-cross.inc
> @@ -0,0 +1,62 @@
> +inherit cross
> +
> +PROVIDES = "virtual/${TUNE_PKGARCH}-go"
> +DEPENDS = "go-native"
> +
> +PN = "go-cross-${TUNE_PKGARCH}"
> +
> +export GOHOSTOS = "${BUILD_GOOS}"
> +export GOHOSTARCH = "${BUILD_GOARCH}"
> +export GOOS = "${TARGET_GOOS}"
> +export GOARCH = "${TARGET_GOARCH}"
> +export GOARM = "${TARGET_GOARM}"
> +export GO386 = "${TARGET_GO386}"
> +export GOMIPS = "${TARGET_GOMIPS}"
> +export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
> +export GOROOT_FINAL = "${libdir}/go"
> +export GOCACHE = "${B}/.cache"
> +CC = "${@d.getVar('BUILD_CC').strip()}"
> +
> +do_configure[noexec] = "1"
> +
> +do_compile() {
> + export CC_FOR_${GOOS}_${GOARCH}="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
> + export CXX_FOR_${GOOS}_${GOARCh}="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
> + cd src
> + ./make.bash --host-only --no-banner
> + cd ${B}
> +}
> +do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +
> +make_wrapper() {
> + rm -f ${D}${bindir}/$2
> + cat <<END >${D}${bindir}/$2
> +#!/bin/bash
> +here=\`dirname \$0\`
> +export GOARCH="${TARGET_GOARCH}"
> +export GOOS="${TARGET_GOOS}"
> +export GOARM="\${GOARM:-${TARGET_GOARM}}"
> +export GO386="\${GO386:-${TARGET_GO386}}"
> +export GOMIPS="\${GOMIPS:-${TARGET_GOMIPS}}"
> +\$here/../../lib/${CROSS_TARGET_SYS_DIR}/go/bin/$1 "\$@"
> +END
> + chmod +x ${D}${bindir}/$2
> +}
> +
> +do_install() {
> + install -d ${D}${libdir}/go
> + cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
> + install -d ${D}${libdir}/go/src
> + (cd ${S}/src; for d in *; do \
> + [ ! -d $d ] || cp --preserve=mode,timestamps -R ${S}/src/$d ${D}${libdir}/go/src/; \
> + done)
> + find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;
> + install -d ${D}${bindir} ${D}${libdir}/go/bin
> + for f in ${B}/bin/*
> + do
> + base=`basename $f`
> + install -m755 $f ${D}${libdir}/go/bin
> + make_wrapper $base ${TARGET_PREFIX}$base
> + done
> +}
> diff --git a/recipes-containers/kubernetes/go-cross_1.12.bb b/recipes-containers/kubernetes/go-cross_1.12.bb
> new file mode 100644
> index 0000000..80b5a03
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-cross_1.12.bb
> @@ -0,0 +1,2 @@
> +require go-cross.inc
> +require go-${PV}.inc
> diff --git a/recipes-containers/kubernetes/go-crosssdk.inc b/recipes-containers/kubernetes/go-crosssdk.inc
> new file mode 100644
> index 0000000..94f6fb8
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-crosssdk.inc
> @@ -0,0 +1,50 @@
> +inherit crosssdk
> +
> +DEPENDS = "go-native virtual/${TARGET_PREFIX}gcc-crosssdk virtual/nativesdk-${TARGET_PREFIX}compilerlibs virtual/${TARGET_PREFIX}binutils-crosssdk"
> +PN = "go-crosssdk-${SDK_SYS}"
> +PROVIDES = "virtual/${TARGET_PREFIX}go-crosssdk"
> +
> +export GOHOSTOS = "${BUILD_GOOS}"
> +export GOHOSTARCH = "${BUILD_GOARCH}"
> +export GOOS = "${TARGET_GOOS}"
> +export GOARCH = "${TARGET_GOARCH}"
> +export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
> +export GOROOT_FINAL = "${libdir}/go"
> +
> +do_configure[noexec] = "1"
> +
> +do_compile() {
> + export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
> + export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
> + cd src
> + ./make.bash --host-only --no-banner
> + cd ${B}
> +}
> +do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +
> +make_wrapper() {
> +    rm -f ${D}${bindir}/$2
> +    cat <<END >${D}${bindir}/$2
> +#!/bin/bash
> +here=\`dirname \$0\`
> +export GOARCH="${TARGET_GOARCH}"
> +export GOOS="${TARGET_GOOS}"
> +\$here/../../lib/${CROSS_TARGET_SYS_DIR}/go/bin/$1 "\$@"
> +END
> +    chmod +x ${D}${bindir}/$2
> +}
> +
> +do_install() {
> + install -d ${D}${libdir}/go
> + install -d ${D}${libdir}/go/bin
> + install -d ${D}${libdir}/go/pkg/tool
> + install -d ${D}${bindir}
> + cp --preserve=mode,timestamps -R ${S}/pkg/tool/${BUILD_GOTUPLE} ${D}${libdir}/go/pkg/tool/
> + for f in ${B}/bin/*
> + do
> + base=`basename $f`
> + install -m755 $f ${D}${libdir}/go/bin
> + make_wrapper $base ${TARGET_PREFIX}$base
> + done
> +}
> diff --git a/recipes-containers/kubernetes/go-crosssdk_1.12.bb b/recipes-containers/kubernetes/go-crosssdk_1.12.bb
> new file mode 100644
> index 0000000..1857c8a
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-crosssdk_1.12.bb
> @@ -0,0 +1,2 @@
> +require go-crosssdk.inc
> +require go-${PV}.inc
> diff --git a/recipes-containers/kubernetes/go-native.inc b/recipes-containers/kubernetes/go-native.inc
> new file mode 100644
> index 0000000..2077087
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-native.inc
> @@ -0,0 +1,55 @@
> +inherit native
> +
> +SRC_URI_append = " https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz;name=bootstrap;subdir=go1.4"
> +SRC_URI[bootstrap.md5sum] = "dbf727a4b0e365bf88d97cbfde590016"
> +SRC_URI[bootstrap.sha256sum] = "f4ff5b5eb3a3cae1c993723f3eab519c5bae18866b5e5f96fe1102f0cb5c3e52"
> +
> +export GOOS = "${BUILD_GOOS}"
> +export GOARCH = "${BUILD_GOARCH}"
> +CC = "${@d.getVar('BUILD_CC').strip()}"
> +
> +GOMAKEARGS ?= "--no-banner"
> +
> +do_configure() {
> + cd ${WORKDIR}/go1.4/go/src
> + CGO_ENABLED=0 GOROOT=${WORKDIR}/go1.4/go ./make.bash
> +}
> +
> +do_compile() {
> + export GOROOT_FINAL="${libdir_native}/go"
> + export GOROOT_BOOTSTRAP="${WORKDIR}/go1.4/go"
> +
> + cd src
> + ./make.bash ${GOMAKEARGS}
> + cd ${B}
> +}
> +do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin"
> +do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin"
> +
> +make_wrapper() {
> + rm -f ${D}${bindir}/$2$3
> + cat <<END >${D}${bindir}/$2$3
> +#!/bin/bash
> +here=\`dirname \$0\`
> +export GOROOT="${GOROOT:-\`readlink -f \$here/../lib/go\`}"
> +\$here/../lib/go/bin/$1 "\$@"
> +END
> + chmod +x ${D}${bindir}/$2
> +}
> +
> +do_install() {
> + install -d ${D}${libdir}/go
> + cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
> + install -d ${D}${libdir}/go/src
> + (cd ${S}/src; for d in *; do \
> + [ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
> + done)
> + find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;
> + install -d ${D}${bindir} ${D}${libdir}/go/bin
> + for f in ${B}/bin/*
> + do
> + base=`basename $f`
> + install -m755 $f ${D}${libdir}/go/bin
> + make_wrapper $base $base
> + done
> +}
> diff --git a/recipes-containers/kubernetes/go-native_1.12.bb b/recipes-containers/kubernetes/go-native_1.12.bb
> new file mode 100644
> index 0000000..bbf3c0d
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-native_1.12.bb
> @@ -0,0 +1,2 @@
> +require ${PN}.inc
> +require go-${PV}.inc
> diff --git a/recipes-containers/kubernetes/go-runtime.inc b/recipes-containers/kubernetes/go-runtime.inc
> new file mode 100644
> index 0000000..9731e16
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-runtime.inc
> @@ -0,0 +1,96 @@
> +DEPENDS = "virtual/${TUNE_PKGARCH}-go go-native"
> +DEPENDS_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk"
> +PROVIDES = "virtual/${TARGET_PREFIX}go-runtime"
> +
> +export GOHOSTOS = "${BUILD_GOOS}"
> +export GOHOSTARCH = "${BUILD_GOARCH}"
> +export GOOS = "${TARGET_GOOS}"
> +export GOARCH = "${TARGET_GOARCH}"
> +export GOARM = "${TARGET_GOARM}"
> +export GO386 = "${TARGET_GO386}"
> +export GOMIPS = "${TARGET_GOMIPS}"
> +export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
> +export GOROOT_FINAL = "${libdir}/go"
> +export CGO_CFLAGS = "${CFLAGS}"
> +export CGO_CPPFLAGS = "${CPPFLAGS}"
> +export CGO_CXXFLAGS = "${CXXFLAGS}"
> +export CGO_LDFLAGS = "${LDFLAGS}"
> +export GOCACHE = "${B}/.cache"
> +
> +GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
> +GO_SHLIB_LDFLAGS ?= '-ldflags="--linkmode=external -extldflags '${GO_EXTLDFLAGS}'"'
> +
> +do_configure() {
> + :
> +}
> +
> +do_configure_libc-musl() {
> + rm -f ${S}/src/runtime/race/*.syso
> +}
> +
> +do_compile() {
> + export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CC}"
> + export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CXX}"
> +
> + cd src
> + ./make.bash --target-only --no-banner std
> + if [ -n "${GO_DYNLINK}" ]; then
> + export GOTOOLDIR="${B}/pkg/tool/native_native"
> + CC="$CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}" GOARCH="${TARGET_GOARCH}" GOOS="${TARGET_GOOS}" GOROOT=${B} \
> + $GOTOOLDIR/go_bootstrap install -linkshared -buildmode=shared ${GO_SHLIB_LDFLAGS} std
> + fi
> + cd ${B}
> +}
> +do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +
> +do_install() {
> + install -d ${D}${libdir}/go/src
> + cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
> + if [ "${BUILD_GOTUPLE}" != "${TARGET_GOTUPLE}" ]; then
> + rm -rf ${D}${libdir}/go/pkg/${BUILD_GOTUPLE}
> + rm -rf ${D}${libdir}/go/pkg/obj/${BUILD_GOTUPLE}
> + fi
> + rm -rf ${D}${libdir}/go/pkg/tool
> + rm -rf ${D}${libdir}/go/pkg/obj
> + rm -rf ${D}${libdir}/go/pkg/bootstrap
> + find src -mindepth 1 -maxdepth 1 -type d | while read srcdir; do
> + cp --preserve=mode,timestamps -R $srcdir ${D}${libdir}/go/src/
> + done
> + find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;
> + rm -f ${D}${libdir}/go/src/cmd/dist/dist
> +        rm -f ${D}${libdir}/go/src/cmd/cgo/zdefaultcc.go
> +        rm -f ${D}${libdir}/go/src/cmd/go/internal/cfg/zdefaultcc.go
> +
> +}
> +
> +ALLOW_EMPTY_${PN} = "1"
> +FILES_${PN} = "${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*${SOLIBSDEV}"
> +FILES_${PN}-dev = "${libdir}/go/src ${libdir}/go/pkg/include \
> +                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*.shlibname \
> +                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*.shlibname \
> +                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*.shlibname \
> +                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*.shlibname \
> +                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*.shlibname \
> +                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*.shlibname \
> +                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*/*.shlibname \
> +                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*.a \
> +                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*.a \
> +                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*.a \
> +                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*.a \
> +                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*.a \
> +                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*.a \
> +                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*/*.a \
> +"
> +FILES_${PN}-staticdev = "${libdir}/go/pkg/${TARGET_GOTUPLE}"
> +
> +# Go sources include some scripts and pre-built binaries for
> +# multiple architectures.  The static .a files for dynamically-linked
> +# runtime are also required in -dev.
> +INSANE_SKIP_${PN}-dev = "staticdev file-rdeps arch"
> +
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> +
> +BBCLASSEXTEND = "nativesdk"
> diff --git a/recipes-containers/kubernetes/go-runtime_1.12.bb b/recipes-containers/kubernetes/go-runtime_1.12.bb
> new file mode 100644
> index 0000000..43b68b4
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-runtime_1.12.bb
> @@ -0,0 +1,2 @@
> +require go-${PV}.inc
> +require go-runtime.inc
> diff --git a/recipes-containers/kubernetes/go-target.inc b/recipes-containers/kubernetes/go-target.inc
> new file mode 100644
> index 0000000..91efd3e
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-target.inc
> @@ -0,0 +1,54 @@
> +DEPENDS = "virtual/${TUNE_PKGARCH}-go go-native"
> +DEPENDS_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk go-native"
> +
> +export GOHOSTOS = "${BUILD_GOOS}"
> +export GOHOSTARCH = "${BUILD_GOARCH}"
> +export GOOS = "${TARGET_GOOS}"
> +export GOARCH = "${TARGET_GOARCH}"
> +export GOARM = "${TARGET_GOARM}"
> +export GO386 = "${TARGET_GO386}"
> +export GOMIPS = "${TARGET_GOMIPS}"
> +export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
> +export GOROOT_FINAL = "${libdir}/go"
> +export GOCACHE = "${B}/.cache"
> +GO_LDFLAGS = ""
> +GO_LDFLAGS_class-nativesdk = "-linkmode external"
> +export GO_LDFLAGS
> +
> +CC_append_class-nativesdk = " ${SECURITY_NOPIE_CFLAGS}"
> +
> +do_configure[noexec] = "1"
> +
> +do_compile() {
> + export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CC}"
> + export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CXX}"
> +
> + cd src
> + ./make.bash --target-only --no-banner
> + cd ${B}
> +}
> +do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +
> +do_install() {
> + install -d ${D}${libdir}/go/pkg/tool
> + cp --preserve=mode,timestamps -R ${B}/pkg/tool/${TARGET_GOTUPLE} ${D}${libdir}/go/pkg/tool/
> + install -d ${D}${libdir}/go/src
> + cp --preserve=mode,timestamps -R ${S}/src/cmd ${D}${libdir}/go/src/
> + find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;
> + install -d ${D}${libdir}/go/bin
> + install -d ${D}${bindir}
> + for f in ${B}/${GO_BUILD_BINDIR}/*; do
> + name=`basename $f`
> + install -m 0755 $f ${D}${libdir}/go/bin/
> + ln -sf ../${baselib}/go/bin/$name ${D}${bindir}/
> + done
> +}
> +
> +PACKAGES = "${PN} ${PN}-dev"
> +FILES_${PN} = "${libdir}/go/bin ${libdir}/go/pkg/tool/${TARGET_GOTUPLE} ${bindir}"
> +FILES_${PN}-dev = "${libdir}/go"
> +RDEPENDS_${PN}-dev = "perl bash"
> +INSANE_SKIP_${PN} = "ldflags"
> +
> +BBCLASSEXTEND = "nativesdk"
> diff --git a/recipes-containers/kubernetes/go_1.12.bb b/recipes-containers/kubernetes/go_1.12.bb
> new file mode 100644
> index 0000000..42cdb04
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go_1.12.bb
> @@ -0,0 +1,14 @@
> +require go-${PV}.inc
> +require go-target.inc
> +
> +export GOBUILDMODE=""
> +
> +# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips
> +# doesn't support -buildmode=pie, so skip the QA checking for mips and its
> +# variants.
> +python() {
> +    if 'mips' in d.getVar('TARGET_ARCH'):
> +        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
> +    else:
> +        d.setVar('GOBUILDMODE', 'pie')
> +}
> --
> 2.17.1
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4845): https://lists.yoctoproject.org/g/meta-virtualization/message/4845
> Mute This Topic: https://lists.yoctoproject.org/mt/67789939/900811
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [timothy.t.orling@linux.intel.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4851): https://lists.yoctoproject.org/g/meta-virtualization/message/4851
> Mute This Topic: https://lists.yoctoproject.org/mt/67789939/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
