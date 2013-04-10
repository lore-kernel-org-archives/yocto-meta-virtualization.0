Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E4A8E014D1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 09:54:06 -0700 (PDT)
Received: by mail-lb0-f174.google.com with SMTP id s10so742787lbi.5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 09:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=b+zKY64YtlO9Fl9nQHfBy3IqvNYo7zJDDV54/6XHvRQ=;
	b=KcVCOuvPqM3wuC3qdwg49aNYfIZ6eTFMXn6ldlPBfTL5jDjv9xgHYwMImk3l02h1i5
	e1tZIJiwn/k0REkTrglI8UOTRfJS3+22kAnB5syzaiVBi48aqp/P7Zkw5PREJ2XyGbuH
	Y7tmQ9WeYbmPtek39hestU+xuA0hn9bYxGfJjCj0kCYfPU9zNT2XfPEqmn+LOXR5iECv
	OWu7uh5asrFUJRc25a0mPVsQ3N0Vac/jbY33R6/53aWORa3wpZq7JcgfNNxtMXz3b4dM
	VgtO7o71nZSOcV3bhBOBFVPLwVCblc5rxO4hgYHSzPu+GgJeIypD1cw+KGTjQ/rO0gvW
	/g6A==
MIME-Version: 1.0
X-Received: by 10.112.155.67 with SMTP id vu3mr1549923lbb.109.1365612844918;
	Wed, 10 Apr 2013 09:54:04 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Wed, 10 Apr 2013 09:54:04 -0700 (PDT)
In-Reply-To: <E7E317BD5B5D764682EEAC13B01676E264D3F8@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1365586806-8155-1-git-send-email-bogdan.purcareata@freescale.com>
	<1365592743-24488-1-git-send-email-bogdan.purcareata@freescale.com>
	<CADkTA4OTJH-deN7=zRkgSm9O=krEAhVHsAAmM2YYYFmO+iUkLw@mail.gmail.com>
	<E7E317BD5B5D764682EEAC13B01676E264D3F8@039-SN2MPN1-021.039d.mgd.msft.net>
Date: Wed, 10 Apr 2013 12:54:04 -0400
Message-ID: <CADkTA4PFijf0zZphbK1koJ-MJqBAH0rTZ85n6ZBjRfqGAk7zXA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Purcareata Bogdan-B43198 <B43198@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Add disable udhcp patch to LXC recipe
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
X-List-Received-Date: Wed, 10 Apr 2013 16:54:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2013 at 9:12 AM, Purcareata Bogdan-B43198
<B43198@freescale.com> wrote:
> Hello,
>
> The patch makes a modification to the LXC busybox template - the one that=
 creates a minimal container with Busybox.
>
> This container will start the udhcpc service - the DHCP client - on init.=
 For an embedded Linux image, can we assume that most containers will have =
manual / static networking configuration on start? If so, starting the udhc=
pc service by default is useless, since the service will then have to be ki=
lled. If there are still containers that use DHCP for networking, they can =
start udhcpc after container boot.
>
> The patch deactivates default start of the DHCP client on a Busybox conta=
iner init.

This definitely explains the logic, and does belong in an amended long
log for the
change. Because at some point someone will wonder why.

I don't disagree with the reasoning, but it would be nice to have this
as an optional
change. Since this is a patch, the options for doing it cleanly are limited=
.

So with a cleaned up long log, let's merge this as is after you
resend, and we'll see
about making it optional if it causes a problem.

Cheers,

Bruce

>
> Best regards,
> Bogdan P.
>
>
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Wednesday, April 10, 2013 3:55 PM
>> To: Purcareata Bogdan-B43198
>> Cc: meta-virtualization@yoctoproject.org
>> Subject: Re: [meta-virtualization] [PATCH] Add disable udhcp patch to LX=
C recipe
>>
>> Can we get a long log here ? Why would we need to do this, and when ? Wh=
at
>> is this trying to fix ? This is unconditionally applied, so it will
>> always be off .. that
>> alone warrants and explanation in the long log.
>>
>> Bruce
>>
>> On Wed, Apr 10, 2013 at 7:19 AM, Bogdan Purcareata
>> <bogdan.purcareata@freescale.com> wrote:
>> > Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
>> > ---
>> >  ...0.9.0-disable-udhcp-from-busybox-template.patch | 24 +++++++++++++=
+++++++++
>> >  recipes-containers/lxc/lxc_0.9.0.bb                |  1 +
>> >  2 files changed, 25 insertions(+)
>> >  create mode 100644 recipes-containers/lxc/files/lxc-0.9.0-disable-udh=
cp-from-busybox-template.patch
>> >
>> > diff --git a/recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from=
-busybox-template.patch
>> b/recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox-temp=
late.patch
>> > new file mode 100644
>> > index 0000000..723be27
>> > --- /dev/null
>> > +++ b/recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybo=
x-template.patch
>> > @@ -0,0 +1,24 @@
>> > +From d7e07e7acb1cbad33806f49143a2a30b4468c369 Mon Sep 17 00:00:00 200=
1
>> > +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
>> > +Date: Mon, 8 Apr 2013 18:30:19 +0300
>> > +Subject: [PATCH] lxc-0.9.0-disable-udhcp-from-busybox-template
>> > +
>> > +---
>> > + templates/lxc-busybox.in | 1 -
>> > + 1 file changed, 1 deletion(-)
>> > +
>> > +diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
>> > +index cb425ec..bb8c951 100644
>> > +--- a/templates/lxc-busybox.in
>> > ++++ b/templates/lxc-busybox.in
>> > +@@ -84,7 +84,6 @@ EOF
>> > + #!/bin/sh
>> > + /bin/syslogd
>> > + /bin/mount -a
>> > +-/bin/udhcpc
>> > + EOF
>> > +
>> > +     # executable
>> > +--
>> > +1.7.11.7
>> > +
>> > diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/=
lxc/lxc_0.9.0.bb
>> > index 292285d..1d6ce71 100644
>> > --- a/recipes-containers/lxc/lxc_0.9.0.bb
>> > +++ b/recipes-containers/lxc/lxc_0.9.0.bb
>> > @@ -22,6 +22,7 @@ RDEPENDS_${PN} =3D " \
>> >  "
>> >
>> >  SRC_URI =3D "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.=
gz \
>> > +       file://lxc-0.9.0-disable-udhcp-from-busybox-template.patch \
>> >         "
>> >  SRC_URI[md5sum] =3D "8552a4479090616f4bc04d8473765fc9"
>> >  SRC_URI[sha256sum] =3D "1e1767eae6cc5fbf892c0e193d25da420ba19f2db2037=
16c38f7cdea3b654120"
>> > --
>> > 1.7.11.7
>> >
>> >
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>
>



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

