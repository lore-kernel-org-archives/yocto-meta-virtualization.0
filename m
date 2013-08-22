Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 894CEE00747
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Aug 2013 17:54:38 -0700 (PDT)
Received: by mail-la0-f52.google.com with SMTP id ev20so895064lab.39
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Aug 2013 17:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Rxq/xswQXbiuN53j6L6tMTZHcSzvcImPzVApYamsmX8=;
	b=TANi0qzLIE1WDBDuzouBKhRGWzvbxF+ogvAxW9iOAh3iKQ6bKEzyEyl0LLCDS470c3
	gq/mdZxNuPWoulQ+Lc03o+FmWrUDX0QwAbzrNvlVJIZpYrCAGlzQ7d2Lfsza56iSp8Sf
	dUbWtco7CKEFjn30uxX5vVysSlrVsuMChd4+IzqcvTgyuQEDwaO2FAHC61kfuIwdu2T6
	h/Zo7ktu532apWofXzeHbWnnitXimUNOvOhwbJztMfYS9fOL7CDC+bkswtxvvktHMCsA
	nFZ1kIStplVmJxHINBFkiDOls6jYngHsRTtD7NHH8qbAiz+jbWBWU6rtshL8fqXc6BMj
	O/gw==
MIME-Version: 1.0
X-Received: by 10.112.168.170 with SMTP id zx10mr9212782lbb.0.1377132877856;
	Wed, 21 Aug 2013 17:54:37 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Wed, 21 Aug 2013 17:54:37 -0700 (PDT)
In-Reply-To: <1377094573-30072-1-git-send-email-david.nystrom@enea.com>
References: <1377094573-30072-1-git-send-email-david.nystrom@enea.com>
Date: Wed, 21 Aug 2013 20:54:37 -0400
Message-ID: <CADkTA4NHoDDeP1C262yZ=dj3+eqJUa2vuBw4xPHLiN4exnhfVQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Fixed Q&A error for OpenFlow recipe
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
X-List-Received-Date: Thu, 22 Aug 2013 00:54:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Can you dump the QA recipe here for the long log ? I've been building this =
and
haven't seen it myself. So I'm curious to see what it is .. with it in
the commit log,
I'll know if I see it.

On Wed, Aug 21, 2013 at 10:16 AM, David Nystr=F6m
<david.c.nystrom@gmail.com> wrote:
> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>
> ---
>  recipes-networking/openflow/openflow_1.0.bb | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-networking/openflow/openflow_1.0.bb b/recipes-networ=
king/openflow/openflow_1.0.bb
> index 3663e50..20a2bc9 100644
> --- a/recipes-networking/openflow/openflow_1.0.bb
> +++ b/recipes-networking/openflow/openflow_1.0.bb
> @@ -1,4 +1,4 @@
> -SUMMARY =3D "OpelFlow"
> +SUMMARY =3D "OpenFlow"

I for one liked the OpelFlow support! :)

>  DESCRIPTION =3D "Provide a generic framework for handling devices in use=
rspace."
>  HOMEPAGE =3D "http://www.openflow.org"
>  SECTION =3D "networking"
> @@ -21,4 +21,9 @@ PACKAGECONFIG[libssl] =3D "--enable-ssl,--disable-ssl, =
openssl, libssl"
>
>  S =3D "${WORKDIR}/git"
>
> -inherit autotools
> \ No newline at end of file
> +inherit autotools
> +
> +do_install_append() {
> +       # Remove /var/run as it is created on startup
> +        rm -rf ${D}${localstatedir}/run
> +}

Indeed .. this will get populated without OpenFlow's help.

Bruce

> --
> 1.8.3.2
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

