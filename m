Return-Path: <ticotimo@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 60BDAE00C37; Fri,  7 Jun 2019 00:19:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.166.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (ticotimo[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DEC95E00B33
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Jun 2019 00:19:20 -0700 (PDT)
Received: by mail-io1-f65.google.com with SMTP id s7so635687iob.11
	for <meta-virtualization@yoctoproject.org>;
	Fri, 07 Jun 2019 00:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C/omMYw0tqfP994ut0pqkKV/Fw6S+DToBG2zJG7m/oE=;
	b=SOWLCnpAqTbmeFXV/oX1d7id/XdsMqQ9Z5ml1sM9GhbpHRhlYEdgVWmD+8u2yA2mKI
	VO/mtMQfGqO/OdDCIw9Quim6c9rSgrsTH99NIbZdnY9I1RDXW3r+joXLbKVmA6SI3c53
	aUPwII1HR5Pwc6jv6e9tcQG2+ZNQCuBpqOv6OrePqLvyxgiLrfgCEnOsDgb2gKxSwJ+U
	L7RiDzMfaZFj6wDF/yJtIQ9ZOQidm+rAhCnq9HiooAe59il+Qg0xuc1xnc/5K5z83xFI
	RBUopLM9ckJdGmGqJ0RgOJI2DQXDCnU8g3sEeISW+HHLa4XH6Ny+VfhVBKXMcSSOsM26
	4fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C/omMYw0tqfP994ut0pqkKV/Fw6S+DToBG2zJG7m/oE=;
	b=s0nOoxWO8M2vvzSj+OuD8u4lGDyDLNtJ0AW8dU9F8sQkG5CMFbe1eVU89M8iIvHUSK
	HFnWrIBmmtqt2m3UlmbviIjhv7GGsDPzS7XAb3bLLlbqz/PELgZVFHgoRsyX7qH7kY83
	VRmfyaQNJwvoPXDfqn/uZKNPGlkLv6mspImhbdm/lVYV6dtnQgnhEwk/zz4TlN4Ibhd8
	Znliv1UUdsyJ9uNV0MYzuHDr/HdVgry4LdxfzLNxQC5xxcDQGmK6EnADf9HncD0wwfdP
	Xgrz+nq+Jz6QKLV9X0mEA5cVBAxnMH39pLqORahsH4kb/wjcgc/Gz1gMhYpaEu0dqgKF
	TuKg==
X-Gm-Message-State: APjAAAVm3X7nJW2uupJnu03yxgaE30nIot/ElBLn3s0VRodg3kyDsD0S
	TZRMQ11LZBGtLSBBJqGrxM+QGv7CEk+QkwblgFw=
X-Google-Smtp-Source: APXvYqznh6QD5aQQDIcagw7egz/+30Vr+JgpiFdu3NSO9Aq2EELcPkpXYznkZ4YMWXNzm5liQmcf6W26GJs8kvtxdXA=
X-Received: by 2002:a6b:b40b:: with SMTP id d11mr18321955iof.122.1559891960389;
	Fri, 07 Jun 2019 00:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190530054251.14308-1-zangrc.fnst@cn.fujitsu.com>
	<CADkTA4NQDc9KfQNbXpAKmJN14ynfEbcebj=mR6rq-QE8naHWdg@mail.gmail.com>
In-Reply-To: <CADkTA4NQDc9KfQNbXpAKmJN14ynfEbcebj=mR6rq-QE8naHWdg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 7 Jun 2019 00:19:09 -0700
Message-ID: <CANx9H-A3cNnXAb3cCqn0_0wKNN16p4M9HuO1ynf1=Zzycs=X2Q@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-positional: upgrade 1.1.1 -> 1.2.1
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
X-List-Received-Date: Fri, 07 Jun 2019 07:19:21 -0000
Content-Type: multipart/alternative; boundary="0000000000002fe5db058ab6a689"

--0000000000002fe5db058ab6a689
Content-Type: text/plain; charset="UTF-8"

This recipe needs a python3 version. Python2 will be EOL soon.

On Mon, Jun 3, 2019 at 1:04 PM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> I've merged your latest round of version bumps.
>
> Bruce
>
> On Thu, May 30, 2019 at 1:41 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> wrote:
> >
> > -Upgrade from python-positional_1.1.1.bb to python-positional_1.2.1.bb.
> >
> > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > ---
> >  ...{python-positional_1.1.1.bb => python-positional_1.2.1.bb} | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-openstack/recipes-devtools/python/{
> python-positional_1.1.1.bb => python-positional_1.2.1.bb} (75%)
> >
> > diff --git a/meta-openstack/recipes-devtools/python/
> python-positional_1.1.1.bb b/meta-openstack/recipes-devtools/python/
> python-positional_1.2.1.bb
> > similarity index 75%
> > rename from meta-openstack/recipes-devtools/python/
> python-positional_1.1.1.bb
> > rename to meta-openstack/recipes-devtools/python/
> python-positional_1.2.1.bb
> > index 144b2cc..93eb6e1 100644
> > --- a/meta-openstack/recipes-devtools/python/python-positional_1.1.1.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-positional_1.2.1.bb
> > @@ -4,8 +4,8 @@ SECTION = "devel/python"
> >  LICENSE = "Apache-2.0"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=5335066555b14d832335aa4660d6c376"
> >
> > -SRC_URI[md5sum] = "c82903c32c1aec1ac0f0f6e166ef4e2e"
> > -SRC_URI[sha256sum] =
> "ef845fa46ee5a11564750aaa09dd7db059aaf39c44c901b37181e5ffa67034b0"
> > +SRC_URI[md5sum] = "4afcffd8e2ba733fd7a50f137a2ee893"
> > +SRC_URI[sha256sum] =
> "cf48ea169f6c39486d5efa0ce7126a97bed979a52af6261cf255a41f9a74453a"
> >
> >  inherit setuptools pypi
> >
> > --
> > 2.20.1
> >
> >
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--0000000000002fe5db058ab6a689
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">This recipe needs a python3 version. Python2 will be=
 EOL soon.</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Jun 3, 2019 at 1:04 PM Bruce Ashfield &lt;<a h=
ref=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">I&#39;ve merged your latest ro=
und of version bumps.<br>
<br>
Bruce<br>
<br>
On Thu, May 30, 2019 at 1:41 AM Zang Ruochen &lt;<a href=3D"mailto:zangrc.f=
nst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; -Upgrade from <a href=3D"http://python-positional_1.1.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python-positional_1.1.1.bb</a> to <a href=3D"htt=
p://python-positional_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python=
-positional_1.2.1.bb</a>.<br>
&gt;<br>
&gt; Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fujit=
su.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...{<a href=3D"http://python-positional_1.1.1.bb" rel=3D"norefer=
rer" target=3D"_blank">python-positional_1.1.1.bb</a> =3D&gt; <a href=3D"ht=
tp://python-positional_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n-positional_1.2.1.bb</a>} | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 rename meta-openstack/recipes-devtools/python/{<a href=3D"http:/=
/python-positional_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-po=
sitional_1.1.1.bb</a> =3D&gt; <a href=3D"http://python-positional_1.2.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">python-positional_1.2.1.bb</a>} (75%)=
<br>
&gt;<br>
&gt; diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://=
python-positional_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-pos=
itional_1.1.1.bb</a> b/meta-openstack/recipes-devtools/python/<a href=3D"ht=
tp://python-positional_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n-positional_1.2.1.bb</a><br>
&gt; similarity index 75%<br>
&gt; rename from meta-openstack/recipes-devtools/python/<a href=3D"http://p=
ython-positional_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-posi=
tional_1.1.1.bb</a><br>
&gt; rename to meta-openstack/recipes-devtools/python/<a href=3D"http://pyt=
hon-positional_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python-positi=
onal_1.2.1.bb</a><br>
&gt; index 144b2cc..93eb6e1 100644<br>
&gt; --- a/meta-openstack/recipes-devtools/python/<a href=3D"http://python-=
positional_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python-positional=
_1.1.1.bb</a><br>
&gt; +++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-=
positional_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python-positional=
_1.2.1.bb</a><br>
&gt; @@ -4,8 +4,8 @@ SECTION =3D &quot;devel/python&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5335066555b14d83=
2335aa4660d6c376&quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;c82903c32c1aec1ac0f0f6e166ef4e2e&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;ef845fa46ee5a11564750aaa09dd7db059aaf39c=
44c901b37181e5ffa67034b0&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;4afcffd8e2ba733fd7a50f137a2ee893&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;cf48ea169f6c39486d5efa0ce7126a97bed979a5=
2af6261cf255a41f9a74453a&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit setuptools pypi<br>
&gt;<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_bla=
nk">meta-virtualization@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listi=
nfo/meta-virtualization</a><br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div></div>

--0000000000002fe5db058ab6a689--
