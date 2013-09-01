Return-Path: <cjp256@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 509A7E0049C
	for <meta-virtualization@yoctoproject.org>;
	Sat, 31 Aug 2013 19:12:45 -0700 (PDT)
Received: by mail-lb0-f179.google.com with SMTP id x18so2906444lbi.24
	for <meta-virtualization@yoctoproject.org>;
	Sat, 31 Aug 2013 19:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Eo+GnEXXwNPxjXp7PNljal/OmWJN6ncXIYat6m3dnYE=;
	b=yx8Ho9mBRdb2HakI1yqLnp8BIaQJBtVhIT70SONeSVfQB9v6txiZ2g1OAVe+Zqsrn1
	mEDg8SjuYQf+HyvQPmEuzHtqK98UJA+BUE9nFsvrjO5/qsfoBXcPghchlRtDtJgPU7GA
	tWT/uhnUGP9P+3Aw9+Z636fixesOBZBq3PnRFSfznZRlWydOX3CeUjYyUmk15vBHHi6w
	rtoX1UOMWaAcRvASpMmdvGc3nZv7tppCmBXstZhQeS9d/sMkFUw5PTWwbnwNbfwuDWyc
	Ie3xn7ncXMHsNDvnL1tEq01PvCGzPIFVNghj+nisbUv6mD0hdwxsTHdICLXGTRqXp1AR
	UqYQ==
MIME-Version: 1.0
X-Received: by 10.152.87.143 with SMTP id ay15mr14806895lab.2.1378001564055;
	Sat, 31 Aug 2013 19:12:44 -0700 (PDT)
Received: by 10.114.181.41 with HTTP; Sat, 31 Aug 2013 19:12:43 -0700 (PDT)
In-Reply-To: <CADkTA4MAHOGDS7=8VMQQuUYDq_uGXq04WRyGqhfkVw=NBLHxOA@mail.gmail.com>
References: <1377833844-14672-1-git-send-email-cjp256@gmail.com>
	<1377833844-14672-2-git-send-email-cjp256@gmail.com>
	<CADkTA4MAHOGDS7=8VMQQuUYDq_uGXq04WRyGqhfkVw=NBLHxOA@mail.gmail.com>
Date: Sat, 31 Aug 2013 22:12:43 -0400
Message-ID: <CABZSBQfzXc4sKVmqxHwUNM+b+kNv4OaxNVTURsujH-YLzYsFdw@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/4] linux-yocto: add kernel fragment and scc for xen dom0 kernel support.
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
X-List-Received-Date: Sun, 01 Sep 2013 02:12:48 -0000
Content-Type: multipart/alternative; boundary=001a11c2409cb9be0804e548fd95

--001a11c2409cb9be0804e548fd95
Content-Type: text/plain; charset=ISO-8859-1

That'd be great.  There are a couple areas that could perhaps use some
work, as the fragment is a little excessive in some of the options and/or
could be broken up a little better, if desired.  On this topic, I have a
couple questions that would help steer me in the right direction in the
future:

1) One thing that's not immediately clear for me is the question of how to
best handle a case where a CONFIG_XXX option may in one instance, be
desirable to be built in - vs being a module in another?  Doing a quick
test seems to imply the first defined instance is the one used, but I'm not
sure if there are any well defined rules for conflict resolution.  The
reason I'm asking is there are CONFIG_XXX=y instances in this config - some
of which need to be built in, some required, and some just *preferably*
built in for various use cases. Specifically CONFIG_XEN_PCIDEV_BACKEND=y
provides some useful functionality before a module could otherwise be
loaded (prevent a pci device from being owned by a linux driver).

2) The other thing I am curious about is how to negotiate the inclusion of
a KERNEL_FEATURES which has a number of built-in bits.  The approach used
by kvm is to effectively always enable the fragment if one is including
meta-virtualization.  This in and of itself isn't really polluting the
target image for those that don't want KVM, because they likely simply
don't include the built kvm modules (ignoring CONFIG_TUN=y).  However, when
you have the =y cases, the user of the layer doesn't have a choice without
going through and commenting out the KERNEL_FEATURES_append...?  This was
the reasoning I took for choosing the base_contains() functionality instead
of just including it like the other bits (ebtables, vswitch, etc.).  Is the
goal for the layer's linux-yocto bbappend to support a "generic" kernel (by
default) to support all of its packages/images?

Take care,
-Chris

--001a11c2409cb9be0804e548fd95
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>That&#39;d be great.=A0 There are a couple areas that=
 could perhaps use some work, as the fragment is a little excessive in some=
 of the options and/or could be broken up a little better, if desired.=A0 O=
n this topic, I have a couple questions that would help steer me in the rig=
ht direction in the future:<br>
<br>1) One thing that&#39;s not immediately clear for me is the question of=
 how to best handle a case where a CONFIG_XXX option may in one instance, b=
e desirable to be built in - vs being a module in another?=A0 Doing a quick=
 test seems to imply the first defined instance is the one used, but I&#39;=
m not sure if there are any well defined rules for conflict resolution.=A0 =
The reason I&#39;m asking is there are CONFIG_XXX=3Dy instances in this con=
fig - some of which need to be built in, some required, and some just *pref=
erably* built in for various use cases. Specifically CONFIG_XEN_PCIDEV_BACK=
END=3Dy provides some useful functionality before a module could otherwise =
be loaded (prevent a pci device from being owned by a linux driver).<br>
<br>2) The other thing I am curious about is how to negotiate the inclusion=
 of a KERNEL_FEATURES which has a number of built-in bits.=A0 The approach =
used by kvm is to effectively always enable the fragment if one is includin=
g meta-virtualization.=A0 This in and of itself isn&#39;t really polluting =
the target image for those that don&#39;t want KVM, because they likely sim=
ply don&#39;t include the built kvm modules (ignoring CONFIG_TUN=3Dy).=A0 H=
owever, when you have the =3Dy cases, the user of the layer doesn&#39;t hav=
e a choice without going through and commenting out the KERNEL_FEATURES_app=
end...?=A0 This was the reasoning I took for choosing the base_contains() f=
unctionality instead of just including it like the other bits (ebtables, vs=
witch, etc.).=A0 Is the goal for the layer&#39;s linux-yocto bbappend to su=
pport a &quot;generic&quot; kernel (by default) to support all of its packa=
ges/images?<br>
<br></div>Take care,<br><div>-Chris</div></div>

--001a11c2409cb9be0804e548fd95--
