Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8BEC4167B
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 12:17:33 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web08.40063.1666009052621209873
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 05:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W205M3h8;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id 137so8833309iou.9
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Oct 2022 05:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=89M5iXok/e1W+gfqfsJeAyOfLibYDjdITYT2C1pQYEo=;
        b=W205M3h8ljV4wbfabP2LLeWKBDePpMVnTCzThAX6VIXUS5qgsNssbB4AkaiLp6or8N
         CNqeJNe944OZnWVuJN50Pk68C6GG7xFYShfqKE4Av5erGd5SFtSFWpy1PkO/FEJds04f
         iFRdDHJzcgwCYWTMq9ZUvJsbkuvHIpZDw1I8SLGSVg11BKntoFRjt2J0/ukIqmUDJmR8
         c7ZEqynOqVTTYs04d1axQg3jjoqFGGe3dxfM7wmVODXhE1kEFzRKV4qf6aCBCVnREwzG
         Osxkd/tH1spP5jvnhe6o20MxVQDvf0UK71nVkhsnDYeLwjF3tc07IE6CZ0ev4/Xr2kHd
         AM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89M5iXok/e1W+gfqfsJeAyOfLibYDjdITYT2C1pQYEo=;
        b=KLguRyMZZyfhKlbAJFkZS/WUmsitnQQOkcOLONU9SMsr4+WQiNgEukZDwliL2EOSG+
         u3rZbLSdJ2nfUNdZL0Hqp1R/qkiY1RPfUawPD3XH2VMSIDqiGX6a+IaoiULs87Kf4k/0
         OSPgs21kKVpId7BzElY93bpPGgTbynZiSxzW3rYfmHwh2+h1WC7CFaodEhqQwBpeZklL
         gsWEEf7S6NeMcOjzW1jurlpzSruGc8OhCTJkzf3QHpJ2bc+dCrdTalKIWWSWOX/UNUuk
         ow+XTV4oR4v/SqeCQI/FB5ci6W+2Og8twshyXxWjHNIjhoMWxETO7gv5I1D0k+BaVChN
         Dx4g==
X-Gm-Message-State: ACrzQf3J8LgHltOxHDKIzzXq/2IZcvr1jOiI7RdTcNRB0+yKWJpqjU57
	JaGARgG25LSR7GjWjg6UinU6eAGMDPQFE+uJ/Ts=
X-Google-Smtp-Source: AMsMyM579XkUeYtVWcx3PPWZ0rYcTU7TRhVV3QaCAOojRC4XaA438JQa/digwj118rGBsOfWkbeBGgPhUaXv7AUMu3s=
X-Received: by 2002:a05:6638:1414:b0:363:dd47:4555 with SMTP id
 k20-20020a056638141400b00363dd474555mr5066356jad.9.1666009051925; Mon, 17 Oct
 2022 05:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221017111121.25341-1-vasileios.anagnostopoulos@siemens.com>
 <171ED6ED0A693A56.19083@lists.yoctoproject.org> <DB6PR1001MB1285C664112541F2BCA24A60FA299@DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB6PR1001MB1285C664112541F2BCA24A60FA299@DB6PR1001MB1285.EURPRD10.PROD.OUTLOOK.COM>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Oct 2022 08:17:20 -0400
Message-ID: <CADkTA4PVr5NYa1DaLofsMgCxNkoXza_MQ4f7k5jAcC4NbxLGSg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 7/7] aardvark-dns: Add ptest support
To: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000bb90c405eb39f591"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Oct 2022 12:17:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7662

--000000000000bb90c405eb39f591
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 17, 2022 at 7:16 AM Vasileios Anagnostopoulos <
vasileios.anagnostopoulos@siemens.com> wrote:

> Hello Everyone,
>
> Some background for the patches that I send.
> I am continuing the initial work from Pascal with netavark and I adapted
> the podman recipe to integrate with netavark, aardvark-dns and crun. To
> activate them, it has to be done probably from your distro overwrites and
> do something like:
> ```
> DEFAULT_CONTAINER_RUNTIME:pn-podman = "crun"
> DEFAULT_NETWORK_STACK:pn-podman = "netavark"
> ```
>

See my comment on the patch introducing this variable.

There's already pending work in this area, so I won't merge those specific
variables as they are. You'll have to carry them locally until the
namespace work is done, and they are uniform across multiple recipes and
package groups.


> For the moment I kept the backwards compatibility and it is an opt-in
> change. But maybe we should consider changing the default behaviour,
> because fedora is already shipping with crun, netavark, and aardvark-dns by
> default.
>
>
The default is unlikely to change in the short to medium term.  Yes, Redhat
likes to take podman in their own direction, but the defaults were created
to follow the wider cloud native direction, and that's where they'll stay
for the time being.



> Furthermore, I had some problems with the tests (even without my changes).
> When I tried to execute the podman tests in the device I was getting:
> ```
> START: ptest-runner
> 2022-10-17T09:38
> BEGIN: /usr/lib/podman/ptest
> Makefile:176: *** Required variable NATIVE_GOOS value is undefined,
> whitespace, or empty.  Stop.
>
> ERROR: Exit status is 2
> DURATION: 0
> END: /usr/lib/podman/ptest
> 2022-10-17T09:38
> STOP: ptest-runner
> TOTAL: 1 FAIL: 1
> ```
> It is a minor problem, but even when I executed the tests manually I still
> had many of them failing
>
> ```
> root@cxg3:~# cd /usr/lib/podman/ptest
> root@cxg3:/usr/lib/podman/ptest# bats ./test/system/ ...
> 373 tests, 77 failures, 38 skipped, 15 not run
>  ```
>
> Do we have to set up the device in a specific way? Is there an example on
> how to deploy podman on a device?
>

Nothing specific. I did a demo for ELCe that used podman for deployment.
Nothing more than the podman packages (and supporting kernel modules) were
installed on top of core-image-minimal for those demos.


>
> Finally, I was wondering if there are any plans on back-porting podman 4.2
> to the kirkstone branch? Is that something of interest, or do we prefer to
> avoid it?
>

Only 3rd 'dot' upgraces on released branches, so 4.2 wouldn't be backported.

I have a whole series of updates to most of the meta-virt packages under
test in master, but unless they fall into that "bugfix release" category,
they'll just stay on master in preparation for the next release. Those
should show up in master-next shortly, if anyone reading this is interested
:)

Bruce



>
> Kind regards,
> Vasileios
>
> -----Original Message-----
> From: meta-virtualization@lists.yoctoproject.org <
> meta-virtualization@lists.yoctoproject.org> On Behalf Of Vasileios
> Anagnostopoulos via lists.yoctoproject.org
> Sent: Monday, 17 October 2022 13:11
> To: meta-virtualization@lists.yoctoproject.org
> Cc: Anagnostopoulos, Vasileios (SI BP R&D ZG FW ITW) <
> vasileios.anagnostopoulos@siemens.com>
> Subject: [meta-virtualization][PATCH 7/7] aardvark-dns: Add ptest support
>
> ---
>  .../aardvark-dns/aardvark-dns.inc             | 24 +++++++++++++++++++
>  .../aardvark-dns/files/run-ptest              |  3 +++
>  2 files changed, 27 insertions(+)
>  create mode 100644 recipes-containers/aardvark-dns/files/run-ptest
>
> diff --git a/recipes-containers/aardvark-dns/aardvark-dns.inc
> b/recipes-containers/aardvark-dns/aardvark-dns.inc
> index 4123a2d..70c94dd 100644
> --- a/recipes-containers/aardvark-dns/aardvark-dns.inc
> +++ b/recipes-containers/aardvark-dns/aardvark-dns.inc
> @@ -1,6 +1,30 @@
> +inherit ptest
> +
> +SRC_URI += " \
> +    file://run-ptest \
> +"
> +
>  # Cargo installs the binary to bin so move it to where podman expects it
>  do_install:append() {
>      install -d ${D}${libexecdir}/podman/
>      mv ${D}${bindir}/* ${D}${libexecdir}/podman/
>      rm -rf ${D}${bindir}/
>  }
> +
> +
> +do_install_ptest () {
> +       cp -r ${S}/test ${D}${PTEST_PATH}
> +}
> +
> +RDEPENDS:${PN}-ptest += " \
> +    bats \
> +    bash \
> +    coreutils \
> +    jq \
> +    iproute2 \
> +    slirp4netns \
> +    dbus-daemon-proxy \
> +    util-linux-unshare \
> +    bind-utils \
> +    ipcalc \
> +"
> diff --git a/recipes-containers/aardvark-dns/files/run-ptest
> b/recipes-containers/aardvark-dns/files/run-ptest
> new file mode 100644
> index 0000000..b33d8fd
> --- /dev/null
> +++ b/recipes-containers/aardvark-dns/files/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/bash
> +
> +NETAVARK=/usr/libexec/podman/netavark
> +AARDVARK=/usr/libexec/podman/aardvark-dns bats ./test/
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7660):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7660
> Mute This Topic: https://lists.yoctoproject.org/mt/94381678/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000bb90c405eb39f591
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Oct 17, 2022 at 7:16 AM Vasileios Anagnosto=
poulos &lt;<a href=3D"mailto:vasileios.anagnostopoulos@siemens.com">vasilei=
os.anagnostopoulos@siemens.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hello Everyone,<br>
<br>
Some background for the patches that I send.<br>
I am continuing the initial work from Pascal with netavark and I adapted th=
e podman recipe to integrate with netavark, aardvark-dns and crun. To activ=
ate them, it has to be done probably from your distro overwrites and do som=
ething like:<br>
```<br>
DEFAULT_CONTAINER_RUNTIME:pn-podman =3D &quot;crun&quot;<br>
DEFAULT_NETWORK_STACK:pn-podman =3D &quot;netavark&quot;<br>
```<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">See my comment on the patch introducing this variable.=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">There&#39;s already pend=
ing work in this area, so I won&#39;t merge those specific variables as the=
y are. You&#39;ll have to carry them locally until the namespace work is do=
ne, and they are uniform across multiple recipes and package groups.</div><=
div class=3D"gmail_default" style=3D"font-size:small"></div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
For the moment I kept the backwards compatibility and it is an opt-in chang=
e. But maybe we should consider changing the default behaviour, because fed=
ora is already shipping with crun, netavark, and aardvark-dns by default.<b=
r>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">The default is unlikely to change in the short to medium t=
erm.=C2=A0 Yes, Redhat likes to take podman in their own direction, but the=
 defaults were created to follow the wider cloud native direction, and that=
&#39;s where they&#39;ll stay for the time being.</div></div><div><br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Furthermore, I had some problems with the tests (even without my changes). =
When I tried to execute the podman tests in the device I was getting:<br>
```<br>
START: ptest-runner<br>
2022-10-17T09:38<br>
BEGIN: /usr/lib/podman/ptest<br>
Makefile:176: *** Required variable NATIVE_GOOS value is undefined, whitesp=
ace, or empty.=C2=A0 Stop.<br>
<br>
ERROR: Exit status is 2<br>
DURATION: 0<br>
END: /usr/lib/podman/ptest<br>
2022-10-17T09:38<br>
STOP: ptest-runner<br>
TOTAL: 1 FAIL: 1<br>
```<br>
It is a minor problem, but even when I executed the tests manually I still =
had many of them failing<br>
<br>
```<br>
root@cxg3:~# cd /usr/lib/podman/ptest<br>
root@cxg3:/usr/lib/podman/ptest# bats ./test/system/ ...<br>
373 tests, 77 failures, 38 skipped, 15 not run<br>
=C2=A0``` <br>
<br>
Do we have to set up the device in a specific way? Is there an example on h=
ow to deploy podman on a device?<br></blockquote><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Nothing specific. I did a =
demo for ELCe that used podman for deployment. Nothing more than the podman=
 packages (and supporting kernel modules) were installed on top of core-ima=
ge-minimal for those demos.</div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Finally, I was wondering if there are any plans on back-porting podman 4.2 =
to the kirkstone branch? Is that something of interest, or do we prefer to =
avoid it?<br></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">Only 3rd &#39;dot&#39; upgraces on released branc=
hes, so 4.2 wouldn&#39;t be backported.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">I have a whole series of updates to most of the meta-virt pa=
ckages under test in master, but unless they fall into that &quot;bugfix re=
lease&quot; category, they&#39;ll just stay on master in preparation for th=
e next release. Those should show up in master-next shortly, if anyone read=
ing this is interested :)</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>Bruce </div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
Kind regards,<br>
Vasileios<br>
<br>
-----Original Message-----<br>
From: <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" target=
=3D"_blank">meta-virtualization@lists.yoctoproject.org</a> &lt;<a href=3D"m=
ailto:meta-virtualization@lists.yoctoproject.org" target=3D"_blank">meta-vi=
rtualization@lists.yoctoproject.org</a>&gt; On Behalf Of Vasileios Anagnost=
opoulos via <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" ta=
rget=3D"_blank">lists.yoctoproject.org</a><br>
Sent: Monday, 17 October 2022 13:11<br>
To: <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" target=3D=
"_blank">meta-virtualization@lists.yoctoproject.org</a><br>
Cc: Anagnostopoulos, Vasileios (SI BP R&amp;D ZG FW ITW) &lt;<a href=3D"mai=
lto:vasileios.anagnostopoulos@siemens.com" target=3D"_blank">vasileios.anag=
nostopoulos@siemens.com</a>&gt;<br>
Subject: [meta-virtualization][PATCH 7/7] aardvark-dns: Add ptest support<b=
r>
<br>
---<br>
=C2=A0.../aardvark-dns/aardvark-dns.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 24 +++++++++++++++++++<br>
=C2=A0.../aardvark-dns/files/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 3 +++<br>
=C2=A02 files changed, 27 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/aardvark-dns/files/run-ptest<br=
>
<br>
diff --git a/recipes-containers/aardvark-dns/aardvark-dns.inc b/recipes-con=
tainers/aardvark-dns/aardvark-dns.inc<br>
index 4123a2d..70c94dd 100644<br>
--- a/recipes-containers/aardvark-dns/aardvark-dns.inc<br>
+++ b/recipes-containers/aardvark-dns/aardvark-dns.inc<br>
@@ -1,6 +1,30 @@<br>
+inherit ptest<br>
+<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 file://run-ptest \<br>
+&quot;<br>
+<br>
=C2=A0# Cargo installs the binary to bin so move it to where podman expects=
 it<br>
=C2=A0do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${libexecdir}/podman/<br>
=C2=A0 =C2=A0 =C2=A0mv ${D}${bindir}/* ${D}${libexecdir}/podman/<br>
=C2=A0 =C2=A0 =C2=A0rm -rf ${D}${bindir}/<br>
=C2=A0}<br>
+<br>
+<br>
+do_install_ptest () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${S}/test ${D}${PTEST_PATH}<br>
+}<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot; \<br>
+=C2=A0 =C2=A0 bats \<br>
+=C2=A0 =C2=A0 bash \<br>
+=C2=A0 =C2=A0 coreutils \<br>
+=C2=A0 =C2=A0 jq \<br>
+=C2=A0 =C2=A0 iproute2 \<br>
+=C2=A0 =C2=A0 slirp4netns \<br>
+=C2=A0 =C2=A0 dbus-daemon-proxy \<br>
+=C2=A0 =C2=A0 util-linux-unshare \<br>
+=C2=A0 =C2=A0 bind-utils \<br>
+=C2=A0 =C2=A0 ipcalc \<br>
+&quot;<br>
diff --git a/recipes-containers/aardvark-dns/files/run-ptest b/recipes-cont=
ainers/aardvark-dns/files/run-ptest<br>
new file mode 100644<br>
index 0000000..b33d8fd<br>
--- /dev/null<br>
+++ b/recipes-containers/aardvark-dns/files/run-ptest<br>
@@ -0,0 +1,3 @@<br>
+#!/bin/bash<br>
+<br>
+NETAVARK=3D/usr/libexec/podman/netavark <br>
+AARDVARK=3D/usr/libexec/podman/aardvark-dns bats ./test/<br>
--<br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7660): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7660" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7660</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/94381678/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/94381678/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000bb90c405eb39f591--

