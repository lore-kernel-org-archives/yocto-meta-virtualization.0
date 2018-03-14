Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A78C6E00B66; Wed, 14 Mar 2018 05:53:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33714E00B66
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 05:53:46 -0700 (PDT)
Received: by mail-lf0-f46.google.com with SMTP id h127-v6so4581552lfg.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 05:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rK6gA7aOcOj32rbSW0gitRap0Dr6N0Yd94+Hpgc8XXk=;
	b=AvETUPicLWvCxbWFvQIut6kdGavD+lAkXEN11E+8Df6ZmZJvSaGGbUZguxywMhEgOt
	zH7pxQCBo7LJB1xjq43p7qie2UPrxQ3c9s4BfkCW9yBlg0r2JvgSf8AaklUJeFJqS7Bs
	2CLzk81G3WjX7FKbD80HYjqZ32kaZhjVRIcRqEjz/z2lngYOKUbUWYxY0+sfPj7ttefS
	NIUdJC21H/9EuR553cLAxM8h/isft7XoUEILlgPwVh38TS6iID8XsoTvMPmJDrdu7mvv
	3UyZ/inlTtkmCyRTciFpoVyo1crhOlOFvv/ZGFVzBsOfsnRUsltE/pQUlQzXvSS3ifmr
	bbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rK6gA7aOcOj32rbSW0gitRap0Dr6N0Yd94+Hpgc8XXk=;
	b=QQHmQ/8gyhurs1jQ0nMMqbC0dZ3kiiRmWIGQeadFUJzHi2A5Kh7udKBVG+0iRu1PxT
	9aZk3mbTQvDq2u2bcJlAW6JjRhAngVi4B51+odyHhobbtVyi1b731igdWmFGcJqFM4st
	JSfue1LZgQhsxlbkPWFohDGPqAiOd/Zf+NYiM0FWarJF7fU0AXVmbQKEK4tpnEhm+A+S
	XUZVoUelXvaHptUG9PZHeimQlMM11nDrRjiiyFV6CctlwNY1W7YUJLFxe9/rdfUkz9ps
	zQrn7JJ2WUDVaws2Qt9++zULFEwDHiIGcXNrrVai5vFuY4j3PkL6mxTUpYxe8EMcQxPv
	TCMA==
X-Gm-Message-State: AElRT7FRTtq+NIfJXtZ2VdPyjfObNlbbMbddzU+ouMG1uysKHeM8clUv
	QV9EXfwte12gtGhpDxQKnWRbceC30Ar1e42NCe/7AA==
X-Google-Smtp-Source: AG47ELuSd9ktU/zfK1t0d6eZvt0QrsidBs8SmTurDO9QpZL6ZKYuiNQlEhZwcfZZ90zBjIComOLYa6Sllj180k3ak6A=
X-Received: by 2002:a19:fe2:: with SMTP id 95-v6mr3490430lfp.13.1521032025926; 
	Wed, 14 Mar 2018 05:53:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Wed, 14 Mar 2018 05:53:45 -0700 (PDT)
In-Reply-To: <355BE46A91031048906B695426A8D8E61735E9EF@DEFTHW99EH4MSX.ww902.siemens.net>
References: <20180314083912.16564-1-pascal.bach@siemens.com>
	<CADkTA4PV1WJiK50qz0bC5eo0_jwBaM+Kb-7j=WXAuzNgw9Nwuw@mail.gmail.com>
	<355BE46A91031048906B695426A8D8E61735E9EF@DEFTHW99EH4MSX.ww902.siemens.net>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Mar 2018 08:53:45 -0400
Message-ID: <CADkTA4NTM=f-MZ-O4_DY8eSfNirPnD6_rg2JLjV7pMWp8kbFLQ@mail.gmail.com>
To: "Bach, Pascal" <pascal.bach@siemens.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] docker: make aufs dependency depend on distro feature
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
X-List-Received-Date: Wed, 14 Mar 2018 12:53:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 14, 2018 at 8:48 AM, Bach, Pascal <pascal.bach@siemens.com> wro=
te:
>
>
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Mittwoch, 14. M=C3=A4rz 2018 13:41
>> To: Bach, Pascal (BT CPS R&D ZG FW CCP) <pascal.bach@siemens.com>
>> Cc: meta-virtualization@yoctoproject.org
>> Subject: Re: [meta-virtualization] [PATCH] docker: make aufs dependency
>> depend on distro feature
>>
>> The problem is .. that this is now a magic distro feature that no one kn=
ows
>> about.
>>
>> At a minimum, this new distro feature use needs to be documented in the
>> layers README.
>
> This check is already used in recipes-kernel/linux/linux-yocto_virtualiza=
tion.inc where it enables aufs support in the kernel.
> But you are right this should be documented as a distro feature for this =
layer.

Ahaha. I missed that when I was giving them a hard time about the
magic virtualization distro feature, I should have done it then :D

I can do the tweak to the README if you want, and I'll take this patch as-i=
s.

Bruce

>
> Pascal
>
>> Bruce
>>
>> On Wed, Mar 14, 2018 at 4:39 AM, Pascal Bach <pascal.bach@siemens.com>
>> wrote:
>> > Only include aufs-utils if the corresponding distro feature is enabled=
.
>> > Without that the aufs kernel driver is not included too.
>> >
>> > Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>> > ---
>> >  recipes-containers/docker/docker_git.bb | 5 +++--
>> >  1 file changed, 3 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/recipes-containers/docker/docker_git.bb
>> > b/recipes-containers/docker/docker_git.bb
>> > index 5c21138..206c884 100644
>> > --- a/recipes-containers/docker/docker_git.bb
>> > +++ b/recipes-containers/docker/docker_git.bb
>> > @@ -64,8 +64,9 @@ DEPENDS =3D " \
>> >  PACKAGES =3D+ "${PN}-contrib"
>> >
>> >  DEPENDS_append_class-target =3D " lvm2"
>> > -RDEPENDS_${PN} =3D "curl aufs-util git util-linux iptables \
>> > -                  ${@bb.utils.contains('DISTRO_FEATURES','systemd',''=
,'cgroup-
>> lite',d)} \
>> > +RDEPENDS_${PN} =3D "util-linux iptables \
>> > +                  ${@bb.utils.contains('DISTRO_FEATURES', 'aufs', 'au=
fs-util', '', d)}
>> \
>> > +                  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
>> > +'', 'cgroup-lite', d)} \
>> >                   "
>> >  RDEPENDS_${PN} +=3D "virtual/containerd virtual/runc"
>> >
>> > --
>> > 2.11.0
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
>> "Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
>> at its end"



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

