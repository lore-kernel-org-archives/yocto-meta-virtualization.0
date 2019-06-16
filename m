Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3837E00D35; Sat, 15 Jun 2019 18:05:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6018FE00B1A
	for <meta-virtualization@yoctoproject.org>;
	Sat, 15 Jun 2019 18:05:50 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id t28so5915060lje.9
	for <meta-virtualization@yoctoproject.org>;
	Sat, 15 Jun 2019 18:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gzPIJB+93CceKYFgwOD5t8nbY1VzKW0tB8binROR6CQ=;
	b=tRjagULbrVfGM2wWRNBOK71Qt3UfeEIMN/csJpW3ir5DVT/uxBYf9dr/9VXnYpVG8q
	h7XcXYhWe6d3GfM5U/OgCZEe4otFROYBYVVFhewDL8gFpHXxiSzaFJPn7IvX1Pq2giyS
	iJduw2N8K1FWuHoTYmxxbEg6J4mAygIZtuoikbbcVLtcss9/Xxz7ii2x4LPgR5nWY6+n
	jqT59LqnBfnWpEclv6JsMeVlLzAT3yQieA2+/91pRr4I9P5rb7CcEqBqSYmWub2rg8Ti
	rqoa8devXSWquqSQnMMp039fEwyEGtGo6+wTsX3wGy9hCLe6+VY2QTSyUlN0sWxpoH2h
	RHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gzPIJB+93CceKYFgwOD5t8nbY1VzKW0tB8binROR6CQ=;
	b=LtmaeIJ0ZFLme7iJH+SSZuAS4rR7Yn85TezvFE33SCA9c3foy4ZdoTQeSf2hhpwo4p
	/hDxtPvRAMqmkxgoTQ1cFseyPx8HZOPxdGcWpbmcKmBsj5sbMxIMarJWRQ+ULKQ0PjkV
	k0qcLnTW8VUmv0UQUrQbnbQsXNxh8ZSJvh+gi+ceO3V4B5MBLy6PyM3VuHFzOkwigc1c
	FH7H7DffhRv0e8mJQUSKipVhFN1jDFrV7X29p8fa96Z4ueJEPPpNwIpYNKM3l9ODQdO5
	dvTExDvi4XcqyXpImFmHTDp+oFDAG5OyHv2g8CNNGcMJqC16zick6g4JRLRVicsVEXjR
	fH4g==
X-Gm-Message-State: APjAAAWQ6UFEFxedIQSk+UmU/56goPjN1aejvsChgtZy9ePwpv1TMQ5Z
	DeN/CEdChObO053peor3acXa8ccizCG/POHamoI=
X-Google-Smtp-Source: APXvYqwgvcVS04TT585fv2g85wPzhMgiflR6ffRZQ1TBvzHkPaySwacWyHCxIM2WqXUcucwQdVemKmtd4CHzgm+OUVM=
X-Received: by 2002:a2e:93c5:: with SMTP id p5mr20537743ljh.79.1560647149131; 
	Sat, 15 Jun 2019 18:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <1560531022-7970-1-git-send-email-bostancioglucevat@gmail.com>
	<CADkTA4NwSDYJYWQrdJdXECgTOa24P82KQvh9upRj+f__ZwjDyQ@mail.gmail.com>
	<CABPcKDPsEB_vvCWOKV267D=kDGYFFfPx9fJr85vqMwZuVJ6kfQ@mail.gmail.com>
In-Reply-To: <CABPcKDPsEB_vvCWOKV267D=kDGYFFfPx9fJr85vqMwZuVJ6kfQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 15 Jun 2019 21:05:37 -0400
Message-ID: <CADkTA4P6TgVebpjJqw2MWy=-CRhkhr4vE1Em517MQ3SUPVa3mQ@mail.gmail.com>
To: =?UTF-8?B?Q2V2YXQgQm9zdGFuY8Sxb8SfbHU=?= <bostancioglucevat@gmail.com>
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
X-List-Received-Date: Sun, 16 Jun 2019 01:05:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 15, 2019 at 4:05 PM Cevat Bostanc=C4=B1o=C4=9Flu
<bostancioglucevat@gmail.com> wrote:
>
> Hello, thanks for the fast reply, I am a newbie for patches/formats etc a=
nd I would like to learn the convention anyway.
>
> i created meta-virtualization-ci project on github and I don't know this =
meta targets & setups e2e.
> i am using for qemuarm target now. but if we can create a list of targets=
 & setups I would like to create e2e ci setup at my home.
> i also have x86_32/64 and many modern arm boards.
>
> I sent another email with descriptions, I am not sure how to reply to thi=
s email with git email.

A v2 in a new thread is fine. No need to reply to the old series.

>
> https://github.com/cevatbostancioglu/meta-virtualization-ci
>
> i think this feature is good for to HEAD,
> i think if we can at least create build tests for all recipes in layer we=
 don't have to worry about.

I do "all" builds before merging any changes, but for many of the
recipes in meta-virt, a successful compile doesn't mean much. For core
recipes, there are a series of system level tests that need to be run.
Eventually, I'll get them into a better form with automation, but for
now, I just run things as I merge changes.

Bruce

>
> Bruce Ashfield <bruce.ashfield@gmail.com>, 14 Haz 2019 Cum, 20:44 tarihin=
de =C5=9Funu yazd=C4=B1:
>>
>> Thanks for the fix. This non-attachment version is easier to review.
>>
>> We need a few tweaks and this should be ready to go.
>>
>> In the long log here, can you capture the compile error and associated
>> details (i.e.
>> architecture, etc). And then why this error has started now (was it
>> gcc9, something else ?)
>> .. plus how the fix solves the problem. (i disabled the Werror and now i=
 can compile kvmtool)
>>
>> You can then duplicate that log log into the patch itself.
>>
>> On Fri, Jun 14, 2019 at 12:50 PM Cevat Bostancioglu
>> <bostancioglucevat@gmail.com> wrote:
>> >
>> > Signed-off-by: Cevat Bostancioglu <bostancioglucevat@gmail.com>
>> > ---
>> >  ...-EXTRA_CFLAGS-variable-and-disable-werror.patch | 26 +++++++++++++=
++++++
>> >  .../0002-kvmtool-add-EXTRA_CFLAGS-variable.patch   | 29 -------------=
---------
>> >  recipes-extended/kvmtool/kvmtool.bb                |  2 +-
>> >  3 files changed, 27 insertions(+), 30 deletions(-)
>> >  create mode 100644 recipes-extended/kvmtool/files/0002-kvmtool-add-EX=
TRA_CFLAGS-variable-and-disable-werror.patch
>> >  delete mode 100644 recipes-extended/kvmtool/files/0002-kvmtool-add-EX=
TRA_CFLAGS-variable.patch
>>
>> We should just make this an additional patch, and not modify the
>> existing one. That way we are
>> keeping some of the history and bisectability in the changes.(i sent ano=
ther email, done)
>>
>> >
>> > diff --git a/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFL=
AGS-variable-and-disable-werror.patch b/recipes-extended/kvmtool/files/0002=
-kvmtool-add-EXTRA_CFLAGS-variable-and-disable-werror.patch
>> > new file mode 100644
>> > index 0000000..d910fae
>> > --- /dev/null
>> > +++ b/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-var=
iable-and-disable-werror.patch
>> > @@ -0,0 +1,26 @@
>> > +From 8e291af191339471c20292784ebb6de6122f4fc4 Mon Sep 17 00:00:00 200=
1
>> > +From: Cevat Bostancioglu <bostancioglucevat@gmail.com>
>> > +Date: Fri, 14 Jun 2019 18:47:25 +0300
>> > +Subject: [PATCH] kvmtool: add CFLAGS Variable and disable Werror
>> > +
>> > +to avoid CFLAGS and warnings via command argument
>>
>> You don't have a Signed-off-by: in the patch itself.
>>
>> .. and finally, is this a good opportunity to update to the HEAD of
>> the repo and pickup other fixes/features ? ( yes )
>>
>>
>>
>> Bruce
>>
>> > +---
>> > + Makefile | 3 +++
>> > + 1 file changed, 3 insertions(+)
>> > +
>> > +diff --git a/Makefile b/Makefile
>> > +index 030ff4e..e0a8b23 100644
>> > +--- a/Makefile
>> > ++++ b/Makefile
>> > +@@ -2,6 +2,9 @@
>> > + # Define WERROR=3D0 to disable -Werror.
>> > + #
>> > +
>> > ++WERROR=3D0
>> > ++CFLAGS +=3D $(EXTRA_CFLAGS)
>> > ++
>> > + ifeq ($(strip $(V)),)
>> > +       E =3D @echo
>> > +       Q =3D @
>> > +--
>> > +2.7.4
>> > diff --git a/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFL=
AGS-variable.patch b/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_=
CFLAGS-variable.patch
>> > deleted file mode 100644
>> > index 262531c..0000000
>> > --- a/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-var=
iable.patch
>> > +++ /dev/null
>> > @@ -1,29 +0,0 @@
>> > -From 977a4d41012d1814f5a5330cacc2e4944de387cc Mon Sep 17 00:00:00 200=
1
>> > -From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
>> > -Date: Sun, 5 Nov 2017 12:39:21 +0100
>> > -Subject: [PATCH 2/2] kvmtool: add EXTRA_CFLAGS variable
>> > -
>> > -to avoid CFLAGS overriding introduce new EXTRA_CFLAGS variable
>> > -for setting via command argument
>> > -
>> > -Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
>> > ----
>> > - Makefile | 2 ++
>> > - 1 file changed, 2 insertions(+)
>> > -
>> > -diff --git a/Makefile b/Makefile
>> > -index 64a0a16..bca1b26 100644
>> > ---- a/Makefile
>> > -+++ b/Makefile
>> > -@@ -2,6 +2,8 @@
>> > - # Define WERROR=3D0 to disable -Werror.
>> > - #
>> > -
>> > -+CFLAGS +=3D $(EXTRA_CFLAGS)
>> > -+
>> > - ifeq ($(strip $(V)),)
>> > -       E =3D @echo
>> > -       Q =3D @
>> > ---
>> > -2.15.0
>> > -
>> > diff --git a/recipes-extended/kvmtool/kvmtool.bb b/recipes-extended/kv=
mtool/kvmtool.bb
>> > index cb09c66..acecb08 100644
>> > --- a/recipes-extended/kvmtool/kvmtool.bb
>> > +++ b/recipes-extended/kvmtool/kvmtool.bb
>> > @@ -13,7 +13,7 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kern=
el/git/will/kvmtool.git \
>> >             file://external-crosscompiler.patch \
>> >             file://0001-Avoid-pointers-for-address-of-packed-members.p=
atch \
>> >             file://0001-kvmtool-9p-fixed-compilation-error.patch \
>> > -           file://0002-kvmtool-add-EXTRA_CFLAGS-variable.patch \
>> > +           file://0002-kvmtool-add-EXTRA_CFLAGS-variable-and-disable-=
werror.patch \
>> >             "
>> >
>> >  SRCREV =3D "0e1882a49f81cb15d328ef83a78849c0ea26eecc"
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

