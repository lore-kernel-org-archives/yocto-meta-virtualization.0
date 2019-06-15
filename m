Return-Path: <bostancioglucevat@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 83436E00C5C; Sat, 15 Jun 2019 13:05:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FROM_EXCESS_BASE64,
	HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bostancioglucevat[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.67 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.0 FROM_EXCESS_BASE64 From: base64 encoded unnecessarily
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14F6FE00A49
	for <meta-virtualization@yoctoproject.org>;
	Sat, 15 Jun 2019 13:05:42 -0700 (PDT)
Received: by mail-ed1-f67.google.com with SMTP id k8so8955725edr.11
	for <meta-virtualization@yoctoproject.org>;
	Sat, 15 Jun 2019 13:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jnseZK6/uD4WvoCsfkWwdpWtpGxvWHRlVLBDOljkPac=;
	b=HSoQ9GPF2Z7gP1yQ4YE+e5Mwf7AdV9TbosN6+JtgZ4PdyxzPvNtKCAJr6qK0IjdBy6
	yBShXH8e8TG+Nc5GWeaAvqu6yRtZ0mpkKjMwiv2TC1Zvf+6FTqKKwQ70HO8vjeguhrlK
	Cu1D6Ll4rx6/XzunsewDSKdkmAlTsNtDMn6dAopoe8QrzXXQj8Nxsc8M3YNTaL9L1A6C
	VPt4irCor0a7pt+uCp5WRmDJiFZyvpQ7kVWX9Dxc2xiHWC5JJM6aIH/cWf0JRy3gGs8X
	Q/AEMPbKvYohctcoqeOgmPIOxOcYQy8tBK8LuecKzIqFW+3W+finjnvspLLddLDh1nJl
	ZDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jnseZK6/uD4WvoCsfkWwdpWtpGxvWHRlVLBDOljkPac=;
	b=o/TtksR2C+h8G/3gatSRDToXR4ebgqrnkq0KsRf6xeHw7A3aKeg0bcI0R/6jW8z4Uz
	fudBylkMF3y9czULewcQ8WvDcU0/zwYkqHnkxGWOJFZu2jcby8xde3LGzKL2HAnAZFB7
	8SNBAEkjCoLtmOJ0/zlJR5D9X7SjRAxvrfsTy5aUZXyFkrSb83RDGx8IssvzLcXy7jMs
	r2TDCTbpnE+5fk0mj/dUlRqxUlxsNMcp43EQmvzmlmaN+YwXiRnzDUROu1/Gkg8mBGNp
	/aR4zE24CoeggzUU1ECVhtrT/i7JVLwkAb+RiLLbpyXv58sQaYKolkt0KOiv+pMKv/eL
	rAeA==
X-Gm-Message-State: APjAAAW9OzCN1NeJ0aphuaz6IDKEN1G7YNXTEpC7xK4L1olxT9Sn2eSI
	GxcisiJDHE1qDIkYq4F+OLzbBKfYZAFd+4slTec=
X-Google-Smtp-Source: APXvYqyirX9Bw6nEldT/myA/rsGJEHBTDGQqafItnfx4o/7ApPcsUisJdhkLsd2+G10Ob/BLLmORVEnMCZ7pWlCTbLI=
X-Received: by 2002:a17:906:948c:: with SMTP id
	t12mr73587784ejx.222.1560629141923; 
	Sat, 15 Jun 2019 13:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <1560531022-7970-1-git-send-email-bostancioglucevat@gmail.com>
	<CADkTA4NwSDYJYWQrdJdXECgTOa24P82KQvh9upRj+f__ZwjDyQ@mail.gmail.com>
In-Reply-To: <CADkTA4NwSDYJYWQrdJdXECgTOa24P82KQvh9upRj+f__ZwjDyQ@mail.gmail.com>
From: =?UTF-8?B?Q2V2YXQgQm9zdGFuY8Sxb8SfbHU=?= <bostancioglucevat@gmail.com>
Date: Sat, 15 Jun 2019 23:05:30 +0300
Message-ID: <CABPcKDPsEB_vvCWOKV267D=kDGYFFfPx9fJr85vqMwZuVJ6kfQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] kvmtool: Werror compile time error fixed.
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
X-List-Received-Date: Sat, 15 Jun 2019 20:05:44 -0000
Content-Type: multipart/alternative; boundary="000000000000a16b7b058b62497a"

--000000000000a16b7b058b62497a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, thanks for the fast reply, I am a newbie for patches/formats etc and
I would like to learn the convention anyway.

i created meta-virtualization-ci project on github and I don't know this
meta targets & setups e2e.
i am using for qemuarm target now. but if we can create a list of targets &
setups I would like to create e2e ci setup at my home.
i also have x86_32/64 and many modern arm boards.

I sent another email with descriptions, I am not sure how to reply to this
email with git email.

https://github.com/cevatbostancioglu/meta-virtualization-ci

i think this feature is good for to HEAD,
i think if we can at least create build tests for all recipes in layer we
don't have to worry about.

Bruce Ashfield <bruce.ashfield@gmail.com>, 14 Haz 2019 Cum, 20:44 tarihinde
=C5=9Funu yazd=C4=B1:

> Thanks for the fix. This non-attachment version is easier to review.
>
> We need a few tweaks and this should be ready to go.
>
>
>
>
>
> * In the long log here, can you capture the compile error and associated
> details (i.e. architecture, etc). And then why this error has started now
> (was it gcc9, something else ?) .. plus how the fix solves the problem*.
> (i disabled the Werror and now i can compile kvmtool)
>
> You can then duplicate that log log into the patch itself.
>
> On Fri, Jun 14, 2019 at 12:50 PM Cevat Bostancioglu
> <bostancioglucevat@gmail.com> wrote:
> >
> > Signed-off-by: Cevat Bostancioglu <bostancioglucevat@gmail.com>
> > ---
> >  ...-EXTRA_CFLAGS-variable-and-disable-werror.patch | 26
> +++++++++++++++++++
> >  .../0002-kvmtool-add-EXTRA_CFLAGS-variable.patch   | 29
> ----------------------
> >  recipes-extended/kvmtool/kvmtool.bb                |  2 +-
> >  3 files changed, 27 insertions(+), 30 deletions(-)
> >  create mode 100644
> recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable-and=
-disable-werror.patch
> >  delete mode 100644
> recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.pat=
ch
>
>
>
> * We should just make this an additional patch, and not modify the
> existing one. That way we are keeping some of the history and bisectabili=
ty
> in the changes.(i sent another email, done)*
>
> >
> > diff --git
> a/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable-a=
nd-disable-werror.patch
> b/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable-a=
nd-disable-werror.patch
> > new file mode 100644
> > index 0000000..d910fae
> > --- /dev/null
> > +++
> b/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable-a=
nd-disable-werror.patch
> > @@ -0,0 +1,26 @@
> > +From 8e291af191339471c20292784ebb6de6122f4fc4 Mon Sep 17 00:00:00 2001
> > +From: Cevat Bostancioglu <bostancioglucevat@gmail.com>
> > +Date: Fri, 14 Jun 2019 18:47:25 +0300
> > +Subject: [PATCH] kvmtool: add CFLAGS Variable and disable Werror
> > +
> > +to avoid CFLAGS and warnings via command argument
>
> You don't have a Signed-off-by: in the patch itself.
>
>
> * .. and finally, is this a good opportunity to update to the HEAD of the
> repo and pickup other fixes/features ? ( yes )*


>
> Bruce
>
> > +---
> > + Makefile | 3 +++
> > + 1 file changed, 3 insertions(+)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 030ff4e..e0a8b23 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -2,6 +2,9 @@
> > + # Define WERROR=3D0 to disable -Werror.
> > + #
> > +
> > ++WERROR=3D0
> > ++CFLAGS +=3D $(EXTRA_CFLAGS)
> > ++
> > + ifeq ($(strip $(V)),)
> > +       E =3D @echo
> > +       Q =3D @
> > +--
> > +2.7.4
> > diff --git
> a/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.p=
atch
> b/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.p=
atch
> > deleted file mode 100644
> > index 262531c..0000000
> > ---
> a/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.p=
atch
> > +++ /dev/null
> > @@ -1,29 +0,0 @@
> > -From 977a4d41012d1814f5a5330cacc2e4944de387cc Mon Sep 17 00:00:00 2001
> > -From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
> > -Date: Sun, 5 Nov 2017 12:39:21 +0100
> > -Subject: [PATCH 2/2] kvmtool: add EXTRA_CFLAGS variable
> > -
> > -to avoid CFLAGS overriding introduce new EXTRA_CFLAGS variable
> > -for setting via command argument
> > -
> > -Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
> > ----
> > - Makefile | 2 ++
> > - 1 file changed, 2 insertions(+)
> > -
> > -diff --git a/Makefile b/Makefile
> > -index 64a0a16..bca1b26 100644
> > ---- a/Makefile
> > -+++ b/Makefile
> > -@@ -2,6 +2,8 @@
> > - # Define WERROR=3D0 to disable -Werror.
> > - #
> > -
> > -+CFLAGS +=3D $(EXTRA_CFLAGS)
> > -+
> > - ifeq ($(strip $(V)),)
> > -       E =3D @echo
> > -       Q =3D @
> > ---
> > -2.15.0
> > -
> > diff --git a/recipes-extended/kvmtool/kvmtool.bb
> b/recipes-extended/kvmtool/kvmtool.bb
> > index cb09c66..acecb08 100644
> > --- a/recipes-extended/kvmtool/kvmtool.bb
> > +++ b/recipes-extended/kvmtool/kvmtool.bb
> > @@ -13,7 +13,7 @@ SRC_URI =3D "git://
> git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git \
> >             file://external-crosscompiler.patch \
> >
>  file://0001-Avoid-pointers-for-address-of-packed-members.patch \
> >             file://0001-kvmtool-9p-fixed-compilation-error.patch \
> > -           file://0002-kvmtool-add-EXTRA_CFLAGS-variable.patch \
> > +
>  file://0002-kvmtool-add-EXTRA_CFLAGS-variable-and-disable-werror.patch \
> >             "
> >
> >  SRCREV =3D "0e1882a49f81cb15d328ef83a78849c0ea26eecc"
> > --
> > 2.7.4
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
>

--000000000000a16b7b058b62497a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, thanks for the fast reply,=C2=A0I am a newbie =
for patches/formats etc and I would like to learn the convention anyway.<br=
><br>i created meta-virtualization-ci project on github and I don&#39;t kno=
w this meta targets &amp; setups e2e.=C2=A0</div><div>i am using for qemuar=
m target now. but if we can create a list of targets &amp; setups I would l=
ike to create e2e ci setup at my home.<br>i also have x86_32/64 and many mo=
dern arm boards.</div><div><br></div><div>I sent another email with descrip=
tions, I am not sure how to reply to this email with git email.<br><br><a h=
ref=3D"https://github.com/cevatbostancioglu/meta-virtualization-ci">https:/=
/github.com/cevatbostancioglu/meta-virtualization-ci</a><br><br>i think thi=
s feature is good for to HEAD,<br>i think if we can at least create build t=
ests for all recipes in layer we don&#39;t have to worry about.<br><br></di=
v><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Bruce As=
hfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail=
.com</a>&gt;, 14 Haz 2019 Cum, 20:44 tarihinde =C5=9Funu yazd=C4=B1:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Thanks for the fix. Th=
is non-attachment version is easier to review.<br>
<br>
We need a few tweaks and this should be ready to go.<br>
<br><b>
In the long log here, can you capture the compile error and associated<br>
details (i.e.<br>
architecture, etc). And then why this error has started now (was it<br>
gcc9, something else ?)<br>
.. plus how the fix solves the problem</b>. (i disabled the Werror and now =
i can compile kvmtool)<br>
<br>
You can then duplicate that log log into the patch itself.<br>
<br>
On Fri, Jun 14, 2019 at 12:50 PM Cevat Bostancioglu<br>
&lt;<a href=3D"mailto:bostancioglucevat@gmail.com" target=3D"_blank">bostan=
cioglucevat@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Cevat Bostancioglu &lt;<a href=3D"mailto:bostanciogluce=
vat@gmail.com" target=3D"_blank">bostancioglucevat@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...-EXTRA_CFLAGS-variable-and-disable-werror.patch | 26 ++++++++=
+++++++++++<br>
&gt;=C2=A0 .../0002-kvmtool-add-EXTRA_CFLAGS-variable.patch=C2=A0 =C2=A0| 2=
9 ----------------------<br>
&gt;=C2=A0 recipes-extended/kvmtool/<a href=3D"http://kvmtool.bb" rel=3D"no=
referrer" target=3D"_blank">kvmtool.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 3 files changed, 27 insertions(+), 30 deletions(-)<br>
&gt;=C2=A0 create mode 100644 recipes-extended/kvmtool/files/0002-kvmtool-a=
dd-EXTRA_CFLAGS-variable-and-disable-werror.patch<br>
&gt;=C2=A0 delete mode 100644 recipes-extended/kvmtool/files/0002-kvmtool-a=
dd-EXTRA_CFLAGS-variable.patch<br>
<br><b>
We should just make this an additional patch, and not modify the<br>
existing one. That way we are<br>
keeping some of the history and bisectability in the changes.(i sent anothe=
r email, done)</b><br>
<br>
&gt;<br>
&gt; diff --git a/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFL=
AGS-variable-and-disable-werror.patch b/recipes-extended/kvmtool/files/0002=
-kvmtool-add-EXTRA_CFLAGS-variable-and-disable-werror.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..d910fae<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-var=
iable-and-disable-werror.patch<br>
&gt; @@ -0,0 +1,26 @@<br>
&gt; +From 8e291af191339471c20292784ebb6de6122f4fc4 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Cevat Bostancioglu &lt;<a href=3D"mailto:bostancioglucevat@gmai=
l.com" target=3D"_blank">bostancioglucevat@gmail.com</a>&gt;<br>
&gt; +Date: Fri, 14 Jun 2019 18:47:25 +0300<br>
&gt; +Subject: [PATCH] kvmtool: add CFLAGS Variable and disable Werror<br>
&gt; +<br>
&gt; +to avoid CFLAGS and warnings via command argument<br>
<br>
You don&#39;t have a Signed-off-by: in the patch itself.<br>
<br><b>
.. and finally, is this a good opportunity to update to the HEAD of<br>
the repo and pickup other fixes/features ? ( yes )</b>=C2=A0</blockquote><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Bruce<br>
<br>
&gt; +---<br>
&gt; + Makefile | 3 +++<br>
&gt; + 1 file changed, 3 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/Makefile b/Makefile<br>
&gt; +index 030ff4e..e0a8b23 100644<br>
&gt; +--- a/Makefile<br>
&gt; ++++ b/Makefile<br>
&gt; +@@ -2,6 +2,9 @@<br>
&gt; + # Define WERROR=3D0 to disable -Werror.<br>
&gt; + #<br>
&gt; +<br>
&gt; ++WERROR=3D0<br>
&gt; ++CFLAGS +=3D $(EXTRA_CFLAGS)<br>
&gt; ++<br>
&gt; + ifeq ($(strip $(V)),)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0E =3D @echo<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Q =3D @<br>
&gt; +--<br>
&gt; +2.7.4<br>
&gt; diff --git a/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFL=
AGS-variable.patch b/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_=
CFLAGS-variable.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 262531c..0000000<br>
&gt; --- a/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-var=
iable.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,29 +0,0 @@<br>
&gt; -From 977a4d41012d1814f5a5330cacc2e4944de387cc Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Dariusz Pelowski &lt;<a href=3D"mailto:dariusz.pelowski@gmail.c=
om" target=3D"_blank">dariusz.pelowski@gmail.com</a>&gt;<br>
&gt; -Date: Sun, 5 Nov 2017 12:39:21 +0100<br>
&gt; -Subject: [PATCH 2/2] kvmtool: add EXTRA_CFLAGS variable<br>
&gt; -<br>
&gt; -to avoid CFLAGS overriding introduce new EXTRA_CFLAGS variable<br>
&gt; -for setting via command argument<br>
&gt; -<br>
&gt; -Signed-off-by: Dariusz Pelowski &lt;<a href=3D"mailto:dariusz.pelowsk=
i@gmail.com" target=3D"_blank">dariusz.pelowski@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - Makefile | 2 ++<br>
&gt; - 1 file changed, 2 insertions(+)<br>
&gt; -<br>
&gt; -diff --git a/Makefile b/Makefile<br>
&gt; -index 64a0a16..bca1b26 100644<br>
&gt; ---- a/Makefile<br>
&gt; -+++ b/Makefile<br>
&gt; -@@ -2,6 +2,8 @@<br>
&gt; - # Define WERROR=3D0 to disable -Werror.<br>
&gt; - #<br>
&gt; -<br>
&gt; -+CFLAGS +=3D $(EXTRA_CFLAGS)<br>
&gt; -+<br>
&gt; - ifeq ($(strip $(V)),)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0E =3D @echo<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0Q =3D @<br>
&gt; ---<br>
&gt; -2.15.0<br>
&gt; -<br>
&gt; diff --git a/recipes-extended/kvmtool/<a href=3D"http://kvmtool.bb" re=
l=3D"noreferrer" target=3D"_blank">kvmtool.bb</a> b/recipes-extended/kvmtoo=
l/<a href=3D"http://kvmtool.bb" rel=3D"noreferrer" target=3D"_blank">kvmtoo=
l.bb</a><br>
&gt; index cb09c66..acecb08 100644<br>
&gt; --- a/recipes-extended/kvmtool/<a href=3D"http://kvmtool.bb" rel=3D"no=
referrer" target=3D"_blank">kvmtool.bb</a><br>
&gt; +++ b/recipes-extended/kvmtool/<a href=3D"http://kvmtool.bb" rel=3D"no=
referrer" target=3D"_blank">kvmtool.bb</a><br>
&gt; @@ -13,7 +13,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.kernel=
.org/pub/scm/linux/kernel/git/will/kvmtool.git" rel=3D"noreferrer" target=
=3D"_blank">git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git</a> \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://external-crossco=
mpiler.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Avoid-point=
ers-for-address-of-packed-members.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-kvmtool-9p-=
fixed-compilation-error.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-kvmtool-add-EXTR=
A_CFLAGS-variable.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-kvmtool-add-EXTR=
A_CFLAGS-variable-and-disable-werror.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;0e1882a49f81cb15d328ef83a78849c0ea26eecc&quot;<=
br>
&gt; --<br>
&gt; 2.7.4<br>
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
--<br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div></div>

--000000000000a16b7b058b62497a--
