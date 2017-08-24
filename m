Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A57F4E00BAB; Thu, 24 Aug 2017 06:59:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.217.172 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.217.172 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC625E0090A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 06:59:44 -0700 (PDT)
Received: by mail-ua0-f172.google.com with SMTP id h9so2322195uac.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 06:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=527QN8xkyAZICveDHwJ+ajBNS+4DVM4DMgMW0oo7YeU=;
	b=CGyUpdDXMgZjfPqsRdIMBnH98hKqAJYJb2pf8m1SpLWnJgNQhubHH/93DJEM7EeTtc
	Lgq5ZY6MUTXU/iW8V1sgXFl2BD807nvwvShj4hmyeGbfowx+fU86RS/2Z9KMJm3LpvFX
	SYkG9oZj1Bnl3DyJXmdrRxcqkV2xkzoQ0h6eQTi/MmXZQIG0acyFsr4VMszNT3Fy99Ef
	kyY20RsuS0Z3muQIgJDd0faMQAnWUfXHi4NNWZmVM6Mb485hM2qPVgXZhd+93fPrwt3j
	I5/5r0D6y2ZaU7CuWtpmVQWoih+6RI27RugvWl5n3gvUWSlmUsswUCC/tWkm7KwItwiP
	qs8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=527QN8xkyAZICveDHwJ+ajBNS+4DVM4DMgMW0oo7YeU=;
	b=tl6OJiufhgUxO9HwCRrwEPZOHkJdz5k3w2yZMs0N8tPgVICTIfIRNO7AsCouE7J0oy
	qOAYirBU6c4xH6ydZMFSSQ6Lrb4LKFdPVJMgxe4/CqLjVEZj29UFw8Any+y4oeomYH+K
	7plcWZJ/625xjgHPtJIxuSBWgPSOQdNU9o1O3qeaVX4iO0xLWdSvWnMYD6aL/HO+ZAmq
	7rt690Lx8vAezFyTW6ZZQitp74UG5+zWvBAxrfqPjfrxVzuSitKISqkif5WlCqoU5grY
	j5NXoq6Gb/pzxSsmNyMgKerFu8drMUc83mGBeBcpw0sJaCS5xXSTuTBs8nUQgyOWGYy+
	Z5nQ==
X-Gm-Message-State: AHYfb5gJANl/X524Plo8KyL0jt1zhptT5d8GuQd4ZmidSRagpRPvU/C9
	voQsXbTncj6uynP9KYFt7NUOSbBF5w==
X-Received: by 10.176.86.9 with SMTP id y9mr3948245uaa.74.1503583184032; Thu,
	24 Aug 2017 06:59:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Thu, 24 Aug 2017 06:59:43 -0700 (PDT)
In-Reply-To: <1503516039-18494-1-git-send-email-mark.asselstine@windriver.com>
References: <1503516039-18494-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 Aug 2017 09:59:43 -0400
Message-ID: <CADkTA4NbGPKDjjc-ZpKkykZwPcBL7ZJK8N9-BPj7QGyUFzmscw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH] erlang-native: Add DEPENDS for ncurses-native
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
X-List-Received-Date: Thu, 24 Aug 2017 13:59:45 -0000
Content-Type: multipart/alternative; boundary="f403045e33029319d00557803d6d"

--f403045e33029319d00557803d6d
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Aug 23, 2017 at 3:20 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> This was most likely being provided by another pkg pulling in
> ncurses-native before erlang-native was being built. With RSS this is
> no longer the case and we need to add the explicit DEPENDS. Without
> this we are seeing erlang-native fail to configure:
>
> | checking for tgetent in -lncurses... no
> | checking for tgetent in -lcurses... no
> | checking for tgetent in -ltermcap... no
> | checking for tgetent in -ltermlib... no
> | configure: error: No curses library functions found
>
> While we are at it we drop the setting of PR as this will be handled
> by the PR server.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-openstack/recipes-devtools/erlang/erlang-native_R16B03-1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-devtools/erlang/erlang-native_R16B03-1.bb
> b/meta-openstack/recipes-devtools/erlang/erlang-native_R16B03-1.bb
> index ca6a48f..61fc027 100644
> --- a/meta-openstack/recipes-devtools/erlang/erlang-native_R16B03-1.bb
> +++ b/meta-openstack/recipes-devtools/erlang/erlang-native_R16B03-1.bb
> @@ -2,7 +2,7 @@ include erlang.inc
>
>  inherit native
>
> -PR = "r0"
> +DEPENDS += "ncurses-native"
>
>  EXTRA_OECONF = '--without-ssl'
>
> --
> 2.7.4
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

--f403045e33029319d00557803d6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Aug 23, 2017 at 3:20 PM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">This was most likely being provi=
ded by another pkg pulling in<br>
ncurses-native before erlang-native was being built. With RSS this is<br>
no longer the case and we need to add the explicit DEPENDS. Without<br>
this we are seeing erlang-native fail to configure:<br>
<br>
| checking for tgetent in -lncurses... no<br>
| checking for tgetent in -lcurses... no<br>
| checking for tgetent in -ltermcap... no<br>
| checking for tgetent in -ltermlib... no<br>
| configure: error: No curses library functions found<br>
<br>
While we are at it we drop the setting of PR as this will be handled<br>
by the PR server.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/erlang/erlang-native_<wbr>R16B03=
-1.bb | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/erlang/erlang-native_<wbr=
>R16B03-1.bb b/meta-openstack/recipes-<wbr>devtools/erlang/erlang-native_<w=
br>R16B03-1.bb<br>
index ca6a48f..61fc027 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/erlang/erlang-native_<wbr>R16B03=
-1.bb<br>
+++ b/meta-openstack/recipes-<wbr>devtools/erlang/erlang-native_<wbr>R16B03=
-1.bb<br>
@@ -2,7 +2,7 @@ include erlang.inc<br>
<br>
=C2=A0inherit native<br>
<br>
-PR =3D &quot;r0&quot;<br>
+DEPENDS +=3D &quot;ncurses-native&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &#39;--without-ssl&#39;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
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
</div>

--f403045e33029319d00557803d6d--
