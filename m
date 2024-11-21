Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AA6D6ED3C
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 14:05:03 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.11378.1732197900787144203
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 06:05:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nKeffILD;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7ede82dbb63so638735a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 06:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732197900; x=1732802700; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oArEPgJ6ta2jdAhuBiasXhskS3UQCiCb1sAClgz8pCQ=;
        b=nKeffILDAp+6Xu8u32kzqPRIKnZSFvnNGdKYuD2zkZ5KMjfnucolg/YTsVDmHCZZ+9
         W3JUmDqXDnlPLUBoELCrOSqWZKyXQmwBsfjsR3nBld6zCHyspU/88tAKjDBBWAy2eInl
         gFEhy94zn6NFmIEvQPyoh3zeSRjFo64URMfb934YKp15ekkPYMDzKlzWbHTNkS57NUpZ
         m5u51NpagdQU1//ZBZw/8w0/8Rt2hU/9cVdej9mk8UFR/Zj7j8rRabMptFTStav8zu+U
         3p6UOgJyIFrqPuK895j7cqo0qq1s23L0Hhl6nvZQjRHfi10VgcbDTKy8ackEnTRU4LXG
         NsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732197900; x=1732802700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oArEPgJ6ta2jdAhuBiasXhskS3UQCiCb1sAClgz8pCQ=;
        b=aVhgUnytk+FOGVCgR60yLzpnxoX/WuaQwlV6VFkfwEcE5VU2qOm/5lI326m7BkM1ic
         apiE43F6cQy/Po5q3w0OEd0CAF7bjylon94jHpaZzSmLqM8ScWeeDKTvykt9JxHmnZbF
         S+yhr8kf01QdAf3PWyAcAwFpZ1PM8JQQKJMCZZPPxy0o/SsHALvSfF/MG596yxTmjb/Z
         xyDy8Nvc8YtGiEuCCRI/atA+urWrGRKo/JaPn0vBN2dBYZMFNIAnODpyKSA3vT8qMYkq
         ucRr8LB9/ndDg7wPGVPfVat7ybf8poCNhyRd/qgiqdU7pEZ4GJFydD/pQXPftIYtSIN0
         e27Q==
X-Gm-Message-State: AOJu0YyLa2QbinIlymeu1C9Qt4hRdZ6c/R6VSLOKzVgLD8mV8xlRMh3E
	oPIeK8PFZyBhRpWz8gWGvj6urXVzeUxD7tsybmbKSQJqlLQmv5kzbxKxR1mmagJBlPYIvZCZmV1
	grpvRjtDJFOkAcH2XnLvIPpsnXNs=
X-Gm-Gg: ASbGncupSTUCVu2Q+VyfymT1tPn1CXSBvsLT8YFjgZo8ZQ36muLLvhJchmrSFCFFOr2
	TTto5792GDaGYcXne9jTSUHXSiYdWK4o=
X-Google-Smtp-Source: AGHT+IEH2yA+J3nwFZtIRExqv8Bpxcz5MnCIfMl1Oerdv65QcWUhQeq6qVJ1Z5S1n8svq4jG0b4MwE8Q0jPcmArRg7M=
X-Received: by 2002:a17:90b:3d04:b0:2ea:4633:1a53 with SMTP id
 98e67ed59e1d1-2eaca6d6b23mr7490596a91.4.1732197899539; Thu, 21 Nov 2024
 06:04:59 -0800 (PST)
MIME-Version: 1.0
References: <20241115141231.1778125-1-peng.zhang1.cn@windriver.com>
 <Zz64Vljz9C29rI2H@gmail.com> <b86724f6-f3c9-47fb-878c-549a3c3d0b0c@windriver.com>
In-Reply-To: <b86724f6-f3c9-47fb-878c-549a3c3d0b0c@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 21 Nov 2024 09:04:45 -0500
Message-ID: <CADkTA4P2ZW15HfY2_Q47_5DjTpTpwQEMmGKJDikxK6T+XH_N=w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] cri-o: enable ptest
To: "Zhang, Peng (Paul) (CN)" <peng.zhang1.cn@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000007b9f4e06276cc0d0"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 14:05:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8995

--0000000000007b9f4e06276cc0d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 4:13=E2=80=AFAM Zhang, Peng (Paul) (CN) <
peng.zhang1.cn@windriver.com> wrote:

>
> On 11/21/2024 12:34 PM, Bruce Ashfield wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender
> and know the content is safe.
> >
> > In message: [meta-virtualization][PATCH] cri-o: enable ptest
> > on 15/11/2024 Zhang, Peng (Paul) (CN) via lists.yoctoproject.org wrote:
> >
> >> From: Zhang Peng <peng.zhang1.cn@windriver.com>
> >>
> >> The ptest build for cri-o was previously disabled due to issues
> >> introduced with Go 1.11, which borken the build process. With the
> >> current Go version, these issues no longer occur, and the ptest build =
is
> >> now functional.
> >> This commit enables ptest support and resolves the "TMPDIR
> >> [buildpaths]" issue encountered during the ptest build process.
> > Can you include a log of the ptest running in the commit log ?
> > That way the baseline pass/fail is understood and captured.
> The CRI-O ptest suite consists of a total of 382 tests. Including the
> entire test results in the commit message would make it overly
> cumbersome and difficult to navigate. Instead, I propose including only
> the list of failed and skipped tests in the commit message, as these
> provide the most critical information.
>

That's acceptable for me. If we just put the total number of tests,
a general overview of the types of testing and then anything
notable (notable here being the skipped or failed tests), then we
have a good reference for the initial state.


> =EF=BB=BFAlternatively, the full test results could be stored in a README=
 or
> another documentation file. This approach ensures the comprehensive test
> results are preserved as a baseline without bloating the commit message.
> =EF=BB=BFWould you prefer the abbreviated results in the commit message, =
or a
> detailed log stored in a separate file?
>

See above. Just the summary in the commit, and a README with
the initial status of the tests stored in a log file.

>
> >> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> >> ---
> >>   recipes-containers/cri-o/cri-o_git.bb         | 37
> ++++++++++++++++++-
> >>   .../0001-Add-trimpath-to-build-nri.test.patch | 31 ++++++++++++++++
> >>   recipes-containers/cri-o/files/run-ptest      | 11 ++++++
> >>   3 files changed, 77 insertions(+), 2 deletions(-)
> >>   create mode 100644
> recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
> >>   create mode 100644 recipes-containers/cri-o/files/run-ptest
> >>
> >> diff --git a/recipes-containers/cri-o/cri-o_git.bb
> b/recipes-containers/cri-o/cri-o_git.bb
> >> index efc86fbe..596a43e2 100644
> >> --- a/recipes-containers/cri-o/cri-o_git.bb
> >> +++ b/recipes-containers/cri-o/cri-o_git.bb
> >> @@ -17,7 +17,9 @@ At a high level, we expect the scope of cri-o to be
> restricted to the following
> >>   SRCREV_cri-o =3D "20c06a19cb395445620c31730c0f1a0a1922eaae"
> >>   SRC_URI =3D "\
> >>        git://
> github.com/kubernetes-sigs/cri-o.git;branch=3Drelease-1.31;name=3Dcri-o;p=
rotocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}
> <http://github.com/kubernetes-sigs/cri-o.git;branch=3Drelease-1.31;name=
=3Dcri-o;protocol=3Dhttps;destsuffix=3D$%7BGO_SRCURI_DESTSUFFIX%7D>
> \
> >> +        file://0001-Add-trimpath-to-build-nri.test.patch \
> >>           file://crio.conf \
> >> +        file://run-ptest \
> >>        "
> >>
> >>   # Apache-2.0 for docker
> >> @@ -28,7 +30,7 @@ GO_IMPORT =3D "import"
> >>
> >>   PV =3D "1.31.0+git${SRCREV_cri-o}"
> >>
> >> -inherit features_check
> >> +inherit features_check ptest
> >>   REQUIRED_DISTRO_FEATURES ?=3D "seccomp"
> >>
> >>   DEPENDS =3D " \
> >> @@ -69,6 +71,13 @@ do_compile() {
> >>        oe_runmake binaries
> >>   }
> >>
> >> +do_compile_ptest() {
> >> +    set +e
> >> +
> >> +    cd ${S}/src/import
> >> +
> >> +    oe_runmake test-binaries
> >> +}
> >>   SYSTEMD_PACKAGES =3D
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
> >>   SYSTEMD_SERVICE:${PN} =3D
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','crio.service','',d)}"
> >>   SYSTEMD_AUTO_ENABLE:${PN} =3D "enable"
> >> @@ -100,6 +109,14 @@ do_install() {
> >>       install -d ${D}${localstatedir}/lib/crio
> >>   }
> >>
> >> +do_install_ptest() {
> >> +    install -d ${D}${PTEST_PATH}/test
> >> +    install -d ${D}${PTEST_PATH}/bin
> >> +    install -d ${D}${PTEST_PATH}/vendor
> >> +    cp -rf ${S}/src/import/test ${D}${PTEST_PATH}
> >> +    cp -rf ${S}/src/import/bin ${D}${PTEST_PATH}
> >> +    cp -rf ${S}/src/import/vendor ${D}${PTEST_PATH}
> >> +}
> > I'm curious. Why does the vendor directory need to be
> > copied / installed for the ptest ?
> The ctr_seccomp.bats test requires a JSON file located at
> vendor/github.com/containers/common/pkg/seccomp/seccomp.json. This file
> is accessed via the CONTAINER_SECCOMP_PROFILE environment variable,
> which defaults to the path within the vendor directory. Although this
> variable can be overridden with a custom-defined path, the default
> configuration relies on the vendor directory.
> =EF=BB=BFThis dependency contributes to only two sub-tests passing within=
 the
> suite. I share your concern about whether this folder should be
> included. Another option is to allow ctr_seccomp.bats to fail by default
> if the vendor directory is not installed.
> =EF=BB=BFWould you recommend keeping the directory or accept the tests fa=
iled to
> avoid requiring the vendor directory?
>

What else is in the vendor/ subdirectory (I haven't gone to check) ?
I'm ok with files being installed into a default location that the test
will check, but I want to be sure that it is only those files.

So I'd want just the files we need from vendor/ installed, and a comment
above the install line indicating that "test < ... > requires these files.

>
> >>   FILES:${PN}-config =3D "${sysconfdir}/crio/config/*"
> >>   FILES:${PN} +=3D "${systemd_unitdir}/system/*"
> >>   FILES:${PN} +=3D "/usr/local/bin/*"
> >> @@ -109,7 +126,23 @@ FILES:${PN} +=3D "/usr/share/containers/oci/hooks=
.d"
> >>   ALLOW_EMPTY:${PN} =3D "1"
> >>
> >>   INSANE_SKIP:${PN} +=3D "ldflags already-stripped textrel"
> >> +INSANE_SKIP:${PN}-ptest +=3D "textrel"
> >>
> >> -deltask compile_ptest_base
> >> +RDEPENDS:${PN}-ptest +=3D " \
> >> +    bash \
> >> +    bats \
> >> +    cni \
> >> +    crictl \
> >> +    bind-utils \
> >> +    coreutils \
> >> +    dbus-daemon-proxy \
> >> +    iproute2 \
> >> +    util-linux-unshare \
> >> +    jq \
> >> +    ipcalc \
> >> +    slirp4netns \
> >> +    parallel \
> >> +    podman \
> >> +"
> > This is an extensive list of rdepends for a ptest.
> > What exactly is it testing ? I think we need to document
> > in a README what exactly is being tested, since this
> > dependency list tells me that it is not trivial and it
> > will be prone to breakage.
> Given the suite's complexity, documenting the detailed purpose of each
> dependency would be challenging and potentially incomplete, as many
> dependencies are used across multiple tests.  However, I agree that a
> README summarizing the primary focus areas of the tests (e.g.,
> networking, security, etc.) could provide clarity and help maintainabilit=
y.
>
> =EF=BB=BFLet me know if you=E2=80=99d prefer a high-level summary of the =
tests or
> additional details in the README.
>

Just a summary of the high level goals and focus of the tests will
be enough for me. I agree that anything overly detailed will just get
out of date, and be a maintenance burden.

That list of dependencies basically says "This needs an complete
distribution to tests" .. and that is fine since it is contained to the
ptests. I just want to document what we know about those
dependencies. (since I will forget).

Bruce


>
> //Peng
>
> > Bruce
> >
> >>   COMPATIBLE_HOST =3D "^(?!(qemu)?mips).*"
> >> diff --git
> a/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patc=
h
> b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patc=
h
> >> new file mode 100644
> >> index 00000000..c6be41f0
> >> --- /dev/null
> >> +++
> b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patc=
h
> >> @@ -0,0 +1,31 @@
> >> +From 0bf230f59d211044e7993543e010b0d7f9dcead3 Mon Sep 17 00:00:00 200=
1
> >> +From: Peng Zhang <peng.zhang1.cn@windriver.com>
> >> +Date: Fri, 25 Oct 2024 10:42:02 +0800
> >> +Subject: [PATCH] Add --trimpath to build nri.test
> >> +
> >> +when build test-binary, TMPDIR[buildpaths] error found in nri.test
> >> +to fix this error, add "--trimpath" option to build nri.test.
> >> +
> >> +Upstream-Status: Inappropriate [oe specific]
> >> +
> >> +Signed-off-by: Peng Zhang <peng.zhang1.cn@windriver.com>
> >> +---
> >> + Makefile | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +Index:
> cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import/Makef=
ile
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +---
> cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae.orig/src/import/=
Makefile
> >> ++++
> cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import/Makef=
ile
> >> +@@ -169,7 +169,7 @@ test/checkcriu/checkcriu: $(GO_FILES)
> >> +     $(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@
> ./test/checkcriu
> >> +
> >> + test/nri/nri.test: $(wildcard test/nri/*.go)
> >> +-    $(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@
> >> ++    $(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@
> ${TRIMPATH}
> >> +
> >> + bin/crio: $(GO_FILES)
> >> +     $(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@
> ./cmd/crio
> >> +--
> >> +2.34.1
> >> +
> >> diff --git a/recipes-containers/cri-o/files/run-ptest
> b/recipes-containers/cri-o/files/run-ptest
> >> new file mode 100644
> >> index 00000000..62abe959
> >> --- /dev/null
> >> +++ b/recipes-containers/cri-o/files/run-ptest
> >> @@ -0,0 +1,11 @@
> >> +#!/bin/sh
> >> +
> >> +./test/test_runner.sh | while IFS=3D read -r line; do
> >> +     if [[ $line =3D~ ^not\ ok ]]; then
> >> +             echo "FAIL: ${line#not ok }"
> >> +     elif [[ $line =3D~ ^ok && ! $line =3D~ \#\ skip ]]; then
> >> +             echo "PASS: ${line#ok }"
> >> +     elif [[ $line =3D~ ^ok.*#\ skip ]]; then
> >> +             echo "SKIP: ${line#ok }"
> >> +     fi
> >> +done
> >> --
> >> 2.35.5
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#8971):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8971
> >> Mute This Topic: https://lists.yoctoproject.org/mt/109593003/1050810
> >> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b
> [bruce.ashfield@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000007b9f4e06276cc0d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Nov 21, 2024 at 4:13=E2=80=AFAM Zhang, Peng=
 (Paul) (CN) &lt;<a href=3D"mailto:peng.zhang1.cn@windriver.com">peng.zhang=
1.cn@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><br>
On 11/21/2024 12:34 PM, Bruce Ashfield wrote:<br>
&gt; CAUTION: This email comes from a non Wind River email account!<br>
&gt; Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.<br>
&gt;<br>
&gt; In message: [meta-virtualization][PATCH] cri-o: enable ptest<br>
&gt; on 15/11/2024 Zhang, Peng (Paul) (CN) via <a href=3D"http://lists.yoct=
oproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</=
a> wrote:<br>
&gt;<br>
&gt;&gt; From: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@windriver.co=
m" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; The ptest build for cri-o was previously disabled due to issues<br=
>
&gt;&gt; introduced with Go 1.11, which borken the build process. With the<=
br>
&gt;&gt; current Go version, these issues no longer occur, and the ptest bu=
ild is<br>
&gt;&gt; now functional.<br>
&gt;&gt; This commit enables ptest support and resolves the &quot;TMPDIR<br=
>
&gt;&gt; [buildpaths]&quot; issue encountered during the ptest build proces=
s.<br>
&gt; Can you include a log of the ptest running in the commit log ?<br>
&gt; That way the baseline pass/fail is understood and captured.<br>
The CRI-O ptest suite consists of a total of 382 tests. Including the <br>
entire test results in the commit message would make it overly <br>
cumbersome and difficult to navigate. Instead, I propose including only <br=
>
the list of failed and skipped tests in the commit message, as these <br>
provide the most critical information.<br></blockquote><div><br></div><div>=
<div class=3D"gmail_default" style=3D"font-size:small">That&#39;s acceptabl=
e for me. If we just put the total number of tests,</div><div class=3D"gmai=
l_default" style=3D"font-size:small">a general overview of the types of tes=
ting and then anything</div><div class=3D"gmail_default" style=3D"font-size=
:small">notable (notable here being the skipped or failed tests), then we</=
div><div class=3D"gmail_default" style=3D"font-size:small">have a good refe=
rence for the initial state.</div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
=EF=BB=BFAlternatively, the full test results could be stored in a README o=
r <br>
another documentation file. This approach ensures the comprehensive test <b=
r>
results are preserved as a baseline without bloating the commit message.<br=
>
=EF=BB=BFWould you prefer the abbreviated results in the commit message, or=
 a <br>
detailed log stored in a separate file?<br></blockquote><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">See above. Just the=
 summary in the commit, and a README with</div><div class=3D"gmail_default"=
 style=3D"font-size:small">the initial status of the tests stored in a log =
file.</div></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
&gt;<br>
&gt;&gt; Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.cn@win=
driver.com" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0recipes-containers/cri-o/<a href=3D"http://cri-o_git.b=
b" rel=3D"noreferrer" target=3D"_blank">cri-o_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 37 ++++++++++++++++++-<br>
&gt;&gt;=C2=A0 =C2=A0.../0001-Add-trimpath-to-build-nri.test.patch | 31 +++=
+++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0recipes-containers/cri-o/files/run-ptest=C2=A0 =C2=A0 =
=C2=A0 | 11 ++++++<br>
&gt;&gt;=C2=A0 =C2=A03 files changed, 77 insertions(+), 2 deletions(-)<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644 recipes-containers/cri-o/files/0001=
-Add-trimpath-to-build-nri.test.patch<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644 recipes-containers/cri-o/files/run-=
ptest<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/recipes-containers/cri-o/<a href=3D"http://cri-o_git.=
bb" rel=3D"noreferrer" target=3D"_blank">cri-o_git.bb</a> b/recipes-contain=
ers/cri-o/<a href=3D"http://cri-o_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">cri-o_git.bb</a><br>
&gt;&gt; index efc86fbe..596a43e2 100644<br>
&gt;&gt; --- a/recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" rel=
=3D"noreferrer" target=3D"_blank">cri-o_git.bb</a><br>
&gt;&gt; +++ b/recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" rel=
=3D"noreferrer" target=3D"_blank">cri-o_git.bb</a><br>
&gt;&gt; @@ -17,7 +17,9 @@ At a high level, we expect the scope of cri-o to=
 be restricted to the following<br>
&gt;&gt;=C2=A0 =C2=A0SRCREV_cri-o =3D &quot;20c06a19cb395445620c31730c0f1a0=
a1922eaae&quot;<br>
&gt;&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/kube=
rnetes-sigs/cri-o.git;branch=3Drelease-1.31;name=3Dcri-o;protocol=3Dhttps;d=
estsuffix=3D$%7BGO_SRCURI_DESTSUFFIX%7D" rel=3D"noreferrer" target=3D"_blan=
k">github.com/kubernetes-sigs/cri-o.git;branch=3Drelease-1.31;name=3Dcri-o;=
protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}</a> \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Add-trimpath-to-build-nri=
.test.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://crio.conf \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0# Apache-2.0 for docker<br>
&gt;&gt; @@ -28,7 +30,7 @@ GO_IMPORT =3D &quot;import&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0PV =3D &quot;1.31.0+git${SRCREV_cri-o}&quot;<br>
&gt;&gt;<br>
&gt;&gt; -inherit features_check<br>
&gt;&gt; +inherit features_check ptest<br>
&gt;&gt;=C2=A0 =C2=A0REQUIRED_DISTRO_FEATURES ?=3D &quot;seccomp&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0DEPENDS =3D &quot; \<br>
&gt;&gt; @@ -69,6 +71,13 @@ do_compile() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake binaries<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; +do_compile_ptest() {<br>
&gt;&gt; +=C2=A0 =C2=A0 set +e<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 cd ${S}/src/import<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 oe_runmake test-binaries<br>
&gt;&gt; +}<br>
&gt;&gt;=C2=A0 =C2=A0SYSTEMD_PACKAGES =3D &quot;${@bb.utils.contains(&#39;D=
ISTRO_FEATURES&#39;,&#39;systemd&#39;,&#39;${PN}&#39;,&#39;&#39;,d)}&quot;<=
br>
&gt;&gt;=C2=A0 =C2=A0SYSTEMD_SERVICE:${PN} =3D &quot;${@bb.utils.contains(&=
#39;DISTRO_FEATURES&#39;,&#39;systemd&#39;,&#39;crio.service&#39;,&#39;&#39=
;,d)}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0SYSTEMD_AUTO_ENABLE:${PN} =3D &quot;enable&quot;<br>
&gt;&gt; @@ -100,6 +109,14 @@ do_install() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${localstatedir}/lib/crio=
<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; +do_install_ptest() {<br>
&gt;&gt; +=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/test<br>
&gt;&gt; +=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/bin<br>
&gt;&gt; +=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/vendor<br>
&gt;&gt; +=C2=A0 =C2=A0 cp -rf ${S}/src/import/test ${D}${PTEST_PATH}<br>
&gt;&gt; +=C2=A0 =C2=A0 cp -rf ${S}/src/import/bin ${D}${PTEST_PATH}<br>
&gt;&gt; +=C2=A0 =C2=A0 cp -rf ${S}/src/import/vendor ${D}${PTEST_PATH}<br>
&gt;&gt; +}<br>
&gt; I&#39;m curious. Why does the vendor directory need to be<br>
&gt; copied / installed for the ptest ?<br>
The ctr_seccomp.bats test requires a JSON file located at <br>
vendor/<a href=3D"http://github.com/containers/common/pkg/seccomp/seccomp.j=
son" rel=3D"noreferrer" target=3D"_blank">github.com/containers/common/pkg/=
seccomp/seccomp.json</a>. This file <br>
is accessed via the CONTAINER_SECCOMP_PROFILE environment variable, <br>
which defaults to the path within the vendor directory. Although this <br>
variable can be overridden with a custom-defined path, the default <br>
configuration relies on the vendor directory.<br>
=EF=BB=BFThis dependency contributes to only two sub-tests passing within t=
he <br>
suite. I share your concern about whether this folder should be <br>
included. Another option is to allow ctr_seccomp.bats to fail by default <b=
r>
if the vendor directory is not installed.<br>
=EF=BB=BFWould you recommend keeping the directory or accept the tests fail=
ed to <br>
avoid requiring the vendor directory?<br></blockquote><div><br></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">What else is in the v=
endor/ subdirectory (I haven&#39;t gone to check) ?</div><div class=3D"gmai=
l_default" style=3D"font-size:small">I&#39;m ok with files being installed =
into a default location that the test</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">will check, but I want to be sure that it is only th=
ose files.</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">So I&#39;d wan=
t just the files we need from vendor/ installed, and a comment</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">above the install line indi=
cating that &quot;test &lt; ... &gt; requires these files.</div></div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt;&gt;=C2=A0 =C2=A0FILES:${PN}-config =3D &quot;${sysconfdir}/crio/config=
/*&quot;<br>
&gt;&gt;=C2=A0 =C2=A0FILES:${PN} +=3D &quot;${systemd_unitdir}/system/*&quo=
t;<br>
&gt;&gt;=C2=A0 =C2=A0FILES:${PN} +=3D &quot;/usr/local/bin/*&quot;<br>
&gt;&gt; @@ -109,7 +126,23 @@ FILES:${PN} +=3D &quot;/usr/share/containers/=
oci/hooks.d&quot;<br>
&gt;&gt;=C2=A0 =C2=A0ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0INSANE_SKIP:${PN} +=3D &quot;ldflags already-stripped =
textrel&quot;<br>
&gt;&gt; +INSANE_SKIP:${PN}-ptest +=3D &quot;textrel&quot;<br>
&gt;&gt;<br>
&gt;&gt; -deltask compile_ptest_base<br>
&gt;&gt; +RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt;&gt; +=C2=A0 =C2=A0 bash \<br>
&gt;&gt; +=C2=A0 =C2=A0 bats \<br>
&gt;&gt; +=C2=A0 =C2=A0 cni \<br>
&gt;&gt; +=C2=A0 =C2=A0 crictl \<br>
&gt;&gt; +=C2=A0 =C2=A0 bind-utils \<br>
&gt;&gt; +=C2=A0 =C2=A0 coreutils \<br>
&gt;&gt; +=C2=A0 =C2=A0 dbus-daemon-proxy \<br>
&gt;&gt; +=C2=A0 =C2=A0 iproute2 \<br>
&gt;&gt; +=C2=A0 =C2=A0 util-linux-unshare \<br>
&gt;&gt; +=C2=A0 =C2=A0 jq \<br>
&gt;&gt; +=C2=A0 =C2=A0 ipcalc \<br>
&gt;&gt; +=C2=A0 =C2=A0 slirp4netns \<br>
&gt;&gt; +=C2=A0 =C2=A0 parallel \<br>
&gt;&gt; +=C2=A0 =C2=A0 podman \<br>
&gt;&gt; +&quot;<br>
&gt; This is an extensive list of rdepends for a ptest.<br>
&gt; What exactly is it testing ? I think we need to document<br>
&gt; in a README what exactly is being tested, since this<br>
&gt; dependency list tells me that it is not trivial and it<br>
&gt; will be prone to breakage.<br>
Given the suite&#39;s complexity, documenting the detailed purpose of each =
<br>
dependency would be challenging and potentially incomplete, as many <br>
dependencies are used across multiple tests.=C2=A0 However, I agree that a =
<br>
README summarizing the primary focus areas of the tests (e.g., <br>
networking, security, etc.) could provide clarity and help maintainability.=
<br>
<br>
=EF=BB=BFLet me know if you=E2=80=99d prefer a high-level summary of the te=
sts or <br>
additional details in the README.<br></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">Just a summary of the hig=
h level goals and focus of the tests will</div><div class=3D"gmail_default"=
 style=3D"font-size:small">be enough for me. I agree that anything overly d=
etailed will just get</div><div class=3D"gmail_default" style=3D"font-size:=
small">out of date, and be a maintenance burden.</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">That list of dependencies basically says &quot;This=
 needs an complete</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">distribution to tests&quot; .. and that is fine since it is contained t=
o the</div><div class=3D"gmail_default" style=3D"font-size:small">ptests. I=
 just want to document what we know about those</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">dependencies. (since I will forget).</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
//Peng<br>
<br>
&gt; Bruce<br>
&gt;<br>
&gt;&gt;=C2=A0 =C2=A0COMPATIBLE_HOST =3D &quot;^(?!(qemu)?mips).*&quot;<br>
&gt;&gt; diff --git a/recipes-containers/cri-o/files/0001-Add-trimpath-to-b=
uild-nri.test.patch b/recipes-containers/cri-o/files/0001-Add-trimpath-to-b=
uild-nri.test.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 00000000..c6be41f0<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nr=
i.test.patch<br>
&gt;&gt; @@ -0,0 +1,31 @@<br>
&gt;&gt; +From 0bf230f59d211044e7993543e010b0d7f9dcead3 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Peng Zhang &lt;<a href=3D"mailto:peng.zhang1.cn@windriver.c=
om" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
&gt;&gt; +Date: Fri, 25 Oct 2024 10:42:02 +0800<br>
&gt;&gt; +Subject: [PATCH] Add --trimpath to build nri.test<br>
&gt;&gt; +<br>
&gt;&gt; +when build test-binary, TMPDIR[buildpaths] error found in nri.tes=
t<br>
&gt;&gt; +to fix this error, add &quot;--trimpath&quot; option to build nri=
.test.<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Inappropriate [oe specific]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Peng Zhang &lt;<a href=3D"mailto:peng.zhang1.cn@wi=
ndriver.com" target=3D"_blank">peng.zhang1.cn@windriver.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + Makefile | 2 +-<br>
&gt;&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; +<br>
&gt;&gt; +Index: cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/s=
rc/import/Makefile<br>
&gt;&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; +--- cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae.orig=
/src/import/Makefile<br>
&gt;&gt; ++++ cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/=
import/Makefile<br>
&gt;&gt; +@@ -169,7 +169,7 @@ test/checkcriu/checkcriu: $(GO_FILES)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags &q=
uot;$(BUILDTAGS)&quot; -o $@ ./test/checkcriu<br>
&gt;&gt; +<br>
&gt;&gt; + test/nri/nri.test: $(wildcard test/nri/*.go)<br>
&gt;&gt; +-=C2=A0 =C2=A0 $(GO) test --tags &quot;test $(BUILDTAGS)&quot; -c=
 ./test/nri -o $@<br>
&gt;&gt; ++=C2=A0 =C2=A0 $(GO) test --tags &quot;test $(BUILDTAGS)&quot; -c=
 ./test/nri -o $@ ${TRIMPATH}<br>
&gt;&gt; +<br>
&gt;&gt; + bin/crio: $(GO_FILES)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags &q=
uot;$(BUILDTAGS)&quot; -o $@ ./cmd/crio<br>
&gt;&gt; +--<br>
&gt;&gt; +2.34.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/recipes-containers/cri-o/files/run-ptest b/recipes-co=
ntainers/cri-o/files/run-ptest<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 00000000..62abe959<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/recipes-containers/cri-o/files/run-ptest<br>
&gt;&gt; @@ -0,0 +1,11 @@<br>
&gt;&gt; +#!/bin/sh<br>
&gt;&gt; +<br>
&gt;&gt; +./test/test_runner.sh | while IFS=3D read -r line; do<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0if [[ $line =3D~ ^not\ ok ]]; then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;FAIL: =
${line#not ok }&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0elif [[ $line =3D~ ^ok &amp;&amp; ! $line =3D=
~ \#\ skip ]]; then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;PASS: =
${line#ok }&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0elif [[ $line =3D~ ^ok.*#\ skip ]]; then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;SKIP: =
${line#ok }&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; +done<br>
&gt;&gt; --<br>
&gt;&gt; 2.35.5<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#8971): <a href=3D"https://lists.yoctoproject.o=
rg/g/meta-virtualization/message/8971" rel=3D"noreferrer" target=3D"_blank"=
>https://lists.yoctoproject.org/g/meta-virtualization/message/8971</a><br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/1095=
93003/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/mt/109593003/1050810</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.y=
octoproject.org" target=3D"_blank">meta-virtualization+owner@lists.yoctopro=
ject.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virt=
ualization/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctop=
roject.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfiel=
d@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000007b9f4e06276cc0d0--

