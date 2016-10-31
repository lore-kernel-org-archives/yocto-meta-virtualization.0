Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DFAE2E009CA; Mon, 31 Oct 2016 07:19:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.173 listed in dnsbl.sorbs.net]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87EB9E009CA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 31 Oct 2016 07:19:42 -0700 (PDT)
Received: by mail-qk0-f173.google.com with SMTP id q130so43162859qke.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 31 Oct 2016 07:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LO1JKuaylqnf2oFtSfjNTX+uRQKHkBqBOfyWG00WSKs=;
	b=mYNaCTilWP1xg+QalTMj8nG+EXhcfdkIts/r8uOiwosjtTd+f3+i0TUoyM60l/yeOK
	3jCc8pmMPCgstR7Pqy3Sli5xdCgsWgCN+InE+BCTaonXOGHPa1ymo3KqPrsP5Q7BpJtt
	uYbNkUDmN4MYekq6MMikcOYkkCNy3XAmYIkzEEQe5ZNTz5Qw66YOgx89so1ldWazV1+x
	cOgIni6U62UxDPIoaqwPgAuB2hCR7jaLEOSQ+yfMvHO7iGbS2P249Bs8ZkqWtzsRovQl
	dZJuHpiNeMY7HIg1AA5YxtJPflO3B7K3Bmdj2oKddoDNjGUmFAUMBg0Sfyke9TopJnQ9
	Yr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LO1JKuaylqnf2oFtSfjNTX+uRQKHkBqBOfyWG00WSKs=;
	b=K+qgNCX75779FyA3l58YAAW//a3Xb2eyqp2HOOEDciTTPPSHlmm43bkS2G+gvQckxe
	i7W4I8rucyYs8DYW0IfsAsSxT+YHf4jjlkSTK6POVNNP9ZEKq003/Sg63O2X70PsfzLw
	yoCraMKwBX6Ir8suj9/axwlGunspisgWHWyX1q5eDUwgbBcU/haLP2O5ozy+nBqhn6cn
	i5XV6EjApYQc5xVvov6oMkqLUBjbeHYqk7D+jQG7d6HC1KQH/ypNEu2/vQq96QJduk7k
	mqwVDvCQjgZnfJSWzGSlH2bFHAi7+IS0vVk44h+HK814tl4d3JhYYWMJ22hd765Sjkpb
	0aYQ==
X-Gm-Message-State: ABUngveqEkyh4HX68FMyl6z5c6XkVX4IJPzvF3Ki58B2YAxOBoptWFtRBkTWH2AKTjDTGIWGhaaZVUeDJL/voQ==
X-Received: by 10.55.15.152 with SMTP id 24mr25057665qkp.45.1477923582131;
	Mon, 31 Oct 2016 07:19:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.220 with HTTP; Mon, 31 Oct 2016 07:19:41 -0700 (PDT)
In-Reply-To: <1477922615-3973-1-git-send-email-s.lengfeld@phytec.de>
References: <1477922615-3973-1-git-send-email-s.lengfeld@phytec.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 31 Oct 2016 10:19:41 -0400
Message-ID: <CADkTA4PZsYZ3yGzqN6ZJe80k28eCKRfSZNWAtBro1bYpcqiraQ@mail.gmail.com>
To: Stefan Lengfeld <s.lengfeld@phytec.de>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] docker: install script config-check.sh
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
X-List-Received-Date: Mon, 31 Oct 2016 14:19:46 -0000
Content-Type: multipart/alternative; boundary=001a114750b01e44f9054029e612

--001a114750b01e44f9054029e612
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 31, 2016 at 10:03 AM, Stefan Lengfeld <s.lengfeld@phytec.de>
wrote:

> The script /usr/share/docker/config-check.sh is very useful to test all
> kernel requirements for docker. A lot of embedded boards will use a
> custom kernel config that does not have all kernel features enabled by
> default. Install the script so kernel developer can easily enable the
> missing features.
>
> Signed-off-by: Stefan Lengfeld <s.lengfeld@phytec.de>
> ---
>  recipes-containers/docker/docker_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-containers/docker/docker_git.bb
> b/recipes-containers/docker/docker_git.bb
> index 4be5e47..39852ad 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -126,6 +126,7 @@ do_install() {
>
>         mkdir -p ${D}/usr/share/docker/
>         cp ${WORKDIR}/hi.Dockerfile ${D}/usr/share/docker/
> +       install -m 0755 ${S}/contrib/check-config.sh ${D}/usr/share/docker/
>

This depends on bash, which isn't currently in the RDEPENDS. Which is why I
had
never bothered to add it.

I'd prefer this be packaged into a docker-utils, or docker-contrib, where
we can add
the RDEPENDS and let folks decide whether they want it installed (or not)
at the
package level.

Cheers,

Bruce


>  }
>
>  inherit useradd
> --
> 1.9.1
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

--001a114750b01e44f9054029e612
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Oct 31, 2016 at 10:03 AM, Stefan Lengfeld <span dir=3D"ltr">&lt=
;<a href=3D"mailto:s.lengfeld@phytec.de" target=3D"_blank">s.lengfeld@phyte=
c.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The script /us=
r/share/docker/config-<wbr>check.sh is very useful to test all<br>
kernel requirements for docker. A lot of embedded boards will use a<br>
custom kernel config that does not have all kernel features enabled by<br>
default. Install the script so kernel developer can easily enable the<br>
missing features.<br>
<br>
Signed-off-by: Stefan Lengfeld &lt;<a href=3D"mailto:s.lengfeld@phytec.de">=
s.lengfeld@phytec.de</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">dock<wbr>er_git.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=
=3D"noreferrer" target=3D"_blank">do<wbr>cker_git.bb</a> b/recipes-containe=
rs/docker/<a href=3D"http://docker_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">do<wbr>cker_git.bb</a><br>
index 4be5e47..39852ad 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
@@ -126,6 +126,7 @@ do_install() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}/usr/share/docker/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/hi.Dockerfile ${D}/usr/share/dock=
er/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${S}/contrib/check-config.sh ${=
D}/usr/share/docker/<br></blockquote><div><br></div><div>This depends on ba=
sh, which isn&#39;t currently in the RDEPENDS. Which is why I had</div><div=
>never bothered to add it.</div><div><br></div><div>I&#39;d prefer this be =
packaged into a docker-utils, or docker-contrib, where we can add</div><div=
>the RDEPENDS and let folks decide whether they want it installed (or not) =
at the</div><div>package level.</div><div><br></div><div>Cheers,</div><div>=
<br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0inherit useradd<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a114750b01e44f9054029e612--
