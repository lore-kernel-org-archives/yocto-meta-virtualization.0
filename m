Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.711.1576026511202187533
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 17:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 140.211.169.56, mailfrom: timothy.t.orling@linux.intel.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A536CE01147; Tue, 10 Dec 2019 17:08:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at https://www.dnswl.org/, high
	*      trust
	*      [134.134.136.24 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9EE7DE0082A
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 17:08:22 -0800 (PST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Dec 2019 17:08:21 -0800
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; 
   d="scan'208,217";a="203384300"
Received: from ttorling-mac05.jf.intel.com ([10.24.8.190])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Dec 2019 17:08:21 -0800
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
Message-Id: <1E2B2391-309B-4469-91F6-584291361490@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [meta-virtualization][PATCH V2 1/2] go: add back 1.12 version to avoid compilation failure
Date: Tue, 10 Dec 2019 17:08:20 -0800
In-Reply-To: <20191209081100.17430-1-Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
References: <20191209081100.17430-1-Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.3445.104.11)
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_6725D0BD-0850-400C-ACF4-1BA063E7A2F7"

--Apple-Mail=_6725D0BD-0850-400C-ACF4-1BA063E7A2F7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Kubernetes 1.17 is now released which can be built with go1.13.4+
=
https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.17.md#dep=
endencies

I have just now submitted a patch to oe-core to upgrade to go1.13.5
https://patchwork.openembedded.org/patch/167900/ =
<https://patchwork.openembedded.org/patch/167900/>

> On Dec 9, 2019, at 12:10 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
>=20
> go 1.12 was removed from oe-core, but currently k8s cannot
> be built successfully with go 1.13. See link below.
>=20
>  https://github.com/kubernetes/kubernetes/issues/82531
>=20
> We need to wait for k8s to support go 1.13 and update it
> to latest release, as well as its depedencies. Before this
> is done, add back go 1.12 and use it.
>=20
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
> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0001-allow-CC-and-CXX-to-have-multip=
le-words.patch
> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0001-release-branch.go1.12-security-=
net-textproto-don-t-n.patch
> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0002-cmd-go-make-content-based-hash-=
generation-less-pedan.patch
> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0003-allow-GOTOOLDIR-to-be-overridde=
n-in-the-environment.patch
> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0004-ld-add-soname-to-shareable-obje=
cts.patch
> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0005-make.bash-override-CC-when-buil=
ding-dist-and-go_boot.patch
> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0006-cmd-dist-separate-host-and-targ=
et-builds.patch
> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0007-cmd-go-make-GOROOT-precious-by-=
default.patch
> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0008-use-GOBUILDMODE-to-set-buildmod=
e.patch
> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0009-ld-replace-glibc-dynamic-linker=
-with-musl.patch
> create mode 100644 recipes-containers/kubernetes/go-common.inc
> create mode 100644 recipes-containers/kubernetes/go-cross-canadian.inc
> create mode 100644 =
recipes-containers/kubernetes/go-cross-canadian_1.12.bb
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
>=20
> diff --git a/recipes-containers/kubernetes/go-1.12.inc =
b/recipes-containers/kubernetes/go-1.12.inc
> new file mode 100644
> index 0000000..ed14b17
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-1.12.inc
> @@ -0,0 +1,24 @@
> +require go-common.inc
> +
> +GO_BASEVERSION =3D "1.12"
> +GO_MINOR =3D ".9"
> +PV .=3D "${GO_MINOR}"
> +FILESEXTRAPATHS_prepend :=3D "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> +
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707"
> +
> +SRC_URI +=3D "\
> +    file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
> +    =
file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch \
> +    =
file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
> +    file://0004-ld-add-soname-to-shareable-objects.patch \
> +    =
file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
> +    file://0006-cmd-dist-separate-host-and-target-builds.patch \
> +    file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
> +    file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
> +    =
file://0001-release-branch.go1.12-security-net-textproto-don-t-n.patch \
> +"
> +SRC_URI_append_libc-musl =3D " =
file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
> +
> +SRC_URI[main.md5sum] =3D "6132109d4050da349eadc9f7b0304ef4"
> +SRC_URI[main.sha256sum] =3D =
"ab0e56ed9c4732a653ed22e232652709afbf573e710f56a07f7fdeca578d62fc"
> diff --git =
a/recipes-containers/kubernetes/go-1.12/0001-allow-CC-and-CXX-to-have-mult=
iple-words.patch =
b/recipes-containers/kubernetes/go-1.12/0001-allow-CC-and-CXX-to-have-mult=
iple-words.patch
> new file mode 100644
> index 0000000..4442858
> --- /dev/null
> +++ =
b/recipes-containers/kubernetes/go-1.12/0001-allow-CC-and-CXX-to-have-mult=
iple-words.patch
> @@ -0,0 +1,31 @@
> +=46rom 7cc519aa5f84cf8fc7ac8c10fc69aa8040330ea0 Mon Sep 17 00:00:00 =
2001
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
> +diff --git a/src/cmd/go/internal/envcmd/env.go =
b/src/cmd/go/internal/envcmd/env.go
> +index afadbad..cedbfbf 100644
> +--- a/src/cmd/go/internal/envcmd/env.go
> ++++ b/src/cmd/go/internal/envcmd/env.go
> +@@ -85,11 +85,11 @@ func MkEnv() []cfg.EnvVar {
> +=20
> + 	cc :=3D cfg.DefaultCC(cfg.Goos, cfg.Goarch)
> + 	if env :=3D strings.Fields(os.Getenv("CC")); len(env) > 0 {
> +-		cc =3D env[0]
> ++		cc =3D strings.Join(env, " ")
> + 	}
> + 	cxx :=3D cfg.DefaultCXX(cfg.Goos, cfg.Goarch)
> + 	if env :=3D strings.Fields(os.Getenv("CXX")); len(env) > 0 {
> +-		cxx =3D env[0]
> ++		cxx =3D strings.Join(env, " ")
> + 	}
> + 	env =3D append(env, cfg.EnvVar{Name: "CC", Value: cc})
> + 	env =3D append(env, cfg.EnvVar{Name: "CXX", Value: cxx})
> diff --git =
a/recipes-containers/kubernetes/go-1.12/0001-release-branch.go1.12-securit=
y-net-textproto-don-t-n.patch =
b/recipes-containers/kubernetes/go-1.12/0001-release-branch.go1.12-securit=
y-net-textproto-don-t-n.patch
> new file mode 100644
> index 0000000..7b39dbd
> --- /dev/null
> +++ =
b/recipes-containers/kubernetes/go-1.12/0001-release-branch.go1.12-securit=
y-net-textproto-don-t-n.patch
> @@ -0,0 +1,163 @@
> +=46rom 265b691ac440bfb711d8de323346f7d72e620efe Mon Sep 17 00:00:00 =
2001
> +From: Filippo Valsorda <filippo@golang.org>
> +Date: Thu, 12 Sep 2019 12:37:36 -0400
> +Subject: [PATCH] [release-branch.go1.12-security] net/textproto: =
don't
> + normalize headers with spaces before the colon
> +
> +RFC 7230 is clear about headers with a space before the colon, like
> +
> +X-Answer : 42
> +
> +being invalid, but we've been accepting and normalizing them for =
compatibility
> +purposes since CL 5690059 in 2012.
> +
> +On the client side, this is harmless and indeed most browsers behave =
the same
> +to this day. On the server side, this becomes a security issue when =
the
> +behavior doesn't match that of a reverse proxy sitting in front of =
the server.
> +
> +For example, if a WAF accepts them without normalizing them, it might =
be
> +possible to bypass its filters, because the Go server would interpret =
the
> +header differently. Worse, if the reverse proxy coalesces requests =
onto a
> +single HTTP/1.1 connection to a Go server, the understanding of the =
request
> +boundaries can get out of sync between them, allowing an attacker to =
tack an
> +arbitrary method and path onto a request by other clients, including
> +authentication headers unknown to the attacker.
> +
> +This was recently presented at multiple security conferences:
> =
+https://portswigger.net/blog/http-desync-attacks-request-smuggling-reborn=

> +
> +net/http servers already reject header keys with invalid characters.
> +Simply stop normalizing extra spaces in net/textproto, let it return =
them
> +unchanged like it does for other invalid headers, and let net/http =
enforce
> +RFC 7230, which is HTTP specific. This loses us normalization on the =
client
> +side, but there's no right answer on the client side anyway, and =
hiding the
> +issue sounds worse than letting the application decide.
> +
> +Fixes CVE-2019-16276
> +
> +Change-Id: I6d272de827e0870da85d93df770d6a0e161bbcf1
> +Reviewed-on: =
https://team-review.git.corp.google.com/c/golang/go-private/+/549719
> +Reviewed-by: Brad Fitzpatrick <bradfitz@google.com>
> +(cherry picked from commit 1280b868e82bf173ea3e988be3092d160ee66082)
> +Reviewed-on: =
https://team-review.git.corp.google.com/c/golang/go-private/+/558776
> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
> +
> +CVE: CVE-2019-16276
> +
> +Upstream-Status: Backport =
[https://github.com/golang/go/commit/6e6f4aaf70c8b1cc81e65a26332aa9409de03=
ad8]
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
> +@@ -4748,6 +4748,10 @@ func TestServerValidatesHeaders(t *testing.T) =
{
> + 		{"foo\xffbar: foo\r\n", 400},                         // =
binary in header
> + 		{"foo\x00bar: foo\r\n", 400},                         // =
binary in header
> + 		{"Foo: " + strings.Repeat("x", 1<<21) + "\r\n", 431}, // =
header too large
> ++		// Spaces between the header key and colon are not =
allowed.
> ++		// See RFC 7230, Section 3.2.4.
> ++		{"Foo : bar\r\n", 400},
> ++		{"Foo\t: bar\r\n", 400},
> +=20
> + 		{"foo: foo foo\r\n", 200},    // LWS space is okay
> + 		{"foo: foo\tfoo\r\n", 200},   // LWS tab is okay
> +diff --git a/src/net/http/transport_test.go =
b/src/net/http/transport_test.go
> +index 5c329543e2..5e5438a708 100644
> +--- a/src/net/http/transport_test.go
> ++++ b/src/net/http/transport_test.go
> +@@ -5133,3 +5133,30 @@ func TestTransportIgnores408(t *testing.T) {
> + 	}
> + 	t.Fatalf("timeout after %v waiting for Transport connections to =
die off", time.Since(t0))
> + }
> ++
> ++func TestInvalidHeaderResponse(t *testing.T) {
> ++	setParallel(t)
> ++	defer afterTest(t)
> ++	cst :=3D newClientServerTest(t, h1Mode, HandlerFunc(func(w =
ResponseWriter, r *Request) {
> ++		conn, buf, _ :=3D w.(Hijacker).Hijack()
> ++		buf.Write([]byte("HTTP/1.1 200 OK\r\n" +
> ++			"Date: Wed, 30 Aug 2017 19:09:27 GMT\r\n" +
> ++			"Content-Type: text/html; charset=3Dutf-8\r\n" +
> ++			"Content-Length: 0\r\n" +
> ++			"Foo : bar\r\n\r\n"))
> ++		buf.Flush()
> ++		conn.Close()
> ++	}))
> ++	defer cst.close()
> ++	res, err :=3D cst.c.Get(cst.ts.URL)
> ++	if err !=3D nil {
> ++		t.Fatal(err)
> ++	}
> ++	defer res.Body.Close()
> ++	if v :=3D res.Header.Get("Foo"); v !=3D "" {
> ++		t.Errorf(`unexpected "Foo" header: %q`, v)
> ++	}
> ++	if v :=3D res.Header.Get("Foo "); v !=3D "bar" {
> ++		t.Errorf(`bad "Foo " header value: %q, want %q`, v, =
"bar")
> ++	}
> ++}
> +diff --git a/src/net/textproto/reader.go =
b/src/net/textproto/reader.go
> +index 2c4f25d5ae..1a5e364cf7 100644
> +--- a/src/net/textproto/reader.go
> ++++ b/src/net/textproto/reader.go
> +@@ -493,18 +493,12 @@ func (r *Reader) ReadMIMEHeader() (MIMEHeader, =
error) {
> + 			return m, err
> + 		}
> +=20
> +-		// Key ends at first colon; should not have trailing =
spaces
> +-		// but they appear in the wild, violating specs, so we =
remove
> +-		// them if present.
> ++		// Key ends at first colon.
> + 		i :=3D bytes.IndexByte(kv, ':')
> + 		if i < 0 {
> + 			return m, ProtocolError("malformed MIME header =
line: " + string(kv))
> + 		}
> +-		endKey :=3D i
> +-		for endKey > 0 && kv[endKey-1] =3D=3D ' ' {
> +-			endKey--
> +-		}
> +-		key :=3D canonicalMIMEHeaderKey(kv[:endKey])
> ++		key :=3D canonicalMIMEHeaderKey(kv[:i])
> +=20
> + 		// As per RFC 7230 field-name is a token, tokens consist =
of one or more chars.
> + 		// We could return a ProtocolError here, but better to =
be liberal in what we
> +diff --git a/src/net/textproto/reader_test.go =
b/src/net/textproto/reader_test.go
> +index f85fbdc36d..b92fdcd3c7 100644
> +--- a/src/net/textproto/reader_test.go
> ++++ b/src/net/textproto/reader_test.go
> +@@ -188,11 +188,10 @@ func TestLargeReadMIMEHeader(t *testing.T) {
> + 	}
> + }
> +=20
> +-// Test that we read slightly-bogus MIME headers seen in the wild,
> +-// with spaces before colons, and spaces in keys.
> ++// TestReadMIMEHeaderNonCompliant checks that we don't normalize =
headers
> ++// with spaces before colons, and accept spaces in keys.
> + func TestReadMIMEHeaderNonCompliant(t *testing.T) {
> +-	// Invalid HTTP response header as sent by an Axis security
> +-	// camera: (this is handled by IE, Firefox, Chrome, curl, etc.)
> ++	// These invalid headers will be rejected by net/http according =
to RFC 7230.
> + 	r :=3D reader("Foo: bar\r\n" +
> + 		"Content-Language: en\r\n" +
> + 		"SID : 0\r\n" +
> +@@ -202,9 +201,9 @@ func TestReadMIMEHeaderNonCompliant(t *testing.T) =
{
> + 	want :=3D MIMEHeader{
> + 		"Foo":              {"bar"},
> + 		"Content-Language": {"en"},
> +-		"Sid":              {"0"},
> +-		"Audio Mode":       {"None"},
> +-		"Privilege":        {"127"},
> ++		"SID ":             {"0"},
> ++		"Audio Mode ":      {"None"},
> ++		"Privilege ":       {"127"},
> + 	}
> + 	if !reflect.DeepEqual(m, want) || err !=3D nil {
> + 		t.Fatalf("ReadMIMEHeader =3D\n%v, %v; want:\n%v", m, =
err, want)
> diff --git =
a/recipes-containers/kubernetes/go-1.12/0002-cmd-go-make-content-based-has=
h-generation-less-pedan.patch =
b/recipes-containers/kubernetes/go-1.12/0002-cmd-go-make-content-based-has=
h-generation-less-pedan.patch
> new file mode 100644
> index 0000000..66b8561
> --- /dev/null
> +++ =
b/recipes-containers/kubernetes/go-1.12/0002-cmd-go-make-content-based-has=
h-generation-less-pedan.patch
> @@ -0,0 +1,218 @@
> +=46rom 47db69e20ed66fb62b01affd83d829654b829893 Mon Sep 17 00:00:00 =
2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Mon, 19 Feb 2018 08:50:59 -0800
> +Subject: [PATCH] cmd/go: make content-based hash generation less =
pedantic
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
> + src/cmd/go/internal/work/exec.go  | 63 =
++++++++++++++++++++++---------
> + 2 files changed, 46 insertions(+), 19 deletions(-)
> +
> +diff --git a/src/cmd/go/internal/envcmd/env.go =
b/src/cmd/go/internal/envcmd/env.go
> +index cedbfbf..5763a0d 100644
> +--- a/src/cmd/go/internal/envcmd/env.go
> ++++ b/src/cmd/go/internal/envcmd/env.go
> +@@ -128,7 +128,7 @@ func ExtraEnvVars() []cfg.EnvVar {
> + func ExtraEnvVarsCostly() []cfg.EnvVar {
> + 	var b work.Builder
> + 	b.Init()
> +-	cppflags, cflags, cxxflags, fflags, ldflags, err :=3D =
b.CFlags(&load.Package{})
> ++	cppflags, cflags, cxxflags, fflags, ldflags, err :=3D =
b.CFlags(&load.Package{}, false)
> + 	if err !=3D nil {
> + 		// Should not happen - b.CFlags was given an empty =
package.
> + 		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
> +diff --git a/src/cmd/go/internal/work/exec.go =
b/src/cmd/go/internal/work/exec.go
> +index 12e1527..e41bfac 100644
> +--- a/src/cmd/go/internal/work/exec.go
> ++++ b/src/cmd/go/internal/work/exec.go
> +@@ -174,6 +174,8 @@ func (b *Builder) Do(root *Action) {
> + 	wg.Wait()
> + }
> +=20
> ++var omitGopath =3D os.Getenv("GOPATH_OMIT_IN_ACTIONID") !=3D ""
> ++
> + // buildActionID computes the action ID for a build action.
> + func (b *Builder) buildActionID(a *Action) cache.ActionID {
> + 	p :=3D a.Package
> +@@ -190,7 +192,7 @@ func (b *Builder) buildActionID(a *Action) =
cache.ActionID {
> + 	// but it does not hide the exact value of $GOPATH.
> + 	// Include the full dir in that case.
> + 	// Assume b.WorkDir is being trimmed properly.
> +-	if !p.Goroot && !strings.HasPrefix(p.Dir, b.WorkDir) {
> ++	if !p.Goroot && !omitGopath && !strings.HasPrefix(p.Dir, =
b.WorkDir) {
> + 		fmt.Fprintf(h, "dir %s\n", p.Dir)
> + 	}
> + 	fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
> +@@ -201,13 +203,13 @@ func (b *Builder) buildActionID(a *Action) =
cache.ActionID {
> + 	}
> + 	if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
> + 		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
> +-		cppflags, cflags, cxxflags, fflags, ldflags, _ :=3D =
b.CFlags(p)
> +-		fmt.Fprintf(h, "CC=3D%q %q %q %q\n", b.ccExe(), =
cppflags, cflags, ldflags)
> ++		cppflags, cflags, cxxflags, fflags, ldflags, _ :=3D =
b.CFlags(p, true)
> ++		fmt.Fprintf(h, "CC=3D%q %q %q %q\n", b.ccExe(true), =
cppflags, cflags, ldflags)
> + 		if len(p.CXXFiles)+len(p.SwigFiles) > 0 {
> +-			fmt.Fprintf(h, "CXX=3D%q %q\n", b.cxxExe(), =
cxxflags)
> ++			fmt.Fprintf(h, "CXX=3D%q %q\n", b.cxxExe(true), =
cxxflags)
> + 		}
> + 		if len(p.FFiles) > 0 {
> +-			fmt.Fprintf(h, "FC=3D%q %q\n", b.fcExe(), =
fflags)
> ++			fmt.Fprintf(h, "FC=3D%q %q\n", b.fcExe(true), =
fflags)
> + 		}
> + 		// TODO(rsc): Should we include the SWIG version or =
Fortran/GCC/G++/Objective-C compiler versions?
> + 	}
> +@@ -2096,33 +2098,33 @@ var (
> + // gccCmd returns a gcc command line prefix
> + // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
> + func (b *Builder) GccCmd(incdir, workdir string) []string {
> +-	return b.compilerCmd(b.ccExe(), incdir, workdir)
> ++	return b.compilerCmd(b.ccExe(false), incdir, workdir)
> + }
> +=20
> + // gxxCmd returns a g++ command line prefix
> + // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
> + func (b *Builder) GxxCmd(incdir, workdir string) []string {
> +-	return b.compilerCmd(b.cxxExe(), incdir, workdir)
> ++	return b.compilerCmd(b.cxxExe(false), incdir, workdir)
> + }
> +=20
> + // gfortranCmd returns a gfortran command line prefix.
> + func (b *Builder) gfortranCmd(incdir, workdir string) []string {
> +-	return b.compilerCmd(b.fcExe(), incdir, workdir)
> ++	return b.compilerCmd(b.fcExe(false), incdir, workdir)
> + }
> +=20
> + // ccExe returns the CC compiler setting without all the extra flags =
we add implicitly.
> +-func (b *Builder) ccExe() []string {
> +-	return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, =
cfg.Goarch))
> ++func (b *Builder) ccExe(filtered bool) []string {
> ++	return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, =
cfg.Goarch), filtered)
> + }
> +=20
> + // cxxExe returns the CXX compiler setting without all the extra =
flags we add implicitly.
> +-func (b *Builder) cxxExe() []string {
> +-	return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, =
cfg.Goarch))
> ++func (b *Builder) cxxExe(filtered bool) []string {
> ++	return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, =
cfg.Goarch), filtered)
> + }
> +=20
> + // fcExe returns the FC compiler setting without all the extra flags =
we add implicitly.
> +-func (b *Builder) fcExe() []string {
> +-	return b.compilerExe(os.Getenv("FC"), "gfortran")
> ++func (b *Builder) fcExe(filtered bool) []string {
> ++	return b.compilerExe(os.Getenv("FC"), "gfortran", filtered)
> + }
> +=20
> + // compilerExe returns the compiler to use given an
> +@@ -2131,11 +2133,14 @@ func (b *Builder) fcExe() []string {
> + // of the compiler but can have additional arguments if they
> + // were present in the environment value.
> + // For example if CC=3D"gcc -DGOPHER" then the result is ["gcc", =
"-DGOPHER"].
> +-func (b *Builder) compilerExe(envValue string, def string) []string =
{
> ++func (b *Builder) compilerExe(envValue string, def string, filtered =
bool) []string {
> + 	compiler :=3D strings.Fields(envValue)
> + 	if len(compiler) =3D=3D 0 {
> + 		compiler =3D []string{def}
> + 	}
> ++	if filtered {
> ++		return append(compiler[0:1], =
filterCompilerFlags(compiler[1:])...)
> ++	}
> + 	return compiler
> + }
> +=20
> +@@ -2285,8 +2290,23 @@ func envList(key, def string) []string {
> + 	return strings.Fields(v)
> + }
> +=20
> ++var filterFlags =3D os.Getenv("CGO_PEDANTIC") =3D=3D ""
> ++
> ++func filterCompilerFlags(flags []string) []string {
> ++	var newflags []string
> ++	if !filterFlags {
> ++		return flags
> ++	}
> ++	for _, flag :=3D range flags {
> ++		if strings.HasPrefix(flag, "-m") {
> ++			newflags =3D append(newflags, flag)
> ++		}
> ++	}
> ++	return newflags
> ++}
> ++
> + // CFlags returns the flags to use when invoking the C, C++ or =
Fortran compilers, or cgo.
> +-func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, =
cxxflags, fflags, ldflags []string, err error) {
> ++func (b *Builder) CFlags(p *load.Package, filtered bool) (cppflags, =
cflags, cxxflags, fflags, ldflags []string, err error) {
> + 	defaults :=3D "-g -O2"
> +=20
> + 	if cppflags, err =3D buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, =
checkCompilerFlags); err !=3D nil {
> +@@ -2304,6 +2324,13 @@ func (b *Builder) CFlags(p *load.Package) =
(cppflags, cflags, cxxflags, fflags, l
> + 	if ldflags, err =3D buildFlags("LDFLAGS", defaults, =
p.CgoLDFLAGS, checkLinkerFlags); err !=3D nil {
> + 		return
> + 	}
> ++	if filtered {
> ++		cppflags =3D filterCompilerFlags(cppflags)
> ++		cflags =3D filterCompilerFlags(cflags)
> ++		cxxflags =3D filterCompilerFlags(cxxflags)
> ++		fflags =3D filterCompilerFlags(fflags)
> ++		ldflags =3D filterCompilerFlags(ldflags)
> ++	}
> +=20
> + 	return
> + }
> +@@ -2319,7 +2346,7 @@ var cgoRe =3D regexp.MustCompile(`[/\\:]`)
> +=20
> + func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, =
pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) =
(outGo, outObj []string, err error) {
> + 	p :=3D a.Package
> +-	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err =
:=3D b.CFlags(p)
> ++	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err =
:=3D b.CFlags(p, false)
> + 	if err !=3D nil {
> + 		return nil, nil, err
> + 	}
> +@@ -2679,7 +2706,7 @@ func (b *Builder) swigIntSize(objdir string) =
(intsize string, err error) {
> +=20
> + // Run SWIG on one SWIG input file.
> + func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir =
string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC =
string, err error) {
> +-	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err :=3D b.CFlags(p)
> ++	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err :=3D b.CFlags(p, =
false)
> + 	if err !=3D nil {
> + 		return "", "", err
> + 	}
> diff --git =
a/recipes-containers/kubernetes/go-1.12/0003-allow-GOTOOLDIR-to-be-overrid=
den-in-the-environment.patch =
b/recipes-containers/kubernetes/go-1.12/0003-allow-GOTOOLDIR-to-be-overrid=
den-in-the-environment.patch
> new file mode 100644
> index 0000000..b6ca40e
> --- /dev/null
> +++ =
b/recipes-containers/kubernetes/go-1.12/0003-allow-GOTOOLDIR-to-be-overrid=
den-in-the-environment.patch
> @@ -0,0 +1,48 @@
> +=46rom 5c32c38bf19b24f0aadd78012d17ff5caa82151e Mon Sep 17 00:00:00 =
2001
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
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/cmd/dist/build.go
> ++++ go/src/cmd/dist/build.go
> +@@ -228,7 +228,9 @@ func xinit() {
> + 	workdir =3D xworkdir()
> + 	xatexit(rmworkdir)
> +=20
> +-	tooldir =3D pathf("%s/pkg/tool/%s_%s", goroot, gohostos, =
gohostarch)
> ++	if tooldir =3D os.Getenv("GOTOOLDIR"); tooldir =3D=3D "" {
> ++		tooldir =3D pathf("%s/pkg/tool/%s_%s", goroot, gohostos, =
gohostarch)
> ++	}
> + }
> +=20
> + // compilerEnv returns a map from "goos/goarch" to the
> +Index: go/src/cmd/go/internal/cfg/cfg.go
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/cmd/go/internal/cfg/cfg.go
> ++++ go/src/cmd/go/internal/cfg/cfg.go
> +@@ -116,7 +116,11 @@ func init() {
> + 		// variables. This matches the initialization of ToolDir =
in
> + 		// go/build, except for using GOROOT rather than
> + 		// runtime.GOROOT.
> +-		build.ToolDir =3D filepath.Join(GOROOT, =
"pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
> ++		if s :=3D os.Getenv("GOTOOLDIR"); s !=3D "" {
> ++			build.ToolDir =3D filepath.Clean(s)
> ++		} else {
> ++			build.ToolDir =3D filepath.Join(GOROOT, =
"pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
> ++		}
> + 	}
> + }
> +=20
> diff --git =
a/recipes-containers/kubernetes/go-1.12/0004-ld-add-soname-to-shareable-ob=
jects.patch =
b/recipes-containers/kubernetes/go-1.12/0004-ld-add-soname-to-shareable-ob=
jects.patch
> new file mode 100644
> index 0000000..004a33a
> --- /dev/null
> +++ =
b/recipes-containers/kubernetes/go-1.12/0004-ld-add-soname-to-shareable-ob=
jects.patch
> @@ -0,0 +1,45 @@
> +=46rom 55eb8c95a89f32aec16b7764e78e8cf75169dc81 Mon Sep 17 00:00:00 =
2001
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
> +diff --git a/src/cmd/link/internal/ld/lib.go =
b/src/cmd/link/internal/ld/lib.go
> +index 220aab3..703925f 100644
> +--- a/src/cmd/link/internal/ld/lib.go
> ++++ b/src/cmd/link/internal/ld/lib.go
> +@@ -1135,6 +1135,7 @@ func (ctxt *Link) hostlink() {
> + 				argv =3D append(argv, "-Wl,-z,relro")
> + 			}
> + 			argv =3D append(argv, "-shared")
> ++			argv =3D append(argv, =
fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
> + 			if ctxt.HeadType !=3D objabi.Hwindows {
> + 				// Pass -z nodelete to mark the shared =
library as
> + 				// non-closeable: a dlclose will do =
nothing.
> +@@ -1146,6 +1147,8 @@ func (ctxt *Link) hostlink() {
> + 			argv =3D append(argv, "-Wl,-z,relro")
> + 		}
> + 		argv =3D append(argv, "-shared")
> ++		argv =3D append(argv, fmt.Sprintf("-Wl,-soname,%s", =
filepath.Base(*flagOutfile)))
> ++
> + 	case BuildModePlugin:
> + 		if ctxt.HeadType =3D=3D objabi.Hdarwin {
> + 			argv =3D append(argv, "-dynamiclib")
> +@@ -1154,6 +1157,7 @@ func (ctxt *Link) hostlink() {
> + 				argv =3D append(argv, "-Wl,-z,relro")
> + 			}
> + 			argv =3D append(argv, "-shared")
> ++			argv =3D append(argv, =
fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
> + 		}
> + 	}
> +=20
> diff --git =
a/recipes-containers/kubernetes/go-1.12/0005-make.bash-override-CC-when-bu=
ilding-dist-and-go_boot.patch =
b/recipes-containers/kubernetes/go-1.12/0005-make.bash-override-CC-when-bu=
ilding-dist-and-go_boot.patch
> new file mode 100644
> index 0000000..ace8de9
> --- /dev/null
> +++ =
b/recipes-containers/kubernetes/go-1.12/0005-make.bash-override-CC-when-bu=
ilding-dist-and-go_boot.patch
> @@ -0,0 +1,37 @@
> +=46rom 1bf15aa8fb773604b2524cfdab493fa4d8fa9285 Mon Sep 17 00:00:00 =
2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Sat, 17 Feb 2018 06:32:45 -0800
> +Subject: [PATCH] make.bash: override CC when building dist and =
go_bootstrap
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
> +@@ -163,7 +163,7 @@ if [ "$GOROOT_BOOTSTRAP" =3D "$GOROOT" ]; then
> + 	exit 1
> + fi
> + rm -f cmd/dist/dist
> +-GOROOT=3D"$GOROOT_BOOTSTRAP" GOOS=3D"" GOARCH=3D"" =
"$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> ++CC=3D"${BUILD_CC:-${CC}}" GOROOT=3D"$GOROOT_BOOTSTRAP" GOOS=3D"" =
GOARCH=3D"" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> +=20
> + # -e doesn't propagate out of eval, so check success by hand.
> + eval $(./cmd/dist/dist env -p || echo FAIL=3Dtrue)
> +@@ -194,7 +194,7 @@ fi
> + # Run dist bootstrap to complete make.bash.
> + # Bootstrap installs a proper cmd/dist, built with the new =
toolchain.
> + # Throw ours, built with Go 1.4, away after bootstrap.
> +-./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
> ++CC=3D"${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap $buildall $vflag =
$GO_DISTFLAGS "$@"
> + rm -f ./cmd/dist/dist
> +=20
> + # DO NOT ADD ANY NEW CODE HERE.
> diff --git =
a/recipes-containers/kubernetes/go-1.12/0006-cmd-dist-separate-host-and-ta=
rget-builds.patch =
b/recipes-containers/kubernetes/go-1.12/0006-cmd-dist-separate-host-and-ta=
rget-builds.patch
> new file mode 100644
> index 0000000..0c0d5da
> --- /dev/null
> +++ =
b/recipes-containers/kubernetes/go-1.12/0006-cmd-dist-separate-host-and-ta=
rget-builds.patch
> @@ -0,0 +1,282 @@
> +=46rom fe0fcaf43ef3aab81541dad2a71b46254dc4cf6a Mon Sep 17 00:00:00 =
2001
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
> + src/cmd/dist/build.go | 153 =
++++++++++++++++++++++++++++++------------
> + 1 file changed, 111 insertions(+), 42 deletions(-)
> +
> +Index: go/src/cmd/dist/build.go
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/cmd/dist/build.go
> ++++ go/src/cmd/dist/build.go
> +@@ -39,6 +39,7 @@ var (
> + 	goldflags        string
> + 	workdir          string
> + 	tooldir          string
> ++	build_tooldir	 string
> + 	oldgoos          string
> + 	oldgoarch        string
> + 	exe              string
> +@@ -50,6 +51,7 @@ var (
> +=20
> + 	rebuildall   bool
> + 	defaultclang bool
> ++	crossBuild   bool
> +=20
> + 	vflag int // verbosity
> + )
> +@@ -231,6 +233,8 @@ func xinit() {
> + 	if tooldir =3D os.Getenv("GOTOOLDIR"); tooldir =3D=3D "" {
> + 		tooldir =3D pathf("%s/pkg/tool/%s_%s", goroot, gohostos, =
gohostarch)
> + 	}
> ++	build_tooldir =3D pathf("%s/pkg/tool/native_native", goroot)
> ++
> + }
> +=20
> + // compilerEnv returns a map from "goos/goarch" to the
> +@@ -260,7 +264,6 @@ func compilerEnv(envName, def string) ma
> + 		if gohostos !=3D goos || gohostarch !=3D goarch {
> + 			m[gohostos+"/"+gohostarch] =3D m[""]
> + 		}
> +-		m[""] =3D env
> + 	}
> +=20
> + 	for _, goos :=3D range okgoos {
> +@@ -487,8 +490,10 @@ func setup() {
> + 	// We keep it in pkg/, just like the object directory above.
> + 	if rebuildall {
> + 		xremoveall(tooldir)
> ++		xremoveall(build_tooldir)
> + 	}
> + 	xmkdirall(tooldir)
> ++	xmkdirall(build_tooldir)
> +=20
> + 	// Remove tool binaries from before the tool/gohostos_gohostarch
> + 	xremoveall(pathf("%s/bin/tool", goroot))
> +@@ -1155,11 +1160,29 @@ func cmdbootstrap() {
> +=20
> + 	var noBanner bool
> + 	var debug bool
> ++	var hostOnly bool
> ++	var targetOnly bool
> ++	var toBuild =3D []string { "std", "cmd" }
> ++
> + 	flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
> + 	flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap =
process")
> + 	flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print =
banner")
> ++	flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host =
binaries, not target")
> ++	flag.BoolVar(&targetOnly, "target-only", targetOnly, "build only =
target binaries, not host")
> +=20
> +-	xflagparse(0)
> ++	xflagparse(-1)
> ++
> ++	if (hostOnly && targetOnly) {
> ++		fatalf("specify only one of --host-only or =
--target-only\n")
> ++	}
> ++	crossBuild =3D hostOnly || targetOnly
> ++	if flag.NArg() > 0 {
> ++		if crossBuild {
> ++			toBuild =3D flag.Args()
> ++		} else {
> ++			fatalf("package names not permitted without =
--host-only or --target-only\n")
> ++		}
> ++	}
> +=20
> + 	if debug {
> + 		// cmd/buildid is used in debug mode.
> +@@ -1207,8 +1230,13 @@ func cmdbootstrap() {
> + 		xprintf("\n")
> + 	}
> +=20
> +-	gogcflags =3D os.Getenv("GO_GCFLAGS") // we were using =
$BOOT_GO_GCFLAGS until now
> +-	goldflags =3D os.Getenv("GO_LDFLAGS")
> ++	// For split host/target cross/cross-canadian builds, we don't
> ++	// want to be setting these flags until after we have compiled
> ++	// the toolchain that runs on the build host.
> ++	if ! crossBuild {
> ++		gogcflags =3D os.Getenv("GO_GCFLAGS") // we were using =
$BOOT_GO_GCFLAGS until now
> ++		goldflags =3D os.Getenv("GO_LDFLAGS")
> ++	}
> + 	goBootstrap :=3D pathf("%s/go_bootstrap", tooldir)
> + 	cmdGo :=3D pathf("%s/go", gobin)
> + 	if debug {
> +@@ -1237,7 +1265,11 @@ func cmdbootstrap() {
> + 		xprintf("\n")
> + 	}
> + 	xprintf("Building Go toolchain2 using go_bootstrap and Go =
toolchain1.\n")
> +-	os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> ++	if crossBuild {
> ++		os.Setenv("CC", defaultcc[""])
> ++	} else {
> ++		os.Setenv("CC", compilerEnvLookup(defaultcc, goos, =
goarch))
> ++	}
> + 	goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
> + 	if debug {
> + 		run("", ShowOutput|CheckExit, pathf("%s/compile", =
tooldir), "-V=3Dfull")
> +@@ -1274,50 +1306,84 @@ func cmdbootstrap() {
> + 	}
> + 	checkNotStale(goBootstrap, append(toolchain, =
"runtime/internal/sys")...)
> +=20
> +-	if goos =3D=3D oldgoos && goarch =3D=3D oldgoarch {
> +-		// Common case - not setting up for cross-compilation.
> +-		timelog("build", "toolchain")
> +-		if vflag > 0 {
> +-			xprintf("\n")
> ++	if crossBuild {
> ++		gogcflags =3D os.Getenv("GO_GCFLAGS")
> ++		goldflags =3D os.Getenv("GO_LDFLAGS")
> ++		tool_files, _ :=3D filepath.Glob(pathf("%s/*", tooldir))
> ++		for _, f :=3D range tool_files {
> ++			copyfile(pathf("%s/%s", build_tooldir, =
filepath.Base(f)), f, writeExec)
> ++			xremove(f)
> ++		}
> ++		os.Setenv("GOTOOLDIR", build_tooldir)
> ++		goBootstrap =3D pathf("%s/go_bootstrap", build_tooldir)
> ++		if hostOnly {
> ++			timelog("build", "host toolchain")
> ++			if vflag > 0 {
> ++				xprintf("\n")
> ++			}
> ++			xprintf("Building %s for host, %s/%s.\n", =
strings.Join(toBuild, ","), goos, goarch)
> ++			goInstall(goBootstrap, toBuild...)
> ++			checkNotStale(goBootstrap, toBuild...)
> ++			// Skip cmdGo staleness checks here, since we =
can't necessarily run the cmdGo binary
> ++
> ++			timelog("build", "target toolchain")
> ++			if vflag > 0 {
> ++				xprintf("\n")
> ++			}
> ++		} else if targetOnly {
> ++			goos =3D oldgoos
> ++			goarch =3D oldgoarch
> ++			os.Setenv("GOOS", goos)
> ++			os.Setenv("GOARCH", goarch)
> ++			os.Setenv("CC", compilerEnvLookup(defaultcc, =
goos, goarch))
> ++			xprintf("Building %s for target, %s/%s.\n", =
strings.Join(toBuild, ","), goos, goarch)
> ++			goInstall(goBootstrap, toBuild...)
> ++			checkNotStale(goBootstrap, toBuild...)
> ++			// Skip cmdGo staleness checks here, since we =
can't run the target's cmdGo binary
> + 		}
> +-		xprintf("Building packages and commands for %s/%s.\n", =
goos, goarch)
> + 	} else {
> +-		// GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
> +-		// Finish GOHOSTOS/GOHOSTARCH installation and then
> +-		// run GOOS/GOARCH installation.
> +-		timelog("build", "host toolchain")
> +-		if vflag > 0 {
> +-			xprintf("\n")
> ++
> ++		if goos =3D=3D oldgoos && goarch =3D=3D oldgoarch {
> ++			// Common case - not setting up for =
cross-compilation.
> ++			timelog("build", "toolchain")
> ++			if vflag > 0 {
> ++				xprintf("\n")
> ++			}
> ++			xprintf("Building packages and commands for =
%s/%s.\n", goos, goarch)
> ++		} else {
> ++			// GOOS/GOARCH does not match =
GOHOSTOS/GOHOSTARCH.
> ++			// Finish GOHOSTOS/GOHOSTARCH installation and =
then
> ++			// run GOOS/GOARCH installation.
> ++			timelog("build", "host toolchain")
> ++			if vflag > 0 {
> ++				xprintf("\n")
> ++			}
> ++			xprintf("Building packages and commands for =
host, %s/%s.\n", goos, goarch)
> ++			goInstall(goBootstrap, "std", "cmd")
> ++			checkNotStale(goBootstrap, "std", "cmd")
> ++			checkNotStale(cmdGo, "std", "cmd")
> ++
> ++			timelog("build", "target toolchain")
> ++			if vflag > 0 {
> ++				xprintf("\n")
> ++			}
> ++			goos =3D oldgoos
> ++			goarch =3D oldgoarch
> ++			os.Setenv("GOOS", goos)
> ++			os.Setenv("GOARCH", goarch)
> ++			os.Setenv("CC", compilerEnvLookup(defaultcc, =
goos, goarch))
> ++			xprintf("Building packages and commands for =
target, %s/%s.\n", goos, goarch)
> + 		}
> +-		xprintf("Building packages and commands for host, =
%s/%s.\n", goos, goarch)
> + 		goInstall(goBootstrap, "std", "cmd")
> + 		checkNotStale(goBootstrap, "std", "cmd")
> + 		checkNotStale(cmdGo, "std", "cmd")
> +=20
> +-		timelog("build", "target toolchain")
> +-		if vflag > 0 {
> +-			xprintf("\n")
> +-		}
> +-		goos =3D oldgoos
> +-		goarch =3D oldgoarch
> +-		os.Setenv("GOOS", goos)
> +-		os.Setenv("GOARCH", goarch)
> +-		os.Setenv("CC", compilerEnvLookup(defaultcc, goos, =
goarch))
> +-		xprintf("Building packages and commands for target, =
%s/%s.\n", goos, goarch)
> +-	}
> +-	targets :=3D []string{"std", "cmd"}
> +-	if goos =3D=3D "js" && goarch =3D=3D "wasm" {
> +-		// Skip the cmd tools for js/wasm. They're not usable.
> +-		targets =3D targets[:1]
> +-	}
> +-	goInstall(goBootstrap, targets...)
> +-	checkNotStale(goBootstrap, targets...)
> +-	checkNotStale(cmdGo, targets...)
> +-	if debug {
> +-		run("", ShowOutput|CheckExit, pathf("%s/compile", =
tooldir), "-V=3Dfull")
> +-		run("", ShowOutput|CheckExit, pathf("%s/buildid", =
tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, =
goarch))
> +-		checkNotStale(goBootstrap, append(toolchain, =
"runtime/internal/sys")...)
> +-		copyfile(pathf("%s/compile4", tooldir), =
pathf("%s/compile", tooldir), writeExec)
> ++		if debug {
> ++			run("", ShowOutput|CheckExit, =
pathf("%s/compile", tooldir), "-V=3Dfull")
> ++			run("", ShowOutput|CheckExit, =
pathf("%s/buildid", tooldir), =
pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
> ++			checkNotStale(goBootstrap, append(toolchain, =
"runtime/internal/sys")...)
> ++			copyfile(pathf("%s/compile4", tooldir), =
pathf("%s/compile", tooldir), writeExec)
> ++		}
> + 	}
> +=20
> + 	// Check that there are no new files in $GOROOT/bin other than
> +@@ -1335,7 +1401,11 @@ func cmdbootstrap() {
> + 	}
> +=20
> + 	// Remove go_bootstrap now that we're done.
> +-	xremove(pathf("%s/go_bootstrap", tooldir))
> ++	// Except that for split host/target cross-builds, we need to
> ++	// keep it.
> ++	if ! crossBuild {
> ++		xremove(pathf("%s/go_bootstrap", tooldir))
> ++	}
> +=20
> + 	// Print trailing banner unless instructed otherwise.
> + 	if !noBanner {
> diff --git =
a/recipes-containers/kubernetes/go-1.12/0007-cmd-go-make-GOROOT-precious-b=
y-default.patch =
b/recipes-containers/kubernetes/go-1.12/0007-cmd-go-make-GOROOT-precious-b=
y-default.patch
> new file mode 100644
> index 0000000..29ef947
> --- /dev/null
> +++ =
b/recipes-containers/kubernetes/go-1.12/0007-cmd-go-make-GOROOT-precious-b=
y-default.patch
> @@ -0,0 +1,106 @@
> +=46rom 7cc60b3887be2d5674b9f5d422d022976cf205e5 Mon Sep 17 00:00:00 =
2001
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
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/cmd/go/internal/work/action.go
> ++++ go/src/cmd/go/internal/work/action.go
> +@@ -600,6 +600,9 @@ func (b *Builder) addTransitiveLinkDeps(
> + 			if p1 =3D=3D nil || p1.Shlib =3D=3D "" || =
haveShlib[filepath.Base(p1.Shlib)] {
> + 				continue
> + 			}
> ++			if goRootPrecious && (p1.Standard || p1.Goroot) =
{
> ++				continue
> ++			}
> + 			haveShlib[filepath.Base(p1.Shlib)] =3D true
> + 			// TODO(rsc): The use of ModeInstall here is =
suspect, but if we only do ModeBuild,
> + 			// we'll end up building an overall library or =
executable that depends at runtime
> +Index: go/src/cmd/go/internal/work/build.go
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/cmd/go/internal/work/build.go
> ++++ go/src/cmd/go/internal/work/build.go
> +@@ -147,6 +147,7 @@ See also: go install, go get, go clean.
> + }
> +=20
> + const concurrentGCBackendCompilationEnabledByDefault =3D true
> ++var goRootPrecious bool =3D true
> +=20
> + func init() {
> + 	// break init cycle
> +@@ -160,6 +161,10 @@ func init() {
> +=20
> + 	AddBuildFlags(CmdBuild)
> + 	AddBuildFlags(CmdInstall)
> ++
> ++	if x :=3D os.Getenv("GOROOT_OVERRIDE"); x !=3D "" {
> ++		goRootPrecious =3D false
> ++	}
> + }
> +=20
> + // Note that flags consulted by other parts of the code
> +Index: go/src/cmd/go/internal/work/exec.go
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/cmd/go/internal/work/exec.go
> ++++ go/src/cmd/go/internal/work/exec.go
> +@@ -436,6 +436,23 @@ func (b *Builder) build(a *Action) (err
> + 		return fmt.Errorf("missing or invalid binary-only =
package; expected file %q", a.Package.Target)
> + 	}
> +=20
> ++	if goRootPrecious && (a.Package.Standard || a.Package.Goroot) {
> ++		_, err :=3D os.Stat(a.Package.Target)
> ++		if err =3D=3D nil {
> ++			a.built =3D a.Package.Target
> ++			a.Target =3D a.Package.Target
> ++			a.buildID =3D b.fileHash(a.Package.Target)
> ++			a.Package.Stale =3D false
> ++			a.Package.StaleReason =3D "GOROOT-resident =
package"
> ++			return nil
> ++		}
> ++		a.Package.Stale =3D true
> ++		a.Package.StaleReason =3D "missing or invalid =
GOROOT-resident package"
> ++		if b.IsCmdList {
> ++			return nil
> ++		}
> ++	}
> ++
> + 	if err :=3D b.Mkdir(a.Objdir); err !=3D nil {
> + 		return err
> + 	}
> +@@ -1438,6 +1455,14 @@ func BuildInstallFunc(b *Builder, a *Act
> + 		return nil
> + 	}
> +=20
> ++	if goRootPrecious && a.Package !=3D nil {
> ++		p :=3D a.Package
> ++		if p.Standard || p.Goroot {
> ++			err :=3D fmt.Errorf("attempting to install =
package %s into read-only GOROOT", p.ImportPath)
> ++			return err
> ++		}
> ++	}
> ++
> + 	if err :=3D b.Mkdir(a.Objdir); err !=3D nil {
> + 		return err
> + 	}
> diff --git =
a/recipes-containers/kubernetes/go-1.12/0008-use-GOBUILDMODE-to-set-buildm=
ode.patch =
b/recipes-containers/kubernetes/go-1.12/0008-use-GOBUILDMODE-to-set-buildm=
ode.patch
> new file mode 100644
> index 0000000..225cf43
> --- /dev/null
> +++ =
b/recipes-containers/kubernetes/go-1.12/0008-use-GOBUILDMODE-to-set-buildm=
ode.patch
> @@ -0,0 +1,37 @@
> +=46rom 0e0c247f0caec23528889ff09d98348cba9028f1 Mon Sep 17 00:00:00 =
2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Fri, 26 Oct 2018 15:02:32 +0800
> +Subject: [PATCH] use GOBUILDMODE to set buildmode
> +
> +While building go itself, the go build system does not support
> +to set `-buildmode=3Dpie' from environment.
> +
> +Add GOBUILDMODE to support it which make PIE executables the default
> +build mode, as PIE executables are required as of Yocto
> +
> +Refers: =
https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI
> +Upstream-Status: Denied [upstream choose antoher solution: `17a256b
> +cmd/go: -buildmode=3Dpie for android/arm']
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + src/cmd/go/internal/work/build.go | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +Index: go/src/cmd/go/internal/work/build.go
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- go.orig/src/cmd/go/internal/work/build.go
> ++++ go/src/cmd/go/internal/work/build.go
> +@@ -223,7 +223,11 @@ func AddBuildFlags(cmd *base.Command) {
> +=20
> + 	cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
> + 	cmd.Flag.Var(buildCompiler{}, "compiler", "")
> +-	cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default", =
"")
> ++	if bm :=3D os.Getenv("GOBUILDMODE"); bm !=3D "" {
> ++		cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", bm, =
"")
> ++	} else {
> ++		cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", =
"default", "")
> ++	}
> + 	cmd.Flag.Var(&load.BuildGcflags, "gcflags", "")
> + 	cmd.Flag.Var(&load.BuildGccgoflags, "gccgoflags", "")
> + 	cmd.Flag.StringVar(&cfg.BuildMod, "mod", "", "")
> diff --git =
a/recipes-containers/kubernetes/go-1.12/0009-ld-replace-glibc-dynamic-link=
er-with-musl.patch =
b/recipes-containers/kubernetes/go-1.12/0009-ld-replace-glibc-dynamic-link=
er-with-musl.patch
> new file mode 100644
> index 0000000..840cf4b
> --- /dev/null
> +++ =
b/recipes-containers/kubernetes/go-1.12/0009-ld-replace-glibc-dynamic-link=
er-with-musl.patch
> @@ -0,0 +1,112 @@
> +=46rom 35ea4be34e94912b00837e0f7c7385f2e98fe769 Mon Sep 17 00:00:00 =
2001
> +From: Matt Madison <matt@madison.systems>
> +Date: Sun, 18 Feb 2018 08:24:05 -0800
> +Subject: [PATCH] ld: replace glibc dynamic linker with musl
> +
> +Rework of patch by Khem Raj <raj.khem@gmail.com>
> +for go 1.10.  Should be applied conditionally on
> +musl being the system C library.
> +
> +Upstream-Status: Inappropriate [Real fix should be portable across =
libcs]
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
> + 		PEreloc1:         pereloc1,
> + 		TLSIEtoLE:        tlsIEtoLE,
> +=20
> +-		Linuxdynld:     "/lib64/ld-linux-x86-64.so.2",
> ++		Linuxdynld:     "/lib64/ld-musl-x86-64.so.1",
> + 		Freebsddynld:   "/libexec/ld-elf.so.1",
> + 		Openbsddynld:   "/usr/libexec/ld.so",
> + 		Netbsddynld:    "/libexec/ld.elf_so",
> +--- a/src/cmd/link/internal/arm/obj.go
> ++++ b/src/cmd/link/internal/arm/obj.go
> +@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
> + 		Machoreloc1:      machoreloc1,
> + 		PEreloc1:         pereloc1,
> +=20
> +-		Linuxdynld:     "/lib/ld-linux.so.3", // 2 for OABI, 3 =
for EABI
> ++		Linuxdynld:     "/lib/ld-musl-armhf.so.1",
> + 		Freebsddynld:   "/usr/libexec/ld-elf.so.1",
> + 		Openbsddynld:   "/usr/libexec/ld.so",
> + 		Netbsddynld:    "/libexec/ld.elf_so",
> +--- a/src/cmd/link/internal/arm64/obj.go
> ++++ b/src/cmd/link/internal/arm64/obj.go
> +@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
> + 		Gentext:          gentext,
> + 		Machoreloc1:      machoreloc1,
> +=20
> +-		Linuxdynld: "/lib/ld-linux-aarch64.so.1",
> ++		Linuxdynld: "/lib/ld-musl-aarch64.so.1",
> +=20
> + 		Freebsddynld:   "XXX",
> + 		Openbsddynld:   "XXX",
> +--- a/src/cmd/link/internal/mips/obj.go
> ++++ b/src/cmd/link/internal/mips/obj.go
> +@@ -60,7 +60,7 @@ func Init() (*sys.Arch, ld.Arch) {
> + 		Gentext:          gentext,
> + 		Machoreloc1:      machoreloc1,
> +=20
> +-		Linuxdynld: "/lib/ld.so.1",
> ++		Linuxdynld: "/lib/ld-musl-mipsle.so.1",
> +=20
> + 		Freebsddynld:   "XXX",
> + 		Openbsddynld:   "XXX",
> +--- a/src/cmd/link/internal/mips64/obj.go
> ++++ b/src/cmd/link/internal/mips64/obj.go
> +@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
> + 		Gentext:          gentext,
> + 		Machoreloc1:      machoreloc1,
> +=20
> +-		Linuxdynld:     "/lib64/ld64.so.1",
> ++		Linuxdynld:     "/lib64/ld-musl-mips64le.so.1",
> + 		Freebsddynld:   "XXX",
> + 		Openbsddynld:   "XXX",
> + 		Netbsddynld:    "XXX",
> +--- a/src/cmd/link/internal/ppc64/obj.go
> ++++ b/src/cmd/link/internal/ppc64/obj.go
> +@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {
> + 		Machoreloc1:      machoreloc1,
> +=20
> + 		// TODO(austin): ABI v1 uses /usr/lib/ld.so.1,
> +-		Linuxdynld: "/lib64/ld64.so.1",
> ++		Linuxdynld: "/lib64/ld-musl-powerpc64le.so.1",
> +=20
> + 		Freebsddynld:   "XXX",
> + 		Openbsddynld:   "XXX",
> +--- a/src/cmd/link/internal/s390x/obj.go
> ++++ b/src/cmd/link/internal/s390x/obj.go
> +@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
> + 		Gentext:          gentext,
> + 		Machoreloc1:      machoreloc1,
> +=20
> +-		Linuxdynld: "/lib64/ld64.so.1",
> ++		Linuxdynld: "/lib64/ld-musl-s390x.so.1",
> +=20
> + 		// not relevant for s390x
> + 		Freebsddynld:   "XXX",
> +--- a/src/cmd/link/internal/x86/obj.go
> ++++ b/src/cmd/link/internal/x86/obj.go
> +@@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {
> + 		Machoreloc1:      machoreloc1,
> + 		PEreloc1:         pereloc1,
> +=20
> +-		Linuxdynld:   "/lib/ld-linux.so.2",
> ++		Linuxdynld:   "/lib/ld-musl-i386.so.1",
> + 		Freebsddynld: "/usr/libexec/ld-elf.so.1",
> + 		Openbsddynld: "/usr/libexec/ld.so",
> + 		Netbsddynld:  "/usr/libexec/ld.elf_so",
> diff --git a/recipes-containers/kubernetes/go-common.inc =
b/recipes-containers/kubernetes/go-common.inc
> new file mode 100644
> index 0000000..93a3d3b
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-common.inc
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "Go programming language compiler"
> +DESCRIPTION =3D " The Go programming language is an open source =
project to make \
> + programmers more productive. Go is expressive, concise, clean, and\
> + efficient. Its concurrency mechanisms make it easy to write =
programs\
> + that get the most out of multicore and networked machines, while =
its\
> + novel type system enables flexible and modular program =
construction.\
> + Go compiles quickly to machine code yet has the convenience of\
> + garbage collection and the power of run-time reflection. It's a\
> + fast, statically typed, compiled language that feels like a\
> + dynamically typed, interpreted language."
> +
> +HOMEPAGE =3D " http://golang.org/"
> +LICENSE =3D "BSD-3-Clause"
> +
> +inherit goarch
> +
> +SRC_URI =3D "http://golang.org/dl/go${PV}.src.tar.gz;name=3Dmain"
> +S =3D "${WORKDIR}/go"
> +B =3D "${S}"
> +UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)\.src\.tar"
> +
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +SSTATE_SCAN_CMD =3D "true"
> +
> +export GOROOT_OVERRIDE =3D "1"
> +export GOTMPDIR ?=3D "${WORKDIR}/go-tmp"
> +GOTMPDIR[vardepvalue] =3D ""
> +export CGO_ENABLED =3D "1"
> +
> +do_compile_prepend() {
> +	BUILD_CC=3D${BUILD_CC}
> +}
> diff --git a/recipes-containers/kubernetes/go-cross-canadian.inc =
b/recipes-containers/kubernetes/go-cross-canadian.inc
> new file mode 100644
> index 0000000..945d0f9
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-cross-canadian.inc
> @@ -0,0 +1,66 @@
> +inherit cross-canadian
> +
> +DEPENDS =3D "go-native virtual/${HOST_PREFIX}go-crosssdk =
virtual/nativesdk-${HOST_PREFIX}go-runtime \
> +           virtual/${HOST_PREFIX}gcc-crosssdk virtual/nativesdk-libc =
\
> +           virtual/nativesdk-${HOST_PREFIX}compilerlibs"
> +PN =3D "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> +
> +# it uses gcc on build machine during go-cross-canadian bootstrap, =
but
> +# the gcc version may be old and not support option =
'-fmacro-prefix-map'
> +# which is one of default values of DEBUG_PREFIX_MAP
> +DEBUG_PREFIX_MAP =3D =
"-fdebug-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-$=
{PR} \
> +                    -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
> +                    -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> +                    "
> +
> +export GOHOSTOS =3D "${BUILD_GOOS}"
> +export GOHOSTARCH =3D "${BUILD_GOARCH}"
> +export GOROOT_BOOTSTRAP =3D "${STAGING_LIBDIR_NATIVE}/go"
> +export GOTOOLDIR_BOOTSTRAP =3D =
"${STAGING_LIBDIR_NATIVE}/${HOST_SYS}/go/pkg/tool/${BUILD_GOTUPLE}"
> +export GOROOT_FINAL =3D "${libdir}/go"
> +export CGO_CFLAGS =3D "${CFLAGS}"
> +export CGO_LDFLAGS =3D "${LDFLAGS}"
> +export GO_LDFLAGS =3D '-linkmode external -extld ${HOST_PREFIX}gcc =
-extldflags "--sysroot=3D${STAGING_DIR_HOST} ${SECURITY_NOPIE_CFLAGS} =
${HOST_CC_ARCH} ${LDFLAGS}"'
> +
> +do_configure[noexec] =3D "1"
> +
> +do_compile() {
> +	export CC_FOR_${HOST_GOOS}_${HOST_GOARCH}=3D"${HOST_PREFIX}gcc =
--sysroot=3D${STAGING_DIR_HOST}${SDKPATHNATIVE} =
${SECURITY_NOPIE_CFLAGS}"
> +	export CXX_FOR_${HOST_GOOS}_${HOST_GOARCH}=3D"${HOST_PREFIX}gxx =
--sysroot=3D${STAGING_DIR_HOST}${SDKPATHNATIVE} =
${SECURITY_NOPIE_CFLAGS}"
> +	cd src
> +	./make.bash --host-only --no-banner
> +	cd ${B}
> +}
> +do_compile[dirs] =3D+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] +=3D "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +
> +
> +make_wrapper() {
> +	rm -f ${D}${bindir}/$2
> +	cat <<END >${D}${bindir}/$2
> +#!/bin/sh
> +here=3D\`dirname \$0\`
> +native_goroot=3D\`readlink -f \$here/../../lib/${TARGET_SYS}/go\`
> +export GOARCH=3D"${TARGET_GOARCH}"
> +export GOOS=3D"${TARGET_GOOS}"
> +test -n "\$GOARM" || export GOARM=3D"${TARGET_GOARM}"
> +test -n "\$GO386" || export GO386=3D"${TARGET_GO386}"
> +test -n "\$GOMIPS" || export GOMIPS=3D"${TARGET_GOMIPS}"
> +export GOTOOLDIR=3D"\$native_goroot/pkg/tool/${HOST_GOTUPLE}"
> +test -n "\$GOROOT" || export =
GOROOT=3D"\$OECORE_TARGET_SYSROOT/${target_libdir}/go"
> +\$here/../../lib/${TARGET_SYS}/go/bin/$1 "\$@"
> +END
> +	chmod +x ${D}${bindir}/$2
> +}
> +
> +do_install() {
> +	install -d ${D}${libdir}/go/pkg/tool
> +	cp --preserve=3Dmode,timestamps -R ${B}/pkg/tool/${HOST_GOTUPLE} =
${D}${libdir}/go/pkg/tool/
> +	install -d ${D}${bindir} ${D}${libdir}/go/bin
> +	for f in ${B}/${GO_BUILD_BINDIR}/*
> +	do
> +		base=3D`basename $f`
> +		install -m755 $f ${D}${libdir}/go/bin
> +		make_wrapper $base ${TARGET_PREFIX}$base
> +	done
> +}
> diff --git a/recipes-containers/kubernetes/go-cross-canadian_1.12.bb =
b/recipes-containers/kubernetes/go-cross-canadian_1.12.bb
> new file mode 100644
> index 0000000..7ac9449
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-cross-canadian_1.12.bb
> @@ -0,0 +1,2 @@
> +require go-cross-canadian.inc
> +require go-${PV}.inc
> diff --git a/recipes-containers/kubernetes/go-cross.inc =
b/recipes-containers/kubernetes/go-cross.inc
> new file mode 100644
> index 0000000..3d344a7
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-cross.inc
> @@ -0,0 +1,62 @@
> +inherit cross
> +
> +PROVIDES =3D "virtual/${TUNE_PKGARCH}-go"
> +DEPENDS =3D "go-native"
> +
> +PN =3D "go-cross-${TUNE_PKGARCH}"
> +
> +export GOHOSTOS =3D "${BUILD_GOOS}"
> +export GOHOSTARCH =3D "${BUILD_GOARCH}"
> +export GOOS =3D "${TARGET_GOOS}"
> +export GOARCH =3D "${TARGET_GOARCH}"
> +export GOARM =3D "${TARGET_GOARM}"
> +export GO386 =3D "${TARGET_GO386}"
> +export GOMIPS =3D "${TARGET_GOMIPS}"
> +export GOROOT_BOOTSTRAP =3D "${STAGING_LIBDIR_NATIVE}/go"
> +export GOROOT_FINAL =3D "${libdir}/go"
> +export GOCACHE =3D "${B}/.cache"
> +CC =3D "${@d.getVar('BUILD_CC').strip()}"
> +
> +do_configure[noexec] =3D "1"
> +
> +do_compile() {
> +	export CC_FOR_${GOOS}_${GOARCH}=3D"${TARGET_PREFIX}gcc =
${TARGET_CC_ARCH} --sysroot=3D${STAGING_DIR_TARGET}"
> +	export CXX_FOR_${GOOS}_${GOARCh}=3D"${TARGET_PREFIX}g++ =
${TARGET_CC_ARCH} --sysroot=3D${STAGING_DIR_TARGET}"
> +	cd src
> +	./make.bash --host-only --no-banner
> +	cd ${B}
> +}
> +do_compile[dirs] =3D+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] +=3D "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +
> +make_wrapper() {
> +	rm -f ${D}${bindir}/$2
> +	cat <<END >${D}${bindir}/$2
> +#!/bin/bash
> +here=3D\`dirname \$0\`
> +export GOARCH=3D"${TARGET_GOARCH}"
> +export GOOS=3D"${TARGET_GOOS}"
> +export GOARM=3D"\${GOARM:-${TARGET_GOARM}}"
> +export GO386=3D"\${GO386:-${TARGET_GO386}}"
> +export GOMIPS=3D"\${GOMIPS:-${TARGET_GOMIPS}}"
> +\$here/../../lib/${CROSS_TARGET_SYS_DIR}/go/bin/$1 "\$@"
> +END
> +	chmod +x ${D}${bindir}/$2
> +}
> +
> +do_install() {
> +	install -d ${D}${libdir}/go
> +	cp --preserve=3Dmode,timestamps -R ${B}/pkg ${D}${libdir}/go/
> +	install -d ${D}${libdir}/go/src
> +	(cd ${S}/src; for d in *; do \
> +		[ ! -d $d ] || cp --preserve=3Dmode,timestamps -R =
${S}/src/$d ${D}${libdir}/go/src/; \
> +	done)
> +	find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm =
-rf {} \;
> +	install -d ${D}${bindir} ${D}${libdir}/go/bin
> +	for f in ${B}/bin/*
> +	do
> +		base=3D`basename $f`
> +		install -m755 $f ${D}${libdir}/go/bin
> +		make_wrapper $base ${TARGET_PREFIX}$base
> +	done
> +}
> diff --git a/recipes-containers/kubernetes/go-cross_1.12.bb =
b/recipes-containers/kubernetes/go-cross_1.12.bb
> new file mode 100644
> index 0000000..80b5a03
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-cross_1.12.bb
> @@ -0,0 +1,2 @@
> +require go-cross.inc
> +require go-${PV}.inc
> diff --git a/recipes-containers/kubernetes/go-crosssdk.inc =
b/recipes-containers/kubernetes/go-crosssdk.inc
> new file mode 100644
> index 0000000..94f6fb8
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-crosssdk.inc
> @@ -0,0 +1,50 @@
> +inherit crosssdk
> +
> +DEPENDS =3D "go-native virtual/${TARGET_PREFIX}gcc-crosssdk =
virtual/nativesdk-${TARGET_PREFIX}compilerlibs =
virtual/${TARGET_PREFIX}binutils-crosssdk"
> +PN =3D "go-crosssdk-${SDK_SYS}"
> +PROVIDES =3D "virtual/${TARGET_PREFIX}go-crosssdk"
> +
> +export GOHOSTOS =3D "${BUILD_GOOS}"
> +export GOHOSTARCH =3D "${BUILD_GOARCH}"
> +export GOOS =3D "${TARGET_GOOS}"
> +export GOARCH =3D "${TARGET_GOARCH}"
> +export GOROOT_BOOTSTRAP =3D "${STAGING_LIBDIR_NATIVE}/go"
> +export GOROOT_FINAL =3D "${libdir}/go"
> +
> +do_configure[noexec] =3D "1"
> +
> +do_compile() {
> +	export =
CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${TARGET_PREFIX}gcc =
${TARGET_CC_ARCH} --sysroot=3D${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
> +	export =
CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${TARGET_PREFIX}g++ =
${TARGET_CC_ARCH} --sysroot=3D${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
> +	cd src
> +	./make.bash --host-only --no-banner
> +	cd ${B}
> +}
> +do_compile[dirs] =3D+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] +=3D "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +
> +make_wrapper() {
> +    rm -f ${D}${bindir}/$2
> +    cat <<END >${D}${bindir}/$2
> +#!/bin/bash
> +here=3D\`dirname \$0\`
> +export GOARCH=3D"${TARGET_GOARCH}"
> +export GOOS=3D"${TARGET_GOOS}"
> +\$here/../../lib/${CROSS_TARGET_SYS_DIR}/go/bin/$1 "\$@"
> +END
> +    chmod +x ${D}${bindir}/$2
> +}
> +
> +do_install() {
> +	install -d ${D}${libdir}/go
> +	install -d ${D}${libdir}/go/bin
> +	install -d ${D}${libdir}/go/pkg/tool
> +	install -d ${D}${bindir}
> +	cp --preserve=3Dmode,timestamps -R =
${S}/pkg/tool/${BUILD_GOTUPLE} ${D}${libdir}/go/pkg/tool/
> +	for f in ${B}/bin/*
> +	do
> +		base=3D`basename $f`
> +		install -m755 $f ${D}${libdir}/go/bin
> +		make_wrapper $base ${TARGET_PREFIX}$base
> +	done
> +}
> diff --git a/recipes-containers/kubernetes/go-crosssdk_1.12.bb =
b/recipes-containers/kubernetes/go-crosssdk_1.12.bb
> new file mode 100644
> index 0000000..1857c8a
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-crosssdk_1.12.bb
> @@ -0,0 +1,2 @@
> +require go-crosssdk.inc
> +require go-${PV}.inc
> diff --git a/recipes-containers/kubernetes/go-native.inc =
b/recipes-containers/kubernetes/go-native.inc
> new file mode 100644
> index 0000000..2077087
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-native.inc
> @@ -0,0 +1,55 @@
> +inherit native
> +
> +SRC_URI_append =3D " =
https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz;name=3Dbootstrap;=
subdir=3Dgo1.4"
> +SRC_URI[bootstrap.md5sum] =3D "dbf727a4b0e365bf88d97cbfde590016"
> +SRC_URI[bootstrap.sha256sum] =3D =
"f4ff5b5eb3a3cae1c993723f3eab519c5bae18866b5e5f96fe1102f0cb5c3e52"
> +
> +export GOOS =3D "${BUILD_GOOS}"
> +export GOARCH =3D "${BUILD_GOARCH}"
> +CC =3D "${@d.getVar('BUILD_CC').strip()}"
> +
> +GOMAKEARGS ?=3D "--no-banner"
> +
> +do_configure() {
> +	cd ${WORKDIR}/go1.4/go/src
> +	CGO_ENABLED=3D0 GOROOT=3D${WORKDIR}/go1.4/go ./make.bash
> +}
> +
> +do_compile() {
> +	export GOROOT_FINAL=3D"${libdir_native}/go"
> +	export GOROOT_BOOTSTRAP=3D"${WORKDIR}/go1.4/go"
> +
> +	cd src
> +	./make.bash ${GOMAKEARGS}
> +	cd ${B}
> +}
> +do_compile[dirs] =3D+ "${GOTMPDIR} ${B}/bin"
> +do_compile[cleandirs] +=3D "${GOTMPDIR} ${B}/bin"
> +
> +make_wrapper() {
> +	rm -f ${D}${bindir}/$2$3
> +	cat <<END >${D}${bindir}/$2$3
> +#!/bin/bash
> +here=3D\`dirname \$0\`
> +export GOROOT=3D"${GOROOT:-\`readlink -f \$here/../lib/go\`}"
> +\$here/../lib/go/bin/$1 "\$@"
> +END
> +	chmod +x ${D}${bindir}/$2
> +}
> +
> +do_install() {
> +	install -d ${D}${libdir}/go
> +	cp --preserve=3Dmode,timestamps -R ${B}/pkg ${D}${libdir}/go/
> +	install -d ${D}${libdir}/go/src
> +	(cd ${S}/src; for d in *; do \
> +		[ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
> +	done)
> +	find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm =
-rf {} \;
> +	install -d ${D}${bindir} ${D}${libdir}/go/bin
> +	for f in ${B}/bin/*
> +	do
> +		base=3D`basename $f`
> +		install -m755 $f ${D}${libdir}/go/bin
> +		make_wrapper $base $base
> +	done
> +}
> diff --git a/recipes-containers/kubernetes/go-native_1.12.bb =
b/recipes-containers/kubernetes/go-native_1.12.bb
> new file mode 100644
> index 0000000..bbf3c0d
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-native_1.12.bb
> @@ -0,0 +1,2 @@
> +require ${PN}.inc
> +require go-${PV}.inc
> diff --git a/recipes-containers/kubernetes/go-runtime.inc =
b/recipes-containers/kubernetes/go-runtime.inc
> new file mode 100644
> index 0000000..9731e16
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-runtime.inc
> @@ -0,0 +1,96 @@
> +DEPENDS =3D "virtual/${TUNE_PKGARCH}-go go-native"
> +DEPENDS_class-nativesdk =3D "virtual/${TARGET_PREFIX}go-crosssdk"
> +PROVIDES =3D "virtual/${TARGET_PREFIX}go-runtime"
> +
> +export GOHOSTOS =3D "${BUILD_GOOS}"
> +export GOHOSTARCH =3D "${BUILD_GOARCH}"
> +export GOOS =3D "${TARGET_GOOS}"
> +export GOARCH =3D "${TARGET_GOARCH}"
> +export GOARM =3D "${TARGET_GOARM}"
> +export GO386 =3D "${TARGET_GO386}"
> +export GOMIPS =3D "${TARGET_GOMIPS}"
> +export GOROOT_BOOTSTRAP =3D "${STAGING_LIBDIR_NATIVE}/go"
> +export GOROOT_FINAL =3D "${libdir}/go"
> +export CGO_CFLAGS =3D "${CFLAGS}"
> +export CGO_CPPFLAGS =3D "${CPPFLAGS}"
> +export CGO_CXXFLAGS =3D "${CXXFLAGS}"
> +export CGO_LDFLAGS =3D "${LDFLAGS}"
> +export GOCACHE =3D "${B}/.cache"
> +
> +GO_EXTLDFLAGS ?=3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
> +GO_SHLIB_LDFLAGS ?=3D '-ldflags=3D"--linkmode=3Dexternal -extldflags =
'${GO_EXTLDFLAGS}'"'
> +
> +do_configure() {
> +	:
> +}
> +
> +do_configure_libc-musl() {
> +	rm -f ${S}/src/runtime/race/*.syso
> +}
> +
> +do_compile() {
> +	export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${CC}"
> +	export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${CXX}"
> +
> +	cd src
> +	./make.bash --target-only --no-banner std
> +	if [ -n "${GO_DYNLINK}" ]; then
> +		export GOTOOLDIR=3D"${B}/pkg/tool/native_native"
> +		CC=3D"$CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}" =
GOARCH=3D"${TARGET_GOARCH}" GOOS=3D"${TARGET_GOOS}" GOROOT=3D${B} \
> +			$GOTOOLDIR/go_bootstrap install -linkshared =
-buildmode=3Dshared ${GO_SHLIB_LDFLAGS} std
> +	fi
> +	cd ${B}
> +}
> +do_compile[dirs] =3D+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] +=3D "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +
> +do_install() {
> +	install -d ${D}${libdir}/go/src
> +	cp --preserve=3Dmode,timestamps -R ${B}/pkg ${D}${libdir}/go/
> +	if [ "${BUILD_GOTUPLE}" !=3D "${TARGET_GOTUPLE}" ]; then
> +		rm -rf ${D}${libdir}/go/pkg/${BUILD_GOTUPLE}
> +		rm -rf ${D}${libdir}/go/pkg/obj/${BUILD_GOTUPLE}
> +	fi
> +	rm -rf ${D}${libdir}/go/pkg/tool
> +	rm -rf ${D}${libdir}/go/pkg/obj
> +	rm -rf ${D}${libdir}/go/pkg/bootstrap
> +	find src -mindepth 1 -maxdepth 1 -type d | while read srcdir; do
> +		cp --preserve=3Dmode,timestamps -R $srcdir =
${D}${libdir}/go/src/
> +	done
> +	find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm =
-rf {} \;
> +	rm -f ${D}${libdir}/go/src/cmd/dist/dist
> +        rm -f ${D}${libdir}/go/src/cmd/cgo/zdefaultcc.go
> +        rm -f ${D}${libdir}/go/src/cmd/go/internal/cfg/zdefaultcc.go
> +
> +}
> +
> +ALLOW_EMPTY_${PN} =3D "1"
> +FILES_${PN} =3D =
"${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*${SOLIBSDEV}"
> +FILES_${PN}-dev =3D "${libdir}/go/src ${libdir}/go/pkg/include \
> +                   =
${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*.shlibname \
> +                   =
${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*.shlibname \
> +                   =
${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*.shlibname \
> +                   =
${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*.shlibname \
> +                   =
${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*.shlibname \
> +                   =
${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*.shlibname \
> +                   =
${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*/*.shlibname \
> +                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*.a \
> +                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*.a \
> +                   ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*.a =
\
> +                   =
${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*.a \
> +                   =
${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*.a \
> +                   =
${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*.a \
> +                   =
${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*/*.a \
> +"
> +FILES_${PN}-staticdev =3D "${libdir}/go/pkg/${TARGET_GOTUPLE}"
> +
> +# Go sources include some scripts and pre-built binaries for
> +# multiple architectures.  The static .a files for dynamically-linked
> +# runtime are also required in -dev.
> +INSANE_SKIP_${PN}-dev =3D "staticdev file-rdeps arch"
> +
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +INHIBIT_SYSROOT_STRIP =3D "1"
> +
> +BBCLASSEXTEND =3D "nativesdk"
> diff --git a/recipes-containers/kubernetes/go-runtime_1.12.bb =
b/recipes-containers/kubernetes/go-runtime_1.12.bb
> new file mode 100644
> index 0000000..43b68b4
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-runtime_1.12.bb
> @@ -0,0 +1,2 @@
> +require go-${PV}.inc
> +require go-runtime.inc
> diff --git a/recipes-containers/kubernetes/go-target.inc =
b/recipes-containers/kubernetes/go-target.inc
> new file mode 100644
> index 0000000..91efd3e
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go-target.inc
> @@ -0,0 +1,54 @@
> +DEPENDS =3D "virtual/${TUNE_PKGARCH}-go go-native"
> +DEPENDS_class-nativesdk =3D "virtual/${TARGET_PREFIX}go-crosssdk =
go-native"
> +
> +export GOHOSTOS =3D "${BUILD_GOOS}"
> +export GOHOSTARCH =3D "${BUILD_GOARCH}"
> +export GOOS =3D "${TARGET_GOOS}"
> +export GOARCH =3D "${TARGET_GOARCH}"
> +export GOARM =3D "${TARGET_GOARM}"
> +export GO386 =3D "${TARGET_GO386}"
> +export GOMIPS =3D "${TARGET_GOMIPS}"
> +export GOROOT_BOOTSTRAP =3D "${STAGING_LIBDIR_NATIVE}/go"
> +export GOROOT_FINAL =3D "${libdir}/go"
> +export GOCACHE =3D "${B}/.cache"
> +GO_LDFLAGS =3D ""
> +GO_LDFLAGS_class-nativesdk =3D "-linkmode external"
> +export GO_LDFLAGS
> +
> +CC_append_class-nativesdk =3D " ${SECURITY_NOPIE_CFLAGS}"
> +
> +do_configure[noexec] =3D "1"
> +
> +do_compile() {
> +	export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${CC}"
> +	export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${CXX}"
> +
> +	cd src
> +	./make.bash --target-only --no-banner
> +	cd ${B}
> +}
> +do_compile[dirs] =3D+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +do_compile[cleandirs] +=3D "${GOTMPDIR} ${B}/bin ${B}/pkg"
> +
> +do_install() {
> +	install -d ${D}${libdir}/go/pkg/tool
> +	cp --preserve=3Dmode,timestamps -R =
${B}/pkg/tool/${TARGET_GOTUPLE} ${D}${libdir}/go/pkg/tool/
> +	install -d ${D}${libdir}/go/src
> +	cp --preserve=3Dmode,timestamps -R ${S}/src/cmd =
${D}${libdir}/go/src/
> +	find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm =
-rf {} \;
> +	install -d ${D}${libdir}/go/bin
> +	install -d ${D}${bindir}
> +	for f in ${B}/${GO_BUILD_BINDIR}/*; do
> +		name=3D`basename $f`
> +		install -m 0755 $f ${D}${libdir}/go/bin/
> +		ln -sf ../${baselib}/go/bin/$name ${D}${bindir}/
> +	done
> +}
> +
> +PACKAGES =3D "${PN} ${PN}-dev"
> +FILES_${PN} =3D "${libdir}/go/bin =
${libdir}/go/pkg/tool/${TARGET_GOTUPLE} ${bindir}"
> +FILES_${PN}-dev =3D "${libdir}/go"
> +RDEPENDS_${PN}-dev =3D "perl bash"
> +INSANE_SKIP_${PN} =3D "ldflags"
> +
> +BBCLASSEXTEND =3D "nativesdk"
> diff --git a/recipes-containers/kubernetes/go_1.12.bb =
b/recipes-containers/kubernetes/go_1.12.bb
> new file mode 100644
> index 0000000..42cdb04
> --- /dev/null
> +++ b/recipes-containers/kubernetes/go_1.12.bb
> @@ -0,0 +1,14 @@
> +require go-${PV}.inc
> +require go-target.inc
> +
> +export GOBUILDMODE=3D""
> +
> +# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips
> +# doesn't support -buildmode=3Dpie, so skip the QA checking for mips =
and its
> +# variants.
> +python() {
> +    if 'mips' in d.getVar('TARGET_ARCH'):
> +        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
> +    else:
> +        d.setVar('GOBUILDMODE', 'pie')
> +}
> --=20
> 2.17.1
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
>=20
> View/Reply Online (#4845): =
https://lists.yoctoproject.org/g/meta-virtualization/message/4845
> Mute This Topic: https://lists.yoctoproject.org/mt/67789939/900811
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: =
https://lists.yoctoproject.org/g/meta-virtualization/unsub  =
[timothy.t.orling@linux.intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--Apple-Mail=_6725D0BD-0850-400C-ACF4-1BA063E7A2F7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Kubernetes 1.17 is now released which can be built with =
go1.13.4+<div class=3D""><a =
href=3D"https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-1.1=
7.md#dependencies" =
class=3D"">https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG-=
1.17.md#dependencies</a></div><div class=3D""><div class=3D""><br =
class=3D""></div><div class=3D"">I have just now submitted a patch to =
oe-core to upgrade to go1.13.5<br class=3D""><div><a =
href=3D"https://patchwork.openembedded.org/patch/167900/" =
class=3D"">https://patchwork.openembedded.org/patch/167900/</a></div><div>=
<br class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On =
Dec 9, 2019, at 12:10 AM, Chen Qi &lt;<a =
href=3D"mailto:Qi.Chen@windriver.com" =
class=3D"">Qi.Chen@windriver.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">go =
1.12 was removed from oe-core, but currently k8s cannot<br class=3D"">be =
built successfully with go 1.13. See link below.<br class=3D""><br =
class=3D""> &nbsp;<a =
href=3D"https://github.com/kubernetes/kubernetes/issues/82531" =
class=3D"">https://github.com/kubernetes/kubernetes/issues/82531</a><br =
class=3D""><br class=3D"">We need to wait for k8s to support go 1.13 and =
update it<br class=3D"">to latest release, as well as its depedencies. =
Before this<br class=3D"">is done, add back go 1.12 and use it.<br =
class=3D""><br class=3D"">Signed-off-by: Chen Qi &lt;<a =
href=3D"mailto:Qi.Chen@windriver.com" =
class=3D"">Qi.Chen@windriver.com</a>&gt;<br class=3D"">---<br class=3D""> =
recipes-containers/kubernetes/go-1.12.inc &nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;24 ++<br class=3D""> ...ow-CC-and-CXX-to-have-multiple-words.patch =
| &nbsp;31 ++<br class=3D""> =
...o1.12-security-net-textproto-don-t-n.patch | 163 ++++++++++<br =
class=3D""> ...ent-based-hash-generation-less-pedan.patch | 218 =
++++++++++++++<br class=3D""> =
...-to-be-overridden-in-the-environment.patch | &nbsp;48 +++<br =
class=3D""> ...4-ld-add-soname-to-shareable-objects.patch | &nbsp;45 =
+++<br class=3D""> ...de-CC-when-building-dist-and-go_boot.patch | =
&nbsp;37 +++<br class=3D""> =
...dist-separate-host-and-target-builds.patch | 282 =
++++++++++++++++++<br class=3D""> =
...d-go-make-GOROOT-precious-by-default.patch | 106 +++++++<br class=3D"">=
 ...008-use-GOBUILDMODE-to-set-buildmode.patch | &nbsp;37 +++<br =
class=3D""> ...place-glibc-dynamic-linker-with-musl.patch | 112 =
+++++++<br class=3D""> recipes-containers/kubernetes/go-common.inc =
&nbsp;&nbsp;| &nbsp;32 ++<br class=3D""> =
.../kubernetes/go-cross-canadian.inc =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;66 ++++<br =
class=3D""> .../kubernetes/go-cross-canadian_1.12.bb =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;2 +<br class=3D""> =
recipes-containers/kubernetes/go-cross.inc &nbsp;&nbsp;&nbsp;| &nbsp;62 =
++++<br class=3D""> .../kubernetes/go-cross_1.12.bb =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;| &nbsp;&nbsp;2 +<br class=3D""> =
recipes-containers/kubernetes/go-crosssdk.inc | &nbsp;50 ++++<br =
class=3D""> .../kubernetes/go-crosssdk_1.12.bb =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;&nbsp;2 +<br class=3D""> =
recipes-containers/kubernetes/go-native.inc &nbsp;&nbsp;| &nbsp;55 =
++++<br class=3D""> .../kubernetes/go-native_1.12.bb =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;| &nbsp;&nbsp;2 +<br class=3D""> =
recipes-containers/kubernetes/go-runtime.inc &nbsp;| &nbsp;96 ++++++<br =
class=3D""> .../kubernetes/go-runtime_1.12.bb =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;&nbsp;2 +<br class=3D""> =
recipes-containers/kubernetes/go-target.inc &nbsp;&nbsp;| &nbsp;54 =
++++<br class=3D""> recipes-containers/kubernetes/go_1.12.bb =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;14 +<br class=3D""> 24 files =
changed, 1542 insertions(+)<br class=3D""> create mode 100644 =
recipes-containers/kubernetes/go-1.12.inc<br class=3D""> create mode =
100644 =
recipes-containers/kubernetes/go-1.12/0001-allow-CC-and-CXX-to-have-multip=
le-words.patch<br class=3D""> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0001-release-branch.go1.12-security-=
net-textproto-don-t-n.patch<br class=3D""> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0002-cmd-go-make-content-based-hash-=
generation-less-pedan.patch<br class=3D""> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0003-allow-GOTOOLDIR-to-be-overridde=
n-in-the-environment.patch<br class=3D""> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0004-ld-add-soname-to-shareable-obje=
cts.patch<br class=3D""> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0005-make.bash-override-CC-when-buil=
ding-dist-and-go_boot.patch<br class=3D""> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0006-cmd-dist-separate-host-and-targ=
et-builds.patch<br class=3D""> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0007-cmd-go-make-GOROOT-precious-by-=
default.patch<br class=3D""> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0008-use-GOBUILDMODE-to-set-buildmod=
e.patch<br class=3D""> create mode 100644 =
recipes-containers/kubernetes/go-1.12/0009-ld-replace-glibc-dynamic-linker=
-with-musl.patch<br class=3D""> create mode 100644 =
recipes-containers/kubernetes/go-common.inc<br class=3D""> create mode =
100644 recipes-containers/kubernetes/go-cross-canadian.inc<br class=3D""> =
create mode 100644 =
recipes-containers/kubernetes/go-cross-canadian_1.12.bb<br class=3D""> =
create mode 100644 recipes-containers/kubernetes/go-cross.inc<br =
class=3D""> create mode 100644 =
recipes-containers/kubernetes/go-cross_1.12.bb<br class=3D""> create =
mode 100644 recipes-containers/kubernetes/go-crosssdk.inc<br class=3D""> =
create mode 100644 recipes-containers/kubernetes/go-crosssdk_1.12.bb<br =
class=3D""> create mode 100644 =
recipes-containers/kubernetes/go-native.inc<br class=3D""> create mode =
100644 recipes-containers/kubernetes/go-native_1.12.bb<br class=3D""> =
create mode 100644 recipes-containers/kubernetes/go-runtime.inc<br =
class=3D""> create mode 100644 =
recipes-containers/kubernetes/go-runtime_1.12.bb<br class=3D""> create =
mode 100644 recipes-containers/kubernetes/go-target.inc<br class=3D""> =
create mode 100644 recipes-containers/kubernetes/go_1.12.bb<br =
class=3D""><br class=3D"">diff --git =
a/recipes-containers/kubernetes/go-1.12.inc =
b/recipes-containers/kubernetes/go-1.12.inc<br class=3D"">new file mode =
100644<br class=3D"">index 0000000..ed14b17<br class=3D"">--- =
/dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-1.12.inc<br class=3D"">@@ -0,0 +1,24 =
@@<br class=3D"">+require go-common.inc<br class=3D"">+<br =
class=3D"">+GO_BASEVERSION =3D "1.12"<br class=3D"">+GO_MINOR =3D =
".9"<br class=3D"">+PV .=3D "${GO_MINOR}"<br =
class=3D"">+FILESEXTRAPATHS_prepend :=3D =
"${FILE_DIRNAME}/go-${GO_BASEVERSION}:"<br class=3D"">+<br =
class=3D"">+LIC_FILES_CHKSUM =3D "<a =
href=3D"file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707" =
class=3D"">file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707</a>"<br =
class=3D"">+<br class=3D"">+SRC_URI +=3D "\<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0001-allow-CC-and-CXX-to-have-multiple-words.patch" =
class=3D"">file://0001-allow-CC-and-CXX-to-have-multiple-words.patch</a> =
\<br class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0002-cmd-go-make-content-based-hash-generation-less-pedan.=
patch" =
class=3D"">file://0002-cmd-go-make-content-based-hash-generation-less-peda=
n.patch</a> \<br class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.p=
atch" =
class=3D"">file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment=
.patch</a> \<br class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0004-ld-add-soname-to-shareable-objects.patch" =
class=3D"">file://0004-ld-add-soname-to-shareable-objects.patch</a> \<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0005-make.bash-override-CC-when-building-dist-and-go_boot.=
patch" =
class=3D"">file://0005-make.bash-override-CC-when-building-dist-and-go_boo=
t.patch</a> \<br class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0006-cmd-dist-separate-host-and-target-builds.patch" =
class=3D"">file://0006-cmd-dist-separate-host-and-target-builds.patch</a> =
\<br class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0007-cmd-go-make-GOROOT-precious-by-default.patch" =
class=3D"">file://0007-cmd-go-make-GOROOT-precious-by-default.patch</a> =
\<br class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0008-use-GOBUILDMODE-to-set-buildmode.patch" =
class=3D"">file://0008-use-GOBUILDMODE-to-set-buildmode.patch</a> \<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0001-release-branch.go1.12-security-net-textproto-don-t-n.=
patch" =
class=3D"">file://0001-release-branch.go1.12-security-net-textproto-don-t-=
n.patch</a> \<br class=3D"">+"<br class=3D"">+SRC_URI_append_libc-musl =3D=
 " <a href=3D"file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"=
 =
class=3D"">file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch</a>=
"<br class=3D"">+<br class=3D"">+SRC_URI[main.md5sum] =3D =
"6132109d4050da349eadc9f7b0304ef4"<br class=3D"">+SRC_URI[main.sha256sum] =
=3D =
"ab0e56ed9c4732a653ed22e232652709afbf573e710f56a07f7fdeca578d62fc"<br =
class=3D"">diff --git =
a/recipes-containers/kubernetes/go-1.12/0001-allow-CC-and-CXX-to-have-mult=
iple-words.patch =
b/recipes-containers/kubernetes/go-1.12/0001-allow-CC-and-CXX-to-have-mult=
iple-words.patch<br class=3D"">new file mode 100644<br class=3D"">index =
0000000..4442858<br class=3D"">--- /dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-1.12/0001-allow-CC-and-CXX-to-have-mult=
iple-words.patch<br class=3D"">@@ -0,0 +1,31 @@<br class=3D"">+=46rom =
7cc519aa5f84cf8fc7ac8c10fc69aa8040330ea0 Mon Sep 17 00:00:00 2001<br =
class=3D"">+From: Matt Madison &lt;<a href=3D"mailto:matt@madison.systems"=
 class=3D"">matt@madison.systems</a>&gt;<br class=3D"">+Date: Mon, 19 =
Feb 2018 08:49:33 -0800<br class=3D"">+Subject: [PATCH] allow CC and CXX =
to have multiple words<br class=3D"">+<br class=3D"">+Upstream-Status: =
Inappropriate [OE specific]<br class=3D"">+<br class=3D"">+Signed-off-by: =
Matt Madison &lt;<a href=3D"mailto:matt@madison.systems" =
class=3D"">matt@madison.systems</a>&gt;<br class=3D"">+<br =
class=3D"">+---<br class=3D"">+ src/cmd/go/internal/envcmd/env.go | 4 =
++--<br class=3D"">+ 1 file changed, 2 insertions(+), 2 deletions(-)<br =
class=3D"">+<br class=3D"">+diff --git =
a/src/cmd/go/internal/envcmd/env.go =
b/src/cmd/go/internal/envcmd/env.go<br class=3D"">+index =
afadbad..cedbfbf 100644<br class=3D"">+--- =
a/src/cmd/go/internal/envcmd/env.go<br class=3D"">++++ =
b/src/cmd/go/internal/envcmd/env.go<br class=3D"">+@@ -85,11 +85,11 @@ =
func MkEnv() []cfg.EnvVar {<br class=3D"">+ <br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cc :=3D =
cfg.DefaultCC(cfg.Goos, cfg.Goarch)<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if env :=3D=
 strings.Fields(os.Getenv("CC")); len(env) &gt; 0 {<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cc =3D =
env[0]<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>cc =3D strings.Join(env, " ")<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>cxx :=3D cfg.DefaultCXX(cfg.Goos, =
cfg.Goarch)<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if env :=3D =
strings.Fields(os.Getenv("CXX")); len(env) &gt; 0 {<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cxx =3D =
env[0]<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>cxx =3D strings.Join(env, " ")<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>env =3D append(env, =
cfg.EnvVar{Name: "CC", Value: cc})<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>env =3D =
append(env, cfg.EnvVar{Name: "CXX", Value: cxx})<br class=3D"">diff =
--git =
a/recipes-containers/kubernetes/go-1.12/0001-release-branch.go1.12-securit=
y-net-textproto-don-t-n.patch =
b/recipes-containers/kubernetes/go-1.12/0001-release-branch.go1.12-securit=
y-net-textproto-don-t-n.patch<br class=3D"">new file mode 100644<br =
class=3D"">index 0000000..7b39dbd<br class=3D"">--- /dev/null<br =
class=3D"">+++ =
b/recipes-containers/kubernetes/go-1.12/0001-release-branch.go1.12-securit=
y-net-textproto-don-t-n.patch<br class=3D"">@@ -0,0 +1,163 @@<br =
class=3D"">+=46rom 265b691ac440bfb711d8de323346f7d72e620efe Mon Sep 17 =
00:00:00 2001<br class=3D"">+From: Filippo Valsorda &lt;<a =
href=3D"mailto:filippo@golang.org" =
class=3D"">filippo@golang.org</a>&gt;<br class=3D"">+Date: Thu, 12 Sep =
2019 12:37:36 -0400<br class=3D"">+Subject: [PATCH] =
[release-branch.go1.12-security] net/textproto: don't<br class=3D"">+ =
normalize headers with spaces before the colon<br class=3D"">+<br =
class=3D"">+RFC 7230 is clear about headers with a space before the =
colon, like<br class=3D"">+<br class=3D"">+X-Answer : 42<br =
class=3D"">+<br class=3D"">+being invalid, but we've been accepting and =
normalizing them for compatibility<br class=3D"">+purposes since CL =
5690059 in 2012.<br class=3D"">+<br class=3D"">+On the client side, this =
is harmless and indeed most browsers behave the same<br class=3D"">+to =
this day. On the server side, this becomes a security issue when the<br =
class=3D"">+behavior doesn't match that of a reverse proxy sitting in =
front of the server.<br class=3D"">+<br class=3D"">+For example, if a =
WAF accepts them without normalizing them, it might be<br =
class=3D"">+possible to bypass its filters, because the Go server would =
interpret the<br class=3D"">+header differently. Worse, if the reverse =
proxy coalesces requests onto a<br class=3D"">+single HTTP/1.1 =
connection to a Go server, the understanding of the request<br =
class=3D"">+boundaries can get out of sync between them, allowing an =
attacker to tack an<br class=3D"">+arbitrary method and path onto a =
request by other clients, including<br class=3D"">+authentication =
headers unknown to the attacker.<br class=3D"">+<br class=3D"">+This was =
recently presented at multiple security conferences:<br class=3D"">+<a =
href=3D"https://portswigger.net/blog/http-desync-attacks-request-smuggling=
-reborn" =
class=3D"">https://portswigger.net/blog/http-desync-attacks-request-smuggl=
ing-reborn</a><br class=3D"">+<br class=3D"">+net/http servers already =
reject header keys with invalid characters.<br class=3D"">+Simply stop =
normalizing extra spaces in net/textproto, let it return them<br =
class=3D"">+unchanged like it does for other invalid headers, and let =
net/http enforce<br class=3D"">+RFC 7230, which is HTTP specific. This =
loses us normalization on the client<br class=3D"">+side, but there's no =
right answer on the client side anyway, and hiding the<br =
class=3D"">+issue sounds worse than letting the application decide.<br =
class=3D"">+<br class=3D"">+Fixes CVE-2019-16276<br class=3D"">+<br =
class=3D"">+Change-Id: I6d272de827e0870da85d93df770d6a0e161bbcf1<br =
class=3D"">+Reviewed-on: <a =
href=3D"https://team-review.git.corp.google.com/c/golang/go-private/+/5497=
19" =
class=3D"">https://team-review.git.corp.google.com/c/golang/go-private/+/5=
49719</a><br class=3D"">+Reviewed-by: Brad Fitzpatrick &lt;<a =
href=3D"mailto:bradfitz@google.com" =
class=3D"">bradfitz@google.com</a>&gt;<br class=3D"">+(cherry picked =
from commit 1280b868e82bf173ea3e988be3092d160ee66082)<br =
class=3D"">+Reviewed-on: <a =
href=3D"https://team-review.git.corp.google.com/c/golang/go-private/+/5587=
76" =
class=3D"">https://team-review.git.corp.google.com/c/golang/go-private/+/5=
58776</a><br class=3D"">+Reviewed-by: Dmitri Shuralyov &lt;<a =
href=3D"mailto:dmitshur@google.com" =
class=3D"">dmitshur@google.com</a>&gt;<br class=3D"">+<br class=3D"">+CVE:=
 CVE-2019-16276<br class=3D"">+<br class=3D"">+Upstream-Status: Backport =
[<a =
href=3D"https://github.com/golang/go/commit/6e6f4aaf70c8b1cc81e65a26332aa9=
409de03ad8" =
class=3D"">https://github.com/golang/go/commit/6e6f4aaf70c8b1cc81e65a26332=
aa9409de03ad8</a>]<br class=3D"">+<br class=3D"">+Signed-off-by: Chen Qi =
&lt;<a href=3D"mailto:Qi.Chen@windriver.com" =
class=3D"">Qi.Chen@windriver.com</a>&gt;<br class=3D"">+---<br =
class=3D"">+ src/net/http/serve_test.go =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;4 ++++<br class=3D"">+ =
src/net/http/transport_test.go &nbsp;&nbsp;| 27 =
+++++++++++++++++++++++++++<br class=3D"">+ src/net/textproto/reader.go =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 10 ++--------<br class=3D"">+ =
src/net/textproto/reader_test.go | 13 ++++++-------<br class=3D"">+ 4 =
files changed, 39 insertions(+), 15 deletions(-)<br class=3D"">+<br =
class=3D"">+diff --git a/src/net/http/serve_test.go =
b/src/net/http/serve_test.go<br class=3D"">+index 6eb0088a96..89bfdfbb82 =
100644<br class=3D"">+--- a/src/net/http/serve_test.go<br class=3D"">++++ =
b/src/net/http/serve_test.go<br class=3D"">+@@ -4748,6 +4748,10 @@ func =
TestServerValidatesHeaders(t *testing.T) {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>{"foo\xffbar: foo\r\n", 400}, =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// =
binary in header<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>{"foo\x00bar: foo\r\n", 400}, =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;// =
binary in header<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>{"Foo: " + strings.Repeat("x", =
1&lt;&lt;21) + "\r\n", 431}, // header too large<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// Spaces =
between the header key and colon are not allowed.<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// See =
RFC 7230, Section 3.2.4.<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>{"Foo : bar\r\n", 400},<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>{"Foo\t: bar\r\n", 400},<br class=3D"">+ <br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>{"foo: =
foo foo\r\n", 200}, &nbsp;&nbsp;&nbsp;// LWS space is okay<br class=3D"">+=
 <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>{"foo: foo\tfoo\r\n", 200}, &nbsp;&nbsp;// LWS tab is okay<br =
class=3D"">+diff --git a/src/net/http/transport_test.go =
b/src/net/http/transport_test.go<br class=3D"">+index =
5c329543e2..5e5438a708 100644<br class=3D"">+--- =
a/src/net/http/transport_test.go<br class=3D"">++++ =
b/src/net/http/transport_test.go<br class=3D"">+@@ -5133,3 +5133,30 @@ =
func TestTransportIgnores408(t *testing.T) {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>t.Fatalf("timeout after %v waiting for Transport connections to =
die off", time.Since(t0))<br class=3D"">+ }<br class=3D"">++<br =
class=3D"">++func TestInvalidHeaderResponse(t *testing.T) {<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>setParallel(t)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>defer afterTest(t)<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cst :=3D newClientServerTest(t, h1Mode, HandlerFunc(func(w =
ResponseWriter, r *Request) {<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>conn, =
buf, _ :=3D w.(Hijacker).Hijack()<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>buf.Write([]byte("HTTP/1.1 200 OK\r\n" +<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>"Date: =
Wed, 30 Aug 2017 19:09:27 GMT\r\n" +<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>"Content-Type: text/html; charset=3Dutf-8\r\n" +<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>"Content-Length: 0\r\n" +<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>"Foo : =
bar\r\n\r\n"))<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>buf.Flush()<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>conn.Close()<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}))<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>defer =
cst.close()<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>res, err :=3D =
cst.c.Get(cst.ts.URL)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if err !=3D nil {<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>t.Fatal(err)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>defer =
res.Body.Close()<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if v :=3D res.Header.Get("Foo"); =
v !=3D "" {<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>t.Errorf(`unexpected "Foo" =
header: %q`, v)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if v :=3D =
res.Header.Get("Foo "); v !=3D "bar" {<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>t.Errorf(`bad "Foo " header value: %q, want %q`, v, "bar")<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">++}<br class=3D"">+diff --git =
a/src/net/textproto/reader.go b/src/net/textproto/reader.go<br =
class=3D"">+index 2c4f25d5ae..1a5e364cf7 100644<br class=3D"">+--- =
a/src/net/textproto/reader.go<br class=3D"">++++ =
b/src/net/textproto/reader.go<br class=3D"">+@@ -493,18 +493,12 @@ func =
(r *Reader) ReadMIMEHeader() (MIMEHeader, error) {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return m, =
err<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+ <br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>// Key ends at first colon; should not have trailing spaces<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>// but they appear in the wild, violating specs, so we remove<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>// them if present.<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>// Key ends at first colon.<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>i :=3D bytes.IndexByte(kv, ':')<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if i &lt; =
0 {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return m, =
ProtocolError("malformed MIME header line: " + string(kv))<br class=3D"">+=
 <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>endKey :=3D i<br class=3D"">+-<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>for =
endKey &gt; 0 &amp;&amp; kv[endKey-1] =3D=3D ' ' {<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>endKey--<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>key :=3D =
canonicalMIMEHeaderKey(kv[:endKey])<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>key :=3D =
canonicalMIMEHeaderKey(kv[:i])<br class=3D"">+ <br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// As per =
RFC 7230 field-name is a token, tokens consist of one or more chars.<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>// We could return a ProtocolError here, but better to be liberal =
in what we<br class=3D"">+diff --git a/src/net/textproto/reader_test.go =
b/src/net/textproto/reader_test.go<br class=3D"">+index =
f85fbdc36d..b92fdcd3c7 100644<br class=3D"">+--- =
a/src/net/textproto/reader_test.go<br class=3D"">++++ =
b/src/net/textproto/reader_test.go<br class=3D"">+@@ -188,11 +188,10 @@ =
func TestLargeReadMIMEHeader(t *testing.T) {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">+ }<br class=3D"">+ <br class=3D"">+-// Test that we read =
slightly-bogus MIME headers seen in the wild,<br class=3D"">+-// with =
spaces before colons, and spaces in keys.<br class=3D"">++// =
TestReadMIMEHeaderNonCompliant checks that we don't normalize headers<br =
class=3D"">++// with spaces before colons, and accept spaces in keys.<br =
class=3D"">+ func TestReadMIMEHeaderNonCompliant(t *testing.T) {<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>// Invalid HTTP response header as sent by an Axis security<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>// camera: (this is handled by IE, Firefox, Chrome, curl, =
etc.)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>// These invalid headers will be =
rejected by net/http according to RFC 7230.<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>r :=3D =
reader("Foo: bar\r\n" +<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>"Content-Language: en\r\n" +<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>"SID : 0\r\n" +<br class=3D"">+@@ -202,9 +201,9 @@ func =
TestReadMIMEHeaderNonCompliant(t *testing.T) {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>want :=3D =
MIMEHeader{<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>"Foo": =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;{"bar"},<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>"Content-Language": {"en"},<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>"Sid": =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;{"0"},<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>"Audio Mode": =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{"None"},<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>"Privilege": =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{"127"},<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>"SID ": =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{"=
0"},<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>"Audio Mode ": =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{"None"},<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>"Privilege ": &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{"127"},<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if !reflect.DeepEqual(m, want) || =
err !=3D nil {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>t.Fatalf("ReadMIMEHeader =3D\n%v, =
%v; want:\n%v", m, err, want)<br class=3D"">diff --git =
a/recipes-containers/kubernetes/go-1.12/0002-cmd-go-make-content-based-has=
h-generation-less-pedan.patch =
b/recipes-containers/kubernetes/go-1.12/0002-cmd-go-make-content-based-has=
h-generation-less-pedan.patch<br class=3D"">new file mode 100644<br =
class=3D"">index 0000000..66b8561<br class=3D"">--- /dev/null<br =
class=3D"">+++ =
b/recipes-containers/kubernetes/go-1.12/0002-cmd-go-make-content-based-has=
h-generation-less-pedan.patch<br class=3D"">@@ -0,0 +1,218 @@<br =
class=3D"">+=46rom 47db69e20ed66fb62b01affd83d829654b829893 Mon Sep 17 =
00:00:00 2001<br class=3D"">+From: Matt Madison &lt;<a =
href=3D"mailto:matt@madison.systems" =
class=3D"">matt@madison.systems</a>&gt;<br class=3D"">+Date: Mon, 19 Feb =
2018 08:50:59 -0800<br class=3D"">+Subject: [PATCH] cmd/go: make =
content-based hash generation less pedantic<br class=3D"">+<br =
class=3D"">+Go 1.10's build tool now uses content-based hashes to<br =
class=3D"">+determine when something should be built or re-built.<br =
class=3D"">+This same mechanism is used to maintain a built-artifact<br =
class=3D"">+cache for speeding up builds.<br class=3D"">+<br =
class=3D"">+However, the hashes it generates include information that<br =
class=3D"">+doesn't work well with OE, nor with using a shared =
runtime<br class=3D"">+library.<br class=3D"">+<br class=3D"">+First, it =
embeds path names to source files, unless<br class=3D"">+building within =
GOROOT. &nbsp;This prevents the building<br class=3D"">+of a package in =
GOPATH for later staging into GOROOT.<br class=3D"">+<br class=3D"">+This =
patch adds support for the environment variable<br =
class=3D"">+GOPATH_OMIT_IN_ACTIONID. &nbsp;If present, path name<br =
class=3D"">+embedding is disabled.<br class=3D"">+<br class=3D"">+Second, =
if cgo is enabled, the build ID for cgo-related<br class=3D"">+packages =
will include the current value of the environment<br class=3D"">+variables=
 for invoking the compiler (CC, CXX, FC) and<br class=3D"">+any =
CGO_xxFLAGS variables. &nbsp;Only if the settings used<br =
class=3D"">+during a compilation exactly match, character for =
character,<br class=3D"">+the values used for compiling runtime/cgo or =
any other<br class=3D"">+cgo-enabled package being imported, will the =
tool<br class=3D"">+decide that the imported package is up-to-date.<br =
class=3D"">+<br class=3D"">+This is done to help ensure correctness, but =
is overly<br class=3D"">+simplistic and effectively prevents the reuse =
of built<br class=3D"">+artifacts that use cgo (or shared runtime, which =
includes<br class=3D"">+runtime/cgo).<br class=3D"">+<br class=3D"">+This =
patch filters out all compiler flags except those<br class=3D"">+beginning=
 with '-m'. &nbsp;The default behavior can be restored<br class=3D"">+by =
setting the CGO_PEDANTIC environment variable.<br class=3D"">+<br =
class=3D"">+Upstream-Status: Inappropriate [OE specific]<br =
class=3D"">+<br class=3D"">+Signed-off-by: Matt Madison &lt;<a =
href=3D"mailto:matt@madison.systems" =
class=3D"">matt@madison.systems</a>&gt;<br class=3D"">+<br =
class=3D"">+---<br class=3D"">+ src/cmd/go/internal/envcmd/env.go | =
&nbsp;2 +-<br class=3D"">+ src/cmd/go/internal/work/exec.go &nbsp;| 63 =
++++++++++++++++++++++---------<br class=3D"">+ 2 files changed, 46 =
insertions(+), 19 deletions(-)<br class=3D"">+<br class=3D"">+diff --git =
a/src/cmd/go/internal/envcmd/env.go =
b/src/cmd/go/internal/envcmd/env.go<br class=3D"">+index =
cedbfbf..5763a0d 100644<br class=3D"">+--- =
a/src/cmd/go/internal/envcmd/env.go<br class=3D"">++++ =
b/src/cmd/go/internal/envcmd/env.go<br class=3D"">+@@ -128,7 +128,7 @@ =
func ExtraEnvVars() []cfg.EnvVar {<br class=3D"">+ func =
ExtraEnvVarsCostly() []cfg.EnvVar {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>var b =
work.Builder<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>b.Init()<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cppflags, =
cflags, cxxflags, fflags, ldflags, err :=3D =
b.CFlags(&amp;load.Package{})<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cppflags, =
cflags, cxxflags, fflags, ldflags, err :=3D =
b.CFlags(&amp;load.Package{}, false)<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if err !=3D=
 nil {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>// Should not happen - b.CFlags =
was given an empty package.<br class=3D"">+ <span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>fmt.Fprintf(os.Stderr, "go: =
invalid cflags: %v\n", err)<br class=3D"">+diff --git =
a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go<br =
class=3D"">+index 12e1527..e41bfac 100644<br class=3D"">+--- =
a/src/cmd/go/internal/work/exec.go<br class=3D"">++++ =
b/src/cmd/go/internal/work/exec.go<br class=3D"">+@@ -174,6 +174,8 @@ =
func (b *Builder) Do(root *Action) {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>wg.Wait()<br class=3D"">+ }<br class=3D"">+ <br class=3D"">++var =
omitGopath =3D os.Getenv("GOPATH_OMIT_IN_ACTIONID") !=3D ""<br =
class=3D"">++<br class=3D"">+ // buildActionID computes the action ID =
for a build action.<br class=3D"">+ func (b *Builder) buildActionID(a =
*Action) cache.ActionID {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>p :=3D a.Package<br class=3D"">+@@ =
-190,7 +192,7 @@ func (b *Builder) buildActionID(a *Action) =
cache.ActionID {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>// but it does not hide the exact =
value of $GOPATH.<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>// Include the full dir in that =
case.<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>// Assume b.WorkDir is being =
trimmed properly.<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if !p.Goroot &amp;&amp; =
!strings.HasPrefix(p.Dir, b.WorkDir) {<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
!p.Goroot &amp;&amp; !omitGopath &amp;&amp; !strings.HasPrefix(p.Dir, =
b.WorkDir) {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>fmt.Fprintf(h, "dir %s\n", =
p.Dir)<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)<br =
class=3D"">+@@ -201,13 +203,13 @@ func (b *Builder) buildActionID(a =
*Action) cache.ActionID {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
len(p.CgoFiles)+len(p.SwigFiles) &gt; 0 {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cppflags, =
cflags, cxxflags, fflags, ldflags, _ :=3D b.CFlags(p)<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>fmt.Fprintf(h, "CC=3D%q %q %q %q\n", b.ccExe(), cppflags, cflags, =
ldflags)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>cppflags, cflags, cxxflags, =
fflags, ldflags, _ :=3D b.CFlags(p, true)<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>fmt.Fprintf(h, "CC=3D%q %q %q %q\n", b.ccExe(true), cppflags, =
cflags, ldflags)<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if =
len(p.CXXFiles)+len(p.SwigFiles) &gt; 0 {<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>fmt.Fprintf(h, "CXX=3D%q %q\n", b.cxxExe(), cxxflags)<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>fmt.Fprintf(h, "CXX=3D%q %q\n", b.cxxExe(true), cxxflags)<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if len(p.FFiles) &gt; 0 {<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>fmt.Fprintf(h, "FC=3D%q %q\n", b.fcExe(), fflags)<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>fmt.Fprintf(h, "FC=3D%q %q\n", b.fcExe(true), fflags)<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>// TODO(rsc): Should we include =
the SWIG version or Fortran/GCC/G++/Objective-C compiler versions?<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">+@@ -2096,33 +2098,33 @@ var (<br class=3D"">+ // =
gccCmd returns a gcc command line prefix<br class=3D"">+ // defaultCC is =
defined in zdefaultcc.go, written by cmd/dist.<br class=3D"">+ func (b =
*Builder) GccCmd(incdir, workdir string) []string {<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
b.compilerCmd(b.ccExe(), incdir, workdir)<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
b.compilerCmd(b.ccExe(false), incdir, workdir)<br class=3D"">+ }<br =
class=3D"">+ <br class=3D"">+ // gxxCmd returns a g++ command line =
prefix<br class=3D"">+ // defaultCXX is defined in zdefaultcc.go, =
written by cmd/dist.<br class=3D"">+ func (b *Builder) GxxCmd(incdir, =
workdir string) []string {<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return b.compilerCmd(b.cxxExe(), =
incdir, workdir)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return =
b.compilerCmd(b.cxxExe(false), incdir, workdir)<br class=3D"">+ }<br =
class=3D"">+ <br class=3D"">+ // gfortranCmd returns a gfortran command =
line prefix.<br class=3D"">+ func (b *Builder) gfortranCmd(incdir, =
workdir string) []string {<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return b.compilerCmd(b.fcExe(), =
incdir, workdir)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return =
b.compilerCmd(b.fcExe(false), incdir, workdir)<br class=3D"">+ }<br =
class=3D"">+ <br class=3D"">+ // ccExe returns the CC compiler setting =
without all the extra flags we add implicitly.<br class=3D"">+-func (b =
*Builder) ccExe() []string {<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch))<br =
class=3D"">++func (b *Builder) ccExe(filtered bool) []string {<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch), =
filtered)<br class=3D"">+ }<br class=3D"">+ <br class=3D"">+ // cxxExe =
returns the CXX compiler setting without all the extra flags we add =
implicitly.<br class=3D"">+-func (b *Builder) cxxExe() []string {<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, =
cfg.Goarch))<br class=3D"">++func (b *Builder) cxxExe(filtered bool) =
[]string {<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return b.compilerExe(origCXX, =
cfg.DefaultCXX(cfg.Goos, cfg.Goarch), filtered)<br class=3D"">+ }<br =
class=3D"">+ <br class=3D"">+ // fcExe returns the FC compiler setting =
without all the extra flags we add implicitly.<br class=3D"">+-func (b =
*Builder) fcExe() []string {<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
b.compilerExe(os.Getenv("FC"), "gfortran")<br class=3D"">++func (b =
*Builder) fcExe(filtered bool) []string {<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
b.compilerExe(os.Getenv("FC"), "gfortran", filtered)<br class=3D"">+ =
}<br class=3D"">+ <br class=3D"">+ // compilerExe returns the compiler =
to use given an<br class=3D"">+@@ -2131,11 +2133,14 @@ func (b *Builder) =
fcExe() []string {<br class=3D"">+ // of the compiler but can have =
additional arguments if they<br class=3D"">+ // were present in the =
environment value.<br class=3D"">+ // For example if CC=3D"gcc -DGOPHER" =
then the result is ["gcc", "-DGOPHER"].<br class=3D"">+-func (b =
*Builder) compilerExe(envValue string, def string) []string {<br =
class=3D"">++func (b *Builder) compilerExe(envValue string, def string, =
filtered bool) []string {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>compiler :=3D =
strings.Fields(envValue)<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if len(compiler) =3D=3D 0 {<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>compiler =3D []string{def}<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if filtered {<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return append(compiler[0:1], =
filterCompilerFlags(compiler[1:])...)<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return compiler<br class=3D"">+ }<br class=3D"">+ <br =
class=3D"">+@@ -2285,8 +2290,23 @@ func envList(key, def string) =
[]string {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return strings.Fields(v)<br =
class=3D"">+ }<br class=3D"">+ <br class=3D"">++var filterFlags =3D =
os.Getenv("CGO_PEDANTIC") =3D=3D ""<br class=3D"">++<br class=3D"">++func =
filterCompilerFlags(flags []string) []string {<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>var =
newflags []string<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if !filterFlags {<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return flags<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>for _, =
flag :=3D range flags {<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if strings.HasPrefix(flag, "-m") =
{<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>newflags =3D append(newflags, =
flag)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return newflags<br class=3D"">++}<br class=3D"">++<br class=3D"">+ =
// CFlags returns the flags to use when invoking the C, C++ or Fortran =
compilers, or cgo.<br class=3D"">+-func (b *Builder) CFlags(p =
*load.Package) (cppflags, cflags, cxxflags, fflags, ldflags []string, =
err error) {<br class=3D"">++func (b *Builder) CFlags(p *load.Package, =
filtered bool) (cppflags, cflags, cxxflags, fflags, ldflags []string, =
err error) {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>defaults :=3D "-g -O2"<br =
class=3D"">+ <br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if cppflags, err =3D =
buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err !=3D =
nil {<br class=3D"">+@@ -2304,6 +2324,13 @@ func (b *Builder) CFlags(p =
*load.Package) (cppflags, cflags, cxxflags, fflags, l<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if ldflags, err =3D buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS, =
checkLinkerFlags); err !=3D nil {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if filtered {<br class=3D"">++<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cppflags =
=3D filterCompilerFlags(cppflags)<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cflags =3D =
filterCompilerFlags(cflags)<br class=3D"">++<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>cxxflags =3D =
filterCompilerFlags(cxxflags)<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>fflags =3D =
filterCompilerFlags(fflags)<br class=3D"">++<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>ldflags =3D =
filterCompilerFlags(ldflags)<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">+ <br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return<br class=3D"">+ }<br =
class=3D"">+@@ -2319,7 +2346,7 @@ var cgoRe =3D =
regexp.MustCompile(`[/\\:]`)<br class=3D"">+ <br class=3D"">+ func (b =
*Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, =
cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj =
[]string, err error) {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>p :=3D a.Package<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err =
:=3D b.CFlags(p)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>cgoCPPFLAGS, cgoCFLAGS, =
cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err :=3D b.CFlags(p, false)<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if err !=3D nil {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return nil, nil, err<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">+@@ -2679,7 +2706,7 @@ func (b *Builder) =
swigIntSize(objdir string) (intsize string, err error) {<br class=3D"">+ =
<br class=3D"">+ // Run SWIG on one SWIG input file.<br class=3D"">+ =
func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir =
string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC =
string, err error) {<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>cgoCPPFLAGS, cgoCFLAGS, =
cgoCXXFLAGS, _, _, err :=3D b.CFlags(p)<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err :=3D b.CFlags(p, =
false)<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if err !=3D nil {<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return "", "", err<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">diff --git =
a/recipes-containers/kubernetes/go-1.12/0003-allow-GOTOOLDIR-to-be-overrid=
den-in-the-environment.patch =
b/recipes-containers/kubernetes/go-1.12/0003-allow-GOTOOLDIR-to-be-overrid=
den-in-the-environment.patch<br class=3D"">new file mode 100644<br =
class=3D"">index 0000000..b6ca40e<br class=3D"">--- /dev/null<br =
class=3D"">+++ =
b/recipes-containers/kubernetes/go-1.12/0003-allow-GOTOOLDIR-to-be-overrid=
den-in-the-environment.patch<br class=3D"">@@ -0,0 +1,48 @@<br =
class=3D"">+=46rom 5c32c38bf19b24f0aadd78012d17ff5caa82151e Mon Sep 17 =
00:00:00 2001<br class=3D"">+From: Matt Madison &lt;<a =
href=3D"mailto:matt@madison.systems" =
class=3D"">matt@madison.systems</a>&gt;<br class=3D"">+Date: Sat, 17 Feb =
2018 05:24:20 -0800<br class=3D"">+Subject: [PATCH] allow GOTOOLDIR to =
be overridden in the environment<br class=3D"">+<br class=3D"">+to allow =
for split host/target build roots<br class=3D"">+<br =
class=3D"">+Upstream-Status: Inappropriate [OE specific]<br =
class=3D"">+<br class=3D"">+Signed-off-by: Matt Madison &lt;<a =
href=3D"mailto:matt@madison.systems" =
class=3D"">matt@madison.systems</a>&gt;<br class=3D"">+<br =
class=3D"">+---<br class=3D"">+ src/cmd/dist/build.go =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 4 +++-<br =
class=3D"">+ src/cmd/go/internal/cfg/cfg.go | 7 +++++--<br class=3D"">+ =
2 files changed, 8 insertions(+), 3 deletions(-)<br class=3D"">+<br =
class=3D"">+Index: go/src/cmd/dist/build.go<br =
class=3D"">+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">+--- go.orig/src/cmd/dist/build.go<br class=3D"">++++ =
go/src/cmd/dist/build.go<br class=3D"">+@@ -228,7 +228,9 @@ func xinit() =
{<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>workdir =3D xworkdir()<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xatexit(rmworkdir)<br class=3D"">+ <br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>tooldir =3D=
 pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if tooldir =3D os.Getenv("GOTOOLDIR"); tooldir =3D=3D "" {<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>tooldir =3D pathf("%s/pkg/tool/%s_%s", goroot, gohostos, =
gohostarch)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+ }<br class=3D"">+=
 <br class=3D"">+ // compilerEnv returns a map from "goos/goarch" to =
the<br class=3D"">+Index: go/src/cmd/go/internal/cfg/cfg.go<br =
class=3D"">+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">+--- go.orig/src/cmd/go/internal/cfg/cfg.go<br class=3D"">++++ =
go/src/cmd/go/internal/cfg/cfg.go<br class=3D"">+@@ -116,7 +116,11 @@ =
func init() {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>// variables. This matches the =
initialization of ToolDir in<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// =
go/build, except for using GOROOT rather than<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// =
runtime.GOROOT.<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>build.ToolDir =3D =
filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if s :=3D os.Getenv("GOTOOLDIR"); s !=3D "" {<br class=3D"">++<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>build.ToolDir =3D filepath.Clean(s)<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>} else =
{<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>build.ToolDir =3D =
filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+ }<br class=3D"">+=
 <br class=3D"">diff --git =
a/recipes-containers/kubernetes/go-1.12/0004-ld-add-soname-to-shareable-ob=
jects.patch =
b/recipes-containers/kubernetes/go-1.12/0004-ld-add-soname-to-shareable-ob=
jects.patch<br class=3D"">new file mode 100644<br class=3D"">index =
0000000..004a33a<br class=3D"">--- /dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-1.12/0004-ld-add-soname-to-shareable-ob=
jects.patch<br class=3D"">@@ -0,0 +1,45 @@<br class=3D"">+=46rom =
55eb8c95a89f32aec16b7764e78e8cf75169dc81 Mon Sep 17 00:00:00 2001<br =
class=3D"">+From: Matt Madison &lt;<a href=3D"mailto:matt@madison.systems"=
 class=3D"">matt@madison.systems</a>&gt;<br class=3D"">+Date: Sat, 17 =
Feb 2018 06:26:10 -0800<br class=3D"">+Subject: [PATCH] ld: add soname =
to shareable objects<br class=3D"">+<br class=3D"">+so that OE's shared =
library dependency handling<br class=3D"">+can find them.<br =
class=3D"">+<br class=3D"">+Upstream-Status: Inappropriate [OE =
specific]<br class=3D"">+<br class=3D"">+Signed-off-by: Matt Madison =
&lt;<a href=3D"mailto:matt@madison.systems" =
class=3D"">matt@madison.systems</a>&gt;<br class=3D"">+<br =
class=3D"">+---<br class=3D"">+ src/cmd/link/internal/ld/lib.go | 4 =
++++<br class=3D"">+ 1 file changed, 4 insertions(+)<br class=3D"">+<br =
class=3D"">+diff --git a/src/cmd/link/internal/ld/lib.go =
b/src/cmd/link/internal/ld/lib.go<br class=3D"">+index 220aab3..703925f =
100644<br class=3D"">+--- a/src/cmd/link/internal/ld/lib.go<br =
class=3D"">++++ b/src/cmd/link/internal/ld/lib.go<br class=3D"">+@@ =
-1135,6 +1135,7 @@ func (ctxt *Link) hostlink() {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>argv =3D =
append(argv, "-Wl,-z,relro")<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>argv =3D append(argv, "-shared")<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>argv =3D =
append(argv, fmt.Sprintf("-Wl,-soname,%s", =
filepath.Base(*flagOutfile)))<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
ctxt.HeadType !=3D objabi.Hwindows {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// Pass =
-z nodelete to mark the shared library as<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// =
non-closeable: a dlclose will do nothing.<br class=3D"">+@@ -1146,6 =
+1147,8 @@ func (ctxt *Link) hostlink() {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>argv =3D =
append(argv, "-Wl,-z,relro")<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>argv =3D append(argv, "-shared")<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>argv =3D =
append(argv, fmt.Sprintf("-Wl,-soname,%s", =
filepath.Base(*flagOutfile)))<br class=3D"">++<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>case =
BuildModePlugin:<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if ctxt.HeadType =3D=3D =
objabi.Hdarwin {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>argv =3D append(argv, =
"-dynamiclib")<br class=3D"">+@@ -1154,6 +1157,7 @@ func (ctxt *Link) =
hostlink() {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>argv =3D append(argv, =
"-Wl,-z,relro")<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>argv =3D =
append(argv, "-shared")<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>argv =3D append(argv, =
fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+ <br =
class=3D"">diff --git =
a/recipes-containers/kubernetes/go-1.12/0005-make.bash-override-CC-when-bu=
ilding-dist-and-go_boot.patch =
b/recipes-containers/kubernetes/go-1.12/0005-make.bash-override-CC-when-bu=
ilding-dist-and-go_boot.patch<br class=3D"">new file mode 100644<br =
class=3D"">index 0000000..ace8de9<br class=3D"">--- /dev/null<br =
class=3D"">+++ =
b/recipes-containers/kubernetes/go-1.12/0005-make.bash-override-CC-when-bu=
ilding-dist-and-go_boot.patch<br class=3D"">@@ -0,0 +1,37 @@<br =
class=3D"">+=46rom 1bf15aa8fb773604b2524cfdab493fa4d8fa9285 Mon Sep 17 =
00:00:00 2001<br class=3D"">+From: Matt Madison &lt;<a =
href=3D"mailto:matt@madison.systems" =
class=3D"">matt@madison.systems</a>&gt;<br class=3D"">+Date: Sat, 17 Feb =
2018 06:32:45 -0800<br class=3D"">+Subject: [PATCH] make.bash: override =
CC when building dist and go_bootstrap<br class=3D"">+<br class=3D"">+for =
handling OE cross-canadian builds.<br class=3D"">+<br =
class=3D"">+Upstream-Status: Inappropriate [OE specific]<br =
class=3D"">+<br class=3D"">+Signed-off-by: Matt Madison &lt;<a =
href=3D"mailto:matt@madison.systems" =
class=3D"">matt@madison.systems</a>&gt;<br class=3D"">+<br =
class=3D"">+---<br class=3D"">+ src/make.bash | 4 ++--<br class=3D"">+ 1 =
file changed, 2 insertions(+), 2 deletions(-)<br class=3D"">+<br =
class=3D"">+diff --git a/src/make.bash b/src/make.bash<br =
class=3D"">+index 78882d9..25943d0 100755<br class=3D"">+--- =
a/src/make.bash<br class=3D"">++++ b/src/make.bash<br class=3D"">+@@ =
-163,7 +163,7 @@ if [ "$GOROOT_BOOTSTRAP" =3D "$GOROOT" ]; then<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>exit 1<br class=3D"">+ fi<br class=3D"">+ rm -f cmd/dist/dist<br =
class=3D"">+-GOROOT=3D"$GOROOT_BOOTSTRAP" GOOS=3D"" GOARCH=3D"" =
"$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist<br =
class=3D"">++CC=3D"${BUILD_CC:-${CC}}" GOROOT=3D"$GOROOT_BOOTSTRAP" =
GOOS=3D"" GOARCH=3D"" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist =
./cmd/dist<br class=3D"">+ <br class=3D"">+ # -e doesn't propagate out =
of eval, so check success by hand.<br class=3D"">+ eval =
$(./cmd/dist/dist env -p || echo FAIL=3Dtrue)<br class=3D"">+@@ -194,7 =
+194,7 @@ fi<br class=3D"">+ # Run dist bootstrap to complete =
make.bash.<br class=3D"">+ # Bootstrap installs a proper cmd/dist, built =
with the new toolchain.<br class=3D"">+ # Throw ours, built with Go 1.4, =
away after bootstrap.<br class=3D"">+-./cmd/dist/dist bootstrap =
$buildall $vflag $GO_DISTFLAGS "$@"<br =
class=3D"">++CC=3D"${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap =
$buildall $vflag $GO_DISTFLAGS "$@"<br class=3D"">+ rm -f =
./cmd/dist/dist<br class=3D"">+ <br class=3D"">+ # DO NOT ADD ANY NEW =
CODE HERE.<br class=3D"">diff --git =
a/recipes-containers/kubernetes/go-1.12/0006-cmd-dist-separate-host-and-ta=
rget-builds.patch =
b/recipes-containers/kubernetes/go-1.12/0006-cmd-dist-separate-host-and-ta=
rget-builds.patch<br class=3D"">new file mode 100644<br class=3D"">index =
0000000..0c0d5da<br class=3D"">--- /dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-1.12/0006-cmd-dist-separate-host-and-ta=
rget-builds.patch<br class=3D"">@@ -0,0 +1,282 @@<br class=3D"">+=46rom =
fe0fcaf43ef3aab81541dad2a71b46254dc4cf6a Mon Sep 17 00:00:00 2001<br =
class=3D"">+From: Matt Madison &lt;<a href=3D"mailto:matt@madison.systems"=
 class=3D"">matt@madison.systems</a>&gt;<br class=3D"">+Date: Sat, 17 =
Feb 2018 10:03:48 -0800<br class=3D"">+Subject: [PATCH] cmd/dist: =
separate host and target builds<br class=3D"">+<br class=3D"">+Change =
the dist tool to allow for OE-style cross-<br class=3D"">+and =
cross-canadian builds:<br class=3D"">+<br class=3D"">+ - command flags =
--host-only and --target only are added;<br class=3D"">+ &nbsp;&nbsp;if =
one is present, the other changes mentioned below<br class=3D"">+ =
&nbsp;&nbsp;take effect, and arguments may also be specified on<br =
class=3D"">+ &nbsp;&nbsp;the command line to enumerate the package(s) to =
be<br class=3D"">+ &nbsp;&nbsp;built.<br class=3D"">+<br class=3D"">+ - =
for OE cross builds, go_bootstrap is always built for<br class=3D"">+ =
&nbsp;&nbsp;the current build host, and is moved, along with the =
supporting<br class=3D"">+ &nbsp;&nbsp;toolchain (asm, compile, etc.) to =
a separate 'native_native'<br class=3D"">+ &nbsp;&nbsp;directory under =
GOROOT/pkg/tool.<br class=3D"">+<br class=3D"">+ - go_bootstrap is not =
automatically removed after the build,<br class=3D"">+ &nbsp;&nbsp;so it =
can be reused later (e.g., building both static and<br class=3D"">+ =
&nbsp;&nbsp;shared runtime).<br class=3D"">+<br class=3D"">+Note that =
for --host-only builds, it would be nice to specify<br class=3D"">+just =
the "cmd" package to build only the go commands/tools,<br class=3D"">+the =
staleness checks in the dist tool will fail if the "std"<br =
class=3D"">+library has not also been built. &nbsp;So host-only builds =
have to<br class=3D"">+build everything anyway.<br class=3D"">+<br =
class=3D"">+Upstream-Status: Inappropriate [OE specific]<br =
class=3D"">+<br class=3D"">+Signed-off-by: Matt Madison &lt;<a =
href=3D"mailto:matt@madison.systems" =
class=3D"">matt@madison.systems</a>&gt;<br class=3D"">+<br =
class=3D"">+more dist cleanup<br class=3D"">+<br class=3D"">+---<br =
class=3D"">+ src/cmd/dist/build.go | 153 =
++++++++++++++++++++++++++++++------------<br class=3D"">+ 1 file =
changed, 111 insertions(+), 42 deletions(-)<br class=3D"">+<br =
class=3D"">+Index: go/src/cmd/dist/build.go<br =
class=3D"">+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">+--- go.orig/src/cmd/dist/build.go<br class=3D"">++++ =
go/src/cmd/dist/build.go<br class=3D"">+@@ -39,6 +39,7 @@ var (<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>goldflags &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>workdir =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>tooldir =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>build_tooldir<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> string<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>oldgoos =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>oldgoarch &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;string<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>exe =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;string<br class=3D"">+@@ -50,6 +51,7 @@ var (<br class=3D"">+ <br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>rebuildall &nbsp;&nbsp;bool<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>defaultclang bool<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>crossBuild &nbsp;&nbsp;bool<br =
class=3D"">+ <br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>vflag int // verbosity<br =
class=3D"">+ )<br class=3D"">+@@ -231,6 +233,8 @@ func xinit() {<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if tooldir =3D os.Getenv("GOTOOLDIR"); tooldir =3D=3D "" {<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>tooldir =3D pathf("%s/pkg/tool/%s_%s", goroot, gohostos, =
gohostarch)<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>build_tooldir =3D pathf("%s/pkg/tool/native_native", goroot)<br =
class=3D"">++<br class=3D"">+ }<br class=3D"">+ <br class=3D"">+ // =
compilerEnv returns a map from "goos/goarch" to the<br class=3D"">+@@ =
-260,7 +264,6 @@ func compilerEnv(envName, def string) ma<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if gohostos !=3D goos || gohostarch !=3D goarch {<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>m[gohostos+"/"+gohostarch] =3D m[""]<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>m[""] =3D env<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+ <br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>for _, goos :=3D range okgoos {<br class=3D"">+@@ -487,8 +490,10 =
@@ func setup() {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>// We keep it in pkg/, just like =
the object directory above.<br class=3D"">+ <span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>if rebuildall {<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xremoveall(tooldir)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>xremoveall(build_tooldir)<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>xmkdirall(tooldir)<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xmkdirall(build_tooldir)<br class=3D"">+ <br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// Remove =
tool binaries from before the tool/gohostos_gohostarch<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xremoveall(pathf("%s/bin/tool", goroot))<br class=3D"">+@@ =
-1155,11 +1160,29 @@ func cmdbootstrap() {<br class=3D"">+ <br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>var noBanner bool<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>var debug bool<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>var hostOnly bool<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>var targetOnly bool<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>var toBuild =3D []string { "std", "cmd" }<br class=3D"">++<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>flag.BoolVar(&amp;rebuildall, "a", rebuildall, "rebuild all")<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>flag.BoolVar(&amp;debug, "d", debug, "enable debugging of =
bootstrap process")<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>flag.BoolVar(&amp;noBanner, =
"no-banner", noBanner, "do not print banner")<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>flag.BoolVar(&amp;hostOnly, "host-only", hostOnly, "build only =
host binaries, not target")<br class=3D"">++<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>flag.BoolVar(&amp;targetOnly, =
"target-only", targetOnly, "build only target binaries, not host")<br =
class=3D"">+ <br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>xflagparse(0)<br class=3D"">++<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xflagparse(-1)<br class=3D"">++<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(hostOnly &amp;&amp; targetOnly) {<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>fatalf("specify only one of --host-only or --target-only\n")<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>crossBuild =3D hostOnly || =
targetOnly<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if flag.NArg() &gt; 0 {<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if crossBuild {<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>toBuild =3D flag.Args()<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>} else {<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>fatalf("package names not =
permitted without --host-only or --target-only\n")<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">+ <br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if debug {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// =
cmd/buildid is used in debug mode.<br class=3D"">+@@ -1207,8 +1230,13 @@ =
func cmdbootstrap() {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>xprintf("\n")<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">+ <br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>gogcflags =3D =
os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>goldflags =3D os.Getenv("GO_LDFLAGS")<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// For =
split host/target cross/cross-canadian builds, we don't<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>// want to be setting these flags until after we have compiled<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>// the toolchain that runs on the build host.<br class=3D"">++<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if ! =
crossBuild {<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>gogcflags =3D =
os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>goldflags =3D os.Getenv("GO_LDFLAGS")<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>goBootstrap :=3D pathf("%s/go_bootstrap", tooldir)<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cmdGo :=3D pathf("%s/go", gobin)<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if debug =
{<br class=3D"">+@@ -1237,7 +1265,11 @@ func cmdbootstrap() {<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xprintf("\n")<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xprintf("Building Go toolchain2 using go_bootstrap and Go =
toolchain1.\n")<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>os.Setenv("CC", =
compilerEnvLookup(defaultcc, goos, goarch))<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
crossBuild {<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>os.Setenv("CC", defaultcc[""])<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>} else {<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>os.Setenv("CC", =
compilerEnvLookup(defaultcc, goos, goarch))<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>goInstall(goBootstrap, append([]string{"-i"}, =
toolchain...)...)<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if debug {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>run("", =
ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=3Dfull")<br =
class=3D"">+@@ -1274,50 +1306,84 @@ func cmdbootstrap() {<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>checkNotStale(goBootstrap, =
append(toolchain, "runtime/internal/sys")...)<br class=3D"">+ <br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if goos =3D=3D oldgoos &amp;&amp; goarch =3D=3D oldgoarch {<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>// Common case - not setting up for cross-compilation.<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>timelog("build", "toolchain")<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if vflag =
&gt; 0 {<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>xprintf("\n")<br class=3D"">++<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
crossBuild {<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>gogcflags =3D =
os.Getenv("GO_GCFLAGS")<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>goldflags =3D =
os.Getenv("GO_LDFLAGS")<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>tool_files, _ :=3D =
filepath.Glob(pathf("%s/*", tooldir))<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>for _, f =
:=3D range tool_files {<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>copyfile(pathf("%s/%s", =
build_tooldir, filepath.Base(f)), f, writeExec)<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xremove(f)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>os.Setenv("GOTOOLDIR", build_tooldir)<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>goBootstrap =3D pathf("%s/go_bootstrap", build_tooldir)<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if hostOnly {<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>timelog("build", "host =
toolchain")<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if vflag &gt; 0 {<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xprintf("\n")<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xprintf("Building %s for host, %s/%s.\n", strings.Join(toBuild, =
","), goos, goarch)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>goInstall(goBootstrap, =
toBuild...)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>checkNotStale(goBootstrap, =
toBuild...)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>// Skip cmdGo staleness checks =
here, since we can't necessarily run the cmdGo binary<br class=3D"">++<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>timelog("build", "target toolchain")<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if vflag =
&gt; 0 {<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>xprintf("\n")<br class=3D"">++<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>} else if targetOnly {<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>goos =3D =
oldgoos<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>goarch =3D oldgoarch<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>os.Setenv("GOOS", goos)<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>os.Setenv("GOARCH", goarch)<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xprintf("Building %s for target, %s/%s.\n", strings.Join(toBuild, =
","), goos, goarch)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>goInstall(goBootstrap, =
toBuild...)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>checkNotStale(goBootstrap, =
toBuild...)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>// Skip cmdGo staleness checks =
here, since we can't run the target's cmdGo binary<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xprintf("Building packages and commands for %s/%s.\n", goos, =
goarch)<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>} else {<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// =
GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// Finish =
GOHOSTOS/GOHOSTARCH installation and then<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// run =
GOOS/GOARCH installation.<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>timelog("build", "host =
toolchain")<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if vflag &gt; 0 {<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xprintf("\n")<br class=3D"">++<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if goos =
=3D=3D oldgoos &amp;&amp; goarch =3D=3D oldgoarch {<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// Common =
case - not setting up for cross-compilation.<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>timelog("build", "toolchain")<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if vflag =
&gt; 0 {<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>xprintf("\n")<br class=3D"">++<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xprintf("Building packages and commands for %s/%s.\n", goos, =
goarch)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>} else {<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// =
GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// Finish =
GOHOSTOS/GOHOSTARCH installation and then<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// run =
GOOS/GOARCH installation.<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>timelog("build", "host =
toolchain")<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if vflag &gt; 0 {<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xprintf("\n")<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xprintf("Building packages and commands for host, %s/%s.\n", =
goos, goarch)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>goInstall(goBootstrap, "std", =
"cmd")<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>checkNotStale(goBootstrap, "std", =
"cmd")<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>checkNotStale(cmdGo, "std", =
"cmd")<br class=3D"">++<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>timelog("build", "target =
toolchain")<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if vflag &gt; 0 {<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xprintf("\n")<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>goos =3D =
oldgoos<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>goarch =3D oldgoarch<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>os.Setenv("GOOS", goos)<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>os.Setenv("GOARCH", goarch)<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xprintf("Building packages and commands for target, %s/%s.\n", =
goos, goarch)<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xprintf("Building packages and commands for host, %s/%s.\n", =
goos, goarch)<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>goInstall(goBootstrap, "std", =
"cmd")<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>checkNotStale(goBootstrap, "std", =
"cmd")<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>checkNotStale(cmdGo, "std", =
"cmd")<br class=3D"">+ <br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>timelog("build", "target =
toolchain")<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if vflag &gt; 0 {<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xprintf("\n")<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>goos =3D =
oldgoos<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>goarch =3D oldgoarch<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>os.Setenv("GOOS", goos)<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>os.Setenv("GOARCH", goarch)<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xprintf("Building packages and commands for target, %s/%s.\n", =
goos, goarch)<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>targets =
:=3D []string{"std", "cmd"}<br class=3D"">+-<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>if goos =3D=3D "js" &amp;&amp; =
goarch =3D=3D "wasm" {<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>// Skip the cmd tools for =
js/wasm. They're not usable.<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>targets =3D=
 targets[:1]<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>goInstall(goBootstrap, targets...)<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>checkNotStale(goBootstrap, targets...)<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>checkNotStale(cmdGo, targets...)<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if debug =
{<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>run("", ShowOutput|CheckExit, =
pathf("%s/compile", tooldir), "-V=3Dfull")<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>run("", =
ShowOutput|CheckExit, pathf("%s/buildid", tooldir), =
pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))<br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>checkNotStale(goBootstrap, append(toolchain, =
"runtime/internal/sys")...)<br class=3D"">+-<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>copyfile(pathf("%s/compile4", =
tooldir), pathf("%s/compile", tooldir), writeExec)<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if debug =
{<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>run("", ShowOutput|CheckExit, =
pathf("%s/compile", tooldir), "-V=3Dfull")<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>run("", =
ShowOutput|CheckExit, pathf("%s/buildid", tooldir), =
pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>checkNotStale(goBootstrap, append(toolchain, =
"runtime/internal/sys")...)<br class=3D"">++<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>copyfile(pathf("%s/compile4", =
tooldir), pathf("%s/compile", tooldir), writeExec)<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">+ <br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>// Check that there are no new =
files in $GOROOT/bin other than<br class=3D"">+@@ -1335,7 +1401,11 @@ =
func cmdbootstrap() {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+ <br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>// Remove go_bootstrap now that we're done.<br class=3D"">+-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xremove(pathf("%s/go_bootstrap", tooldir))<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// Except =
that for split host/target cross-builds, we need to<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// keep =
it.<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if ! crossBuild {<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>xremove(pathf("%s/go_bootstrap", tooldir))<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">+ <br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>// Print trailing banner unless =
instructed otherwise.<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if !noBanner {<br class=3D"">diff =
--git =
a/recipes-containers/kubernetes/go-1.12/0007-cmd-go-make-GOROOT-precious-b=
y-default.patch =
b/recipes-containers/kubernetes/go-1.12/0007-cmd-go-make-GOROOT-precious-b=
y-default.patch<br class=3D"">new file mode 100644<br class=3D"">index =
0000000..29ef947<br class=3D"">--- /dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-1.12/0007-cmd-go-make-GOROOT-precious-b=
y-default.patch<br class=3D"">@@ -0,0 +1,106 @@<br class=3D"">+=46rom =
7cc60b3887be2d5674b9f5d422d022976cf205e5 Mon Sep 17 00:00:00 2001<br =
class=3D"">+From: Matt Madison &lt;<a href=3D"mailto:matt@madison.systems"=
 class=3D"">matt@madison.systems</a>&gt;<br class=3D"">+Date: Fri, 2 Mar =
2018 06:00:20 -0800<br class=3D"">+Subject: [PATCH] cmd/go: make GOROOT =
precious by default<br class=3D"">+<br class=3D"">+The go build tool =
normally rebuilds whatever it detects is<br class=3D"">+stale. =
&nbsp;This can be a problem when GOROOT is intended to<br class=3D"">+be =
read-only and the go runtime has been built as a shared<br =
class=3D"">+library, since we don't want every application to be =
rebuilding<br class=3D"">+the shared runtime - particularly in =
cross-build/packaging<br class=3D"">+setups, since that would lead to =
'abi mismatch' runtime errors.<br class=3D"">+<br class=3D"">+This patch =
prevents the install and linkshared actions from<br class=3D"">+installing=
 to GOROOT unless overridden with the GOROOT_OVERRIDE<br =
class=3D"">+environment variable.<br class=3D"">+<br =
class=3D"">+Upstream-Status: Inappropriate [OE specific]<br =
class=3D"">+<br class=3D"">+Signed-off-by: Matt Madison &lt;<a =
href=3D"mailto:matt@madison.systems" =
class=3D"">matt@madison.systems</a>&gt;<br class=3D"">+<br =
class=3D"">+---<br class=3D"">+ src/cmd/go/internal/work/action.go | =
&nbsp;3 +++<br class=3D"">+ src/cmd/go/internal/work/build.go &nbsp;| =
&nbsp;5 +++++<br class=3D"">+ src/cmd/go/internal/work/exec.go =
&nbsp;&nbsp;| 25 +++++++++++++++++++++++++<br class=3D"">+ 3 files =
changed, 33 insertions(+)<br class=3D"">+<br class=3D"">+Index: =
go/src/cmd/go/internal/work/action.go<br =
class=3D"">+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">+--- go.orig/src/cmd/go/internal/work/action.go<br =
class=3D"">++++ go/src/cmd/go/internal/work/action.go<br class=3D"">+@@ =
-600,6 +600,9 @@ func (b *Builder) addTransitiveLinkDeps(<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if p1 =3D=3D nil || p1.Shlib =3D=3D "" || =
haveShlib[filepath.Base(p1.Shlib)] {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>continue<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
goRootPrecious &amp;&amp; (p1.Standard || p1.Goroot) {<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>continue<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>haveShlib[filepath.Base(p1.Shlib)] =3D true<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// =
TODO(rsc): The use of ModeInstall here is suspect, but if we only do =
ModeBuild,<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>// we'll end up building an =
overall library or executable that depends at runtime<br =
class=3D"">+Index: go/src/cmd/go/internal/work/build.go<br =
class=3D"">+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">+--- go.orig/src/cmd/go/internal/work/build.go<br =
class=3D"">++++ go/src/cmd/go/internal/work/build.go<br class=3D"">+@@ =
-147,6 +147,7 @@ See also: go install, go get, go clean.<br class=3D"">+ =
}<br class=3D"">+ <br class=3D"">+ const =
concurrentGCBackendCompilationEnabledByDefault =3D true<br =
class=3D"">++var goRootPrecious bool =3D true<br class=3D"">+ <br =
class=3D"">+ func init() {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>// break init cycle<br =
class=3D"">+@@ -160,6 +161,10 @@ func init() {<br class=3D"">+ <br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>AddBuildFlags(CmdBuild)<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>AddBuildFlags(CmdInstall)<br class=3D"">++<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if x :=3D =
os.Getenv("GOROOT_OVERRIDE"); x !=3D "" {<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>goRootPrecious =3D false<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">+ }<br class=3D"">+ <br class=3D"">+ // Note that flags =
consulted by other parts of the code<br class=3D"">+Index: =
go/src/cmd/go/internal/work/exec.go<br =
class=3D"">+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">+--- go.orig/src/cmd/go/internal/work/exec.go<br =
class=3D"">++++ go/src/cmd/go/internal/work/exec.go<br class=3D"">+@@ =
-436,6 +436,23 @@ func (b *Builder) build(a *Action) (err<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return fmt.Errorf("missing or invalid binary-only package; =
expected file %q", a.Package.Target)<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">+ <br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if goRootPrecious &amp;&amp; =
(a.Package.Standard || a.Package.Goroot) {<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>_, err :=3D=
 os.Stat(a.Package.Target)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if err =3D=3D nil {<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>a.built =3D a.Package.Target<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>a.Target =
=3D a.Package.Target<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>a.buildID =3D =
b.fileHash(a.Package.Target)<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>a.Package.Stale =3D false<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>a.Package.StaleReason =3D "GOROOT-resident package"<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return nil<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>a.Package.Stale =3D true<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>a.Package.StaleReason =3D "missing or invalid GOROOT-resident =
package"<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if b.IsCmdList {<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return nil<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">++<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if err :=3D b.Mkdir(a.Objdir); =
err !=3D nil {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return err<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">+@@ -1438,6 +1455,14 @@ func BuildInstallFunc(b *Builder, a =
*Act<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return nil<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">+ <br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if goRootPrecious &amp;&amp; =
a.Package !=3D nil {<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>p :=3D a.Package<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if p.Standard || p.Goroot {<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>err :=3D =
fmt.Errorf("attempting to install package %s into read-only GOROOT", =
p.ImportPath)<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return err<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}<br class=3D"">++<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if err :=3D b.Mkdir(a.Objdir); =
err !=3D nil {<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return err<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>}<br =
class=3D"">diff --git =
a/recipes-containers/kubernetes/go-1.12/0008-use-GOBUILDMODE-to-set-buildm=
ode.patch =
b/recipes-containers/kubernetes/go-1.12/0008-use-GOBUILDMODE-to-set-buildm=
ode.patch<br class=3D"">new file mode 100644<br class=3D"">index =
0000000..225cf43<br class=3D"">--- /dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-1.12/0008-use-GOBUILDMODE-to-set-buildm=
ode.patch<br class=3D"">@@ -0,0 +1,37 @@<br class=3D"">+=46rom =
0e0c247f0caec23528889ff09d98348cba9028f1 Mon Sep 17 00:00:00 2001<br =
class=3D"">+From: Hongxu Jia &lt;<a =
href=3D"mailto:hongxu.jia@windriver.com" =
class=3D"">hongxu.jia@windriver.com</a>&gt;<br class=3D"">+Date: Fri, 26 =
Oct 2018 15:02:32 +0800<br class=3D"">+Subject: [PATCH] use GOBUILDMODE =
to set buildmode<br class=3D"">+<br class=3D"">+While building go =
itself, the go build system does not support<br class=3D"">+to set =
`-buildmode=3Dpie' from environment.<br class=3D"">+<br class=3D"">+Add =
GOBUILDMODE to support it which make PIE executables the default<br =
class=3D"">+build mode, as PIE executables are required as of Yocto<br =
class=3D"">+<br class=3D"">+Refers: <a =
href=3D"https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI" =
class=3D"">https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI<=
/a><br class=3D"">+Upstream-Status: Denied [upstream choose antoher =
solution: `17a256b<br class=3D"">+cmd/go: -buildmode=3Dpie for =
android/arm']<br class=3D"">+<br class=3D"">+Signed-off-by: Hongxu Jia =
&lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
class=3D"">hongxu.jia@windriver.com</a>&gt;<br class=3D"">+---<br =
class=3D"">+ src/cmd/go/internal/work/build.go | 6 +++++-<br class=3D"">+ =
1 file changed, 5 insertions(+), 1 deletion(-)<br class=3D"">+<br =
class=3D"">+Index: go/src/cmd/go/internal/work/build.go<br =
class=3D"">+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br =
class=3D"">+--- go.orig/src/cmd/go/internal/work/build.go<br =
class=3D"">++++ go/src/cmd/go/internal/work/build.go<br class=3D"">+@@ =
-223,7 +223,11 @@ func AddBuildFlags(cmd *base.Command) {<br class=3D"">+ =
<br class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>cmd.Flag.Var(&amp;load.BuildAsmflags, "asmflags", "")<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cmd.Flag.Var(buildCompiler{}, "compiler", "")<br class=3D"">+-<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cmd.Flag.StringVar(&amp;cfg.BuildBuildmode, "buildmode", =
"default", "")<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if bm :=3D =
os.Getenv("GOBUILDMODE"); bm !=3D "" {<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cmd.Flag.StringVar(&amp;cfg.BuildBuildmode, "buildmode", bm, =
"")<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>} else {<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cmd.Flag.StringVar(&amp;cfg.BuildBuildmode, "buildmode", =
"default", "")<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cmd.Flag.Var(&amp;load.BuildGcflags, "gcflags", "")<br class=3D"">+=
 <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cmd.Flag.Var(&amp;load.BuildGccgoflags, "gccgoflags", "")<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cmd.Flag.StringVar(&amp;cfg.BuildMod, "mod", "", "")<br =
class=3D"">diff --git =
a/recipes-containers/kubernetes/go-1.12/0009-ld-replace-glibc-dynamic-link=
er-with-musl.patch =
b/recipes-containers/kubernetes/go-1.12/0009-ld-replace-glibc-dynamic-link=
er-with-musl.patch<br class=3D"">new file mode 100644<br class=3D"">index =
0000000..840cf4b<br class=3D"">--- /dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-1.12/0009-ld-replace-glibc-dynamic-link=
er-with-musl.patch<br class=3D"">@@ -0,0 +1,112 @@<br class=3D"">+=46rom =
35ea4be34e94912b00837e0f7c7385f2e98fe769 Mon Sep 17 00:00:00 2001<br =
class=3D"">+From: Matt Madison &lt;<a href=3D"mailto:matt@madison.systems"=
 class=3D"">matt@madison.systems</a>&gt;<br class=3D"">+Date: Sun, 18 =
Feb 2018 08:24:05 -0800<br class=3D"">+Subject: [PATCH] ld: replace =
glibc dynamic linker with musl<br class=3D"">+<br class=3D"">+Rework of =
patch by Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
class=3D"">raj.khem@gmail.com</a>&gt;<br class=3D"">+for go 1.10. =
&nbsp;Should be applied conditionally on<br class=3D"">+musl being the =
system C library.<br class=3D"">+<br class=3D"">+Upstream-Status: =
Inappropriate [Real fix should be portable across libcs]<br =
class=3D"">+<br class=3D"">+Signed-off-by: Matt Madison &lt;<a =
href=3D"mailto:matt@madison.systems" =
class=3D"">matt@madison.systems</a>&gt;<br class=3D"">+<br =
class=3D"">+---<br class=3D"">+ src/cmd/link/internal/amd64/obj.go =
&nbsp;| 2 +-<br class=3D"">+ src/cmd/link/internal/arm/obj.go =
&nbsp;&nbsp;&nbsp;| 2 +-<br class=3D"">+ =
src/cmd/link/internal/arm64/obj.go &nbsp;| 2 +-<br class=3D"">+ =
src/cmd/link/internal/mips/obj.go &nbsp;&nbsp;| 2 +-<br class=3D"">+ =
src/cmd/link/internal/mips64/obj.go | 2 +-<br class=3D"">+ =
src/cmd/link/internal/ppc64/obj.go &nbsp;| 2 +-<br class=3D"">+ =
src/cmd/link/internal/s390x/obj.go &nbsp;| 2 +-<br class=3D"">+ =
src/cmd/link/internal/x86/obj.go &nbsp;&nbsp;&nbsp;| 2 +-<br class=3D"">+ =
8 files changed, 8 insertions(+), 8 deletions(-)<br class=3D"">+<br =
class=3D"">+--- a/src/cmd/link/internal/amd64/obj.go<br class=3D"">++++ =
b/src/cmd/link/internal/amd64/obj.go<br class=3D"">+@@ -62,7 +62,7 @@ =
func Init() (*sys.Arch, ld.Arch) {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>PEreloc1: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pereloc1,<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>TLSIEtoLE: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tlsIEtoLE,<br class=3D"">+ <br =
class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Linuxdynld: =
&nbsp;&nbsp;&nbsp;&nbsp;"/lib64/ld-linux-x86-64.so.2",<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Linuxdynld: =
&nbsp;&nbsp;&nbsp;&nbsp;"/lib64/ld-musl-x86-64.so.1",<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Freebsddynld: &nbsp;&nbsp;"/libexec/ld-elf.so.1",<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Openbsddynld: &nbsp;&nbsp;"/usr/libexec/ld.so",<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Netbsddynld: &nbsp;&nbsp;&nbsp;"/libexec/ld.elf_so",<br =
class=3D"">+--- a/src/cmd/link/internal/arm/obj.go<br class=3D"">++++ =
b/src/cmd/link/internal/arm/obj.go<br class=3D"">+@@ -59,7 +59,7 @@ func =
Init() (*sys.Arch, ld.Arch) {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Machoreloc1: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;machoreloc1,<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>PEreloc1: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pereloc1,<br class=3D"">+ =
<br class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Linuxdynld: &nbsp;&nbsp;&nbsp;&nbsp;"/lib/ld-linux.so.3", // 2 =
for OABI, 3 for EABI<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>Linuxdynld: =
&nbsp;&nbsp;&nbsp;&nbsp;"/lib/ld-musl-armhf.so.1",<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Freebsddynld: &nbsp;&nbsp;"/usr/libexec/ld-elf.so.1",<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Openbsddynld: &nbsp;&nbsp;"/usr/libexec/ld.so",<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Netbsddynld: &nbsp;&nbsp;&nbsp;"/libexec/ld.elf_so",<br =
class=3D"">+--- a/src/cmd/link/internal/arm64/obj.go<br class=3D"">++++ =
b/src/cmd/link/internal/arm64/obj.go<br class=3D"">+@@ -57,7 +57,7 @@ =
func Init() (*sys.Arch, ld.Arch) {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>Gentext: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gentext,<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Machoreloc1: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;machoreloc1,<br =
class=3D"">+ <br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>Linuxdynld: =
"/lib/ld-linux-aarch64.so.1",<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Linuxdynld: "/lib/ld-musl-aarch64.so.1",<br class=3D"">+ <br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Freebsddynld: &nbsp;&nbsp;"XXX",<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Openbsddynld: &nbsp;&nbsp;"XXX",<br class=3D"">+--- =
a/src/cmd/link/internal/mips/obj.go<br class=3D"">++++ =
b/src/cmd/link/internal/mips/obj.go<br class=3D"">+@@ -60,7 +60,7 @@ =
func Init() (*sys.Arch, ld.Arch) {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>Gentext: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gentext,<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Machoreloc1: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;machoreloc1,<br =
class=3D"">+ <br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>Linuxdynld: "/lib/ld.so.1",<br =
class=3D"">++<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Linuxdynld: "/lib/ld-musl-mipsle.so.1",<br class=3D"">+ <br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Freebsddynld: &nbsp;&nbsp;"XXX",<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Openbsddynld: &nbsp;&nbsp;"XXX",<br class=3D"">+--- =
a/src/cmd/link/internal/mips64/obj.go<br class=3D"">++++ =
b/src/cmd/link/internal/mips64/obj.go<br class=3D"">+@@ -59,7 +59,7 @@ =
func Init() (*sys.Arch, ld.Arch) {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>Gentext: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gentext,<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Machoreloc1: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;machoreloc1,<br =
class=3D"">+ <br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>Linuxdynld: =
&nbsp;&nbsp;&nbsp;&nbsp;"/lib64/ld64.so.1",<br class=3D"">++<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Linuxdynld: =
&nbsp;&nbsp;&nbsp;&nbsp;"/lib64/ld-musl-mips64le.so.1",<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Freebsddynld: &nbsp;&nbsp;"XXX",<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Openbsddynld: &nbsp;&nbsp;"XXX",<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Netbsddynld: &nbsp;&nbsp;&nbsp;"XXX",<br class=3D"">+--- =
a/src/cmd/link/internal/ppc64/obj.go<br class=3D"">++++ =
b/src/cmd/link/internal/ppc64/obj.go<br class=3D"">+@@ -62,7 +62,7 @@ =
func Init() (*sys.Arch, ld.Arch) {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Machoreloc1: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;machoreloc1,<br =
class=3D"">+ <br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>// TODO(austin): ABI v1 uses =
/usr/lib/ld.so.1,<br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>Linuxdynld: =
"/lib64/ld64.so.1",<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>Linuxdynld: =
"/lib64/ld-musl-powerpc64le.so.1",<br class=3D"">+ <br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Freebsddynld: &nbsp;&nbsp;"XXX",<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Openbsddynld: &nbsp;&nbsp;"XXX",<br class=3D"">+--- =
a/src/cmd/link/internal/s390x/obj.go<br class=3D"">++++ =
b/src/cmd/link/internal/s390x/obj.go<br class=3D"">+@@ -57,7 +57,7 @@ =
func Init() (*sys.Arch, ld.Arch) {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>Gentext: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gentext,<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Machoreloc1: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;machoreloc1,<br =
class=3D"">+ <br class=3D"">+-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>Linuxdynld: =
"/lib64/ld64.so.1",<br class=3D"">++<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>Linuxdynld: =
"/lib64/ld-musl-s390x.so.1",<br class=3D"">+ <br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>// not =
relevant for s390x<br class=3D"">+ <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>Freebsddynld: =
&nbsp;&nbsp;"XXX",<br class=3D"">+--- =
a/src/cmd/link/internal/x86/obj.go<br class=3D"">++++ =
b/src/cmd/link/internal/x86/obj.go<br class=3D"">+@@ -58,7 +58,7 @@ func =
Init() (*sys.Arch, ld.Arch) {<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Machoreloc1: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;machoreloc1,<br =
class=3D"">+ <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>PEreloc1: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pereloc1,<br class=3D"">+ =
<br class=3D"">+-<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Linuxdynld: &nbsp;&nbsp;"/lib/ld-linux.so.2",<br class=3D"">++<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Linuxdynld: &nbsp;&nbsp;"/lib/ld-musl-i386.so.1",<br class=3D"">+ =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Freebsddynld: "/usr/libexec/ld-elf.so.1",<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Openbsddynld: "/usr/libexec/ld.so",<br class=3D"">+ <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>Netbsddynld: &nbsp;"/usr/libexec/ld.elf_so",<br class=3D"">diff =
--git a/recipes-containers/kubernetes/go-common.inc =
b/recipes-containers/kubernetes/go-common.inc<br class=3D"">new file =
mode 100644<br class=3D"">index 0000000..93a3d3b<br class=3D"">--- =
/dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-common.inc<br class=3D"">@@ -0,0 =
+1,32 @@<br class=3D"">+SUMMARY =3D "Go programming language =
compiler"<br class=3D"">+DESCRIPTION =3D " The Go programming language =
is an open source project to make \<br class=3D"">+ programmers more =
productive. Go is expressive, concise, clean, and\<br class=3D"">+ =
efficient. Its concurrency mechanisms make it easy to write programs\<br =
class=3D"">+ that get the most out of multicore and networked machines, =
while its\<br class=3D"">+ novel type system enables flexible and =
modular program construction.\<br class=3D"">+ Go compiles quickly to =
machine code yet has the convenience of\<br class=3D"">+ garbage =
collection and the power of run-time reflection. It's a\<br class=3D"">+ =
fast, statically typed, compiled language that feels like a\<br =
class=3D"">+ dynamically typed, interpreted language."<br class=3D"">+<br =
class=3D"">+HOMEPAGE =3D " <a href=3D"http://golang.org/" =
class=3D"">http://golang.org/</a>"<br class=3D"">+LICENSE =3D =
"BSD-3-Clause"<br class=3D"">+<br class=3D"">+inherit goarch<br =
class=3D"">+<br class=3D"">+SRC_URI =3D "<a =
href=3D"http://golang.org/dl/go${PV}.src.tar.gz;name=3Dmain" =
class=3D"">http://golang.org/dl/go${PV}.src.tar.gz;name=3Dmain</a>"<br =
class=3D"">+S =3D "${WORKDIR}/go"<br class=3D"">+B =3D "${S}"<br =
class=3D"">+UPSTREAM_CHECK_REGEX =3D =
"(?P&lt;pver&gt;\d+(\.\d+)+)\.src\.tar"<br class=3D"">+<br =
class=3D"">+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"<br =
class=3D"">+SSTATE_SCAN_CMD =3D "true"<br class=3D"">+<br =
class=3D"">+export GOROOT_OVERRIDE =3D "1"<br class=3D"">+export =
GOTMPDIR ?=3D "${WORKDIR}/go-tmp"<br class=3D"">+GOTMPDIR[vardepvalue] =3D=
 ""<br class=3D"">+export CGO_ENABLED =3D "1"<br class=3D"">+<br =
class=3D"">+do_compile_prepend() {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>BUILD_CC=3D${BUILD_CC}<br class=3D"">+}<br class=3D"">diff --git =
a/recipes-containers/kubernetes/go-cross-canadian.inc =
b/recipes-containers/kubernetes/go-cross-canadian.inc<br class=3D"">new =
file mode 100644<br class=3D"">index 0000000..945d0f9<br class=3D"">--- =
/dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-cross-canadian.inc<br class=3D"">@@ =
-0,0 +1,66 @@<br class=3D"">+inherit cross-canadian<br class=3D"">+<br =
class=3D"">+DEPENDS =3D "go-native virtual/${HOST_PREFIX}go-crosssdk =
virtual/nativesdk-${HOST_PREFIX}go-runtime \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;virtual/${HOST=
_PREFIX}gcc-crosssdk virtual/nativesdk-libc \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;virtual/native=
sdk-${HOST_PREFIX}compilerlibs"<br class=3D"">+PN =3D =
"go-cross-canadian-${TRANSLATED_TARGET_ARCH}"<br class=3D"">+<br =
class=3D"">+# it uses gcc on build machine during go-cross-canadian =
bootstrap, but<br class=3D"">+# the gcc version may be old and not =
support option '-fmacro-prefix-map'<br class=3D"">+# which is one of =
default values of DEBUG_PREFIX_MAP<br class=3D"">+DEBUG_PREFIX_MAP =3D =
"-fdebug-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-$=
{PR} \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-fdebug-prefix-map=3D${STAGING_DIR=
_HOST}=3D \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-fdebug-prefix-map=3D${STAGING_DIR=
_NATIVE}=3D \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"<br class=3D"">+<br =
class=3D"">+export GOHOSTOS =3D "${BUILD_GOOS}"<br class=3D"">+export =
GOHOSTARCH =3D "${BUILD_GOARCH}"<br class=3D"">+export GOROOT_BOOTSTRAP =
=3D "${STAGING_LIBDIR_NATIVE}/go"<br class=3D"">+export =
GOTOOLDIR_BOOTSTRAP =3D =
"${STAGING_LIBDIR_NATIVE}/${HOST_SYS}/go/pkg/tool/${BUILD_GOTUPLE}"<br =
class=3D"">+export GOROOT_FINAL =3D "${libdir}/go"<br class=3D"">+export =
CGO_CFLAGS =3D "${CFLAGS}"<br class=3D"">+export CGO_LDFLAGS =3D =
"${LDFLAGS}"<br class=3D"">+export GO_LDFLAGS =3D '-linkmode external =
-extld ${HOST_PREFIX}gcc -extldflags "--sysroot=3D${STAGING_DIR_HOST} =
${SECURITY_NOPIE_CFLAGS} ${HOST_CC_ARCH} ${LDFLAGS}"'<br class=3D"">+<br =
class=3D"">+do_configure[noexec] =3D "1"<br class=3D"">+<br =
class=3D"">+do_compile() {<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>export =
CC_FOR_${HOST_GOOS}_${HOST_GOARCH}=3D"${HOST_PREFIX}gcc =
--sysroot=3D${STAGING_DIR_HOST}${SDKPATHNATIVE} =
${SECURITY_NOPIE_CFLAGS}"<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>export =
CXX_FOR_${HOST_GOOS}_${HOST_GOARCH}=3D"${HOST_PREFIX}gxx =
--sysroot=3D${STAGING_DIR_HOST}${SDKPATHNATIVE} =
${SECURITY_NOPIE_CFLAGS}"<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>cd src<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>./make.bash --host-only --no-banner<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cd =
${B}<br class=3D"">+}<br class=3D"">+do_compile[dirs] =3D+ "${GOTMPDIR} =
${B}/bin ${B}/pkg"<br class=3D"">+do_compile[cleandirs] +=3D =
"${GOTMPDIR} ${B}/bin ${B}/pkg"<br class=3D"">+<br class=3D"">+<br =
class=3D"">+make_wrapper() {<br class=3D"">+<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>rm -f ${D}${bindir}/$2<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cat &lt;&lt;END &gt;${D}${bindir}/$2<br class=3D"">+#!/bin/sh<br =
class=3D"">+here=3D\`dirname \$0\`<br class=3D"">+native_goroot=3D\`readli=
nk -f \$here/../../lib/${TARGET_SYS}/go\`<br class=3D"">+export =
GOARCH=3D"${TARGET_GOARCH}"<br class=3D"">+export =
GOOS=3D"${TARGET_GOOS}"<br class=3D"">+test -n "\$GOARM" || export =
GOARM=3D"${TARGET_GOARM}"<br class=3D"">+test -n "\$GO386" || export =
GO386=3D"${TARGET_GO386}"<br class=3D"">+test -n "\$GOMIPS" || export =
GOMIPS=3D"${TARGET_GOMIPS}"<br class=3D"">+export =
GOTOOLDIR=3D"\$native_goroot/pkg/tool/${HOST_GOTUPLE}"<br class=3D"">+test=
 -n "\$GOROOT" || export =
GOROOT=3D"\$OECORE_TARGET_SYSROOT/${target_libdir}/go"<br =
class=3D"">+\$here/../../lib/${TARGET_SYS}/go/bin/$1 "\$@"<br =
class=3D"">+END<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>chmod +x ${D}${bindir}/$2<br =
class=3D"">+}<br class=3D"">+<br class=3D"">+do_install() {<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>install -d ${D}${libdir}/go/pkg/tool<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cp =
--preserve=3Dmode,timestamps -R ${B}/pkg/tool/${HOST_GOTUPLE} =
${D}${libdir}/go/pkg/tool/<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>install -d ${D}${bindir} =
${D}${libdir}/go/bin<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>for f in =
${B}/${GO_BUILD_BINDIR}/*<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>do<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>base=3D`basename $f`<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>install -m755 $f =
${D}${libdir}/go/bin<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>make_wrapper $base =
${TARGET_PREFIX}$base<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>done<br class=3D"">+}<br =
class=3D"">diff --git =
a/recipes-containers/kubernetes/go-cross-canadian_1.12.bb =
b/recipes-containers/kubernetes/go-cross-canadian_1.12.bb<br =
class=3D"">new file mode 100644<br class=3D"">index 0000000..7ac9449<br =
class=3D"">--- /dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-cross-canadian_1.12.bb<br class=3D"">@@=
 -0,0 +1,2 @@<br class=3D"">+require go-cross-canadian.inc<br =
class=3D"">+require go-${PV}.inc<br class=3D"">diff --git =
a/recipes-containers/kubernetes/go-cross.inc =
b/recipes-containers/kubernetes/go-cross.inc<br class=3D"">new file mode =
100644<br class=3D"">index 0000000..3d344a7<br class=3D"">--- =
/dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-cross.inc<br class=3D"">@@ -0,0 +1,62 =
@@<br class=3D"">+inherit cross<br class=3D"">+<br class=3D"">+PROVIDES =
=3D "virtual/${TUNE_PKGARCH}-go"<br class=3D"">+DEPENDS =3D =
"go-native"<br class=3D"">+<br class=3D"">+PN =3D =
"go-cross-${TUNE_PKGARCH}"<br class=3D"">+<br class=3D"">+export =
GOHOSTOS =3D "${BUILD_GOOS}"<br class=3D"">+export GOHOSTARCH =3D =
"${BUILD_GOARCH}"<br class=3D"">+export GOOS =3D "${TARGET_GOOS}"<br =
class=3D"">+export GOARCH =3D "${TARGET_GOARCH}"<br class=3D"">+export =
GOARM =3D "${TARGET_GOARM}"<br class=3D"">+export GO386 =3D =
"${TARGET_GO386}"<br class=3D"">+export GOMIPS =3D "${TARGET_GOMIPS}"<br =
class=3D"">+export GOROOT_BOOTSTRAP =3D "${STAGING_LIBDIR_NATIVE}/go"<br =
class=3D"">+export GOROOT_FINAL =3D "${libdir}/go"<br class=3D"">+export =
GOCACHE =3D "${B}/.cache"<br class=3D"">+CC =3D =
"${@d.getVar('BUILD_CC').strip()}"<br class=3D"">+<br =
class=3D"">+do_configure[noexec] =3D "1"<br class=3D"">+<br =
class=3D"">+do_compile() {<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>export =
CC_FOR_${GOOS}_${GOARCH}=3D"${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} =
--sysroot=3D${STAGING_DIR_TARGET}"<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>export =
CXX_FOR_${GOOS}_${GOARCh}=3D"${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} =
--sysroot=3D${STAGING_DIR_TARGET}"<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cd src<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>./make.bash --host-only --no-banner<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cd =
${B}<br class=3D"">+}<br class=3D"">+do_compile[dirs] =3D+ "${GOTMPDIR} =
${B}/bin ${B}/pkg"<br class=3D"">+do_compile[cleandirs] +=3D =
"${GOTMPDIR} ${B}/bin ${B}/pkg"<br class=3D"">+<br =
class=3D"">+make_wrapper() {<br class=3D"">+<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>rm -f ${D}${bindir}/$2<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cat &lt;&lt;END &gt;${D}${bindir}/$2<br class=3D"">+#!/bin/bash<br =
class=3D"">+here=3D\`dirname \$0\`<br class=3D"">+export =
GOARCH=3D"${TARGET_GOARCH}"<br class=3D"">+export =
GOOS=3D"${TARGET_GOOS}"<br class=3D"">+export =
GOARM=3D"\${GOARM:-${TARGET_GOARM}}"<br class=3D"">+export =
GO386=3D"\${GO386:-${TARGET_GO386}}"<br class=3D"">+export =
GOMIPS=3D"\${GOMIPS:-${TARGET_GOMIPS}}"<br =
class=3D"">+\$here/../../lib/${CROSS_TARGET_SYS_DIR}/go/bin/$1 "\$@"<br =
class=3D"">+END<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>chmod +x ${D}${bindir}/$2<br =
class=3D"">+}<br class=3D"">+<br class=3D"">+do_install() {<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>install -d ${D}${libdir}/go<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cp =
--preserve=3Dmode,timestamps -R ${B}/pkg ${D}${libdir}/go/<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>install -d ${D}${libdir}/go/src<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>(cd =
${S}/src; for d in *; do \<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>[ ! -d $d ] || cp =
--preserve=3Dmode,timestamps -R ${S}/src/$d ${D}${libdir}/go/src/; \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>done)<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>find ${D}${libdir}/go/src -depth =
-type d -name testdata -exec rm -rf {} \;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-d ${D}${bindir} ${D}${libdir}/go/bin<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>for f in =
${B}/bin/*<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>do<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>base=3D`basename $f`<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>install -m755 $f =
${D}${libdir}/go/bin<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>make_wrapper $base =
${TARGET_PREFIX}$base<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>done<br class=3D"">+}<br =
class=3D"">diff --git a/recipes-containers/kubernetes/go-cross_1.12.bb =
b/recipes-containers/kubernetes/go-cross_1.12.bb<br class=3D"">new file =
mode 100644<br class=3D"">index 0000000..80b5a03<br class=3D"">--- =
/dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-cross_1.12.bb<br class=3D"">@@ -0,0 =
+1,2 @@<br class=3D"">+require go-cross.inc<br class=3D"">+require =
go-${PV}.inc<br class=3D"">diff --git =
a/recipes-containers/kubernetes/go-crosssdk.inc =
b/recipes-containers/kubernetes/go-crosssdk.inc<br class=3D"">new file =
mode 100644<br class=3D"">index 0000000..94f6fb8<br class=3D"">--- =
/dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-crosssdk.inc<br class=3D"">@@ -0,0 =
+1,50 @@<br class=3D"">+inherit crosssdk<br class=3D"">+<br =
class=3D"">+DEPENDS =3D "go-native virtual/${TARGET_PREFIX}gcc-crosssdk =
virtual/nativesdk-${TARGET_PREFIX}compilerlibs =
virtual/${TARGET_PREFIX}binutils-crosssdk"<br class=3D"">+PN =3D =
"go-crosssdk-${SDK_SYS}"<br class=3D"">+PROVIDES =3D =
"virtual/${TARGET_PREFIX}go-crosssdk"<br class=3D"">+<br =
class=3D"">+export GOHOSTOS =3D "${BUILD_GOOS}"<br class=3D"">+export =
GOHOSTARCH =3D "${BUILD_GOARCH}"<br class=3D"">+export GOOS =3D =
"${TARGET_GOOS}"<br class=3D"">+export GOARCH =3D "${TARGET_GOARCH}"<br =
class=3D"">+export GOROOT_BOOTSTRAP =3D "${STAGING_LIBDIR_NATIVE}/go"<br =
class=3D"">+export GOROOT_FINAL =3D "${libdir}/go"<br class=3D"">+<br =
class=3D"">+do_configure[noexec] =3D "1"<br class=3D"">+<br =
class=3D"">+do_compile() {<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>export =
CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${TARGET_PREFIX}gcc =
${TARGET_CC_ARCH} --sysroot=3D${STAGING_DIR_TARGET}${SDKPATHNATIVE}"<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>export =
CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${TARGET_PREFIX}g++ =
${TARGET_CC_ARCH} --sysroot=3D${STAGING_DIR_TARGET}${SDKPATHNATIVE}"<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cd src<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>./make.bash --host-only =
--no-banner<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>cd ${B}<br class=3D"">+}<br =
class=3D"">+do_compile[dirs] =3D+ "${GOTMPDIR} ${B}/bin ${B}/pkg"<br =
class=3D"">+do_compile[cleandirs] +=3D "${GOTMPDIR} ${B}/bin =
${B}/pkg"<br class=3D"">+<br class=3D"">+make_wrapper() {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;rm -f ${D}${bindir}/$2<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;cat &lt;&lt;END &gt;${D}${bindir}/$2<br =
class=3D"">+#!/bin/bash<br class=3D"">+here=3D\`dirname \$0\`<br =
class=3D"">+export GOARCH=3D"${TARGET_GOARCH}"<br class=3D"">+export =
GOOS=3D"${TARGET_GOOS}"<br =
class=3D"">+\$here/../../lib/${CROSS_TARGET_SYS_DIR}/go/bin/$1 "\$@"<br =
class=3D"">+END<br class=3D"">+ &nbsp;&nbsp;&nbsp;chmod +x =
${D}${bindir}/$2<br class=3D"">+}<br class=3D"">+<br =
class=3D"">+do_install() {<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>install -d ${D}${libdir}/go<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>install -d ${D}${libdir}/go/bin<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-d ${D}${libdir}/go/pkg/tool<br class=3D"">+<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>install -d ${D}${bindir}<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cp --preserve=3Dmode,timestamps -R ${S}/pkg/tool/${BUILD_GOTUPLE} =
${D}${libdir}/go/pkg/tool/<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>for f in ${B}/bin/*<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>do<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>base=3D`basename $f`<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>install -m755 $f ${D}${libdir}/go/bin<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>make_wrapper $base ${TARGET_PREFIX}$base<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>done<br =
class=3D"">+}<br class=3D"">diff --git =
a/recipes-containers/kubernetes/go-crosssdk_1.12.bb =
b/recipes-containers/kubernetes/go-crosssdk_1.12.bb<br class=3D"">new =
file mode 100644<br class=3D"">index 0000000..1857c8a<br class=3D"">--- =
/dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-crosssdk_1.12.bb<br class=3D"">@@ =
-0,0 +1,2 @@<br class=3D"">+require go-crosssdk.inc<br class=3D"">+require=
 go-${PV}.inc<br class=3D"">diff --git =
a/recipes-containers/kubernetes/go-native.inc =
b/recipes-containers/kubernetes/go-native.inc<br class=3D"">new file =
mode 100644<br class=3D"">index 0000000..2077087<br class=3D"">--- =
/dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-native.inc<br class=3D"">@@ -0,0 =
+1,55 @@<br class=3D"">+inherit native<br class=3D"">+<br =
class=3D"">+SRC_URI_append =3D " <a =
href=3D"https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz;name=3Dbo=
otstrap;subdir=3Dgo1.4" =
class=3D"">https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz;name=3D=
bootstrap;subdir=3Dgo1.4</a>"<br class=3D"">+SRC_URI[bootstrap.md5sum] =3D=
 "dbf727a4b0e365bf88d97cbfde590016"<br =
class=3D"">+SRC_URI[bootstrap.sha256sum] =3D =
"f4ff5b5eb3a3cae1c993723f3eab519c5bae18866b5e5f96fe1102f0cb5c3e52"<br =
class=3D"">+<br class=3D"">+export GOOS =3D "${BUILD_GOOS}"<br =
class=3D"">+export GOARCH =3D "${BUILD_GOARCH}"<br class=3D"">+CC =3D =
"${@d.getVar('BUILD_CC').strip()}"<br class=3D"">+<br =
class=3D"">+GOMAKEARGS ?=3D "--no-banner"<br class=3D"">+<br =
class=3D"">+do_configure() {<br class=3D"">+<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>cd ${WORKDIR}/go1.4/go/src<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>CGO_ENABLED=3D0 GOROOT=3D${WORKDIR}/go1.4/go ./make.bash<br =
class=3D"">+}<br class=3D"">+<br class=3D"">+do_compile() {<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>export GOROOT_FINAL=3D"${libdir_native}/go"<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>export =
GOROOT_BOOTSTRAP=3D"${WORKDIR}/go1.4/go"<br class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cd src<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>./make.bash ${GOMAKEARGS}<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cd ${B}<br class=3D"">+}<br class=3D"">+do_compile[dirs] =3D+ =
"${GOTMPDIR} ${B}/bin"<br class=3D"">+do_compile[cleandirs] +=3D =
"${GOTMPDIR} ${B}/bin"<br class=3D"">+<br class=3D"">+make_wrapper() =
{<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">=
	</span>rm -f ${D}${bindir}/$2$3<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cat =
&lt;&lt;END &gt;${D}${bindir}/$2$3<br class=3D"">+#!/bin/bash<br =
class=3D"">+here=3D\`dirname \$0\`<br class=3D"">+export =
GOROOT=3D"${GOROOT:-\`readlink -f \$here/../lib/go\`}"<br =
class=3D"">+\$here/../lib/go/bin/$1 "\$@"<br class=3D"">+END<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>chmod +x ${D}${bindir}/$2<br class=3D"">+}<br class=3D"">+<br =
class=3D"">+do_install() {<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>install -d ${D}${libdir}/go<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cp --preserve=3Dmode,timestamps -R ${B}/pkg ${D}${libdir}/go/<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>install -d ${D}${libdir}/go/src<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>(cd =
${S}/src; for d in *; do \<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>[ -d $d ] &amp;&amp; cp -a =
${S}/src/$d ${D}${libdir}/go/src/; \<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>done)<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm =
-rf {} \;<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>install -d ${D}${bindir} =
${D}${libdir}/go/bin<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>for f in ${B}/bin/*<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>do<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>base=3D`basename $f`<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>install -m755 $f ${D}${libdir}/go/bin<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>make_wrapper $base $base<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>done<br =
class=3D"">+}<br class=3D"">diff --git =
a/recipes-containers/kubernetes/go-native_1.12.bb =
b/recipes-containers/kubernetes/go-native_1.12.bb<br class=3D"">new file =
mode 100644<br class=3D"">index 0000000..bbf3c0d<br class=3D"">--- =
/dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-native_1.12.bb<br class=3D"">@@ -0,0 =
+1,2 @@<br class=3D"">+require ${PN}.inc<br class=3D"">+require =
go-${PV}.inc<br class=3D"">diff --git =
a/recipes-containers/kubernetes/go-runtime.inc =
b/recipes-containers/kubernetes/go-runtime.inc<br class=3D"">new file =
mode 100644<br class=3D"">index 0000000..9731e16<br class=3D"">--- =
/dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-runtime.inc<br class=3D"">@@ -0,0 =
+1,96 @@<br class=3D"">+DEPENDS =3D "virtual/${TUNE_PKGARCH}-go =
go-native"<br class=3D"">+DEPENDS_class-nativesdk =3D =
"virtual/${TARGET_PREFIX}go-crosssdk"<br class=3D"">+PROVIDES =3D =
"virtual/${TARGET_PREFIX}go-runtime"<br class=3D"">+<br class=3D"">+export=
 GOHOSTOS =3D "${BUILD_GOOS}"<br class=3D"">+export GOHOSTARCH =3D =
"${BUILD_GOARCH}"<br class=3D"">+export GOOS =3D "${TARGET_GOOS}"<br =
class=3D"">+export GOARCH =3D "${TARGET_GOARCH}"<br class=3D"">+export =
GOARM =3D "${TARGET_GOARM}"<br class=3D"">+export GO386 =3D =
"${TARGET_GO386}"<br class=3D"">+export GOMIPS =3D "${TARGET_GOMIPS}"<br =
class=3D"">+export GOROOT_BOOTSTRAP =3D "${STAGING_LIBDIR_NATIVE}/go"<br =
class=3D"">+export GOROOT_FINAL =3D "${libdir}/go"<br class=3D"">+export =
CGO_CFLAGS =3D "${CFLAGS}"<br class=3D"">+export CGO_CPPFLAGS =3D =
"${CPPFLAGS}"<br class=3D"">+export CGO_CXXFLAGS =3D "${CXXFLAGS}"<br =
class=3D"">+export CGO_LDFLAGS =3D "${LDFLAGS}"<br class=3D"">+export =
GOCACHE =3D "${B}/.cache"<br class=3D"">+<br class=3D"">+GO_EXTLDFLAGS =
?=3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"<br =
class=3D"">+GO_SHLIB_LDFLAGS ?=3D '-ldflags=3D"--linkmode=3Dexternal =
-extldflags '${GO_EXTLDFLAGS}'"'<br class=3D"">+<br =
class=3D"">+do_configure() {<br class=3D"">+<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>:<br class=3D"">+}<br =
class=3D"">+<br class=3D"">+do_configure_libc-musl() {<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>rm -f ${S}/src/runtime/race/*.syso<br class=3D"">+}<br =
class=3D"">+<br class=3D"">+do_compile() {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>export =
CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${CC}"<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>export =
CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${CXX}"<br class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cd src<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>./make.bash --target-only =
--no-banner std<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if [ -n "${GO_DYNLINK}" ]; =
then<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>export =
GOTOOLDIR=3D"${B}/pkg/tool/native_native"<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>CC=3D"$CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}" =
GOARCH=3D"${TARGET_GOARCH}" GOOS=3D"${TARGET_GOOS}" GOROOT=3D${B} \<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>$GOTOOLDIR/go_bootstrap install -linkshared -buildmode=3Dshared =
${GO_SHLIB_LDFLAGS} std<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>fi<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cd =
${B}<br class=3D"">+}<br class=3D"">+do_compile[dirs] =3D+ "${GOTMPDIR} =
${B}/bin ${B}/pkg"<br class=3D"">+do_compile[cleandirs] +=3D =
"${GOTMPDIR} ${B}/bin ${B}/pkg"<br class=3D"">+<br =
class=3D"">+do_install() {<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>install -d =
${D}${libdir}/go/src<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>cp --preserve=3Dmode,timestamps =
-R ${B}/pkg ${D}${libdir}/go/<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if [ =
"${BUILD_GOTUPLE}" !=3D "${TARGET_GOTUPLE}" ]; then<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>rm -rf =
${D}${libdir}/go/pkg/${BUILD_GOTUPLE}<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>rm -rf =
${D}${libdir}/go/pkg/obj/${BUILD_GOTUPLE}<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>fi<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>rm -rf ${D}${libdir}/go/pkg/tool<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>rm -rf =
${D}${libdir}/go/pkg/obj<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>rm -rf =
${D}${libdir}/go/pkg/bootstrap<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>find src =
-mindepth 1 -maxdepth 1 -type d | while read srcdir; do<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cp --preserve=3Dmode,timestamps -R $srcdir =
${D}${libdir}/go/src/<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>done<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>find =
${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>rm -f ${D}${libdir}/go/src/cmd/dist/dist<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rm -f =
${D}${libdir}/go/src/cmd/cgo/zdefaultcc.go<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rm -f =
${D}${libdir}/go/src/cmd/go/internal/cfg/zdefaultcc.go<br class=3D"">+<br =
class=3D"">+}<br class=3D"">+<br class=3D"">+ALLOW_EMPTY_${PN} =3D =
"1"<br class=3D"">+FILES_${PN} =3D =
"${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*${SOLIBSDEV}"<br =
class=3D"">+FILES_${PN}-dev =3D "${libdir}/go/src =
${libdir}/go/pkg/include \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${libdir}/go/pkg/${TARGET_GOTUPLE}_dynli=
nk/*.shlibname \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${libdir}/go/pkg/${TARGET_GOTUPLE}_dynli=
nk/*/*.shlibname \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${libdir}/go/pkg/${TARGET_GOTUPLE}_dynli=
nk/*/*/*.shlibname \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${libdir}/go/pkg/${TARGET_GOTUPLE}_dynli=
nk/*/*/*/*.shlibname \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${libdir}/go/pkg/${TARGET_GOTUPLE}_dynli=
nk/*/*/*/*/*.shlibname \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${libdir}/go/pkg/${TARGET_GOTUPLE}_dynli=
nk/*/*/*/*/*/*.shlibname \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${libdir}/go/pkg/${TARGET_GOTUPLE}_dynli=
nk/*/*/*/*/*/*/*.shlibname \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${libdir}/go/pkg/${TARGET_GOTUPLE}_dynli=
nk/*.a \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${libdir}/go/pkg/${TARGET_GOTUPLE}_dynli=
nk/*/*.a \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${libdir}/go/pkg/${TARGET_GOTUPLE}_dynli=
nk/*/*/*.a \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${libdir}/go/pkg/${TARGET_GOTUPLE}_dynli=
nk/*/*/*/*.a \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${libdir}/go/pkg/${TARGET_GOTUPLE}_dynli=
nk/*/*/*/*/*.a \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${libdir}/go/pkg/${TARGET_GOTUPLE}_dynli=
nk/*/*/*/*/*/*.a \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${libdir}/go/pkg/${TARGET_GOTUPLE}_dynli=
nk/*/*/*/*/*/*/*.a \<br class=3D"">+"<br class=3D"">+FILES_${PN}-staticdev=
 =3D "${libdir}/go/pkg/${TARGET_GOTUPLE}"<br class=3D"">+<br class=3D"">+#=
 Go sources include some scripts and pre-built binaries for<br =
class=3D"">+# multiple architectures. &nbsp;The static .a files for =
dynamically-linked<br class=3D"">+# runtime are also required in =
-dev.<br class=3D"">+INSANE_SKIP_${PN}-dev =3D "staticdev file-rdeps =
arch"<br class=3D"">+<br class=3D"">+INHIBIT_PACKAGE_STRIP =3D "1"<br =
class=3D"">+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"<br =
class=3D"">+INHIBIT_SYSROOT_STRIP =3D "1"<br class=3D"">+<br =
class=3D"">+BBCLASSEXTEND =3D "nativesdk"<br class=3D"">diff --git =
a/recipes-containers/kubernetes/go-runtime_1.12.bb =
b/recipes-containers/kubernetes/go-runtime_1.12.bb<br class=3D"">new =
file mode 100644<br class=3D"">index 0000000..43b68b4<br class=3D"">--- =
/dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-runtime_1.12.bb<br class=3D"">@@ -0,0 =
+1,2 @@<br class=3D"">+require go-${PV}.inc<br class=3D"">+require =
go-runtime.inc<br class=3D"">diff --git =
a/recipes-containers/kubernetes/go-target.inc =
b/recipes-containers/kubernetes/go-target.inc<br class=3D"">new file =
mode 100644<br class=3D"">index 0000000..91efd3e<br class=3D"">--- =
/dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go-target.inc<br class=3D"">@@ -0,0 =
+1,54 @@<br class=3D"">+DEPENDS =3D "virtual/${TUNE_PKGARCH}-go =
go-native"<br class=3D"">+DEPENDS_class-nativesdk =3D =
"virtual/${TARGET_PREFIX}go-crosssdk go-native"<br class=3D"">+<br =
class=3D"">+export GOHOSTOS =3D "${BUILD_GOOS}"<br class=3D"">+export =
GOHOSTARCH =3D "${BUILD_GOARCH}"<br class=3D"">+export GOOS =3D =
"${TARGET_GOOS}"<br class=3D"">+export GOARCH =3D "${TARGET_GOARCH}"<br =
class=3D"">+export GOARM =3D "${TARGET_GOARM}"<br class=3D"">+export =
GO386 =3D "${TARGET_GO386}"<br class=3D"">+export GOMIPS =3D =
"${TARGET_GOMIPS}"<br class=3D"">+export GOROOT_BOOTSTRAP =3D =
"${STAGING_LIBDIR_NATIVE}/go"<br class=3D"">+export GOROOT_FINAL =3D =
"${libdir}/go"<br class=3D"">+export GOCACHE =3D "${B}/.cache"<br =
class=3D"">+GO_LDFLAGS =3D ""<br class=3D"">+GO_LDFLAGS_class-nativesdk =
=3D "-linkmode external"<br class=3D"">+export GO_LDFLAGS<br =
class=3D"">+<br class=3D"">+CC_append_class-nativesdk =3D " =
${SECURITY_NOPIE_CFLAGS}"<br class=3D"">+<br =
class=3D"">+do_configure[noexec] =3D "1"<br class=3D"">+<br =
class=3D"">+do_compile() {<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>export =
CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${CC}"<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>export =
CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}=3D"${CXX}"<br class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>cd src<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>./make.bash --target-only =
--no-banner<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>cd ${B}<br class=3D"">+}<br =
class=3D"">+do_compile[dirs] =3D+ "${GOTMPDIR} ${B}/bin ${B}/pkg"<br =
class=3D"">+do_compile[cleandirs] +=3D "${GOTMPDIR} ${B}/bin =
${B}/pkg"<br class=3D"">+<br class=3D"">+do_install() {<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>install -d ${D}${libdir}/go/pkg/tool<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cp =
--preserve=3Dmode,timestamps -R ${B}/pkg/tool/${TARGET_GOTUPLE} =
${D}${libdir}/go/pkg/tool/<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>install -d =
${D}${libdir}/go/src<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>cp --preserve=3Dmode,timestamps =
-R ${S}/src/cmd ${D}${libdir}/go/src/<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>find =
${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>install -d ${D}${libdir}/go/bin<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>install =
-d ${D}${bindir}<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>for f in =
${B}/${GO_BUILD_BINDIR}/*; do<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>name=3D`basename $f`<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>install -m 0755 $f =
${D}${libdir}/go/bin/<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>ln -sf ../${baselib}/go/bin/$name =
${D}${bindir}/<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>done<br class=3D"">+}<br =
class=3D"">+<br class=3D"">+PACKAGES =3D "${PN} ${PN}-dev"<br =
class=3D"">+FILES_${PN} =3D "${libdir}/go/bin =
${libdir}/go/pkg/tool/${TARGET_GOTUPLE} ${bindir}"<br =
class=3D"">+FILES_${PN}-dev =3D "${libdir}/go"<br =
class=3D"">+RDEPENDS_${PN}-dev =3D "perl bash"<br =
class=3D"">+INSANE_SKIP_${PN} =3D "ldflags"<br class=3D"">+<br =
class=3D"">+BBCLASSEXTEND =3D "nativesdk"<br class=3D"">diff --git =
a/recipes-containers/kubernetes/go_1.12.bb =
b/recipes-containers/kubernetes/go_1.12.bb<br class=3D"">new file mode =
100644<br class=3D"">index 0000000..42cdb04<br class=3D"">--- =
/dev/null<br class=3D"">+++ =
b/recipes-containers/kubernetes/go_1.12.bb<br class=3D"">@@ -0,0 +1,14 =
@@<br class=3D"">+require go-${PV}.inc<br class=3D"">+require =
go-target.inc<br class=3D"">+<br class=3D"">+export GOBUILDMODE=3D""<br =
class=3D"">+<br class=3D"">+# Add pie to GOBUILDMODE to satisfy =
"textrel" QA checking, but mips<br class=3D"">+# doesn't support =
-buildmode=3Dpie, so skip the QA checking for mips and its<br =
class=3D"">+# variants.<br class=3D"">+python() {<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;if 'mips' in d.getVar('TARGET_ARCH'):<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.appendVar('INSANE_SKIP_%s' % =
d.getVar('PN'), " textrel")<br class=3D"">+ &nbsp;&nbsp;&nbsp;else:<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.setVar('GOBUILDMODE', =
'pie')<br class=3D"">+}<br class=3D"">-- <br class=3D"">2.17.1<br =
class=3D""><br class=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br=
 class=3D"">Links: You receive all messages sent to this group.<br =
class=3D""><br class=3D"">View/Reply Online (#4845): <a =
href=3D"https://lists.yoctoproject.org/g/meta-virtualization/message/4845"=
 =
class=3D"">https://lists.yoctoproject.org/g/meta-virtualization/message/48=
45</a><br class=3D"">Mute This Topic: <a =
href=3D"https://lists.yoctoproject.org/mt/67789939/900811" =
class=3D"">https://lists.yoctoproject.org/mt/67789939/900811</a><br =
class=3D"">Group Owner: <a =
href=3D"mailto:meta-virtualization+owner@lists.yoctoproject.org" =
class=3D"">meta-virtualization+owner@lists.yoctoproject.org</a><br =
class=3D"">Unsubscribe: <a =
href=3D"https://lists.yoctoproject.org/g/meta-virtualization/unsub" =
class=3D"">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> =
&nbsp;[<a href=3D"mailto:timothy.t.orling@linux.intel.com" =
class=3D"">timothy.t.orling@linux.intel.com</a>]<br =
class=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br =
class=3D""></div></div></blockquote></div><br =
class=3D""></div></div></body></html>=

--Apple-Mail=_6725D0BD-0850-400C-ACF4-1BA063E7A2F7--
