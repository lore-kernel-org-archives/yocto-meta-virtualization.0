Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 393DFE00C00; Sun, 31 Jan 2016 21:12:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F2D53E00BF7
	for <meta-virtualization@yoctoproject.org>;
	Sun, 31 Jan 2016 21:12:42 -0800 (PST)
Received: by mail-vk0-f53.google.com with SMTP id e185so70550777vkb.1
	for <meta-virtualization@yoctoproject.org>;
	Sun, 31 Jan 2016 21:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0rNbz+m0Uwu/hFELaCSk91K692VEWLWPSb1cT2AX71E=;
	b=xGoM0bt8La04omIGiIZPhYSLDIKK7ZC2DM4QH/vecyAFEJIBHKJOITd/bl5rmiczWm
	/Gbg+fhnctrfyZsTNS13iVzXqg37RpCrvjPvraB0Jk8vc5DoDH6NM0NeU0t40Pk89jB1
	nnqTjeAnnzt6HA9AJxlorSpSoDOOq+SsWN3okyayqAcEL7rMR2KvBKZE8CS6w9cpmLrj
	mERVjZXAjM7v0IDKLXeDs7WGvj7qcm0t9tVufDH8Rdn2brkFY7fGyPPvzcrvbuG2JHh9
	U7MuHHrEOTKqy7hgp3MwT8auRxJGLtoAElIVwMvaXt8jE4ZpEIoDB1UrDkmnyfkyJ/Ha
	ybVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=0rNbz+m0Uwu/hFELaCSk91K692VEWLWPSb1cT2AX71E=;
	b=UI/Ze7jANijIDgHDBRf1nf14QPgOG2yjqAb6ALQ/9lFv98C8+2v7SkaiEcBwmWtdkw
	EUYNcEXKfaaz/eimxuvy+qsu2AsCUesi3/2yYp/KrTaZzmXCuRjPICTSB3WXzSEXJtTJ
	8axqhZXfb7UVxx4WaARSaWIuo8hvwKJV7cJUYEwEcZxkqk0GQR+7cfdMesUwbQoP0bXQ
	XrWfDzfD8raZ3DBLQtwkQbeNLRxOnMoCGD+UMZqOsUV7oHcFDSy7GIB3QhoYvR+Rcpmh
	eidBwEa58c1OTBqHzSO5YLHhri8hDozysEJo53eiXKkjB+MrIOOFrxEHk9ljtt7HHxoU
	hb7w==
X-Gm-Message-State: AG10YOSWGfWsNTNVf80YqY3o3S0CCfNpLk29sh2ypSXXJvfk5Q0X/snG4bk3XTTs1+EHa5WtDi0zZ9HXe8lZrQ==
MIME-Version: 1.0
X-Received: by 10.31.44.77 with SMTP id s74mr14443936vks.4.1454303561918; Sun,
	31 Jan 2016 21:12:41 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Sun, 31 Jan 2016 21:12:41 -0800 (PST)
In-Reply-To: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
References: <1453835364-6473-1-git-send-email-cardoe@cardoe.com>
Date: Mon, 1 Feb 2016 00:12:41 -0500
Message-ID: <CADkTA4NiMuxbbzNnZVWq1BbitEPsJnz4vu0YNZyvJK6tznf=3g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 0/8] Xen 4.6 updates
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
X-List-Received-Date: Mon, 01 Feb 2016 05:12:48 -0000
Content-Type: multipart/alternative; boundary=001a11c075a2342ef0052aae6fa9

--001a11c075a2342ef0052aae6fa9
Content-Type: text/plain; charset=UTF-8

I've merged this to master. Stay tuned for the jethro version.

Bruce

On Tue, Jan 26, 2016 at 2:09 PM, Doug Goldstein <cardoe@cardoe.com> wrote:

> A number of updates for building Xen 4.6. This should be the last of the
> patches that I've been carrying locally for 4.6 (save for init script
> changes but those I'm trying to upstream).
>
> change since v1:
> - readd libgcc to xen-xl per Chris Patterson's testing
> - add patches I forgot to submit in the first place
> - squash in EXTRA_OEMAKE and do_install_append changes into xen.inc
> - make sure xen_git is able to fetch
>
> Doug Goldstein (8):
>   xen: update git version to 4.6.x
>   xen: drop explicit DEPEND on libgcc
>   xen: fix up typo in XSM comments
>   xen: separate the extra steps into their own tasks
>   xen: move bits common to all Xen versions to xen.inc
>   xen: merge do_install_append to do_install
>   xen: don't allow the build system to fetch
>   xen: don't inject -mfpmath=sse which causes build issues
>
>  ...xen-x86-Fix-up-rules-when-forcing-mno-sse.patch | 28 ----------
>  recipes-extended/xen/xen.inc                       | 59
> ++++++++++++++++++++--
>  recipes-extended/xen/xen_4.6.0.bb                  | 40 ---------------
>  recipes-extended/xen/xen_git.bb                    |  8 +--
>  4 files changed, 60 insertions(+), 75 deletions(-)
>  delete mode 100644
> recipes-extended/xen/files/xen-x86-Fix-up-rules-when-forcing-mno-sse.patch
>
> --
> 2.4.10
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

--001a11c075a2342ef0052aae6fa9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve merged this to master. Stay tuned for the jethro =
version.<div><br></div><div>Bruce</div></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On Tue, Jan 26, 2016 at 2:09 PM, Doug Goldstein=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:cardoe@cardoe.com" target=3D"_blan=
k">cardoe@cardoe.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">A number of updates for building Xen 4.6. This should be the last of the<=
br>
patches that I&#39;ve been carrying locally for 4.6 (save for init script<b=
r>
changes but those I&#39;m trying to upstream).<br>
<br>
change since v1:<br>
- readd libgcc to xen-xl per Chris Patterson&#39;s testing<br>
- add patches I forgot to submit in the first place<br>
- squash in EXTRA_OEMAKE and do_install_append changes into xen.inc<br>
- make sure xen_git is able to fetch<br>
<br>
Doug Goldstein (8):<br>
=C2=A0 xen: update git version to 4.6.x<br>
=C2=A0 xen: drop explicit DEPEND on libgcc<br>
=C2=A0 xen: fix up typo in XSM comments<br>
=C2=A0 xen: separate the extra steps into their own tasks<br>
=C2=A0 xen: move bits common to all Xen versions to xen.inc<br>
=C2=A0 xen: merge do_install_append to do_install<br>
=C2=A0 xen: don&#39;t allow the build system to fetch<br>
=C2=A0 xen: don&#39;t inject -mfpmath=3Dsse which causes build issues<br>
<br>
=C2=A0...xen-x86-Fix-up-rules-when-forcing-mno-sse.patch | 28 ----------<br=
>
=C2=A0recipes-extended/xen/xen.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 59 ++++++++++++++++++++--<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_4.6.0.bb" rel=3D"noreferre=
r" target=3D"_blank">xen_4.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 40 ---------------<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">xen_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +--<br>
=C2=A04 files changed, 60 insertions(+), 75 deletions(-)<br>
=C2=A0delete mode 100644 recipes-extended/xen/files/xen-x86-Fix-up-rules-wh=
en-forcing-mno-sse.patch<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.4.10<br>
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
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div>

--001a11c075a2342ef0052aae6fa9--
