Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A88D9E00A3B; Fri, 20 Jan 2017 06:00:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.182 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.182 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52E3AE00A31
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 06:00:05 -0800 (PST)
Received: by mail-yw0-f182.google.com with SMTP id v200so87478216ywc.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 06:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kv42HZ/d4su2I8RVH4djL5fIpdZvmFRNFG8GEHLk6FU=;
	b=itfTIzd7R7KFww3a1jB2u1hwGxGZ3F9gPKUzlDf/FAnb+Kl04J5aew7990coMyi34i
	k63Y7/iOkMtTpE2NCH1fuQ0dH+PpnA6yE7fk68+oq2mdKGOg1ZsaBaidr5xOvDLpXs8/
	0IN8YLidLnwhOyIYyhFBi/Z6ZRynnTMIP5rw3CAAmmptXPil4TnuaruFC0T+eLkgim93
	lpO5BZt1sGukCkYjlG+ZAPd38eFEGLQxMClMNpPf7Hk7bkR31Ei96/36agb37hBOjHHp
	+ctm3ry4Mh1J+Ca3aksr7NPF9OdyC5VPIcj9sHJaQbdfjNlzNK1Q505cbXEZqaJa3EPe
	WLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kv42HZ/d4su2I8RVH4djL5fIpdZvmFRNFG8GEHLk6FU=;
	b=ltjNi/6RAxa1VyqOXv3dUXHaBqLeMQ/5KTnTi2xHw7WB9g74a0VFsBEiGXyc1yb8gj
	jvEujs/Q+BKhix97Rob78D1ONtTe8PopYQr8Znp23qWVtzzJP7c/qFwTAMvBi2kBG/lS
	mSo/tVfD2cQPUy4xzR1sH6OM8ZxkQb2SARd8XQgqgptIshvPwsJkhVhtOMt485BqbiAZ
	jKcRr8H7UYUfDv6zzcj9YsbvNd7avRsEt3/QTcYx7zQra+tQjfJiGox/WIff3Uq24huh
	Yb6+vnfL/5/MAMdzQkL95fqO2SaB9jqJbpfkjtx/TOkykrdmhBCfVgkMIz+ey0kfY2ya
	WxlQ==
X-Gm-Message-State: AIkVDXJKgBJzP/jw/Kq27Q+FQZyvzN87iuLZZy3PsAW9bPF/3gA3iFxq0SM3jN5NWmtBaXdDQnBSzGfgZvkV8A==
X-Received: by 10.55.124.7 with SMTP id x7mr7246391qkc.149.1484920805006; Fri,
	20 Jan 2017 06:00:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Fri, 20 Jan 2017 06:00:04 -0800 (PST)
In-Reply-To: <20170120083415.5677-1-fathi.boudra@linaro.org>
References: <20170120083415.5677-1-fathi.boudra@linaro.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Jan 2017 09:00:04 -0500
Message-ID: <CADkTA4OoiNg3r4t08B7pkCTgWOSFN5o7Bau0uum2HAq=2E57QA@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] docker: update to 1.13.0 release
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
X-List-Received-Date: Fri, 20 Jan 2017 14:00:07 -0000
Content-Type: multipart/alternative; boundary=94eb2c05fef81a27f2054687111e

--94eb2c05fef81a27f2054687111e
Content-Type: text/plain; charset=UTF-8

merged

Bruce

On Fri, Jan 20, 2017 at 3:34 AM, Fathi Boudra <fathi.boudra@linaro.org>
wrote:

> Adjust SRCREV and DOCKER_VERSION to match docker 1.13.0 release.
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  recipes-containers/docker/docker_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/docker/docker_git.bb
> b/recipes-containers/docker/docker_git.bb
> index 62a016a..1eb24a5 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
>   subtle and/or glaring issues. \
>   "
>
> -SRCREV = "7392c3b0ce0f9d3e918a321c66668c5d1ef4f689"
> +SRCREV = "49bf474f9ed7ce7143a59d1964ff7b7fd9b52178"
>  SRC_URI = "\
>         git://github.com/docker/docker.git;nobranch=1 \
>         file://docker.service \
> @@ -32,7 +32,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
> aadc30f9c14d876ded7bedc0afd2d3d7"
>
>  S = "${WORKDIR}/git"
>
> -DOCKER_VERSION = "1.12.5"
> +DOCKER_VERSION = "1.13.0"
>  PV = "${DOCKER_VERSION}+git${SRCREV}"
>
>  DEPENDS = " \
> --
> 2.11.0
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

--94eb2c05fef81a27f2054687111e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged<br><br></div>Bruce<br></div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Fri, Jan 20, 2017 at 3:34 AM, Fa=
thi Boudra <span dir=3D"ltr">&lt;<a href=3D"mailto:fathi.boudra@linaro.org"=
 target=3D"_blank">fathi.boudra@linaro.org</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Adjust SRCREV and DOCKER_VERSION to match docker 1.=
13.0 release.<br>
<br>
Signed-off-by: Fathi Boudra &lt;<a href=3D"mailto:fathi.boudra@linaro.org">=
fathi.boudra@linaro.org</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">dock<wbr>er_git.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=
=3D"noreferrer" target=3D"_blank">do<wbr>cker_git.bb</a> b/recipes-containe=
rs/docker/<a href=3D"http://docker_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">do<wbr>cker_git.bb</a><br>
index 62a016a..1eb24a5 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
@@ -18,7 +18,7 @@ DESCRIPTION =3D &quot;Linux container runtime \<br>
=C2=A0 subtle and/or glaring issues. \<br>
=C2=A0 &quot;<br>
<br>
-SRCREV =3D &quot;<wbr>7392c3b0ce0f9d3e918a321c66668c<wbr>5d1ef4f689&quot;<=
br>
+SRCREV =3D &quot;<wbr>49bf474f9ed7ce7143a59d1964ff7b<wbr>7fd9b52178&quot;<=
br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/docker/docke=
r.git;nobranch=3D1" rel=3D"noreferrer" target=3D"_blank">github.com/docker/=
<wbr>docker.git;nobranch=3D1</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.service \<br>
@@ -32,7 +32,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>aadc=
30f9c14d876ded7bedc0afd2d3<wbr>d7&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-DOCKER_VERSION =3D &quot;1.12.5&quot;<br>
+DOCKER_VERSION =3D &quot;1.13.0&quot;<br>
=C2=A0PV =3D &quot;${DOCKER_VERSION}+git${<wbr>SRCREV}&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot; \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--94eb2c05fef81a27f2054687111e--
