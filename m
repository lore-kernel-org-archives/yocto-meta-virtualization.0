Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08442E00970; Fri, 24 Mar 2017 06:28:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.195 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.195 listed in list.dnswl.org]
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8FB9E003C1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 Mar 2017 06:28:49 -0700 (PDT)
Received: by mail-qk0-f195.google.com with SMTP id n141so358004qke.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 24 Mar 2017 06:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Dbf5ZZzl73ZqPnM/B1Q4H2LWhcWONx5NeJthSlVgXLM=;
	b=VQwexeB2vDTqQfI6mgCxZ8RV89JWBmW8cG8XonXnyNYpLupTrNWjje/zoM2A8s1F2W
	iydaxmpuW7E87252sFQh0OTWn9eK3y6Fik2bVAeRb6dgx8HO83nVjsht2lvkhKMugk+T
	O+KER70vgHMRvCEFK5ejfiG8wiaftZhqITKILTiQAMzQgKotFBaXdSkiGs5X+DYdzugc
	uhPftzRYDXHNqthhQOG/pdUxIPpop6O7muDVwgYjoG9LI34VFHzSADwXMIXmC86Nsnrw
	Bme85/5JGN1mxVHpQoRz4SVq1AtS0mCbQInPqmGZDJ5hu+mJxn8JB3l85OIDd3s/S2mR
	v78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Dbf5ZZzl73ZqPnM/B1Q4H2LWhcWONx5NeJthSlVgXLM=;
	b=pt/UrtnEdjDs5T68QxMRolwPz218FzNbzOFrs68Xs3YwgPmXr9mfBmj/zJ/9zl8f6n
	Fwk32/2ppiHUdBuu8PWxDXAPiZ3QOrd4tm1MNF7B7M8APiLics9mSCzx4S6hNvoxMOJF
	N3ufP6qIXkxU3a5kt055/IQ8VMbNa/JIJ8UZ2k7EbI4/vfgdbrtAW/D1bgdo9OC81nXR
	xvK43DybJoNbViYN9g/D54qz198CwdEDguJnaB5W8FAqFO8usoHMQFOoz16cFvklQ/sP
	Yk7zxeKnZTC383Dae2lPDoJ0BQMdacAWoJlnnJScGItivT3h/OweW0SeWqD8W81/vqha
	Wcrg==
X-Gm-Message-State: AFeK/H3M0ra+m6G3U9G8eVTWntwG4lKQm2sflBgNl1XguiUpCcdglwPJaXiZaUn4lBc58gR742OwNrG+u/rQwg==
X-Received: by 10.55.174.6 with SMTP id x6mr7850424qke.318.1490362128756; Fri,
	24 Mar 2017 06:28:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Fri, 24 Mar 2017 06:28:48 -0700 (PDT)
In-Reply-To: <20170322064552.19079-1-raj.khem@gmail.com>
References: <20170322064552.19079-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 24 Mar 2017 09:28:48 -0400
Message-ID: <CADkTA4Mn67L0UdD_101f8evrpFJE5SehTCFb8mJPMhR=1Uvs5g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [[PATCH 1/2] lxc: Remove gcc-5 specific workaround
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
X-List-Received-Date: Fri, 24 Mar 2017 13:28:52 -0000
Content-Type: multipart/alternative; boundary=94eb2c06404e4597e3054b79f950

--94eb2c06404e4597e3054b79f950
Content-Type: text/plain; charset=UTF-8

both patches are merged.

Bruce

On Wed, Mar 22, 2017 at 2:45 AM, Khem Raj <raj.khem@gmail.com> wrote:

> We are using gcc6 now
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-containers/lxc/lxc_2.0.0.bb | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc/
> lxc_2.0.0.bb
> index 90d17e2..250ac4d 100644
> --- a/recipes-containers/lxc/lxc_2.0.0.bb
> +++ b/recipes-containers/lxc/lxc_2.0.0.bb
> @@ -55,9 +55,6 @@ EXTRA_OECONF += "--enable-log-src-basename"
>
>  CFLAGS_append = " -Wno-error=deprecated-declarations"
>
> -# disable problematic GCC 5.2 optimizations [YOCTO #8291]
> -FULL_OPTIMIZATION_append_arm = " -fno-schedule-insns2"
> -
>  PACKAGECONFIG ??= "templates \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '',
> d)} \
>  "
> --
> 2.12.0
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c06404e4597e3054b79f950
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">both patches are merged.<div><br></div><div>Bruce</div></d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Mar 22=
, 2017 at 2:45 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">We are using gcc6 now<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_2.<wbr>0.0.bb</a> | 3 ---<br>
=C2=A01 file changed, 3 deletions(-)<br>
<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_<wbr>2.0.0.bb</a> b/recipes-containers/lx=
c/<a href=3D"http://lxc_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">lxc_=
<wbr>2.0.0.bb</a><br>
index 90d17e2..250ac4d 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.0.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.0.bb</a><br>
@@ -55,9 +55,6 @@ EXTRA_OECONF +=3D &quot;--enable-log-src-basename&quot;<b=
r>
<br>
=C2=A0CFLAGS_append =3D &quot; -Wno-error=3Ddeprecated-<wbr>declarations&qu=
ot;<br>
<br>
-# disable problematic GCC 5.2 optimizations [YOCTO #8291]<br>
-FULL_OPTIMIZATION_append_arm =3D &quot; -fno-schedule-insns2&quot;<br>
-<br>
=C2=A0PACKAGECONFIG ??=3D &quot;templates \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#=
39;selinux&#39;, &#39;selinux&#39;, &#39;&#39;, d)} \<br>
=C2=A0&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.12.0<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--94eb2c06404e4597e3054b79f950--
