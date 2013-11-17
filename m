Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 212F4E002AC
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Nov 2013 12:58:46 -0800 (PST)
Received: by mail-la0-f54.google.com with SMTP id ev20so4199829lab.41
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Nov 2013 12:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=FkmVZV1jzRSoVKIFow3endzUKP0Yg+CJRH9XNEQGU7g=;
	b=VTnvy8n3SY1xmwgB1yN/NKvAj+9M/2Rz92hVrmb1oAJmeomugz6HcMXJ8SG6r0EVh0
	AGW2+sUZaIPu8aPGPIH/+5s4El+cSzSFHGz2GzCOnuSqNAeCnagUX8VRVYJ3W5lYjLWx
	0AvdD0w70LPfEq6s569bQdgxr3ZI17JakC2dfbxtUCG4SHPB+lo8ZLiCeevx5Ns6Oucn
	gahXZT+MMs6uAEBAJvGCK/icMFhpKmLqIRDlQuK3tTFpd8s0xvHgzcjL67zNHcFAgCdL
	8YzI54+UG8NlcG+8ttmM0k9o99aXljoQqZWtp/kmDVZK3iE7dDsyqrNn1t9C10wtyldz
	3esA==
MIME-Version: 1.0
X-Received: by 10.152.6.74 with SMTP id y10mr11372975lay.16.1384721924289;
	Sun, 17 Nov 2013 12:58:44 -0800 (PST)
Received: by 10.114.181.41 with HTTP; Sun, 17 Nov 2013 12:58:44 -0800 (PST)
In-Reply-To: <CADkTA4OKxUpKr=0mqFREY9UCTWfAoG3QJwFft481rOwLc_cL7w@mail.gmail.com>
References: <CADkTA4OKxUpKr=0mqFREY9UCTWfAoG3QJwFft481rOwLc_cL7w@mail.gmail.com>
Date: Sun, 17 Nov 2013 15:58:44 -0500
Message-ID: <CABZSBQeNOp6A0gxTVEA6DsF8E+Ovho5DaDkr4eJsszP=Bz5E9g@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Xen Query ...
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
X-List-Received-Date: Sun, 17 Nov 2013 20:58:49 -0000
Content-Type: multipart/alternative; boundary=089e0149401a68faab04eb65b2c7

--089e0149401a68faab04eb65b2c7
Content-Type: text/plain; charset=ISO-8859-1

I did a couple of fresh builds yesterday against oe-core master without
issue (I do this pretty regularly...).

For the two distros that I build, they share:
DISTRO_FEATURES_append = " tpm txt usb3 xen opengl aufs "

Another build I do extends that even further.  They are regularly updated
to master on oe-core/meta-oe/meta-intel/meta-virtualization/meta-measured.

As another test, I took my existing "vanilla" build tree (nodistro, no
additional flags), created a new distro config and built xen-image-minimal:

oe-xen.conf:
DISTRO = "oe-xen"
DISTROOVERRIDES = ""
DISTRO_FEATURES_append = " xen aufs "

eglibc and the image built OK.

Then, in the same build tree, I went back to nodistro, with the same
DISTRO_FEATURES_append instead placed into local.conf.  eglibc and the
image built OK.

I will note that on occasion, I have seen the rare oddball errors (eglibc
sounds like a familiar one, but couldn't say for sure) - usually after a
substantial fetch and/or layer changes.  I've gone into the rabbit hole on
a couple of them without much success.  In all cases, wiping out
tmp/cache/sstate and starting fresh fixed the issues for me.

Out of curiosity, what's the error you are seeing?

Cheers,
-Chris

On Sat, Nov 16, 2013 at 10:42 PM, Bruce Ashfield
<bruce.ashfield@gmail.com>wrote:

> Hi all,
>
> Just sending a question to see who else is building Xen from
> meta-virtualization
> master against yocto/oe-core master ?
>
> All my builds have been failing on eglibc after adding xen and aufs to
> the DISTRO_FEATURES.
> I've worked around the problem and converted them to IMAGE_FEATURES to get
> full
> functionality, but I'm wondering if anyone else has seen this .. I
> want to rule out my
> build machine, and it being a one-off, before I dig any deeper.
>
> Cheers,
>
> Bruce
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--089e0149401a68faab04eb65b2c7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I did a couple of fresh builds yesterday against oe-core m=
aster without issue (I do this pretty regularly...).<div><br></div><div>For=
 the two distros that I build, they share:<br></div><div>DISTRO_FEATURES_ap=
pend =3D &quot; tpm txt usb3 xen opengl aufs &quot;<br>
</div><div><br></div><div class=3D"gmail_extra">Another build I do extends =
that even further. =A0They are regularly updated to master on oe-core/meta-=
oe/meta-intel/meta-virtualization/meta-measured.</div><div class=3D"gmail_e=
xtra">
<br></div><div class=3D"gmail_extra">As another test, I took my existing &q=
uot;vanilla&quot; build tree (nodistro, no additional flags), created a new=
 distro config and built xen-image-minimal:</div><div class=3D"gmail_extra"=
>
<br></div><div class=3D"gmail_extra">oe-xen.conf:</div><div class=3D"gmail_=
extra"><div class=3D"gmail_extra">DISTRO =3D &quot;oe-xen&quot;</div><div c=
lass=3D"gmail_extra">DISTROOVERRIDES =3D &quot;&quot;</div><div class=3D"gm=
ail_extra">
DISTRO_FEATURES_append =3D &quot; xen aufs &quot;<br></div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">eglibc and the image built =
OK.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Th=
en, in the same build tree, I went back to nodistro, with the same DISTRO_F=
EATURES_append instead placed into local.conf. =A0eglibc and the image buil=
t OK.</div>
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I will note=
 that on occasion, I have seen the rare oddball errors (eglibc sounds like =
a familiar one, but couldn&#39;t say for sure) - usually after a substantia=
l fetch and/or layer changes. =A0I&#39;ve gone into the rabbit hole on a co=
uple of them without much success. =A0In all cases, wiping out tmp/cache/ss=
tate and starting fresh fixed the issues for me.<br>
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Out o=
f curiosity, what&#39;s the error you are seeing?</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Cheers,</div><div class=3D"gmai=
l_extra">
-Chris</div><div class=3D"gmail_extra"><br></div></div><div class=3D"gmail_=
extra"><div class=3D"gmail_quote">On Sat, Nov 16, 2013 at 10:42 PM, Bruce A=
shfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">Hi all,<br>
<br>
Just sending a question to see who else is building Xen from meta-virtualiz=
ation<br>
master against yocto/oe-core master ?<br>
<br>
All my builds have been failing on eglibc after adding xen and aufs to<br>
the DISTRO_FEATURES.<br>
I&#39;ve worked around the problem and converted them to IMAGE_FEATURES to =
get full<br>
functionality, but I&#39;m wondering if anyone else has seen this .. I<br>
want to rule out my<br>
build machine, and it being a one-off, before I dig any deeper.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<span class=3D""><font color=3D"#888888"><br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</font></span></blockquote></div><br></div></div>

--089e0149401a68faab04eb65b2c7--
