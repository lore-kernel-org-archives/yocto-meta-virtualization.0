Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7AE39E014BC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 08:26:21 -0700 (PDT)
Received: by mail-lb0-f175.google.com with SMTP id o10so657832lbi.34
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=GhUZze/z7qJS/bKtSJw/e41OkrB+DV98uPTM+FYGSqA=;
	b=zrlUZ2u8jA7JShvKMxXCqYWtxVyMfgQcaYwMRgzSw6RyiF00SXf6zWJv9561KTwsrx
	IPwQ7jjHqefajcrGPE3+xM3Wb6VzIPopClyvpGphswZO7XdJYIwIjrMtb4qVVDFU9BLk
	wBeDqdzeRQdkO2wehzw0M+/RESte6ZtGoW0sPKQXQFKbhUThZn0RifDfhXZiqojhHb20
	FwN2TASvHFhcoXIEW+mnXqb4DugAYCg5vcWkyyKqWYL/bIyHf5+8Y/oTk9Rt38NNp7z4
	ZPSX/xTBb5COibbbxO0nc9LdFZZcTBBZv7f7TLxwZLQx1jVrT+xhyWT9DALIQDIClCnP
	CbuQ==
MIME-Version: 1.0
X-Received: by 10.112.147.170 with SMTP id tl10mr1406084lbb.100.1365607580130; 
	Wed, 10 Apr 2013 08:26:20 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Wed, 10 Apr 2013 08:26:20 -0700 (PDT)
In-Reply-To: <E7E317BD5B5D764682EEAC13B01676E264D3E6@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1365587401-8284-1-git-send-email-bogdan.purcareata@freescale.com>
	<CADkTA4NmLke-mcwgVUXgcYacH0Bfy5Nn_ndLCqw7Ub-bGvdNbA@mail.gmail.com>
	<E7E317BD5B5D764682EEAC13B01676E264D3E6@039-SN2MPN1-021.039d.mgd.msft.net>
Date: Wed, 10 Apr 2013 11:26:20 -0400
Message-ID: <CADkTA4PWOJvfppBKJO1EvzG7ZetGw7DoGjLC524Ru62KrdLthg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Purcareata Bogdan-B43198 <B43198@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Add LXC 0.9.0 recipe
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
X-List-Received-Date: Wed, 10 Apr 2013 15:26:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2013 at 9:05 AM, Purcareata Bogdan-B43198
<B43198@freescale.com> wrote:
> Hello,
>
> I can provide a log summing up the logs submitted by the LXC maintainers =
on the lxc-devel mainling list on the intermediate releases between 0.8 and=
 0.9.
>
> They look something like this:
>> -----Original Message-----
>> From: St=E9phane Graber [mailto:stgraber@ubuntu.com]
>> Sent: Tuesday, April 02, 2013 4:39 AM
>> To: Daniel Lezcano
>> Cc: Lxc development list
>> Subject: [lxc-devel] LXC 0.9 final pull request
>>
>> Hi Daniel,
>>
>> You'll find the 0.9 pull request below.
>>
>> Based on what you did last time, the following should do the trick:
>>  - Review the pull request
>>  - Use "git pull --edit --no-ff --stat git://github.com/lxc/lxc.git",
>>    that should do a real merge, letting you do a proper Sign-off of the
>>    changes.
>>  - Update the version number to 0.9
>>  - Commit and tag
>>
>> Feature changes include:
>>  - Support for ephemeral containers in lxc-clone
>>  - --clear-env/--keep-env support in lxc-attach
>>  - -n option to lxc-start-ephemeral
>>
>> Everything else is bugfixes on top of rc1.
>>
>>
>> Before sending this pull request I've done the following tests:
>>  - Test build on my machine (up to date Ubuntu 13.04)
>>  - Test build on Launchpad (Ubuntu 12.04, 12.10 and 13.04)
>>  - Test build on an armhf board running Ubuntu 13.04
>>  - Test build for Android cross-compiling on my laptop
>>  - Ran our test suite on the x86 binaries
>>  - Ran a quick test (start/stop/info/wait) on Android
>>  - Tested the API and tools on ARM
>>  - Rebuilt all my local templates (~20 containers) on a variety of
>>    architectures (i386, amd64, armel and armhf)
>
> Is this ok? How should I submit the log?

Definitely. The best way to summit the log, is to just amend you commit
locally, update the message and resend the series.

Bruce

>
> Best regards,
> Bogdan P.
>
>
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Wednesday, April 10, 2013 3:53 PM
>> To: Purcareata Bogdan-B43198
>> Cc: meta-virtualization@yoctoproject.org
>> Subject: Re: [meta-virtualization] [PATCH] Add LXC 0.9.0 recipe
>>
>> Can we get a bit of a long log that describes how this was testing ? Or
>> an entry in the meta-virtualization/docs directory ?
>>
>> There's no reason to keep this the existing recipe around, so the 0.8.0
>> recipe should be removed, and we can see the differences between the
>> two and ensure that functionality drops and adds are understood.
>>
>> Cheers,
>>
>> Bruce
>>
>> On Wed, Apr 10, 2013 at 5:50 AM, Bogdan Purcareata
>> <bogdan.purcareata@freescale.com> wrote:
>> > ---
>> >  recipes-containers/lxc/lxc_0.9.0.bb | 38 ++++++++++++++++++++++++++++=
+++++++++
>> >  1 file changed, 38 insertions(+)
>> >  create mode 100644 recipes-containers/lxc/lxc_0.9.0.bb
>> >
>> > diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/=
lxc/lxc_0.9.0.bb
>> > new file mode 100644
>> > index 0000000..292285d
>> > --- /dev/null
>> > +++ b/recipes-containers/lxc/lxc_0.9.0.bb
>> > @@ -0,0 +1,38 @@
>> > +DESCRIPTION =3D "lxc aims to use these new functionnalities to provid=
e an userspace container object"
>> > +SECTION =3D "console/utils"
>> > +LICENSE =3D "GPLv2"
>> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3=
64516c"
>> > +PRIORITY =3D "optional"
>> > +PR =3D "r1"
>> > +DEPENDS =3D "libxml2 libcap"
>> > +RDEPENDS_${PN} =3D " \
>> > +               rsync \
>> > +               gzip \
>> > +               libcap-bin \
>> > +               bridge-utils \
>> > +               dnsmasq \
>> > +               perl-module-strict \
>> > +               perl-module-getopt-long \
>> > +               perl-module-vars \
>> > +               perl-module-warnings-register \
>> > +               perl-module-exporter \
>> > +               perl-module-constant \
>> > +               perl-module-overload \
>> > +               perl-module-exporter-heavy \
>> > +"
>> > +
>> > +SRC_URI =3D "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.=
gz \
>> > +       "
>> > +SRC_URI[md5sum] =3D "8552a4479090616f4bc04d8473765fc9"
>> > +SRC_URI[sha256sum] =3D "1e1767eae6cc5fbf892c0e193d25da420ba19f2db2037=
16c38f7cdea3b654120"
>> > +
>> > +S =3D "${WORKDIR}/${PN}-${PV}"
>> > +
>> > +PACKAGECONFIG ??=3D ""
>> > +PACKAGECONFIG[doc] =3D "--enable-doc,--disable-doc"
>> > +PACKAGECONFIG[rpath] =3D "--enable-rpath,--disable-rpath"
>> > +PACKAGECONFIG[apparmour] =3D "--enable-apparmor,--disable-apparmor,ap=
parmor,apparmor"
>> > +
>> > +inherit autotools
>> > +
>> > +FILES_${PN}-dbg +=3D "${libexecdir}/lxc/.debug"
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

