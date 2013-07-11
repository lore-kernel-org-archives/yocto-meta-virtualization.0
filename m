Return-Path: <cmayer1@binghamton.edu>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08E3DE0140D
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Jul 2013 06:46:28 -0700 (PDT)
Received: by mail-ob0-f169.google.com with SMTP id up14so10075857obb.14
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Jul 2013 06:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=E8lfwil/WHcSWuqq72eKETL864F//bZEUvMcVngNvFg=;
	b=dGbur51/rUFfkbz7y5+yIzxVuQ22V3QUuDkvuw8buF3QHT4/YKSMJRUZO8d8qFhaTn
	YeNE29APd2CT8uf1C2nSEyvUqqMW8eVc/dQc9AjOeKmL7nLAD34qtzDMCFCKobqmkoyF
	f4idtp1U4DCiYDXIwC4gCV5bHEUjp8YU/O+GtYML9UVXT2V0SMqyDbMLW2i4CKlFX07K
	LhAant6G94CP4298UWsQ7VbmurDaWAbb5c/+NH1nXEtrgKlSGkcI7FIMqIvIqnV+HEoK
	SCYISofDU7eOq5Xvd6p/MDLd4D2k2akXT8S+QjomMhr3y7ib6Ev1xmfjRuveXoI/cU8Y
	GCYw==
MIME-Version: 1.0
X-Received: by 10.60.52.16 with SMTP id p16mr32056923oeo.29.1373550388115;
	Thu, 11 Jul 2013 06:46:28 -0700 (PDT)
Received: by 10.76.19.18 with HTTP; Thu, 11 Jul 2013 06:46:28 -0700 (PDT)
Date: Thu, 11 Jul 2013 09:46:28 -0400
Message-ID: <CAOys6nobUKRgeadUW7-fz3tWf0hUa4Nw1Oif5Oy+-kyunK+aJA@mail.gmail.com>
From: Christopher W Mayer <cmayer1@binghamton.edu>
To: meta-virtualization@yoctoproject.org
X-Gm-Message-State: ALoCoQmT8WXJGgFfxwhsmFp5PCSSTR80zBFO0OIvFe6BpEG3KmY2urBPPCT1BMrH2fNwD4QUBDX+
Subject: Getting Xen Up and Running
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
X-List-Received-Date: Thu, 11 Jul 2013 13:46:29 -0000
Content-Type: multipart/alternative; boundary=001a11330b22f7081804e13c9e5b

--001a11330b22f7081804e13c9e5b
Content-Type: text/plain; charset=ISO-8859-1

Hi Everyone,
    I posted this same email to the Open Embedded mailing list a few days
ago, but was pointed here instead, so my apologies if this looks a little
familiar. I am trying to use the Meta-Virtualization layer to build Xen
dom0 support into an Open Embedded build. I've built the xen-image-minimal
target but when I try to boot it as dom0, I get this error


*'elf_xen_note_check: ERROR: Will only load images built for the
generic loader or Linux images')*

I used this link<http://xen.1045712.n5.nabble.com/Panic-on-CPU0-Unable-to-boot-with-Xen-4-1-on-Fedora-16-manual-grub2-config-after-compiling-Xen-from-e-td5571653.html>,followed
Ian Campbell's instructions (the third post down) and found that
the kernel being built is not Xen capable. Am I missing something simple
here? Is this a problem with the layer or am I using it wrong? Any help is
appreciated.

--001a11330b22f7081804e13c9e5b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Everyone,<br></div>=A0=A0=A0 I posted this same em=
ail to the Open Embedded mailing list a few days ago, but was pointed here =
instead, so my apologies if this looks a little familiar. I am trying to us=
e the=20
Meta-Virtualization layer to build Xen dom0 support into an Open=20
Embedded build. I&#39;ve built the xen-image-minimal target but when I try=
=20
to boot it as dom0, I get this error<br>
=A0 <br><pre style=3D"width:50em;font-size:medium;white-space:pre-wrap"><i>=
&#39;elf_xen_note_check: ERROR: Will only load images built for the generic=
 loader or Linux images&#39;)</i></pre>I used <a href=3D"http://xen.1045712=
.n5.nabble.com/Panic-on-CPU0-Unable-to-boot-with-Xen-4-1-on-Fedora-16-manua=
l-grub2-config-after-compiling-Xen-from-e-td5571653.html" target=3D"_blank"=
>this link</a>
 ,followed Ian Campbell&#39;s instructions (the third post down) and found=
=20
that the kernel being built is not Xen capable. Am I missing something=20
simple here? Is this a problem with the layer or am I using it wrong?=20
Any help is appreciated. </div>

--001a11330b22f7081804e13c9e5b--
