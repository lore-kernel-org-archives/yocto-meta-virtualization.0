Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34056E0087A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Jan 2014 09:11:48 -0800 (PST)
Received: by mail-la0-f47.google.com with SMTP id el20so3256955lab.34
	for <meta-virtualization@yoctoproject.org>;
	Mon, 20 Jan 2014 09:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7mvDx2NaOP1IEtT8HvQ9V23XfUsKifeFTL4FOBsiKtk=;
	b=Ab/e82NjfHzrEXzvy16hNFq50NAOVldBiSpTxhVDcrdM92oiTHiKrvVMWlvOT09eZb
	9f3eqY7sMYqNr2UQbSHS8axwRdBApCtJIcGvlWTBBH3udvbvRPmccnYLUcjG7AcZuATF
	pxdCP6gWc2OMSMUf7+AdYGyPXAGee2ZVOLyJJa6o4ZrdFlD6bjDjT9GGjJg0oamFxmM8
	gM+Cz60ARMPl7RXml9DzAuFIOW+v+YonuqTK2j7UjpnMQOQRCi4GGnp3KtEC6nWqT3eD
	S8Xb7Z2xjuKhyQLDrRh+dABQh5KsN8ZkKIBBEMLPJ5h3xmoqvxcgoRxzbiALNUCUNyK+
	R4CA==
MIME-Version: 1.0
X-Received: by 10.112.144.69 with SMTP id sk5mr2199892lbb.44.1390237907232;
	Mon, 20 Jan 2014 09:11:47 -0800 (PST)
Received: by 10.114.161.69 with HTTP; Mon, 20 Jan 2014 09:11:47 -0800 (PST)
In-Reply-To: <1390183175-1718-1-git-send-email-flihp@twobit.us>
References: <1390183175-1718-1-git-send-email-flihp@twobit.us>
Date: Mon, 20 Jan 2014 12:11:47 -0500
Message-ID: <CABZSBQeZqkuJg=CoJa+i1u=+vbJQbPj7Vs20Xo1noEm=0DgMrA@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/3] Xen recipe minor cleanup.
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
X-List-Received-Date: Mon, 20 Jan 2014 17:11:51 -0000
Content-Type: multipart/alternative; boundary=047d7b3432f49d2d9504f069fc7f

--047d7b3432f49d2d9504f069fc7f
Content-Type: text/plain; charset=ISO-8859-1

+1, series looks good to me.


On Sun, Jan 19, 2014 at 8:59 PM, Philip Tricca <flihp@twobit.us> wrote:

> Philip Tricca (3):
>   xen: Move supporting files into xencommons and xendomains packages.
>   xen: Cleanup watchdog FILES declaration.
>   xen: Add RDEPENDS for xencommons.
>
>  recipes-extended/xen/xen.inc |   25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> --
> 1.7.10.4
>
>

--047d7b3432f49d2d9504f069fc7f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+1, series looks good to me.<br></div><div class=3D"gmail_=
extra"><br><br><div class=3D"gmail_quote">On Sun, Jan 19, 2014 at 8:59 PM, =
Philip Tricca <span dir=3D"ltr">&lt;<a href=3D"mailto:flihp@twobit.us" targ=
et=3D"_blank">flihp@twobit.us</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Philip Tricca (3):<br>
=A0 xen: Move supporting files into xencommons and xendomains packages.<br>
=A0 xen: Cleanup watchdog FILES declaration.<br>
=A0 xen: Add RDEPENDS for xencommons.<br>
<br>
=A0recipes-extended/xen/xen.inc | =A0 25 +++++++++++++++++++------<br>
=A01 file changed, 19 insertions(+), 6 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.7.10.4<br>
<br>
</font></span></blockquote></div><br></div>

--047d7b3432f49d2d9504f069fc7f--
