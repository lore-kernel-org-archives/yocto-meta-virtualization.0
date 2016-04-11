Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AED49E0083D; Mon, 11 Apr 2016 05:34:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.214.180 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DC81E0083D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Apr 2016 05:34:30 -0700 (PDT)
Received: by mail-ob0-f180.google.com with SMTP id j9so109123719obd.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Apr 2016 05:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=D6YTzh+hmHIy7qo5Cx/+aZg00dshSTx/6AZTCauzrSE=;
	b=swSGFz70ltrZhADGvPZTOfZ8qqKdtmnw5oKPObuTHr2nMNaUQfsd9iVG8Nvumgyxyt
	Lpklxgk5yom0DBWBl+ByBv+CpyAYAHvwLSaX+mSG6cugC6oVbcNKiBV5hQwgyv+JcJvQ
	pmw3J6HwaJj9sUVDv/YUwOqG+lVgNt1/OyRnOxmSQC2prSVuU2G83Cx5DiHsuGpfkGaX
	TKQzLybQYkuXsgFkvdvvklcDMubOBliojz1bQkLtD43H8VGA5iusDkRlvGS1o2pzxwez
	Fut4WB2ZKxOZnSXbZggj5igznCXp8jDKmeB1cdao2bOL/kxxFnyIxI40OFHu5fJlfj6P
	J7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=D6YTzh+hmHIy7qo5Cx/+aZg00dshSTx/6AZTCauzrSE=;
	b=BbfZnPzBNzzzFXtkjTO53jc+XzAbWt/gp3bCc3wxy7IcT+X96O+V4OgFoHq7zVzOl+
	PVksxfC9RUjEGaVsUF1VuamiwJfVnlbw/2Q6CXwXZqMvGVLrakslqOAjBkTBRdFs4aS0
	ofYtaQncLKhFVYN9Vx09SKyh2wv5BjPiwWM0BtTH9gO5B3ZNjKArPB22q2daVOk/jQxR
	aGSgE928Af2RbNyndlRceJm8kTEKNXQQ8A/+q5QnTxuuO5CWhj9Of6rpMaYwinEvyK7b
	ulKTf851VgBbNukj6goxGJVMIn8Eumsh9ZAPljKF8nodjDDagzxSGwWmYNo1liMtx3i1
	iPZQ==
X-Gm-Message-State: AD7BkJIc50nm+glczasKsEriWlcURQnqclXPpIBHCRtivVtXhcwgGolstFEvSoANvIpqtr7p69j7sEMDctyIqg==
MIME-Version: 1.0
X-Received: by 10.60.96.74 with SMTP id dq10mr9711256oeb.48.1460378070135;
	Mon, 11 Apr 2016 05:34:30 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Mon, 11 Apr 2016 05:34:30 -0700 (PDT)
In-Reply-To: <1459850068-22873-1-git-send-email-zongchun.yu@nxp.com>
References: <1459850068-22873-1-git-send-email-zongchun.yu@nxp.com>
Date: Mon, 11 Apr 2016 08:34:30 -0400
Message-ID: <CADkTA4PqZ=QAuJs8-uO_CDX9mh=n-+U05NHTFjYu4i_HPx8thw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: zongchun.yu@nxp.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] go-cross: uprev to 1.5.2
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Apr 2016 12:34:35 -0000
Content-Type: multipart/alternative; boundary=089e01177a6d1bb989053034c479

--089e01177a6d1bb989053034c479
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 5, 2016 at 5:54 AM, <zongchun.yu@nxp.com> wrote:

> From: Zongchun Yu <zongchun.yu@nxp.com>
>
> * Add go-native as build bootstrap for go-cross.
> * Upgrade go-cross to v1.5.2
>

In the past, we've been cherry picking this from oe-meta-go, so we can
tweak things easily
for our needs. Is this change from scratch ? Or from there as well ?

This looks fine to me in general, but I'd like to couple it to the docker
update, so I'll pend
this on v2 of the docker update ... when I can build and test both myself
as well.

Bruce


>
> Signed-off-by: Zongchun Yu <zongchun.yu@nxp.com>
> ---
>  classes/go-osarchmap.bbclass                       |  38 ++++++
>  ...alignment-for-the-.rel.plt-section-on-32-.patch |  30 -----
>  .../go-cross/files/bsd_svid_source.patch           |  37 ------
>  recipes-devtools/go-cross/files/ccache.patch       | 147
> ---------------------
>  recipes-devtools/go-cross/go-1.4.inc               |  14 ++
>  .../go-cross/go-1.4/016-armhf-elf-header.patch     |  21 +++
>  recipes-devtools/go-cross/go-1.4/syslog.patch      |  57 ++++++++
>  recipes-devtools/go-cross/go-1.5.inc               |  19 +++
>  .../go-cross/go-1.5/armhf-elf-header.patch         |  19 +++
>  .../go-cross/go-1.5/fix-cc-handling.patch          |  46 +++++++
>  .../go-cross/go-1.5/fix-target-cc-for-build.patch  |  13 ++
>  recipes-devtools/go-cross/go-1.5/gotooldir.patch   |  26 ++++
>  .../go-1.5/split-host-and-target-build.patch       |  58 ++++++++
>  recipes-devtools/go-cross/go-1.5/syslog.patch      |  57 ++++++++
>  recipes-devtools/go-cross/go-common.inc            |  20 +++
>  recipes-devtools/go-cross/go-cross-1.3_1.3.bb      |  72 ----------
>  recipes-devtools/go-cross/go-cross.inc             |  45 +++++++
>  recipes-devtools/go-cross/go-cross_1.5.bb          |   2 +
>  recipes-devtools/go-cross/go-native.inc            |  50 +++++++
>  recipes-devtools/go-cross/go-native_1.4.bb         |   2 +
>  20 files changed, 487 insertions(+), 286 deletions(-)
>  create mode 100644 classes/go-osarchmap.bbclass
>  delete mode 100644
> recipes-devtools/go-cross/files/0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch
>  delete mode 100644 recipes-devtools/go-cross/files/bsd_svid_source.patch
>  delete mode 100644 recipes-devtools/go-cross/files/ccache.patch
>  create mode 100644 recipes-devtools/go-cross/go-1.4.inc
>  create mode 100644
> recipes-devtools/go-cross/go-1.4/016-armhf-elf-header.patch
>  create mode 100644 recipes-devtools/go-cross/go-1.4/syslog.patch
>  create mode 100644 recipes-devtools/go-cross/go-1.5.inc
>  create mode 100644 recipes-devtools/go-cross/go-1.5/armhf-elf-header.patch
>  create mode 100644 recipes-devtools/go-cross/go-1.5/fix-cc-handling.patch
>  create mode 100644
> recipes-devtools/go-cross/go-1.5/fix-target-cc-for-build.patch
>  create mode 100644 recipes-devtools/go-cross/go-1.5/gotooldir.patch
>  create mode 100644
> recipes-devtools/go-cross/go-1.5/split-host-and-target-build.patch
>  create mode 100644 recipes-devtools/go-cross/go-1.5/syslog.patch
>  create mode 100644 recipes-devtools/go-cross/go-common.inc
>  delete mode 100644 recipes-devtools/go-cross/go-cross-1.3_1.3.bb
>  create mode 100644 recipes-devtools/go-cross/go-cross.inc
>  create mode 100644 recipes-devtools/go-cross/go-cross_1.5.bb
>  create mode 100644 recipes-devtools/go-cross/go-native.inc
>  create mode 100644 recipes-devtools/go-cross/go-native_1.4.bb
>
> diff --git a/classes/go-osarchmap.bbclass b/classes/go-osarchmap.bbclass
> new file mode 100644
> index 0000000..4e00c7b
> --- /dev/null
> +++ b/classes/go-osarchmap.bbclass
> @@ -0,0 +1,38 @@
> +BUILD_GOOS = "${@go_map_os(d.getVar('BUILD_OS', True), d)}"
> +BUILD_GOARCH = "${@go_map_arch(d.getVar('BUILD_ARCH', True), d)}"
> +BUILD_GOTUPLE = "${BUILD_GOOS}_${BUILD_GOARCH}"
> +HOST_GOOS = "${@go_map_os(d.getVar('HOST_OS', True), d)}"
> +HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH', True), d)}"
> +HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH', True),
> d.getVar('TUNE_FEATURES', True), d)}"
> +HOST_GOTUPLE = "${HOST_GOOS}_${HOST_GOARCH}"
> +TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS', True), d)}"
> +TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH', True), d)}"
> +TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH', True),
> d.getVar('TUNE_FEATURES', True), d)}"
> +TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
> +GO_BUILD_BINDIR =
> "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE',True) ==
> d.getVar('HOST_GOTUPLE',True)]}"
> +
> +def go_map_arch(a, d):
> +    import re
> +    if re.match('i.86', a):
> +        return '386'
> +    elif a == 'x86_64':
> +        return 'amd64'
> +    elif re.match('arm.*', a):
> +        return 'arm'
> +    elif re.match('aarch64.*', a):
> +        return 'arm64'
> +    elif re.match('p(pc|owerpc)(|64)', a):
> +        return 'powerpc'
> +    else:
> +        bb.error("cannot map '%s' to a Go architecture" % a)
> +
> +def go_map_arm(a, f, d):
> +    import re
> +    if re.match('arm.*', a) and re.match('arm.*7.*', f):
> +        return '7'
> +    return ''
> +
> +def go_map_os(o, d):
> +    if o.startswith('linux'):
> +        return 'linux'
> +    return o
> diff --git
> a/recipes-devtools/go-cross/files/0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch
> b/recipes-devtools/go-cross/files/0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch
> deleted file mode 100644
> index 4cfa9d1..0000000
> ---
> a/recipes-devtools/go-cross/files/0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 855145d5c03c4b4faf60736c38d7a299c682af4a Mon Sep 17 00:00:00 2001
> -From: Shenghou Ma <minux@golang.org>
> -Date: Sat, 7 Feb 2015 14:06:02 -0500
> -Subject: [PATCH] cmd/ld: set alignment for the .rel.plt section on 32-bit
> - architectures
> -
> -Fixes #9802.
> -
> -Change-Id: I22c52a37bdb23a14cc4615c9519431bb14ca81ca
> -Reviewed-on: https://go-review.googlesource.com/4170
> -Reviewed-by: Ian Lance Taylor <iant@golang.org>
> ----
> - src/cmd/ld/elf.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/cmd/ld/elf.c b/src/cmd/ld/elf.c
> -index 12ced98..97ed4bd 100644
> ---- a/src/cmd/ld/elf.c
> -+++ b/src/cmd/ld/elf.c
> -@@ -1363,6 +1363,7 @@ asmbelf(vlong symo)
> -                       sh->type = SHT_REL;
> -                       sh->flags = SHF_ALLOC;
> -                       sh->entsize = ELF32RELSIZE;
> -+                      sh->addralign = 4;
> -                       sh->link = elfshname(".dynsym")->shnum;
> -                       shsym(sh, linklookup(ctxt, ".rel.plt", 0));
> -
> ---
> -1.9.1
> -
> diff --git a/recipes-devtools/go-cross/files/bsd_svid_source.patch
> b/recipes-devtools/go-cross/files/bsd_svid_source.patch
> deleted file mode 100644
> index 21e1d4c..0000000
> --- a/recipes-devtools/go-cross/files/bsd_svid_source.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -golang-cross: do_compile fails cc1: all warnings being treated as errors
> -
> -glibc 2.20 deprecates _BSD_SOURCE and _SVID_SOURCE and emits an error
> -message.  From patch 16632:
> -       libc [PATCH] BZ #16632: Disable _SVID_SOURCE/_BSD_SOURCE warning
> -       if _DEFAULT_SOURCE is defined
> -
> -Since we also need to support glibc before 2.20, from the release notes
> -for glibc 2.20, the recommended fix is to define _DEFAULT_SOURCE
> -
> -(fixed upstream)
> -https://groups.google.com/forum/#!topic/golang-codereviews/S4TARFCxu2k
> -
> -Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ----
> - include/u.h |   10 ++++++++++
> - 1 file changed, 10 insertions(+)
> -
> ---- a/include/u.h
> -+++ b/include/u.h
> -@@ -38,6 +38,16 @@
> - #             define __MAKECONTEXT_V2_SOURCE 1
> - #     endif
> - #endif
> -+/**
> -+ * in glibc >= 2.20, _BSD_SOURCE and _SVID_SOURCE causes warning
> -+ * messages if _DEFAULT_SOURCE is not defined.
> -+ *
> -+ * From glibc 2.20 release notes, since this application needs
> _BSD_SOURCE
> -+ * and/or _SVID_SOURCE and we must support glibc < 2.19 and
> -+ * glibc >= 2.20, then define all 3 (_DEFAULT_SOURCE, _BSD_SOURCE,
> -+ * and _SVID_SOURCE) unconditionally
> -+ */
> -+#define _DEFAULT_SOURCE 1
> - #define _BSD_SOURCE 1
> - #define _NETBSD_SOURCE 1      /* NetBSD */
> - #define _SVID_SOURCE 1
> diff --git a/recipes-devtools/go-cross/files/ccache.patch
> b/recipes-devtools/go-cross/files/ccache.patch
> deleted file mode 100644
> index b7a64bf..0000000
> --- a/recipes-devtools/go-cross/files/ccache.patch
> +++ /dev/null
> @@ -1,147 +0,0 @@
> -golang doesn't work with ccache. In the current state, a lot of parsing
> -happens where it'll grab the first string in CC or LD and uses that for
> -its builds. When ccache is enabled, it results in trying to do builds
> -with just ccache.
> -
> -The brokeness is seen when building with apps that uses cgo, like docker.
> -To enable ccache to work, some string comparisons and changes to parsing
> -had to be made.
> -
> -Signed-off-by: Amy Fong <amy.fong@windriver.com>
> -
> -Index: go/src/cmd/cgo/gcc.go
> -===================================================================
> ---- go.orig/src/cmd/cgo/gcc.go 2014-06-18 17:26:26.000000000 -0700
> -+++ go/src/cmd/cgo/gcc.go      2015-06-18 13:19:08.908877160 -0700
> -@@ -712,6 +712,12 @@
> - func (p *Package) gccBaseCmd() []string {
> -       // Use $CC if set, since that's what the build uses.
> -       if ret := strings.Fields(os.Getenv("CC")); len(ret) > 0 {
> -+              if strings.Contains(ret[0], "ccache") {
> -+                      base_cc := ret[0] + " " + ret[1]
> -+                      os.Setenv("CCACHE_CC", ret[1])
> -+                      ret[1] = base_cc
> -+                      return ret[1:]
> -+              }
> -               return ret
> -       }
> -       // Try $GCC if set, since that's what we used to use.
> -Index: go/src/pkg/os/exec/lp_unix.go
> -===================================================================
> ---- go.orig/src/pkg/os/exec/lp_unix.go 2014-06-18 17:26:25.000000000 -0700
> -+++ go/src/pkg/os/exec/lp_unix.go      2015-06-18 13:19:29.464876331 -0700
> -@@ -35,8 +35,14 @@
> -       // (only bypass the path if file begins with / or ./ or ../)
> -       // but that would not match all the Unix shells.
> -
> --      if strings.Contains(file, "/") {
> --              err := findExecutable(file)
> -+      tmp := file
> -+      if strings.Contains(file, " ") {
> -+              exec_part := strings.Split(file, " ")[0]
> -+              tmp = exec_part
> -+      }
> -+
> -+      if strings.Contains(tmp, "/") {
> -+              err := findExecutable(tmp)
> -               if err == nil {
> -                       return file, nil
> -               }
> -@@ -51,7 +57,7 @@
> -                       // Unix shell semantics: path element "" means "."
> -                       dir = "."
> -               }
> --              path := dir + "/" + file
> -+              path := dir + "/" + tmp
> -               if err := findExecutable(path); err == nil {
> -                       return path, nil
> -               }
> -Index: go/src/cmd/go/build.go
> -===================================================================
> ---- go.orig/src/cmd/go/build.go        2014-06-18 17:26:26.000000000 -0700
> -+++ go/src/cmd/go/build.go     2015-06-18 13:20:08.724874749 -0700
> -@@ -2005,8 +2005,15 @@
> -       // strings returned are "gcc", "-I", objdir (and cuts them off).
> -
> -       compiler := envList(envvar, defcmd)
> --      a := []string{compiler[0], "-I", objdir}
> --      a = append(a, compiler[1:]...)
> -+
> -+      a := []string{compiler[0]}
> -+      if strings.Contains(compiler[0], "ccache") {
> -+              a = append(a, compiler[1], "-I", objdir)
> -+              a = append(a, compiler[2:]...)
> -+      } else {
> -+              a = append(a, "-I", objdir)
> -+              a = append(a, compiler[1:]...)
> -+      }
> -
> -       // Definitely want -fPIC but on Windows gcc complains
> -       // "-fPIC ignored for target (all code is position independent)"
> -Index: go/src/cmd/ld/lib.c
> -===================================================================
> ---- go.orig/src/cmd/ld/lib.c   2014-06-18 17:26:27.000000000 -0700
> -+++ go/src/cmd/ld/lib.c        2015-06-18 13:18:39.564878343 -0700
> -@@ -552,7 +552,7 @@
> - void
> - hostlink(void)
> - {
> --      char *p, **argv;
> -+      char *p, *q, **argv;
> -       int c, i, w, n, argc, len;
> -       Hostobj *h;
> -       Biobuf *f;
> -@@ -577,6 +577,19 @@
> -       if(extld == nil)
> -               extld = "gcc";
> -       argv[argc++] = extld;
> -+
> -+      p = extldflags;
> -+      if (strstr(argv[0], "ccache") != NULL) {
> -+              while(p != nil) {
> -+                      while(*p == ' ')
> -+                              *p++ = '\0';
> -+                      if(*p == '\0')
> -+                              break;
> -+                      argv[argc++] = p;
> -+                      p = strchr(p + 1, ' ');
> -+                      break;
> -+              }
> -+      }
> -       switch(thechar){
> -       case '8':
> -               argv[argc++] = "-m32";
> -@@ -629,12 +642,12 @@
> -                       errorexit();
> -               }
> -               Bseek(f, h->off, 0);
> --              p = smprint("%s/%06d.o", tmpdir, i);
> --              argv[argc++] = p;
> --              w = create(p, 1, 0775);
> -+              q = smprint("%s/%06d.o", tmpdir, i);
> -+              argv[argc++] = q;
> -+              w = create(q, 1, 0775);
> -               if(w < 0) {
> -                       ctxt->cursym = S;
> --                      diag("cannot create %s: %r", p);
> -+                      diag("cannot create %s: %r", q);
> -                       errorexit();
> -               }
> -               len = h->len;
> -@@ -646,7 +659,7 @@
> -               }
> -               if(close(w) < 0) {
> -                       ctxt->cursym = S;
> --                      diag("cannot write %s: %r", p);
> -+                      diag("cannot write %s: %r", q);
> -                       errorexit();
> -               }
> -               Bterm(f);
> -@@ -656,7 +669,6 @@
> -       for(i=0; i<nldflag; i++)
> -               argv[argc++] = ldflag[i];
> -
> --      p = extldflags;
> -       while(p != nil) {
> -               while(*p == ' ')
> -                       *p++ = '\0';
> diff --git a/recipes-devtools/go-cross/go-1.4.inc
> b/recipes-devtools/go-cross/go-1.4.inc
> new file mode 100644
> index 0000000..0ffbcd0
> --- /dev/null
> +++ b/recipes-devtools/go-cross/go-1.4.inc
> @@ -0,0 +1,14 @@
> +require go-common.inc
> +
> +PV = "1.4.2"
> +GO_BASEVERSION = "1.4"
> +FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> +
> +SRC_URI += "\
> +        file://016-armhf-elf-header.patch \
> +        file://syslog.patch \
> +"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=591778525c869cdde0ab5a1bf283cd81"
> +SRC_URI[md5sum] = "907f85c8fa765d31f7f955836fec4049"
> +SRC_URI[sha256sum] =
> "299a6fd8f8adfdce15bc06bde926e7b252ae8e24dd5b16b7d8791ed79e7b5e9b"
> diff --git a/recipes-devtools/go-cross/go-1.4/016-armhf-elf-header.patch
> b/recipes-devtools/go-cross/go-1.4/016-armhf-elf-header.patch
> new file mode 100644
> index 0000000..1ae53a3
> --- /dev/null
> +++ b/recipes-devtools/go-cross/go-1.4/016-armhf-elf-header.patch
> @@ -0,0 +1,21 @@
> +Description: Use correct ELF header for armhf binaries.
> +Author: Adam Conrad <adconrad@ubuntu.com>
> +Last-Update: 2013-07-08
> +
> +Index: go/src/cmd/ld/elf.c
> +===================================================================
> +--- go.orig/src/cmd/ld/elf.c   2015-02-20 10:49:58.763451586 -0800
> ++++ go/src/cmd/ld/elf.c        2015-02-20 10:49:27.895478521 -0800
> +@@ -57,7 +57,11 @@
> +       case '5':
> +               // we use EABI on both linux/arm and freebsd/arm.
> +               if(HEADTYPE == Hlinux || HEADTYPE == Hfreebsd)
> +-                      hdr.flags = 0x5000002; // has entry point,
> Version5 EABI
> ++#ifdef __ARM_PCS_VFP
> ++                      hdr.flags = 0x5000402; // has entry point,
> Version5 EABI, hard-float ABI
> ++#else
> ++                      hdr.flags = 0x5000202; // has entry point,
> Version5 EABI, soft-float ABI
> ++#endif
> +               // fallthrough
> +       default:
> +               hdr.phoff = ELF32HDRSIZE;       /* Must be be
> ELF32HDRSIZE: first PHdr must follow ELF header */
> diff --git a/recipes-devtools/go-cross/go-1.4/syslog.patch
> b/recipes-devtools/go-cross/go-1.4/syslog.patch
> new file mode 100644
> index 0000000..ce82a4f
> --- /dev/null
> +++ b/recipes-devtools/go-cross/go-1.4/syslog.patch
> @@ -0,0 +1,57 @@
> +diff -r -u go/src/log/syslog/syslog.go
> /home/achang/GOCOPY/go/src/log/syslog/syslog.go
> +--- go/src/log/syslog/syslog.go        2013-11-28 13:38:28.000000000 -0800
> ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog.go    2014-10-03
> 11:44:37.710403200 -0700
> +@@ -33,6 +33,9 @@
> + const severityMask = 0x07
> + const facilityMask = 0xf8
> +
> ++var writeTimeout = 1 * time.Second
> ++var connectTimeout = 1 * time.Second
> ++
> + const (
> +       // Severity.
> +
> +@@ -100,6 +103,7 @@
> + type serverConn interface {
> +       writeString(p Priority, hostname, tag, s, nl string) error
> +       close() error
> ++      setWriteDeadline(t time.Time) error
> + }
> +
> + type netConn struct {
> +@@ -273,7 +277,11 @@
> +               nl = "\n"
> +       }
> +
> +-      err := w.conn.writeString(p, w.hostname, w.tag, msg, nl)
> ++      err := w.conn.setWriteDeadline(time.Now().Add(writeTimeout))
> ++      if err != nil {
> ++              return 0, err
> ++      }
> ++      err = w.conn.writeString(p, w.hostname, w.tag, msg, nl)
> +       if err != nil {
> +               return 0, err
> +       }
> +@@ -305,6 +313,10 @@
> +       return n.conn.Close()
> + }
> +
> ++func (n *netConn) setWriteDeadline(t time.Time) error {
> ++      return n.conn.SetWriteDeadline(t)
> ++}
> ++
> + // NewLogger creates a log.Logger whose output is written to
> + // the system log service with the specified priority. The logFlag
> + // argument is the flag set passed through to log.New to create
> +diff -r -u go/src/log/syslog/syslog_unix.go
> /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go
> +--- go/src/log/syslog/syslog_unix.go   2013-11-28 13:38:28.000000000 -0800
> ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go       2014-10-03
> 11:44:39.010403175 -0700
> +@@ -19,7 +19,7 @@
> +       logPaths := []string{"/dev/log", "/var/run/syslog"}
> +       for _, network := range logTypes {
> +               for _, path := range logPaths {
> +-                      conn, err := net.Dial(network, path)
> ++                      conn, err := net.DialTimeout(network, path,
> connectTimeout)
> +                       if err != nil {
> +                               continue
> +                       } else {
> diff --git a/recipes-devtools/go-cross/go-1.5.inc
> b/recipes-devtools/go-cross/go-1.5.inc
> new file mode 100644
> index 0000000..bb91ed8
> --- /dev/null
> +++ b/recipes-devtools/go-cross/go-1.5.inc
> @@ -0,0 +1,19 @@
> +require go-common.inc
> +
> +PV = "1.5.2"
> +GO_BASEVERSION = "1.5"
> +FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> +
> +
> +SRC_URI += "\
> +       file://armhf-elf-header.patch \
> +       file://syslog.patch \
> +       file://fix-target-cc-for-build.patch \
> +       file://fix-cc-handling.patch \
> +       file://split-host-and-target-build.patch \
> +       file://gotooldir.patch \
> +"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=591778525c869cdde0ab5a1bf283cd81"
> +SRC_URI[md5sum] = "38fed22e7b80672291e7cba7fb9c3475"
> +SRC_URI[sha256sum] =
> "f3ddd624c00461641ce3d3a8d8e3c622392384ca7699e901b370a4eac5987a74"
> diff --git a/recipes-devtools/go-cross/go-1.5/armhf-elf-header.patch
> b/recipes-devtools/go-cross/go-1.5/armhf-elf-header.patch
> new file mode 100644
> index 0000000..f56869b
> --- /dev/null
> +++ b/recipes-devtools/go-cross/go-1.5/armhf-elf-header.patch
> @@ -0,0 +1,19 @@
> +Index: go/src/cmd/link/internal/ld/elf.go
> +===================================================================
> +--- go.orig/src/cmd/link/internal/ld/elf.go    2015-07-29
> 13:05:25.952533140 -0700
> ++++ go/src/cmd/link/internal/ld/elf.go 2015-07-29 13:14:53.413112995 -0700
> +@@ -780,7 +780,13 @@
> +       // 32-bit architectures
> +       case '5':
> +               // we use EABI on both linux/arm and freebsd/arm.
> +-              if HEADTYPE == obj.Hlinux || HEADTYPE == obj.Hfreebsd {
> ++              if HEADTYPE == obj.Hlinux {
> ++                      if Ctxt.Goarm == 7 {
> ++                              ehdr.flags = 0x5000402 // has entry point,
> Version5 EABI, hard float
> ++                      } else {
> ++                              ehdr.flags = 0x5000202 // has entry point,
> Version5 EABI, soft float
> ++                      }
> ++              } else if HEADTYPE == obj.Hfreebsd {
> +                       ehdr.flags = 0x5000002 // has entry point,
> Version5 EABI
> +               }
> +               fallthrough
> diff --git a/recipes-devtools/go-cross/go-1.5/fix-cc-handling.patch
> b/recipes-devtools/go-cross/go-1.5/fix-cc-handling.patch
> new file mode 100644
> index 0000000..85770a9
> --- /dev/null
> +++ b/recipes-devtools/go-cross/go-1.5/fix-cc-handling.patch
> @@ -0,0 +1,46 @@
> +Index: go/src/cmd/go/build.go
> +===================================================================
> +--- go.orig/src/cmd/go/build.go        2015-07-29 14:48:40.323185807 -0700
> ++++ go/src/cmd/go/build.go     2015-07-30 07:37:40.529818586 -0700
> +@@ -2805,12 +2805,24 @@
> +       return b.ccompilerCmd("CC", defaultCC, objdir)
> + }
> +
> ++// gccCmd returns a gcc command line prefix
> ++// defaultCC is defined in zdefaultcc.go, written by cmd/dist.
> ++func (b *builder) gccCmdForReal() []string {
> ++      return envList("CC", defaultCC)
> ++}
> ++
> + // gxxCmd returns a g++ command line prefix
> + // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
> + func (b *builder) gxxCmd(objdir string) []string {
> +       return b.ccompilerCmd("CXX", defaultCXX, objdir)
> + }
> +
> ++// gxxCmd returns a g++ command line prefix
> ++// defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
> ++func (b *builder) gxxCmdForReal() []string {
> ++      return envList("CXX", defaultCXX)
> ++}
> ++
> + // ccompilerCmd returns a command line prefix for the given environment
> + // variable and using the default command when the variable is empty.
> + func (b *builder) ccompilerCmd(envvar, defcmd, objdir string) []string {
> +Index: go/src/cmd/go/env.go
> +===================================================================
> +--- go.orig/src/cmd/go/env.go  2015-07-29 14:48:40.323185807 -0700
> ++++ go/src/cmd/go/env.go       2015-07-30 07:40:54.461655721 -0700
> +@@ -52,10 +52,9 @@
> +
> +       if goos != "plan9" {
> +               cmd := b.gccCmd(".")
> +-              env = append(env, envVar{"CC", cmd[0]})
> ++              env = append(env, envVar{"CC",
> strings.Join(b.gccCmdForReal(), " ")})
> +               env = append(env, envVar{"GOGCCFLAGS",
> strings.Join(cmd[3:], " ")})
> +-              cmd = b.gxxCmd(".")
> +-              env = append(env, envVar{"CXX", cmd[0]})
> ++              env = append(env, envVar{"CXX",
> strings.Join(b.gxxCmdForReal(), " ")})
> +       }
> +
> +       if buildContext.CgoEnabled {
> diff --git
> a/recipes-devtools/go-cross/go-1.5/fix-target-cc-for-build.patch
> b/recipes-devtools/go-cross/go-1.5/fix-target-cc-for-build.patch
> new file mode 100644
> index 0000000..adfeb6b
> --- /dev/null
> +++ b/recipes-devtools/go-cross/go-1.5/fix-target-cc-for-build.patch
> @@ -0,0 +1,13 @@
> +Index: go/src/make.bash
> +===================================================================
> +--- go.orig/src/make.bash      2015-07-29 13:28:11.334031696 -0700
> ++++ go/src/make.bash   2015-07-29 13:36:55.814465630 -0700
> +@@ -158,7 +158,7 @@
> + fi
> +
> + echo "##### Building packages and commands for $GOOS/$GOARCH."
> +-CC=$CC_FOR_TARGET "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags
> "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
> ++CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags
> "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
> + echo
> +
> + rm -f "$GOTOOLDIR"/go_bootstrap
> diff --git a/recipes-devtools/go-cross/go-1.5/gotooldir.patch
> b/recipes-devtools/go-cross/go-1.5/gotooldir.patch
> new file mode 100644
> index 0000000..473a328
> --- /dev/null
> +++ b/recipes-devtools/go-cross/go-1.5/gotooldir.patch
> @@ -0,0 +1,26 @@
> +Index: go/src/go/build/build.go
> +===================================================================
> +--- go.orig/src/go/build/build.go
> ++++ go/src/go/build/build.go
> +@@ -1388,7 +1388,7 @@ func init() {
> + }
> +
> + // ToolDir is the directory containing build tools.
> +-var ToolDir = filepath.Join(runtime.GOROOT(),
> "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
> ++var ToolDir = envOr("GOTOOLDIR", filepath.Join(runtime.GOROOT(),
> "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH))
> +
> + // IsLocalImport reports whether the import path is
> + // a local import path, like ".", "..", "./foo", or "../foo".
> +Index: go/src/cmd/go/build.go
> +===================================================================
> +--- go.orig/src/cmd/go/build.go
> ++++ go/src/cmd/go/build.go
> +@@ -1312,7 +1312,7 @@ func (b *builder) build(a *action) (err
> +               }
> +
> +               cgoExe := tool("cgo")
> +-              if a.cgo != nil && a.cgo.target != "" {
> ++              if a.cgo != nil && a.cgo.target != "" &&
> os.Getenv("GOTOOLDIR") == "" {
> +                       cgoExe = a.cgo.target
> +               }
> +               outGo, outObj, err := b.cgo(a.p, cgoExe, obj, pcCFLAGS,
> pcLDFLAGS, cgofiles, gccfiles, cxxfiles, a.p.MFiles)
> diff --git
> a/recipes-devtools/go-cross/go-1.5/split-host-and-target-build.patch
> b/recipes-devtools/go-cross/go-1.5/split-host-and-target-build.patch
> new file mode 100644
> index 0000000..85fb240
> --- /dev/null
> +++ b/recipes-devtools/go-cross/go-1.5/split-host-and-target-build.patch
> @@ -0,0 +1,58 @@
> +Index: go/src/make.bash
> +===================================================================
> +--- go.orig/src/make.bash
> ++++ go/src/make.bash
> +@@ -143,12 +143,23 @@ if [ "$1" = "--no-clean" ]; then
> +       buildall=""
> +       shift
> + fi
> +-./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds
> go_bootstrap
> +-# Delay move of dist tool to now, because bootstrap may clear tool
> directory.
> +-mv cmd/dist/dist "$GOTOOLDIR"/dist
> +-echo
> +
> +-if [ "$GOHOSTARCH" != "$GOARCH" -o "$GOHOSTOS" != "$GOOS" ]; then
> ++do_host_build="yes"
> ++do_target_build="yes"
> ++if [ "$1" = "--target-only" ]; then
> ++      do_host_build="no"
> ++      shift
> ++elif [ "$1" = "--host-only" ]; then
> ++      do_target_build="no"
> ++      shift
> ++fi
> ++
> ++if [ "$do_host_build" = "yes" ]; then
> ++      ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds
> go_bootstrap
> ++      # Delay move of dist tool to now, because bootstrap may clear tool
> directory.
> ++      mv cmd/dist/dist "$GOTOOLDIR"/dist
> ++      echo
> ++
> +       echo "##### Building packages and commands for host,
> $GOHOSTOS/$GOHOSTARCH."
> +       # CC_FOR_TARGET is recorded as the default compiler for the go
> tool. When building for the host, however,
> +       # use the host compiler, CC, from `cmd/dist/dist env` instead.
> +@@ -157,11 +168,20 @@ if [ "$GOHOSTARCH" != "$GOARCH" -o "$GOH
> +       echo
> + fi
> +
> +-echo "##### Building packages and commands for $GOOS/$GOARCH."
> +-CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags
> "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
> +-echo
> ++if [ "$do_target_build" = "yes" ]; then
> ++    GO_INSTALL="${GO_TARGET_INSTALL:-std cmd}"
> ++    echo "##### Building packages and commands for $GOOS/$GOARCH."
> ++    if [ "$GOHOSTOS" = "$GOOS" -a "$GOHOSTARCH" = "$GOARCH" -a
> "$do_host_build" = "yes" ]; then
> ++      rm -rf ./host-tools
> ++      mkdir ./host-tools
> ++      mv "$GOTOOLDIR"/* ./host-tools
> ++      GOTOOLDIR="$PWD/host-tools"
> ++    fi
> ++    GOTOOLDIR="$GOTOOLDIR" CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap
> install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v
> ${GO_INSTALL}
> ++    echo
> +
> +-rm -f "$GOTOOLDIR"/go_bootstrap
> ++    rm -f "$GOTOOLDIR"/go_bootstrap
> ++fi
> +
> + if [ "$1" != "--no-banner" ]; then
> +       "$GOTOOLDIR"/dist banner
> diff --git a/recipes-devtools/go-cross/go-1.5/syslog.patch
> b/recipes-devtools/go-cross/go-1.5/syslog.patch
> new file mode 100644
> index 0000000..ce82a4f
> --- /dev/null
> +++ b/recipes-devtools/go-cross/go-1.5/syslog.patch
> @@ -0,0 +1,57 @@
> +diff -r -u go/src/log/syslog/syslog.go
> /home/achang/GOCOPY/go/src/log/syslog/syslog.go
> +--- go/src/log/syslog/syslog.go        2013-11-28 13:38:28.000000000 -0800
> ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog.go    2014-10-03
> 11:44:37.710403200 -0700
> +@@ -33,6 +33,9 @@
> + const severityMask = 0x07
> + const facilityMask = 0xf8
> +
> ++var writeTimeout = 1 * time.Second
> ++var connectTimeout = 1 * time.Second
> ++
> + const (
> +       // Severity.
> +
> +@@ -100,6 +103,7 @@
> + type serverConn interface {
> +       writeString(p Priority, hostname, tag, s, nl string) error
> +       close() error
> ++      setWriteDeadline(t time.Time) error
> + }
> +
> + type netConn struct {
> +@@ -273,7 +277,11 @@
> +               nl = "\n"
> +       }
> +
> +-      err := w.conn.writeString(p, w.hostname, w.tag, msg, nl)
> ++      err := w.conn.setWriteDeadline(time.Now().Add(writeTimeout))
> ++      if err != nil {
> ++              return 0, err
> ++      }
> ++      err = w.conn.writeString(p, w.hostname, w.tag, msg, nl)
> +       if err != nil {
> +               return 0, err
> +       }
> +@@ -305,6 +313,10 @@
> +       return n.conn.Close()
> + }
> +
> ++func (n *netConn) setWriteDeadline(t time.Time) error {
> ++      return n.conn.SetWriteDeadline(t)
> ++}
> ++
> + // NewLogger creates a log.Logger whose output is written to
> + // the system log service with the specified priority. The logFlag
> + // argument is the flag set passed through to log.New to create
> +diff -r -u go/src/log/syslog/syslog_unix.go
> /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go
> +--- go/src/log/syslog/syslog_unix.go   2013-11-28 13:38:28.000000000 -0800
> ++++ /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go       2014-10-03
> 11:44:39.010403175 -0700
> +@@ -19,7 +19,7 @@
> +       logPaths := []string{"/dev/log", "/var/run/syslog"}
> +       for _, network := range logTypes {
> +               for _, path := range logPaths {
> +-                      conn, err := net.Dial(network, path)
> ++                      conn, err := net.DialTimeout(network, path,
> connectTimeout)
> +                       if err != nil {
> +                               continue
> +                       } else {
> diff --git a/recipes-devtools/go-cross/go-common.inc
> b/recipes-devtools/go-cross/go-common.inc
> new file mode 100644
> index 0000000..f9587ea
> --- /dev/null
> +++ b/recipes-devtools/go-cross/go-common.inc
> @@ -0,0 +1,20 @@
> +SUMMARY = "Go programming language compiler"
> +DESCRIPTION = " The Go programming language is an open source project to
> make \
> + programmers more productive. Go is expressive, concise, clean, and\
> + efficient. Its concurrency mechanisms make it easy to write programs\
> + that get the most out of multicore and networked machines, while its\
> + novel type system enables flexible and modular program construction.\
> + Go compiles quickly to machine code yet has the convenience of\
> + garbage collection and the power of run-time reflection. It's a\
> + fast, statically typed, compiled language that feels like a\
> + dynamically typed, interpreted language."
> +HOMEPAGE = " http://golang.org/"
> +LICENSE = "BSD-3-Clause"
> +
> +inherit go-osarchmap
> +
> +SRC_URI = "http://golang.org/dl/go${PV}.src.tar.gz"
> +S = "${WORKDIR}/go"
> +B = "${S}"
> +
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> diff --git a/recipes-devtools/go-cross/go-cross-1.3_1.3.bb
> b/recipes-devtools/go-cross/go-cross-1.3_1.3.bb
> deleted file mode 100644
> index dd57e56..0000000
> --- a/recipes-devtools/go-cross/go-cross-1.3_1.3.bb
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -DESCRIPTION = "\
> -  Go is an open source programming language that makes it easy to build
> simple, \
> -  reliable, and efficient software. \
> -  "
> -HOMEPAGE = "https://golang.org/"
> -LICENSE = "BSD-3-Clause"
> -
> -DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc"
> -
> -SRC_URI = "http://golang.org/dl/go${PV}.src.tar.gz"
> -
> -S = "${WORKDIR}/go/"
> -
> -inherit cross
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=591778525c869cdde0ab5a1bf283cd81"
> -SRC_URI[md5sum] = "4b66d7249554181c314f139ea78920b1"
> -SRC_URI[sha256sum] =
> "eb983e6c5b2b9838f482c5442b1ac1856f610f2b21f3c123b3fedb48ffc35382"
> -
> -SRC_URI += "\
> -        file://bsd_svid_source.patch \
> -        file://ccache.patch \
> -
> file://0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch \
> -        "
> -
> -do_compile() {
> -       ## Setting `$GOBIN` doesn't do any good, looks like it ends up
> copying binaries there.
> -       export GOROOT_FINAL="${SYSROOT}${libdir}/go-1.3"
> -
> -       export GOHOSTOS="linux"
> -       export GOOS="linux"
> -
> -       export GOARCH="${TARGET_ARCH}"
> -       # golang only support 386, amd64 and arm architecture.
> -       if [ "${TARGET_ARCH}" = "x86_64" ]; then
> -               export GOARCH="amd64"
> -       elif [ "${TARGET_ARCH}" = "i586" ]; then
> -               export GOARCH="386"
> -       fi
> -       if [ "${TARGET_ARCH}" = "arm" ]
> -       then
> -               if [ `echo ${TUNE_PKGARCH} | cut -c 1-7` = "cortexa" ]
> -               then
> -                       echo GOARM 7
> -                       export GOARM="7"
> -               fi
> -       fi
> -
> -       export CGO_ENABLED="1"
> -       ## TODO: consider setting GO_EXTLINK_ENABLED
> -
> -       export CC="${BUILD_CC}"
> -       export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH}
> --sysroot=${STAGING_DIR_TARGET}"
> -       export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH}
> --sysroot=${STAGING_DIR_TARGET}"
> -       export GO_CCFLAGS="${HOST_CFLAGS}"
> -       export GO_LDFLAGS="${HOST_LDFLAGS}"
> -
> -       cd src && ./make.bash
> -}
> -
> -do_install() {
> -       ## It should be okay to ignore `${WORKDIR}/go/bin/linux_arm`...
> -       ## Also `gofmt` is not needed right now.
> -       install -d "${D}${bindir}/go-1.3"
> -       install -m 0755 "${WORKDIR}/go/bin/go" "${D}${bindir}/go-1.3/"
> -       install -d "${D}${libdir}/go-1.3"
> -
> -       ## TODO: use `install` instead of `cp`
> -       for dir in include lib pkg src test
> -       do cp -a "${WORKDIR}/go/${dir}" "${D}${libdir}/go-1.3/"
> -       done
> -}
> diff --git a/recipes-devtools/go-cross/go-cross.inc
> b/recipes-devtools/go-cross/go-cross.inc
> new file mode 100644
> index 0000000..eea1b2c
> --- /dev/null
> +++ b/recipes-devtools/go-cross/go-cross.inc
> @@ -0,0 +1,45 @@
> +inherit cross
> +
> +DEPENDS += "go-native"
> +
> +export GOHOSTOS = "${BUILD_GOOS}"
> +export GOHOSTARCH = "${BUILD_GOARCH}"
> +export GOOS = "${TARGET_GOOS}"
> +export GOARCH = "${TARGET_GOARCH}"
> +export GOARM = "${TARGET_GOARM}"
> +export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
> +export GOROOT_FINAL = "${libdir}/go"
> +export CGO_ENABLED = "1"
> +export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH}
> --sysroot=${STAGING_DIR_TARGET}"
> +export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH}
> --sysroot=${STAGING_DIR_TARGET}"
> +CC = "${@d.getVar('BUILD_CC', True).strip()}"
> +
> +do_configure[noexec] = "1"
> +
> +do_compile() {
> +    export GOBIN="${B}/bin"
> +    rm -rf ${GOBIN} ${B}/pkg
> +    mkdir ${GOBIN}
> +    cd src
> +    ./make.bash --host-only
> +}
> +
> +do_install() {
> +    install -d ${D}${libdir}/go
> +    cp -a ${B}/pkg ${D}${libdir}/go/
> +    install -d ${D}${libdir}/go/src
> +    (cd ${S}/src; for d in *; do \
> +        [ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
> +    done)
> +    install -d ${D}${bindir}
> +    for f in ${B}/bin/*
> +    do
> +        install -m755 $f ${D}${bindir}
> +    done
> +}
> +
> +do_package[noexec] = "1"
> +do_packagedata[noexec] = "1"
> +do_package_write_ipk[noexec] = "1"
> +do_package_write_deb[noexec] = "1"
> +do_package_write_rpm[noexec] = "1"
> diff --git a/recipes-devtools/go-cross/go-cross_1.5.bb
> b/recipes-devtools/go-cross/go-cross_1.5.bb
> new file mode 100644
> index 0000000..80b5a03
> --- /dev/null
> +++ b/recipes-devtools/go-cross/go-cross_1.5.bb
> @@ -0,0 +1,2 @@
> +require go-cross.inc
> +require go-${PV}.inc
> diff --git a/recipes-devtools/go-cross/go-native.inc
> b/recipes-devtools/go-cross/go-native.inc
> new file mode 100644
> index 0000000..ae3dc83
> --- /dev/null
> +++ b/recipes-devtools/go-cross/go-native.inc
> @@ -0,0 +1,50 @@
> +inherit native
> +
> +export GOOS = "${BUILD_GOOS}"
> +export GOARCH = "${BUILD_GOARCH}"
> +export GOROOT_FINAL = "${STAGING_LIBDIR_NATIVE}/go"
> +export CGO_ENABLED = "1"
> +
> +do_configure[noexec] = "1"
> +
> +do_compile() {
> +    export GOBIN="${B}/bin"
> +    rm -rf ${GOBIN}
> +    mkdir ${GOBIN}
> +    cd src
> +    ./make.bash --host-only
> +}
> +
> +
> +make_wrapper() {
> +    rm -f ${D}${bindir}/$2
> +    cat <<END >${D}${bindir}/$2
> +#!/bin/bash
> +here=\`dirname \$0\`
> +export GOROOT="${GOROOT:-\`readlink -f \$here/../lib/go\`}"
> +\$here/../lib/go/bin/$1 "\$@"
> +END
> +    chmod +x ${D}${bindir}/$2
> +}
> +
> +do_install() {
> +    install -d ${D}${libdir}/go
> +    cp -a ${B}/pkg ${D}${libdir}/go/
> +    install -d ${D}${libdir}/go/src
> +    (cd ${S}/src; for d in *; do \
> +        [ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
> +    done)
> +    install -d ${D}${bindir} ${D}${libdir}/go/bin
> +    for f in ${B}/bin/*
> +    do
> +        base=`basename $f`
> +        install -m755 $f ${D}${libdir}/go/bin
> +        make_wrapper $base $base
> +    done
> +}
> +
> +do_package[noexec] = "1"
> +do_packagedata[noexec] = "1"
> +do_package_write_ipk[noexec] = "1"
> +do_package_write_deb[noexec] = "1"
> +do_package_write_rpm[noexec] = "1"
> diff --git a/recipes-devtools/go-cross/go-native_1.4.bb
> b/recipes-devtools/go-cross/go-native_1.4.bb
> new file mode 100644
> index 0000000..cf186e7
> --- /dev/null
> +++ b/recipes-devtools/go-cross/go-native_1.4.bb
> @@ -0,0 +1,2 @@
> +require go-native.inc
> +require go-${PV}.inc
> --
> 1.8.3.2
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--089e01177a6d1bb989053034c479
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Apr 5, 2016 at 5:54 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:zongchun.yu@nxp.com" target=3D"_blank">zongchun.yu@nxp.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">From: Zongchun Yu &lt;<a href=3D"=
mailto:zongchun.yu@nxp.com">zongchun.yu@nxp.com</a>&gt;<br>
<br>
* Add go-native as build bootstrap for go-cross.<br>
* Upgrade go-cross to v1.5.2<br></blockquote><div><br></div><div>In the pas=
t, we&#39;ve been cherry picking this from oe-meta-go, so we can tweak thin=
gs easily</div><div>for our needs. Is this change from scratch ? Or from th=
ere as well ?</div><div><br></div><div>This looks fine to me in general, bu=
t I&#39;d like to couple it to the docker update, so I&#39;ll pend</div><di=
v>this on v2 of the docker update ... when I can build and test both myself=
 as well.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<br>
Signed-off-by: Zongchun Yu &lt;<a href=3D"mailto:zongchun.yu@nxp.com">zongc=
hun.yu@nxp.com</a>&gt;<br>
---<br>
=C2=A0classes/go-osarchmap.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 38 ++++++<br>
=C2=A0...alignment-for-the-.rel.plt-section-on-32-.patch |=C2=A0 30 -----<b=
r>
=C2=A0.../go-cross/files/bsd_svid_source.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 37 ------<br>
=C2=A0recipes-devtools/go-cross/files/ccache.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 147 ---------------------<br>
=C2=A0recipes-devtools/go-cross/go-1.4.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 ++<br>
=C2=A0.../go-cross/go-1.4/016-armhf-elf-header.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 21 +++<br>
=C2=A0recipes-devtools/go-cross/go-1.4/syslog.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 57 ++++++++<br>
=C2=A0recipes-devtools/go-cross/go-1.5.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 19 +++<br>
=C2=A0.../go-cross/go-1.5/armhf-elf-header.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 19 +++<br>
=C2=A0.../go-cross/go-1.5/fix-cc-handling.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 46 +++++++<br>
=C2=A0.../go-cross/go-1.5/fix-target-cc-for-build.patch=C2=A0 |=C2=A0 13 ++=
<br>
=C2=A0recipes-devtools/go-cross/go-1.5/gotooldir.patch=C2=A0 =C2=A0|=C2=A0 =
26 ++++<br>
=C2=A0.../go-1.5/split-host-and-target-build.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 58 ++++++++<br>
=C2=A0recipes-devtools/go-cross/go-1.5/syslog.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 57 ++++++++<br>
=C2=A0recipes-devtools/go-cross/go-common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 20 +++<br>
=C2=A0recipes-devtools/go-cross/<a href=3D"http://go-cross-1.3_1.3.bb" rel=
=3D"noreferrer" target=3D"_blank">go-cross-1.3_1.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 72 ----------<br>
=C2=A0recipes-devtools/go-cross/go-cross.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 45 +++++++<br>
=C2=A0recipes-devtools/go-cross/<a href=3D"http://go-cross_1.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">go-cross_1.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0recipes-devtools/go-cross/go-native.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 50 +++++++<br>
=C2=A0recipes-devtools/go-cross/<a href=3D"http://go-native_1.4.bb" rel=3D"=
noreferrer" target=3D"_blank">go-native_1.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A020 files changed, 487 insertions(+), 286 deletions(-)<br>
=C2=A0create mode 100644 classes/go-osarchmap.bbclass<br>
=C2=A0delete mode 100644 recipes-devtools/go-cross/files/0001-cmd-ld-set-al=
ignment-for-the-.rel.plt-section-on-32-.patch<br>
=C2=A0delete mode 100644 recipes-devtools/go-cross/files/bsd_svid_source.pa=
tch<br>
=C2=A0delete mode 100644 recipes-devtools/go-cross/files/ccache.patch<br>
=C2=A0create mode 100644 recipes-devtools/go-cross/go-1.4.inc<br>
=C2=A0create mode 100644 recipes-devtools/go-cross/go-1.4/016-armhf-elf-hea=
der.patch<br>
=C2=A0create mode 100644 recipes-devtools/go-cross/go-1.4/syslog.patch<br>
=C2=A0create mode 100644 recipes-devtools/go-cross/go-1.5.inc<br>
=C2=A0create mode 100644 recipes-devtools/go-cross/go-1.5/armhf-elf-header.=
patch<br>
=C2=A0create mode 100644 recipes-devtools/go-cross/go-1.5/fix-cc-handling.p=
atch<br>
=C2=A0create mode 100644 recipes-devtools/go-cross/go-1.5/fix-target-cc-for=
-build.patch<br>
=C2=A0create mode 100644 recipes-devtools/go-cross/go-1.5/gotooldir.patch<b=
r>
=C2=A0create mode 100644 recipes-devtools/go-cross/go-1.5/split-host-and-ta=
rget-build.patch<br>
=C2=A0create mode 100644 recipes-devtools/go-cross/go-1.5/syslog.patch<br>
=C2=A0create mode 100644 recipes-devtools/go-cross/go-common.inc<br>
=C2=A0delete mode 100644 recipes-devtools/go-cross/<a href=3D"http://go-cro=
ss-1.3_1.3.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-1.3_1.3.bb</a>=
<br>
=C2=A0create mode 100644 recipes-devtools/go-cross/go-cross.inc<br>
=C2=A0create mode 100644 recipes-devtools/go-cross/<a href=3D"http://go-cro=
ss_1.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.5.bb</a><br>
=C2=A0create mode 100644 recipes-devtools/go-cross/go-native.inc<br>
=C2=A0create mode 100644 recipes-devtools/go-cross/<a href=3D"http://go-nat=
ive_1.4.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.4.bb</a><br>
<br>
diff --git a/classes/go-osarchmap.bbclass b/classes/go-osarchmap.bbclass<br=
>
new file mode 100644<br>
index 0000000..4e00c7b<br>
--- /dev/null<br>
+++ b/classes/go-osarchmap.bbclass<br>
@@ -0,0 +1,38 @@<br>
+BUILD_GOOS =3D &quot;${@go_map_os(d.getVar(&#39;BUILD_OS&#39;, True), d)}&=
quot;<br>
+BUILD_GOARCH =3D &quot;${@go_map_arch(d.getVar(&#39;BUILD_ARCH&#39;, True)=
, d)}&quot;<br>
+BUILD_GOTUPLE =3D &quot;${BUILD_GOOS}_${BUILD_GOARCH}&quot;<br>
+HOST_GOOS =3D &quot;${@go_map_os(d.getVar(&#39;HOST_OS&#39;, True), d)}&qu=
ot;<br>
+HOST_GOARCH =3D &quot;${@go_map_arch(d.getVar(&#39;HOST_ARCH&#39;, True), =
d)}&quot;<br>
+HOST_GOARM =3D &quot;${@go_map_arm(d.getVar(&#39;HOST_ARCH&#39;, True), d.=
getVar(&#39;TUNE_FEATURES&#39;, True), d)}&quot;<br>
+HOST_GOTUPLE =3D &quot;${HOST_GOOS}_${HOST_GOARCH}&quot;<br>
+TARGET_GOOS =3D &quot;${@go_map_os(d.getVar(&#39;TARGET_OS&#39;, True), d)=
}&quot;<br>
+TARGET_GOARCH =3D &quot;${@go_map_arch(d.getVar(&#39;TARGET_ARCH&#39;, Tru=
e), d)}&quot;<br>
+TARGET_GOARM =3D &quot;${@go_map_arm(d.getVar(&#39;TARGET_ARCH&#39;, True)=
, d.getVar(&#39;TUNE_FEATURES&#39;, True), d)}&quot;<br>
+TARGET_GOTUPLE =3D &quot;${TARGET_GOOS}_${TARGET_GOARCH}&quot;<br>
+GO_BUILD_BINDIR =3D &quot;${@[&#39;bin/${HOST_GOTUPLE}&#39;,&#39;bin&#39;]=
[d.getVar(&#39;BUILD_GOTUPLE&#39;,True) =3D=3D d.getVar(&#39;HOST_GOTUPLE&#=
39;,True)]}&quot;<br>
+<br>
+def go_map_arch(a, d):<br>
+=C2=A0 =C2=A0 import re<br>
+=C2=A0 =C2=A0 if re.match(&#39;i.86&#39;, a):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;386&#39;<br>
+=C2=A0 =C2=A0 elif a =3D=3D &#39;x86_64&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;amd64&#39;<br>
+=C2=A0 =C2=A0 elif re.match(&#39;arm.*&#39;, a):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;arm&#39;<br>
+=C2=A0 =C2=A0 elif re.match(&#39;aarch64.*&#39;, a):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;arm64&#39;<br>
+=C2=A0 =C2=A0 elif re.match(&#39;p(pc|owerpc)(|64)&#39;, a):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;powerpc&#39;<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;cannot map &#39;%s&#39; to a Go=
 architecture&quot; % a)<br>
+<br>
+def go_map_arm(a, f, d):<br>
+=C2=A0 =C2=A0 import re<br>
+=C2=A0 =C2=A0 if re.match(&#39;arm.*&#39;, a) and re.match(&#39;arm.*7.*&#=
39;, f):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;7&#39;<br>
+=C2=A0 =C2=A0 return &#39;&#39;<br>
+<br>
+def go_map_os(o, d):<br>
+=C2=A0 =C2=A0 if o.startswith(&#39;linux&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;linux&#39;<br>
+=C2=A0 =C2=A0 return o<br>
diff --git a/recipes-devtools/go-cross/files/0001-cmd-ld-set-alignment-for-=
the-.rel.plt-section-on-32-.patch b/recipes-devtools/go-cross/files/0001-cm=
d-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch<br>
deleted file mode 100644<br>
index 4cfa9d1..0000000<br>
--- a/recipes-devtools/go-cross/files/0001-cmd-ld-set-alignment-for-the-.re=
l.plt-section-on-32-.patch<br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-From 855145d5c03c4b4faf60736c38d7a299c682af4a Mon Sep 17 00:00:00 2001<br>
-From: Shenghou Ma &lt;<a href=3D"mailto:minux@golang.org">minux@golang.org=
</a>&gt;<br>
-Date: Sat, 7 Feb 2015 14:06:02 -0500<br>
-Subject: [PATCH] cmd/ld: set alignment for the .rel.plt section on 32-bit<=
br>
- architectures<br>
-<br>
-Fixes #9802.<br>
-<br>
-Change-Id: I22c52a37bdb23a14cc4615c9519431bb14ca81ca<br>
-Reviewed-on: <a href=3D"https://go-review.googlesource.com/4170" rel=3D"no=
referrer" target=3D"_blank">https://go-review.googlesource.com/4170</a><br>
-Reviewed-by: Ian Lance Taylor &lt;<a href=3D"mailto:iant@golang.org">iant@=
golang.org</a>&gt;<br>
----<br>
- src/cmd/ld/elf.c | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/src/cmd/ld/elf.c b/src/cmd/ld/elf.c<br>
-index 12ced98..97ed4bd 100644<br>
---- a/src/cmd/ld/elf.c<br>
-+++ b/src/cmd/ld/elf.c<br>
-@@ -1363,6 +1363,7 @@ asmbelf(vlong symo)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sh-&gt;type =3D SHT_REL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sh-&gt;flags =3D SHF_ALLOC;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sh-&gt;entsize =3D ELF32RELSIZE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sh-&gt;addralign =3D 4;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sh-&gt;link =3D elfshname(&quot;.dynsym&quot;)-&gt;shnum;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0shsym(sh, linklookup(ctxt, &quot;.rel.plt&quot;, 0));<br>
-<br>
---<br>
-1.9.1<br>
-<br>
diff --git a/recipes-devtools/go-cross/files/bsd_svid_source.patch b/recipe=
s-devtools/go-cross/files/bsd_svid_source.patch<br>
deleted file mode 100644<br>
index 21e1d4c..0000000<br>
--- a/recipes-devtools/go-cross/files/bsd_svid_source.patch<br>
+++ /dev/null<br>
@@ -1,37 +0,0 @@<br>
-golang-cross: do_compile fails cc1: all warnings being treated as errors<b=
r>
-<br>
-glibc 2.20 deprecates _BSD_SOURCE and _SVID_SOURCE and emits an error<br>
-message.=C2=A0 From patch 16632:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0libc [PATCH] BZ #16632: Disable _SVID_SOURCE/_B=
SD_SOURCE warning<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if _DEFAULT_SOURCE is defined<br>
-<br>
-Since we also need to support glibc before 2.20, from the release notes<br=
>
-for glibc 2.20, the recommended fix is to define _DEFAULT_SOURCE<br>
-<br>
-(fixed upstream)<br>
-<a href=3D"https://groups.google.com/forum/#!topic/golang-codereviews/S4TA=
RFCxu2k" rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/for=
um/#!topic/golang-codereviews/S4TARFCxu2k</a><br>
-<br>
-Signed-off-by: Amy Fong &lt;<a href=3D"mailto:amy.fong@windriver.com">amy.=
fong@windriver.com</a>&gt;<br>
----<br>
- include/u.h |=C2=A0 =C2=A010 ++++++++++<br>
- 1 file changed, 10 insertions(+)<br>
-<br>
---- a/include/u.h<br>
-+++ b/include/u.h<br>
-@@ -38,6 +38,16 @@<br>
- #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0define __MAKECONTEXT_V2_=
SOURCE 1<br>
- #=C2=A0 =C2=A0 =C2=A0endif<br>
- #endif<br>
-+/**<br>
-+ * in glibc &gt;=3D 2.20, _BSD_SOURCE and _SVID_SOURCE causes warning<br>
-+ * messages if _DEFAULT_SOURCE is not defined.<br>
-+ *<br>
-+ * From glibc 2.20 release notes, since this application needs _BSD_SOURC=
E<br>
-+ * and/or _SVID_SOURCE and we must support glibc &lt; 2.19 and<br>
-+ * glibc &gt;=3D 2.20, then define all 3 (_DEFAULT_SOURCE, _BSD_SOURCE,<b=
r>
-+ * and _SVID_SOURCE) unconditionally<br>
-+ */<br>
-+#define _DEFAULT_SOURCE 1<br>
- #define _BSD_SOURCE 1<br>
- #define _NETBSD_SOURCE 1=C2=A0 =C2=A0 =C2=A0 /* NetBSD */<br>
- #define _SVID_SOURCE 1<br>
diff --git a/recipes-devtools/go-cross/files/ccache.patch b/recipes-devtool=
s/go-cross/files/ccache.patch<br>
deleted file mode 100644<br>
index b7a64bf..0000000<br>
--- a/recipes-devtools/go-cross/files/ccache.patch<br>
+++ /dev/null<br>
@@ -1,147 +0,0 @@<br>
-golang doesn&#39;t work with ccache. In the current state, a lot of parsin=
g<br>
-happens where it&#39;ll grab the first string in CC or LD and uses that fo=
r<br>
-its builds. When ccache is enabled, it results in trying to do builds<br>
-with just ccache.<br>
-<br>
-The brokeness is seen when building with apps that uses cgo, like docker.<=
br>
-To enable ccache to work, some string comparisons and changes to parsing<b=
r>
-had to be made.<br>
-<br>
-Signed-off-by: Amy Fong &lt;<a href=3D"mailto:amy.fong@windriver.com">amy.=
fong@windriver.com</a>&gt;<br>
-<br>
-Index: go/src/cmd/cgo/gcc.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/cgo/gcc.go 2014-06-18 17:26:26.000000000 -0700<br>
-+++ go/src/cmd/cgo/gcc.go=C2=A0 =C2=A0 =C2=A0 2015-06-18 13:19:08.90887716=
0 -0700<br>
-@@ -712,6 +712,12 @@<br>
- func (p *Package) gccBaseCmd() []string {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// Use $CC if set, since that&#39;s what the bu=
ild uses.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ret :=3D strings.Fields(os.Getenv(&quot;CC&q=
uot;)); len(ret) &gt; 0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if strings.Contains(ret[=
0], &quot;ccache&quot;) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 base_cc :=3D ret[0] + &quot; &quot; + ret[1]<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;CCACHE_CC&quot;, ret[1])<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ret[1] =3D base_cc<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return ret[1:]<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// Try $GCC if set, since that&#39;s what we us=
ed to use.<br>
-Index: go/src/pkg/os/exec/lp_unix.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/pkg/os/exec/lp_unix.go 2014-06-18 17:26:25.000000000 -0700=
<br>
-+++ go/src/pkg/os/exec/lp_unix.go=C2=A0 =C2=A0 =C2=A0 2015-06-18 13:19:29.=
464876331 -0700<br>
-@@ -35,8 +35,14 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// (only bypass the path if file begins with / =
or ./ or ../)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// but that would not match all the Unix shells=
.<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 if strings.Contains(file, &quot;/&quot;) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err :=3D findExecutable(=
file)<br>
-+=C2=A0 =C2=A0 =C2=A0 tmp :=3D file<br>
-+=C2=A0 =C2=A0 =C2=A0 if strings.Contains(file, &quot; &quot;) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_part :=3D strings.S=
plit(file, &quot; &quot;)[0]<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp =3D exec_part<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if strings.Contains(tmp, &quot;/&quot;) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err :=3D findExecutable(=
tmp)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if err =3D=3D nil {=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return file, nil<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -51,7 +57,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0// Unix shell semantics: path element &quot;&quot; means &quot;.&=
quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dir =3D &quot;.&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path :=3D dir + &quot;/&=
quot; + file<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path :=3D dir + &quot;/&=
quot; + tmp<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if err :=3D findExe=
cutable(path); err =3D=3D nil {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return path, nil<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-Index: go/src/cmd/go/build.go<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/go/build.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 2014-06-18 17:2=
6:26.000000000 -0700<br>
-+++ go/src/cmd/go/build.go=C2=A0 =C2=A0 =C2=A02015-06-18 13:20:08.72487474=
9 -0700<br>
-@@ -2005,8 +2005,15 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// strings returned are &quot;gcc&quot;, &quot;=
-I&quot;, objdir (and cuts them off).<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0compiler :=3D envList(envvar, defcmd)<br>
--=C2=A0 =C2=A0 =C2=A0 a :=3D []string{compiler[0], &quot;-I&quot;, objdir}=
<br>
--=C2=A0 =C2=A0 =C2=A0 a =3D append(a, compiler[1:]...)<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 a :=3D []string{compiler[0]}<br>
-+=C2=A0 =C2=A0 =C2=A0 if strings.Contains(compiler[0], &quot;ccache&quot;)=
 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a =3D append(a, compiler=
[1], &quot;-I&quot;, objdir)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a =3D append(a, compiler=
[2:]...)<br>
-+=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a =3D append(a, &quot;-I=
&quot;, objdir)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a =3D append(a, compiler=
[1:]...)<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// Definitely want -fPIC but on Windows gcc com=
plains<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// &quot;-fPIC ignored for target (all code is =
position independent)&quot;<br>
-Index: go/src/cmd/ld/lib.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- go.orig/src/cmd/ld/lib.c=C2=A0 =C2=A02014-06-18 17:26:27.000000000 -07=
00<br>
-+++ go/src/cmd/ld/lib.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 2015-06-18 13:18:39.564=
878343 -0700<br>
-@@ -552,7 +552,7 @@<br>
- void<br>
- hostlink(void)<br>
- {<br>
--=C2=A0 =C2=A0 =C2=A0 char *p, **argv;<br>
-+=C2=A0 =C2=A0 =C2=A0 char *p, *q, **argv;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int c, i, w, n, argc, len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0Hostobj *h;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0Biobuf *f;<br>
-@@ -577,6 +577,19 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if(extld =3D=3D nil)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extld =3D &quot;gcc=
&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0argv[argc++] =3D extld;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 p =3D extldflags;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (strstr(argv[0], &quot;ccache&quot;) !=3D NULL) {=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while(p !=3D nil) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 while(*p =3D=3D &#39; &#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *p++ =3D &#39;\0&#39;;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if(*p =3D=3D &#39;\0&#39;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 argv[argc++] =3D p;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 p =3D strchr(p + 1, &#39; &#39;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch(thechar){<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;8&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv[argc++] =3D &q=
uot;-m32&quot;;<br>
-@@ -629,12 +642,12 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0errorexit();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bseek(f, h-&gt;off,=
 0);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D smprint(&quot;%s/%=
06d.o&quot;, tmpdir, i);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argv[argc++] =3D p;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 w =3D create(p, 1, 0775)=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D smprint(&quot;%s/%=
06d.o&quot;, tmpdir, i);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argv[argc++] =3D q;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 w =3D create(q, 1, 0775)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(w &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ctxt-&gt;cursym =3D S;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 diag(&quot;cannot create %s: %r&quot;, p);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 diag(&quot;cannot create %s: %r&quot;, q);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0errorexit();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D h-&gt;len;<=
br>
-@@ -646,7 +659,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(close(w) &lt; 0)=
 {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ctxt-&gt;cursym =3D S;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 diag(&quot;cannot write %s: %r&quot;, p);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 diag(&quot;cannot write %s: %r&quot;, q);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0errorexit();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bterm(f);<br>
-@@ -656,7 +669,6 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for(i=3D0; i&lt;nldflag; i++)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv[argc++] =3D ld=
flag[i];<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 p =3D extldflags;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while(p !=3D nil) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while(*p =3D=3D &#3=
9; &#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*p++ =3D &#39;\0&#39;;<br>
diff --git a/recipes-devtools/go-cross/go-1.4.inc b/recipes-devtools/go-cro=
ss/go-1.4.inc<br>
new file mode 100644<br>
index 0000000..0ffbcd0<br>
--- /dev/null<br>
+++ b/recipes-devtools/go-cross/go-1.4.inc<br>
@@ -0,0 +1,14 @@<br>
+require go-common.inc<br>
+<br>
+PV =3D &quot;1.4.2&quot;<br>
+GO_BASEVERSION =3D &quot;1.4&quot;<br>
+FILESEXTRAPATHS_prepend :=3D &quot;${FILE_DIRNAME}/go-${GO_BASEVERSION}:&q=
uot;<br>
+<br>
+SRC_URI +=3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://016-armhf-elf-header.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://syslog.patch \<br>
+&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D591778525c869cdde0ab5a1bf2=
83cd81&quot;<br>
+SRC_URI[md5sum] =3D &quot;907f85c8fa765d31f7f955836fec4049&quot;<br>
+SRC_URI[sha256sum] =3D &quot;299a6fd8f8adfdce15bc06bde926e7b252ae8e24dd5b1=
6b7d8791ed79e7b5e9b&quot;<br>
diff --git a/recipes-devtools/go-cross/go-1.4/016-armhf-elf-header.patch b/=
recipes-devtools/go-cross/go-1.4/016-armhf-elf-header.patch<br>
new file mode 100644<br>
index 0000000..1ae53a3<br>
--- /dev/null<br>
+++ b/recipes-devtools/go-cross/go-1.4/016-armhf-elf-header.patch<br>
@@ -0,0 +1,21 @@<br>
+Description: Use correct ELF header for armhf binaries.<br>
+Author: Adam Conrad &lt;<a href=3D"mailto:adconrad@ubuntu.com">adconrad@ub=
untu.com</a>&gt;<br>
+Last-Update: 2013-07-08<br>
+<br>
+Index: go/src/cmd/ld/elf.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- go.orig/src/cmd/ld/elf.c=C2=A0 =C2=A02015-02-20 10:49:58.763451586 -08=
00<br>
++++ go/src/cmd/ld/elf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 2015-02-20 10:49:27.895=
478521 -0800<br>
+@@ -57,7 +57,11 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;5&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// we use EABI on b=
oth linux/arm and freebsd/arm.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(HEADTYPE =3D=3D =
Hlinux || HEADTYPE =3D=3D Hfreebsd)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hdr.flags =3D 0x5000002; // has entry point, Version5 EABI<br>
++#ifdef __ARM_PCS_VFP<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hdr.flags =3D 0x5000402; // has entry point, Version5 EABI, hard-float =
ABI<br>
++#else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hdr.flags =3D 0x5000202; // has entry point, Version5 EABI, soft-float =
ABI<br>
++#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// fallthrough<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hdr.phoff =3D ELF32=
HDRSIZE;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Must be be ELF32HDRSIZE: first PHdr m=
ust follow ELF header */<br>
diff --git a/recipes-devtools/go-cross/go-1.4/syslog.patch b/recipes-devtoo=
ls/go-cross/go-1.4/syslog.patch<br>
new file mode 100644<br>
index 0000000..ce82a4f<br>
--- /dev/null<br>
+++ b/recipes-devtools/go-cross/go-1.4/syslog.patch<br>
@@ -0,0 +1,57 @@<br>
+diff -r -u go/src/log/syslog/syslog.go /home/achang/GOCOPY/go/src/log/sysl=
og/syslog.go<br>
+--- go/src/log/syslog/syslog.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 2013-11-28 13:3=
8:28.000000000 -0800<br>
++++ /home/achang/GOCOPY/go/src/log/syslog/syslog.go=C2=A0 =C2=A0 2014-10-0=
3 11:44:37.710403200 -0700<br>
+@@ -33,6 +33,9 @@<br>
+ const severityMask =3D 0x07<br>
+ const facilityMask =3D 0xf8<br>
+<br>
++var writeTimeout =3D 1 * time.Second<br>
++var connectTimeout =3D 1 * time.Second<br>
++<br>
+ const (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Severity.<br>
+<br>
+@@ -100,6 +103,7 @@<br>
+ type serverConn interface {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writeString(p Priority, hostname, tag, s, nl st=
ring) error<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0close() error<br>
++=C2=A0 =C2=A0 =C2=A0 setWriteDeadline(t time.Time) error<br>
+ }<br>
+<br>
+ type netConn struct {<br>
+@@ -273,7 +277,11 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nl =3D &quot;\n&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 err :=3D w.conn.writeString(p, w.hostname, w.tag, ms=
g, nl)<br>
++=C2=A0 =C2=A0 =C2=A0 err :=3D w.conn.setWriteDeadline(time.Now().Add(writ=
eTimeout))<br>
++=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0, err<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 err =3D w.conn.writeString(p, w.hostname, w.tag, msg=
, nl)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0, err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -305,6 +313,10 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return n.conn.Close()<br>
+ }<br>
+<br>
++func (n *netConn) setWriteDeadline(t time.Time) error {<br>
++=C2=A0 =C2=A0 =C2=A0 return n.conn.SetWriteDeadline(t)<br>
++}<br>
++<br>
+ // NewLogger creates a log.Logger whose output is written to<br>
+ // the system log service with the specified priority. The logFlag<br>
+ // argument is the flag set passed through to log.New to create<br>
+diff -r -u go/src/log/syslog/syslog_unix.go /home/achang/GOCOPY/go/src/log=
/syslog/syslog_unix.go<br>
+--- go/src/log/syslog/syslog_unix.go=C2=A0 =C2=A02013-11-28 13:38:28.00000=
0000 -0800<br>
++++ /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go=C2=A0 =C2=A0 =C2=
=A0 =C2=A02014-10-03 11:44:39.010403175 -0700<br>
+@@ -19,7 +19,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0logPaths :=3D []string{&quot;/dev/log&quot;, &q=
uot;/var/run/syslog&quot;}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, network :=3D range logTypes {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for _, path :=3D ra=
nge logPaths {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 conn, err :=3D net.Dial(network, path)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 conn, err :=3D net.DialTimeout(network, path, connectTimeout)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0} else {<br>
diff --git a/recipes-devtools/go-cross/go-1.5.inc b/recipes-devtools/go-cro=
ss/go-1.5.inc<br>
new file mode 100644<br>
index 0000000..bb91ed8<br>
--- /dev/null<br>
+++ b/recipes-devtools/go-cross/go-1.5.inc<br>
@@ -0,0 +1,19 @@<br>
+require go-common.inc<br>
+<br>
+PV =3D &quot;1.5.2&quot;<br>
+GO_BASEVERSION =3D &quot;1.5&quot;<br>
+FILESEXTRAPATHS_prepend :=3D &quot;${FILE_DIRNAME}/go-${GO_BASEVERSION}:&q=
uot;<br>
+<br>
+<br>
+SRC_URI +=3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://armhf-elf-header.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://syslog.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-target-cc-for-build.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-cc-handling.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://split-host-and-target-build.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://gotooldir.patch \<br>
+&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D591778525c869cdde0ab5a1bf2=
83cd81&quot;<br>
+SRC_URI[md5sum] =3D &quot;38fed22e7b80672291e7cba7fb9c3475&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f3ddd624c00461641ce3d3a8d8e3c622392384ca7699e=
901b370a4eac5987a74&quot;<br>
diff --git a/recipes-devtools/go-cross/go-1.5/armhf-elf-header.patch b/reci=
pes-devtools/go-cross/go-1.5/armhf-elf-header.patch<br>
new file mode 100644<br>
index 0000000..f56869b<br>
--- /dev/null<br>
+++ b/recipes-devtools/go-cross/go-1.5/armhf-elf-header.patch<br>
@@ -0,0 +1,19 @@<br>
+Index: go/src/cmd/link/internal/ld/elf.go<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- go.orig/src/cmd/link/internal/ld/elf.go=C2=A0 =C2=A0 2015-07-29 13:05:=
25.952533140 -0700<br>
++++ go/src/cmd/link/internal/ld/elf.go 2015-07-29 13:14:53.413112995 -0700=
<br>
+@@ -780,7 +780,13 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// 32-bit architectures<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;5&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// we use EABI on b=
oth linux/arm and freebsd/arm.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if HEADTYPE =3D=3D obj.H=
linux || HEADTYPE =3D=3D obj.Hfreebsd {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if HEADTYPE =3D=3D obj.H=
linux {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if Ctxt.Goarm =3D=3D 7 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ehdr.flags =3D 0x5000402 // has entry point=
, Version5 EABI, hard float<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ehdr.flags =3D 0x5000202 // has entry point=
, Version5 EABI, soft float<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if HEADTYPE =3D=
=3D obj.Hfreebsd {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ehdr.flags =3D 0x5000002 // has entry point, Version5 EABI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fallthrough<br>
diff --git a/recipes-devtools/go-cross/go-1.5/fix-cc-handling.patch b/recip=
es-devtools/go-cross/go-1.5/fix-cc-handling.patch<br>
new file mode 100644<br>
index 0000000..85770a9<br>
--- /dev/null<br>
+++ b/recipes-devtools/go-cross/go-1.5/fix-cc-handling.patch<br>
@@ -0,0 +1,46 @@<br>
+Index: go/src/cmd/go/build.go<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- go.orig/src/cmd/go/build.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 2015-07-29 14:4=
8:40.323185807 -0700<br>
++++ go/src/cmd/go/build.go=C2=A0 =C2=A0 =C2=A02015-07-30 07:37:40.52981858=
6 -0700<br>
+@@ -2805,12 +2805,24 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return b.ccompilerCmd(&quot;CC&quot;, defaultCC=
, objdir)<br>
+ }<br>
+<br>
++// gccCmd returns a gcc command line prefix<br>
++// defaultCC is defined in zdefaultcc.go, written by cmd/dist.<br>
++func (b *builder) gccCmdForReal() []string {<br>
++=C2=A0 =C2=A0 =C2=A0 return envList(&quot;CC&quot;, defaultCC)<br>
++}<br>
++<br>
+ // gxxCmd returns a g++ command line prefix<br>
+ // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.<br>
+ func (b *builder) gxxCmd(objdir string) []string {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return b.ccompilerCmd(&quot;CXX&quot;, defaultC=
XX, objdir)<br>
+ }<br>
+<br>
++// gxxCmd returns a g++ command line prefix<br>
++// defaultCXX is defined in zdefaultcc.go, written by cmd/dist.<br>
++func (b *builder) gxxCmdForReal() []string {<br>
++=C2=A0 =C2=A0 =C2=A0 return envList(&quot;CXX&quot;, defaultCXX)<br>
++}<br>
++<br>
+ // ccompilerCmd returns a command line prefix for the given environment<b=
r>
+ // variable and using the default command when the variable is empty.<br>
+ func (b *builder) ccompilerCmd(envvar, defcmd, objdir string) []string {<=
br>
+Index: go/src/cmd/go/env.go<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- go.orig/src/cmd/go/env.go=C2=A0 2015-07-29 14:48:40.323185807 -0700<br=
>
++++ go/src/cmd/go/env.go=C2=A0 =C2=A0 =C2=A0 =C2=A02015-07-30 07:40:54.461=
655721 -0700<br>
+@@ -52,10 +52,9 @@<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if goos !=3D &quot;plan9&quot; {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd :=3D b.gccCmd(&=
quot;.&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env =3D append(env, envV=
ar{&quot;CC&quot;, cmd[0]})<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env =3D append(env, envV=
ar{&quot;CC&quot;, strings.Join(b.gccCmdForReal(), &quot; &quot;)})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D append(env,=
 envVar{&quot;GOGCCFLAGS&quot;, strings.Join(cmd[3:], &quot; &quot;)})<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D b.gxxCmd(&quot;.=
&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env =3D append(env, envV=
ar{&quot;CXX&quot;, cmd[0]})<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env =3D append(env, envV=
ar{&quot;CXX&quot;, strings.Join(b.gxxCmdForReal(), &quot; &quot;)})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if buildContext.CgoEnabled {<br>
diff --git a/recipes-devtools/go-cross/go-1.5/fix-target-cc-for-build.patch=
 b/recipes-devtools/go-cross/go-1.5/fix-target-cc-for-build.patch<br>
new file mode 100644<br>
index 0000000..adfeb6b<br>
--- /dev/null<br>
+++ b/recipes-devtools/go-cross/go-1.5/fix-target-cc-for-build.patch<br>
@@ -0,0 +1,13 @@<br>
+Index: go/src/make.bash<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- go.orig/src/make.bash=C2=A0 =C2=A0 =C2=A0 2015-07-29 13:28:11.33403169=
6 -0700<br>
++++ go/src/make.bash=C2=A0 =C2=A02015-07-29 13:36:55.814465630 -0700<br>
+@@ -158,7 +158,7 @@<br>
+ fi<br>
+<br>
+ echo &quot;##### Building packages and commands for $GOOS/$GOARCH.&quot;<=
br>
+-CC=3D$CC_FOR_TARGET &quot;$GOTOOLDIR&quot;/go_bootstrap install $GO_FLAGS=
 -gcflags &quot;$GO_GCFLAGS&quot; -ldflags &quot;$GO_LDFLAGS&quot; -v std c=
md<br>
++CC=3D&quot;$CC_FOR_TARGET&quot; &quot;$GOTOOLDIR&quot;/go_bootstrap insta=
ll $GO_FLAGS -gcflags &quot;$GO_GCFLAGS&quot; -ldflags &quot;$GO_LDFLAGS&qu=
ot; -v std cmd<br>
+ echo<br>
+<br>
+ rm -f &quot;$GOTOOLDIR&quot;/go_bootstrap<br>
diff --git a/recipes-devtools/go-cross/go-1.5/gotooldir.patch b/recipes-dev=
tools/go-cross/go-1.5/gotooldir.patch<br>
new file mode 100644<br>
index 0000000..473a328<br>
--- /dev/null<br>
+++ b/recipes-devtools/go-cross/go-1.5/gotooldir.patch<br>
@@ -0,0 +1,26 @@<br>
+Index: go/src/go/build/build.go<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- go.orig/src/go/build/build.go<br>
++++ go/src/go/build/build.go<br>
+@@ -1388,7 +1388,7 @@ func init() {<br>
+ }<br>
+<br>
+ // ToolDir is the directory containing build tools.<br>
+-var ToolDir =3D filepath.Join(runtime.GOROOT(), &quot;pkg/tool/&quot;+run=
time.GOOS+&quot;_&quot;+runtime.GOARCH)<br>
++var ToolDir =3D envOr(&quot;GOTOOLDIR&quot;, filepath.Join(runtime.GOROOT=
(), &quot;pkg/tool/&quot;+runtime.GOOS+&quot;_&quot;+runtime.GOARCH))<br>
+<br>
+ // IsLocalImport reports whether the import path is<br>
+ // a local import path, like &quot;.&quot;, &quot;..&quot;, &quot;./foo&q=
uot;, or &quot;../foo&quot;.<br>
+Index: go/src/cmd/go/build.go<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- go.orig/src/cmd/go/build.go<br>
++++ go/src/cmd/go/build.go<br>
+@@ -1312,7 +1312,7 @@ func (b *builder) build(a *action) (err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cgoExe :=3D tool(&q=
uot;cgo&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if a.cgo !=3D nil &amp;&=
amp; a.cgo.target !=3D &quot;&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if a.cgo !=3D nil &amp;&=
amp; a.cgo.target !=3D &quot;&quot; &amp;&amp; os.Getenv(&quot;GOTOOLDIR&qu=
ot;) =3D=3D &quot;&quot; {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cgoExe =3D a.cgo.target<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0outGo, outObj, err =
:=3D b.cgo(a.p, cgoExe, obj, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, cxxfi=
les, a.p.MFiles)<br>
diff --git a/recipes-devtools/go-cross/go-1.5/split-host-and-target-build.p=
atch b/recipes-devtools/go-cross/go-1.5/split-host-and-target-build.patch<b=
r>
new file mode 100644<br>
index 0000000..85fb240<br>
--- /dev/null<br>
+++ b/recipes-devtools/go-cross/go-1.5/split-host-and-target-build.patch<br=
>
@@ -0,0 +1,58 @@<br>
+Index: go/src/make.bash<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- go.orig/src/make.bash<br>
++++ go/src/make.bash<br>
+@@ -143,12 +143,23 @@ if [ &quot;$1&quot; =3D &quot;--no-clean&quot; ]; th=
en<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buildall=3D&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0shift<br>
+ fi<br>
+-./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v # builds go_bootstra=
p<br>
+-# Delay move of dist tool to now, because bootstrap may clear tool direct=
ory.<br>
+-mv cmd/dist/dist &quot;$GOTOOLDIR&quot;/dist<br>
+-echo<br>
+<br>
+-if [ &quot;$GOHOSTARCH&quot; !=3D &quot;$GOARCH&quot; -o &quot;$GOHOSTOS&=
quot; !=3D &quot;$GOOS&quot; ]; then<br>
++do_host_build=3D&quot;yes&quot;<br>
++do_target_build=3D&quot;yes&quot;<br>
++if [ &quot;$1&quot; =3D &quot;--target-only&quot; ]; then<br>
++=C2=A0 =C2=A0 =C2=A0 do_host_build=3D&quot;no&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 shift<br>
++elif [ &quot;$1&quot; =3D &quot;--host-only&quot; ]; then<br>
++=C2=A0 =C2=A0 =C2=A0 do_target_build=3D&quot;no&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 shift<br>
++fi<br>
++<br>
++if [ &quot;$do_host_build&quot; =3D &quot;yes&quot; ]; then<br>
++=C2=A0 =C2=A0 =C2=A0 ./cmd/dist/dist bootstrap $buildall $GO_DISTFLAGS -v=
 # builds go_bootstrap<br>
++=C2=A0 =C2=A0 =C2=A0 # Delay move of dist tool to now, because bootstrap =
may clear tool directory.<br>
++=C2=A0 =C2=A0 =C2=A0 mv cmd/dist/dist &quot;$GOTOOLDIR&quot;/dist<br>
++=C2=A0 =C2=A0 =C2=A0 echo<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;##### Building packages and commands=
 for host, $GOHOSTOS/$GOHOSTARCH.&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# CC_FOR_TARGET is recorded as the default comp=
iler for the go tool. When building for the host, however,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# use the host compiler, CC, from `cmd/dist/dis=
t env` instead.<br>
+@@ -157,11 +168,20 @@ if [ &quot;$GOHOSTARCH&quot; !=3D &quot;$GOARCH&quot=
; -o &quot;$GOH<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo<br>
+ fi<br>
+<br>
+-echo &quot;##### Building packages and commands for $GOOS/$GOARCH.&quot;<=
br>
+-CC=3D&quot;$CC_FOR_TARGET&quot; &quot;$GOTOOLDIR&quot;/go_bootstrap insta=
ll $GO_FLAGS -gcflags &quot;$GO_GCFLAGS&quot; -ldflags &quot;$GO_LDFLAGS&qu=
ot; -v std cmd<br>
+-echo<br>
++if [ &quot;$do_target_build&quot; =3D &quot;yes&quot; ]; then<br>
++=C2=A0 =C2=A0 GO_INSTALL=3D&quot;${GO_TARGET_INSTALL:-std cmd}&quot;<br>
++=C2=A0 =C2=A0 echo &quot;##### Building packages and commands for $GOOS/$=
GOARCH.&quot;<br>
++=C2=A0 =C2=A0 if [ &quot;$GOHOSTOS&quot; =3D &quot;$GOOS&quot; -a &quot;$=
GOHOSTARCH&quot; =3D &quot;$GOARCH&quot; -a &quot;$do_host_build&quot; =3D =
&quot;yes&quot; ]; then<br>
++=C2=A0 =C2=A0 =C2=A0 rm -rf ./host-tools<br>
++=C2=A0 =C2=A0 =C2=A0 mkdir ./host-tools<br>
++=C2=A0 =C2=A0 =C2=A0 mv &quot;$GOTOOLDIR&quot;/* ./host-tools<br>
++=C2=A0 =C2=A0 =C2=A0 GOTOOLDIR=3D&quot;$PWD/host-tools&quot;<br>
++=C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 GOTOOLDIR=3D&quot;$GOTOOLDIR&quot; CC=3D&quot;$CC_FOR_TARGE=
T&quot; &quot;$GOTOOLDIR&quot;/go_bootstrap install $GO_FLAGS -gcflags &quo=
t;$GO_GCFLAGS&quot; -ldflags &quot;$GO_LDFLAGS&quot; -v ${GO_INSTALL}<br>
++=C2=A0 =C2=A0 echo<br>
+<br>
+-rm -f &quot;$GOTOOLDIR&quot;/go_bootstrap<br>
++=C2=A0 =C2=A0 rm -f &quot;$GOTOOLDIR&quot;/go_bootstrap<br>
++fi<br>
+<br>
+ if [ &quot;$1&quot; !=3D &quot;--no-banner&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$GOTOOLDIR&quot;/dist banner<br>
diff --git a/recipes-devtools/go-cross/go-1.5/syslog.patch b/recipes-devtoo=
ls/go-cross/go-1.5/syslog.patch<br>
new file mode 100644<br>
index 0000000..ce82a4f<br>
--- /dev/null<br>
+++ b/recipes-devtools/go-cross/go-1.5/syslog.patch<br>
@@ -0,0 +1,57 @@<br>
+diff -r -u go/src/log/syslog/syslog.go /home/achang/GOCOPY/go/src/log/sysl=
og/syslog.go<br>
+--- go/src/log/syslog/syslog.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 2013-11-28 13:3=
8:28.000000000 -0800<br>
++++ /home/achang/GOCOPY/go/src/log/syslog/syslog.go=C2=A0 =C2=A0 2014-10-0=
3 11:44:37.710403200 -0700<br>
+@@ -33,6 +33,9 @@<br>
+ const severityMask =3D 0x07<br>
+ const facilityMask =3D 0xf8<br>
+<br>
++var writeTimeout =3D 1 * time.Second<br>
++var connectTimeout =3D 1 * time.Second<br>
++<br>
+ const (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Severity.<br>
+<br>
+@@ -100,6 +103,7 @@<br>
+ type serverConn interface {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writeString(p Priority, hostname, tag, s, nl st=
ring) error<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0close() error<br>
++=C2=A0 =C2=A0 =C2=A0 setWriteDeadline(t time.Time) error<br>
+ }<br>
+<br>
+ type netConn struct {<br>
+@@ -273,7 +277,11 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nl =3D &quot;\n&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 err :=3D w.conn.writeString(p, w.hostname, w.tag, ms=
g, nl)<br>
++=C2=A0 =C2=A0 =C2=A0 err :=3D w.conn.setWriteDeadline(time.Now().Add(writ=
eTimeout))<br>
++=C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0, err<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 err =3D w.conn.writeString(p, w.hostname, w.tag, msg=
, nl)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0, err<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -305,6 +313,10 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return n.conn.Close()<br>
+ }<br>
+<br>
++func (n *netConn) setWriteDeadline(t time.Time) error {<br>
++=C2=A0 =C2=A0 =C2=A0 return n.conn.SetWriteDeadline(t)<br>
++}<br>
++<br>
+ // NewLogger creates a log.Logger whose output is written to<br>
+ // the system log service with the specified priority. The logFlag<br>
+ // argument is the flag set passed through to log.New to create<br>
+diff -r -u go/src/log/syslog/syslog_unix.go /home/achang/GOCOPY/go/src/log=
/syslog/syslog_unix.go<br>
+--- go/src/log/syslog/syslog_unix.go=C2=A0 =C2=A02013-11-28 13:38:28.00000=
0000 -0800<br>
++++ /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go=C2=A0 =C2=A0 =C2=
=A0 =C2=A02014-10-03 11:44:39.010403175 -0700<br>
+@@ -19,7 +19,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0logPaths :=3D []string{&quot;/dev/log&quot;, &q=
uot;/var/run/syslog&quot;}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, network :=3D range logTypes {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for _, path :=3D ra=
nge logPaths {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 conn, err :=3D net.Dial(network, path)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 conn, err :=3D net.DialTimeout(network, path, connectTimeout)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0} else {<br>
diff --git a/recipes-devtools/go-cross/go-common.inc b/recipes-devtools/go-=
cross/go-common.inc<br>
new file mode 100644<br>
index 0000000..f9587ea<br>
--- /dev/null<br>
+++ b/recipes-devtools/go-cross/go-common.inc<br>
@@ -0,0 +1,20 @@<br>
+SUMMARY =3D &quot;Go programming language compiler&quot;<br>
+DESCRIPTION =3D &quot; The Go programming language is an open source proje=
ct to make \<br>
+ programmers more productive. Go is expressive, concise, clean, and\<br>
+ efficient. Its concurrency mechanisms make it easy to write programs\<br>
+ that get the most out of multicore and networked machines, while its\<br>
+ novel type system enables flexible and modular program construction.\<br>
+ Go compiles quickly to machine code yet has the convenience of\<br>
+ garbage collection and the power of run-time reflection. It&#39;s a\<br>
+ fast, statically typed, compiled language that feels like a\<br>
+ dynamically typed, interpreted language.&quot;<br>
+HOMEPAGE =3D &quot; <a href=3D"http://golang.org/" rel=3D"noreferrer" targ=
et=3D"_blank">http://golang.org/</a>&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+<br>
+inherit go-osarchmap<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://golang.org/dl/go${PV}.src.tar.gz" rel=
=3D"noreferrer" target=3D"_blank">http://golang.org/dl/go${PV}.src.tar.gz</=
a>&quot;<br>
+S =3D &quot;${WORKDIR}/go&quot;<br>
+B =3D &quot;${S}&quot;<br>
+<br>
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
diff --git a/recipes-devtools/go-cross/<a href=3D"http://go-cross-1.3_1.3.b=
b" rel=3D"noreferrer" target=3D"_blank">go-cross-1.3_1.3.bb</a> b/recipes-d=
evtools/go-cross/<a href=3D"http://go-cross-1.3_1.3.bb" rel=3D"noreferrer" =
target=3D"_blank">go-cross-1.3_1.3.bb</a><br>
deleted file mode 100644<br>
index dd57e56..0000000<br>
--- a/recipes-devtools/go-cross/<a href=3D"http://go-cross-1.3_1.3.bb" rel=
=3D"noreferrer" target=3D"_blank">go-cross-1.3_1.3.bb</a><br>
+++ /dev/null<br>
@@ -1,72 +0,0 @@<br>
-DESCRIPTION =3D &quot;\<br>
-=C2=A0 Go is an open source programming language that makes it easy to bui=
ld simple, \<br>
-=C2=A0 reliable, and efficient software. \<br>
-=C2=A0 &quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://golang.org/" rel=3D"noreferrer" targ=
et=3D"_blank">https://golang.org/</a>&quot;<br>
-LICENSE =3D &quot;BSD-3-Clause&quot;<br>
-<br>
-DEPENDS =3D &quot;virtual/${TARGET_PREFIX}gcc libgcc&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://golang.org/dl/go${PV}.src.tar.gz" rel=
=3D"noreferrer" target=3D"_blank">http://golang.org/dl/go${PV}.src.tar.gz</=
a>&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/go/&quot;<br>
-<br>
-inherit cross<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D591778525c869cdde0ab5a1bf2=
83cd81&quot;<br>
-SRC_URI[md5sum] =3D &quot;4b66d7249554181c314f139ea78920b1&quot;<br>
-SRC_URI[sha256sum] =3D &quot;eb983e6c5b2b9838f482c5442b1ac1856f610f2b21f3c=
123b3fedb48ffc35382&quot;<br>
-<br>
-SRC_URI +=3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://bsd_svid_source.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://ccache.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-cmd-ld-set-alignment-for-the-.rel.=
plt-section-on-32-.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0## Setting `$GOBIN` doesn&#39;t do any good, lo=
oks like it ends up copying binaries there.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOROOT_FINAL=3D&quot;${SYSROOT}${libdir}=
/go-1.3&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOHOSTOS=3D&quot;linux&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOOS=3D&quot;linux&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D&quot;${TARGET_ARCH}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# golang only support 386, amd64 and arm archit=
ecture.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${TARGET_ARCH}&quot; =3D &quot;x86_6=
4&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D&qu=
ot;amd64&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ &quot;${TARGET_ARCH}&quot; =3D &quot;i58=
6&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D&qu=
ot;386&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${TARGET_ARCH}&quot; =3D &quot;arm&q=
uot; ]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ `echo ${TUNE_P=
KGARCH} | cut -c 1-7` =3D &quot;cortexa&quot; ]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo GOARM 7<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0export GOARM=3D&quot;7&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0## TODO: consider setting GO_EXTLINK_ENABLED<br=
>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CC=3D&quot;${BUILD_CC}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CC_FOR_TARGET=3D&quot;${TARGET_PREFIX}gc=
c ${TARGET_CC_ARCH} --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CXX_FOR_TARGET=3D&quot;${TARGET_PREFIX}g=
++ ${TARGET_CC_ARCH} --sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GO_CCFLAGS=3D&quot;${HOST_CFLAGS}&quot;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GO_LDFLAGS=3D&quot;${HOST_LDFLAGS}&quot;=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd src &amp;&amp; ./make.bash<br>
-}<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0## It should be okay to ignore `${WORKDIR}/go/b=
in/linux_arm`...<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0## Also `gofmt` is not needed right now.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d &quot;${D}${bindir}/go-1.3&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 &quot;${WORKDIR}/go/bin/go&quot=
; &quot;${D}${bindir}/go-1.3/&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d &quot;${D}${libdir}/go-1.3&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0## TODO: use `install` instead of `cp`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for dir in include lib pkg src test<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0do cp -a &quot;${WORKDIR}/go/${dir}&quot; &quot=
;${D}${libdir}/go-1.3/&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-}<br>
diff --git a/recipes-devtools/go-cross/go-cross.inc b/recipes-devtools/go-c=
ross/go-cross.inc<br>
new file mode 100644<br>
index 0000000..eea1b2c<br>
--- /dev/null<br>
+++ b/recipes-devtools/go-cross/go-cross.inc<br>
@@ -0,0 +1,45 @@<br>
+inherit cross<br>
+<br>
+DEPENDS +=3D &quot;go-native&quot;<br>
+<br>
+export GOHOSTOS =3D &quot;${BUILD_GOOS}&quot;<br>
+export GOHOSTARCH =3D &quot;${BUILD_GOARCH}&quot;<br>
+export GOOS =3D &quot;${TARGET_GOOS}&quot;<br>
+export GOARCH =3D &quot;${TARGET_GOARCH}&quot;<br>
+export GOARM =3D &quot;${TARGET_GOARM}&quot;<br>
+export GOROOT_BOOTSTRAP =3D &quot;${STAGING_LIBDIR_NATIVE}/go&quot;<br>
+export GOROOT_FINAL =3D &quot;${libdir}/go&quot;<br>
+export CGO_ENABLED =3D &quot;1&quot;<br>
+export CC_FOR_TARGET=3D&quot;${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysro=
ot=3D${STAGING_DIR_TARGET}&quot;<br>
+export CXX_FOR_TARGET=3D&quot;${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysr=
oot=3D${STAGING_DIR_TARGET}&quot;<br>
+CC =3D &quot;${@d.getVar(&#39;BUILD_CC&#39;, True).strip()}&quot;<br>
+<br>
+do_configure[noexec] =3D &quot;1&quot;<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 export GOBIN=3D&quot;${B}/bin&quot;<br>
+=C2=A0 =C2=A0 rm -rf ${GOBIN} ${B}/pkg<br>
+=C2=A0 =C2=A0 mkdir ${GOBIN}<br>
+=C2=A0 =C2=A0 cd src<br>
+=C2=A0 =C2=A0 ./make.bash --host-only<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 install -d ${D}${libdir}/go<br>
+=C2=A0 =C2=A0 cp -a ${B}/pkg ${D}${libdir}/go/<br>
+=C2=A0 =C2=A0 install -d ${D}${libdir}/go/src<br>
+=C2=A0 =C2=A0 (cd ${S}/src; for d in *; do \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -d $d ] &amp;&amp; cp -a ${S}/src/$d ${D}${l=
ibdir}/go/src/; \<br>
+=C2=A0 =C2=A0 done)<br>
+=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
+=C2=A0 =C2=A0 for f in ${B}/bin/*<br>
+=C2=A0 =C2=A0 do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m755 $f ${D}${bindir}<br>
+=C2=A0 =C2=A0 done<br>
+}<br>
+<br>
+do_package[noexec] =3D &quot;1&quot;<br>
+do_packagedata[noexec] =3D &quot;1&quot;<br>
+do_package_write_ipk[noexec] =3D &quot;1&quot;<br>
+do_package_write_deb[noexec] =3D &quot;1&quot;<br>
+do_package_write_rpm[noexec] =3D &quot;1&quot;<br>
diff --git a/recipes-devtools/go-cross/<a href=3D"http://go-cross_1.5.bb" r=
el=3D"noreferrer" target=3D"_blank">go-cross_1.5.bb</a> b/recipes-devtools/=
go-cross/<a href=3D"http://go-cross_1.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">go-cross_1.5.bb</a><br>
new file mode 100644<br>
index 0000000..80b5a03<br>
--- /dev/null<br>
+++ b/recipes-devtools/go-cross/<a href=3D"http://go-cross_1.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">go-cross_1.5.bb</a><br>
@@ -0,0 +1,2 @@<br>
+require go-cross.inc<br>
+require go-${PV}.inc<br>
diff --git a/recipes-devtools/go-cross/go-native.inc b/recipes-devtools/go-=
cross/go-native.inc<br>
new file mode 100644<br>
index 0000000..ae3dc83<br>
--- /dev/null<br>
+++ b/recipes-devtools/go-cross/go-native.inc<br>
@@ -0,0 +1,50 @@<br>
+inherit native<br>
+<br>
+export GOOS =3D &quot;${BUILD_GOOS}&quot;<br>
+export GOARCH =3D &quot;${BUILD_GOARCH}&quot;<br>
+export GOROOT_FINAL =3D &quot;${STAGING_LIBDIR_NATIVE}/go&quot;<br>
+export CGO_ENABLED =3D &quot;1&quot;<br>
+<br>
+do_configure[noexec] =3D &quot;1&quot;<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 export GOBIN=3D&quot;${B}/bin&quot;<br>
+=C2=A0 =C2=A0 rm -rf ${GOBIN}<br>
+=C2=A0 =C2=A0 mkdir ${GOBIN}<br>
+=C2=A0 =C2=A0 cd src<br>
+=C2=A0 =C2=A0 ./make.bash --host-only<br>
+}<br>
+<br>
+<br>
+make_wrapper() {<br>
+=C2=A0 =C2=A0 rm -f ${D}${bindir}/$2<br>
+=C2=A0 =C2=A0 cat &lt;&lt;END &gt;${D}${bindir}/$2<br>
+#!/bin/bash<br>
+here=3D\`dirname \$0\`<br>
+export GOROOT=3D&quot;${GOROOT:-\`readlink -f \$here/../lib/go\`}&quot;<br=
>
+\$here/../lib/go/bin/$1 &quot;\$@&quot;<br>
+END<br>
+=C2=A0 =C2=A0 chmod +x ${D}${bindir}/$2<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 install -d ${D}${libdir}/go<br>
+=C2=A0 =C2=A0 cp -a ${B}/pkg ${D}${libdir}/go/<br>
+=C2=A0 =C2=A0 install -d ${D}${libdir}/go/src<br>
+=C2=A0 =C2=A0 (cd ${S}/src; for d in *; do \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -d $d ] &amp;&amp; cp -a ${S}/src/$d ${D}${l=
ibdir}/go/src/; \<br>
+=C2=A0 =C2=A0 done)<br>
+=C2=A0 =C2=A0 install -d ${D}${bindir} ${D}${libdir}/go/bin<br>
+=C2=A0 =C2=A0 for f in ${B}/bin/*<br>
+=C2=A0 =C2=A0 do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 base=3D`basename $f`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m755 $f ${D}${libdir}/go/bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 make_wrapper $base $base<br>
+=C2=A0 =C2=A0 done<br>
+}<br>
+<br>
+do_package[noexec] =3D &quot;1&quot;<br>
+do_packagedata[noexec] =3D &quot;1&quot;<br>
+do_package_write_ipk[noexec] =3D &quot;1&quot;<br>
+do_package_write_deb[noexec] =3D &quot;1&quot;<br>
+do_package_write_rpm[noexec] =3D &quot;1&quot;<br>
diff --git a/recipes-devtools/go-cross/<a href=3D"http://go-native_1.4.bb" =
rel=3D"noreferrer" target=3D"_blank">go-native_1.4.bb</a> b/recipes-devtool=
s/go-cross/<a href=3D"http://go-native_1.4.bb" rel=3D"noreferrer" target=3D=
"_blank">go-native_1.4.bb</a><br>
new file mode 100644<br>
index 0000000..cf186e7<br>
--- /dev/null<br>
+++ b/recipes-devtools/go-cross/<a href=3D"http://go-native_1.4.bb" rel=3D"=
noreferrer" target=3D"_blank">go-native_1.4.bb</a><br>
@@ -0,0 +1,2 @@<br>
+require go-native.inc<br>
+require go-${PV}.inc<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.3.2<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--089e01177a6d1bb989053034c479--
