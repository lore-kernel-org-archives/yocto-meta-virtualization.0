Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9591BE00DC6; Fri, 17 Jun 2016 05:36:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.218.65 listed in list.dnswl.org]
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
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 104D0E00DB6
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Jun 2016 05:36:33 -0700 (PDT)
Received: by mail-oi0-f65.google.com with SMTP id e205so13437640oig.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Jun 2016 05:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NnpKv2Wu1kgCmML2DZ1f8WwXv5R4hzZggFvuqresHJ0=;
	b=BGkmR8S0OxtbklWSwrVd/NYXR802j5InMtzsDi1sgAO45L4nt1Q9yStfqYmgt7X5FI
	XhiQI8vQqcBOsAqqPXNiodFbF63c/+L4k+vkP41zNC0ZM/e/aNZhhLou+y1vpiZevt+0
	zqc/7InutMHrvjUj3ppOtQVoNHCIit/X97ZFOwEnchxvytztgp8kGXVOKRGK6Gufi9Se
	GUfcAjjS1zzV8kmhkf55ZIuTdn6kt2TngpNXPe6pMxN5erzCE2Aggx9EX4+shCuFROlD
	B5oZqImMfOu5041aZ4O+TXsCOoK+gXFKeWWstKHpV3zh2II5g0B5pkFpiUO+95HmQoyI
	JRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NnpKv2Wu1kgCmML2DZ1f8WwXv5R4hzZggFvuqresHJ0=;
	b=fFYWyDMEg+AuOKbqJoqVE9uQJOO4w31qcVcfqorhUhwygfQvUjYuew+xZpHtXpFdpt
	nJGS53+4FhZLhH+KjdR7xrnlUi+PTg/Mw3hSFMUcBQZ6QZWfdxZe+H0VP8RqRNeFjsQa
	Jm7SHBTrBJV+JhMvVFKQG6fdDV+m59tfYzaPhk+sjnAlgW+9slJom3WDztliqlOwDsGx
	HqAMkp0FhheGPXOkrhr3r1zf2+YuLcNTyjUuNyIcoJURQ8/0iWlzPWG/CJvCBClCPSlK
	oxl4c4unJUvrAriwKCI0eqfJwpkfzVghlXDBnDxues4vd7X5jYTGkExXu9hTSFeRqJJD
	kAxQ==
X-Gm-Message-State: ALyK8tKbF54ecLck6GgR3xH2g/K2ectnI3jBTGYoaxlkVsl+5ATCCWe2YcRYjhukCxIRZUdzMPikzlLtRomhGQ==
X-Received: by 10.157.51.21 with SMTP id f21mr1287803otc.8.1466166993105; Fri,
	17 Jun 2016 05:36:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.117 with HTTP; Fri, 17 Jun 2016 05:36:32 -0700 (PDT)
In-Reply-To: <1466103989-25752-1-git-send-email-paul@paulbarker.me.uk>
References: <1466103989-25752-1-git-send-email-paul@paulbarker.me.uk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 Jun 2016 08:36:32 -0400
Message-ID: <CADkTA4P7ttz-e-KmWTxPNTkdUg=LxxemZtKCTuS4L2ViZ33n4g@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] runc: Backport fix for building against musl
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
X-List-Received-Date: Fri, 17 Jun 2016 12:36:35 -0000
Content-Type: multipart/alternative; boundary=001a113e1bf0ce44cc0535789a75

--001a113e1bf0ce44cc0535789a75
Content-Type: text/plain; charset=UTF-8

merged.

I have a runc update queued, but I can drop this when I push that update.

Cheers,

Bruce

On Thu, Jun 16, 2016 at 3:06 PM, Paul Barker <paul@paulbarker.me.uk> wrote:

> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
>  .../0001-nsexec-fix-build-against-musl-libc.patch  | 48
> ++++++++++++++++++++++
>  recipes-containers/runc/runc_git.bb                |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644
> recipes-containers/runc/runc/0001-nsexec-fix-build-against-musl-libc.patch
>
> diff --git
> a/recipes-containers/runc/runc/0001-nsexec-fix-build-against-musl-libc.patch
> b/recipes-containers/runc/runc/0001-nsexec-fix-build-against-musl-libc.patch
> new file mode 100644
> index 0000000..aa57636
> --- /dev/null
> +++
> b/recipes-containers/runc/runc/0001-nsexec-fix-build-against-musl-libc.patch
> @@ -0,0 +1,48 @@
> +From ac6bd953192fa6752a07be7501f69f7cffe33e8e Mon Sep 17 00:00:00 2001
> +From: Natanael Copa <natanael.copa@docker.com>
> +Date: Tue, 19 Apr 2016 10:43:00 +0200
> +Subject: [PATCH] nsexec: fix build against musl libc
> +
> +Remove a wrongly added include which was added in commit 3c2e77ee (Add a
> +compatibility header for CentOS/RHEL 6, 2016-01-29) apparently to
> +fix this compile error on centos 6:
> +
> +> In file included from
> +> Godeps/_workspace/src/
> github.com/opencontainers/runc/libcontainer/nsenter/nsexec.c:20:
> +> /usr/include/linux/netlink.h:35: error: expected
> specifier-qualifier-list before 'sa_family_t'
> +
> +The glibc bits/sockaddr.h says that this header should never be included
> +directly[1]. Instead, sys/socket.h should be used.
> +
> +The problem was correctly fixed later, in commit 394fb55 (Fix build
> +error on centos6, 2016-03-02) so the incorrect bits/sockaddr.h can
> +safely be removed.
> +
> +This is needed to build musl libc.
> +
> +Fixes #761
> +
> +[1]:
> https://github.molgen.mpg.de/git-mirror/glibc/blob/20003c49884422da7ffbc459cdeee768a6fee07b/bits/sockaddr.h#L20
> +
> +Signed-off-by: Natanael Copa <natanael.copa@docker.com>
> +Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> +Upstream-status: Backport
> +---
> + libcontainer/nsenter/nsexec.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/libcontainer/nsenter/nsexec.c b/libcontainer/nsenter/nsexec.c
> +index 8f37d6c..40a8f89 100644
> +--- a/libcontainer/nsenter/nsexec.c
> ++++ b/libcontainer/nsenter/nsexec.c
> +@@ -18,7 +18,6 @@
> + #include <unistd.h>
> + #include <grp.h>
> +
> +-#include <bits/sockaddr.h>
> + #include <linux/types.h>
> +
> + // All arguments should be above the stack because it grows down
> +--
> +2.1.4
> +
> diff --git a/recipes-containers/runc/runc_git.bb
> b/recipes-containers/runc/runc_git.bb
> index 30a4640..b47914e 100644
> --- a/recipes-containers/runc/runc_git.bb
> +++ b/recipes-containers/runc/runc_git.bb
> @@ -7,6 +7,7 @@ DESCRIPTION = "runc is a CLI tool for spawning and running
> containers according
>  SRCREV = "baf6536d6259209c3edfa2b22237af82942d3dfa"
>  SRC_URI = "\
>         git://github.com/opencontainers/runc;branch=master \
> +       file://0001-nsexec-fix-build-against-musl-libc.patch \
>         "
>
>  # Apache-2.0 for containerd
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113e1bf0ce44cc0535789a75
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>I have a runc update queued, bu=
t I can drop this when I push that update.</div><div><br></div><div>Cheers,=
</div><div><br></div><div>Bruce</div></div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On Thu, Jun 16, 2016 at 3:06 PM, Paul Barker <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:paul@paulbarker.me.uk" target=3D"_blank=
">paul@paulbarker.me.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@paulbarker.me.uk=
">paul@paulbarker.me.uk</a>&gt;<br>
---<br>
=C2=A0.../0001-nsexec-fix-build-against-musl-libc.patch=C2=A0 | 48 ++++++++=
++++++++++++++<br>
=C2=A0recipes-containers/runc/<a href=3D"http://runc_git.bb" rel=3D"norefer=
rer" target=3D"_blank">runc_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 49 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/runc/runc/0001-nsexec-fix-build=
-against-musl-libc.patch<br>
<br>
diff --git a/recipes-containers/runc/runc/0001-nsexec-fix-build-against-mus=
l-libc.patch b/recipes-containers/runc/runc/0001-nsexec-fix-build-against-m=
usl-libc.patch<br>
new file mode 100644<br>
index 0000000..aa57636<br>
--- /dev/null<br>
+++ b/recipes-containers/runc/runc/0001-nsexec-fix-build-against-musl-libc.=
patch<br>
@@ -0,0 +1,48 @@<br>
+From ac6bd953192fa6752a07be7501f69f7cffe33e8e Mon Sep 17 00:00:00 2001<br>
+From: Natanael Copa &lt;<a href=3D"mailto:natanael.copa@docker.com">natana=
el.copa@docker.com</a>&gt;<br>
+Date: Tue, 19 Apr 2016 10:43:00 +0200<br>
+Subject: [PATCH] nsexec: fix build against musl libc<br>
+<br>
+Remove a wrongly added include which was added in commit 3c2e77ee (Add a<b=
r>
+compatibility header for CentOS/RHEL 6, 2016-01-29) apparently to<br>
+fix this compile error on centos 6:<br>
+<br>
+&gt; In file included from<br>
+&gt; Godeps/_workspace/src/<a href=3D"http://github.com/opencontainers/run=
c/libcontainer/nsenter/nsexec.c:20" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/opencontainers/runc/libcontainer/nsenter/nsexec.c:20</a>:<br>
+&gt; /usr/include/linux/netlink.h:35: error: expected specifier-qualifier-=
list before &#39;sa_family_t&#39;<br>
+<br>
+The glibc bits/sockaddr.h says that this header should never be included<b=
r>
+directly[1]. Instead, sys/socket.h should be used.<br>
+<br>
+The problem was correctly fixed later, in commit 394fb55 (Fix build<br>
+error on centos6, 2016-03-02) so the incorrect bits/sockaddr.h can<br>
+safely be removed.<br>
+<br>
+This is needed to build musl libc.<br>
+<br>
+Fixes #761<br>
+<br>
+[1]: <a href=3D"https://github.molgen.mpg.de/git-mirror/glibc/blob/20003c4=
9884422da7ffbc459cdeee768a6fee07b/bits/sockaddr.h#L20" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.molgen.mpg.de/git-mirror/glibc/blob/20003c4=
9884422da7ffbc459cdeee768a6fee07b/bits/sockaddr.h#L20</a><br>
+<br>
+Signed-off-by: Natanael Copa &lt;<a href=3D"mailto:natanael.copa@docker.co=
m">natanael.copa@docker.com</a>&gt;<br>
+Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@paulbarker.me.uk">pa=
ul@paulbarker.me.uk</a>&gt;<br>
+Upstream-status: Backport<br>
+---<br>
+ libcontainer/nsenter/nsexec.c | 1 -<br>
+ 1 file changed, 1 deletion(-)<br>
+<br>
+diff --git a/libcontainer/nsenter/nsexec.c b/libcontainer/nsenter/nsexec.c=
<br>
+index 8f37d6c..40a8f89 100644<br>
+--- a/libcontainer/nsenter/nsexec.c<br>
++++ b/libcontainer/nsenter/nsexec.c<br>
+@@ -18,7 +18,6 @@<br>
+ #include &lt;unistd.h&gt;<br>
+ #include &lt;grp.h&gt;<br>
+<br>
+-#include &lt;bits/sockaddr.h&gt;<br>
+ #include &lt;linux/types.h&gt;<br>
+<br>
+ // All arguments should be above the stack because it grows down<br>
+--<br>
+2.1.4<br>
+<br>
diff --git a/recipes-containers/runc/<a href=3D"http://runc_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc_git.bb</a> b/recipes-containers/runc/<a =
href=3D"http://runc_git.bb" rel=3D"noreferrer" target=3D"_blank">runc_git.b=
b</a><br>
index 30a4640..b47914e 100644<br>
--- a/recipes-containers/runc/<a href=3D"http://runc_git.bb" rel=3D"norefer=
rer" target=3D"_blank">runc_git.bb</a><br>
+++ b/recipes-containers/runc/<a href=3D"http://runc_git.bb" rel=3D"norefer=
rer" target=3D"_blank">runc_git.bb</a><br>
@@ -7,6 +7,7 @@ DESCRIPTION =3D &quot;runc is a CLI tool for spawning and r=
unning containers according<br>
=C2=A0SRCREV =3D &quot;baf6536d6259209c3edfa2b22237af82942d3dfa&quot;<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/opencontaine=
rs/runc;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/op=
encontainers/runc;branch=3Dmaster</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-nsexec-fix-build-against-musl-libc.=
patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0# Apache-2.0 for containerd<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a113e1bf0ce44cc0535789a75--
