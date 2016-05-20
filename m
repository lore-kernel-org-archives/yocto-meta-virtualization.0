Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D31FAE00F17; Fri, 20 May 2016 12:46:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8518CE00F0B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 May 2016 12:46:07 -0700 (PDT)
Received: by mail-oi0-f65.google.com with SMTP id w198so26064166oiw.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 May 2016 12:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=ZlynW901eCen7t6Y9boEx19TAOJfzLvVf98eKgcKWAw=;
	b=pSMT4n7oethJ0rUymieI53vSyawUuBwmDSVcsKoRp5i2aILGJ6iUyEStVz7oxYhruV
	P98//H4G5xzjAvSkJHZiYOXnoRoJsAknzSqs6TG7rIK6BlvjpVOyZoR1q5lREKFRbXB7
	WiOVgvQXz1CfwFOjTnkHljYl8fYDQ9MNrcbJy7LZAO0qZAkCH9B7hQqQz6rLq94nVnCT
	DAlm85fTcxyQOCjrPhkL5BKpHwq9QF+GgzQWycc8BBbAACgUO1RjG613f/HVT6cIBfnS
	MGXV1seFANELxX8jpasqXZkVySa3qVxi8Zsc8Rku1KK0gF8whcOWC4/5pWDyiX5x8hhT
	Mj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=ZlynW901eCen7t6Y9boEx19TAOJfzLvVf98eKgcKWAw=;
	b=itEu5p5uFzi7PXbvuUkDIF9teauGnNCTBsDRzfH0TcJMxRrEm/U12rqUzIL89F9rTg
	WuLTUr8sjwGzfFfYYMd3CGf58LqJYzgOBcXwVXibf+nghBcMoOsCTHymRLAB/Ob1c6H/
	6Ul/XI5hLmsPKWXzNxRLq6UyYFRTus6Rzk4PyN3l897viDh2HITrmweI/ndO7ArdTN0w
	5pf3fxHS6iC+XkLvf60bm0dgyy39ctpBXQbZGcDGWql9AiuRy9LMDrnn88lGTK7dKYOw
	KRwAhSJHvVYgqJunRpy+DGWmtZAD6IVXik+6rpF6OpIchjtABZXn5n/cZwoW3ZBdKqpO
	yqkw==
X-Gm-Message-State: AOPr4FWJM585xY6yKNPv/EeN1OshoiupQRHTZ2SQH8yvyzYFfqeN5ioijUll/hi+dywaJTw6HRFslbM52OE+/Q==
MIME-Version: 1.0
X-Received: by 10.202.91.7 with SMTP id p7mr3094759oib.16.1463773566750; Fri,
	20 May 2016 12:46:06 -0700 (PDT)
Received: by 10.157.32.198 with HTTP; Fri, 20 May 2016 12:46:06 -0700 (PDT)
In-Reply-To: <8ea11d6f-4707-55ce-ee18-6394cb3d4a83@mvista.com>
References: <1463725643-4514-1-git-send-email-zhe.he@windriver.com>
	<CADkTA4PhPeH8OtSknWb2U0AhoPz3x2-neFFxuX3HQ8epkrbpXQ@mail.gmail.com>
	<8ea11d6f-4707-55ce-ee18-6394cb3d4a83@mvista.com>
Date: Fri, 20 May 2016 15:46:06 -0400
Message-ID: <CADkTA4N0tVLLN4fxcitZxzfPa6Bamp-eUoB2qccoBXsOSj_+HA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "akuster@mvista" <akuster@mvista.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] qemu: Add packageconfig for libseccomp to avoid rdepend QA warning
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
X-List-Received-Date: Fri, 20 May 2016 19:46:12 -0000
Content-Type: multipart/alternative; boundary=001a113caba47a589d05334b577f

--001a113caba47a589d05334b577f
Content-Type: text/plain; charset=UTF-8

On Fri, May 20, 2016 at 12:41 PM, akuster@mvista <akuster@mvista.com> wrote:

> On 5/20/16 9:33 AM, Bruce Ashfield wrote:
> > merged to master.
> >
>
> Wont this make a depends on the meta-security layer where libseccomp lives?
>

Yep. When enabled (which I have in other builds). But since it is off by
default,
I'm fine with it.

Bruce


>
> - Armin
>
>
> > Bruce
> >
> > On Fri, May 20, 2016 at 2:27 AM, <zhe.he@windriver.com
> > <mailto:zhe.he@windriver.com>> wrote:
> >
> >     From: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
> >
> >     "WARNING: QA Issue: qemu rdepends on libseccomp, but it isn't a build
> >     dependency? [build-deps]"
> >
> >     Currently qemu itself checks and links with libsecomp(if version >=
> >     2.1.1)
> >     for x86 and x86-64, since it is not specified in configure, and
> >     causes the
> >     above warning.
> >
> >     This patch adds packageconfig for libseccomp and set it disabled as
> >     default.
> >     This feature can be enabled whenever libseccomp exists and is needed.
> >
> >     Signed-off-by: He Zhe <zhe.he@windriver.com
> >     <mailto:zhe.he@windriver.com>>
> >     ---
> >      meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend | 1 +
> >      1 file changed, 1 insertion(+)
> >
> >     diff --git a/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
> >     b/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
> >     index ca8274e..9d774c4 100644
> >     --- a/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
> >     +++ b/meta-openstack/recipes-devtools/qemu/qemu_2.%.bbappend
> >     @@ -1,4 +1,5 @@
> >      PACKAGECONFIG[spice] = "--enable-spice,--disable-spice,spice,"
> >     +PACKAGECONFIG[libseccomp] =
> >     "--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
> >
> >      PACKAGECONFIG ?= "fdt spice virtfs libcap-ng"
> >      PACKAGECONFIG_class-native = "fdt"
> >     --
> >     1.9.1
> >
> >     --
> >     _______________________________________________
> >     meta-virtualization mailing list
> >     meta-virtualization@yoctoproject.org
> >     <mailto:meta-virtualization@yoctoproject.org>
> >     https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end"
> >
> >
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113caba47a589d05334b577f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, May 20, 2016 at 12:41 PM, akuster@mvista <span dir=3D"ltr">&lt;=
<a href=3D"mailto:akuster@mvista.com" target=3D"_blank">akuster@mvista.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 5/20/16 9:33 AM,=
 Bruce Ashfield wrote:<br>
&gt; merged to master.<br>
&gt;<br>
<br>
Wont this make a depends on the meta-security layer where libseccomp lives?=
<br></blockquote><div><br></div><div>Yep. When enabled (which I have in oth=
er builds). But since it is off by default,</div><div>I&#39;m fine with it.=
</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<br>
- Armin<br>
<span class=3D""><br>
<br>
&gt; Bruce<br>
&gt;<br>
&gt; On Fri, May 20, 2016 at 2:27 AM, &lt;<a href=3D"mailto:zhe.he@windrive=
r.com">zhe.he@windriver.com</a><br>
</span>&gt; &lt;mailto:<a href=3D"mailto:zhe.he@windriver.com">zhe.he@windr=
iver.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver=
.com">zhe.he@windriver.com</a> &lt;mailto:<a href=3D"mailto:zhe.he@windrive=
r.com">zhe.he@windriver.com</a>&gt;&gt;<br>
<span class=3D"">&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;WARNING: QA Issue: qemu rdepends on libseccom=
p, but it isn&#39;t a build<br>
&gt;=C2=A0 =C2=A0 =C2=A0dependency? [build-deps]&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Currently qemu itself checks and links with libseco=
mp(if version &gt;=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A02.1.1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0for x86 and x86-64, since it is not specified in co=
nfigure, and<br>
&gt;=C2=A0 =C2=A0 =C2=A0causes the<br>
&gt;=C2=A0 =C2=A0 =C2=A0above warning.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0This patch adds packageconfig for libseccomp and se=
t it disabled as<br>
&gt;=C2=A0 =C2=A0 =C2=A0default.<br>
&gt;=C2=A0 =C2=A0 =C2=A0This feature can be enabled whenever libseccomp exi=
sts and is needed.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@=
windriver.com">zhe.he@windriver.com</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:zhe.he@windrive=
r.com">zhe.he@windriver.com</a>&gt;&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 meta-openstack/recipes-devtools/qemu/qemu_2.%.bbap=
pend | 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta-openstack/recipes-devtools/qemu/q=
emu_2.%.bbappend<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta-openstack/recipes-devtools/qemu/qemu_2.%.bba=
ppend<br>
&gt;=C2=A0 =C2=A0 =C2=A0index ca8274e..9d774c4 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta-openstack/recipes-devtools/qemu/qemu_2.%=
.bbappend<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta-openstack/recipes-devtools/qemu/qemu_2.%=
.bbappend<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,4 +1,5 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PACKAGECONFIG[spice] =3D &quot;--enable-spice,--di=
sable-spice,spice,&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+PACKAGECONFIG[libseccomp] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;--enable-seccomp,--disable-seccomp,libseccomp=
,libseccomp&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PACKAGECONFIG ?=3D &quot;fdt spice virtfs libcap-n=
g&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PACKAGECONFIG_class-native =3D &quot;fdt&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A01.9.1<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0_______________________________________________<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta-virtualization mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:meta-virtualization@yoctoproject.=
org">meta-virtualization@yoctoproject.org</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:meta-virtualiza=
tion@yoctoproject.org">meta-virtualization@yoctoproject.org</a>&gt;<br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"=
https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=3D"norefer=
rer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtual=
ization</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt; thee at its end&quot;<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a113caba47a589d05334b577f--
