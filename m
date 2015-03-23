Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 06DD9E0094C; Mon, 23 Mar 2015 05:08:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.45 listed in list.dnswl.org]
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C916AE00757
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Mar 2015 05:08:11 -0700 (PDT)
Received: by labe2 with SMTP id e2so56842260lab.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Mar 2015 05:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=3iW/PdCrlhVyVhXiilNuoGcCrSdWZBtZnweazINUSxA=;
	b=ggFQlV1hDt6SftJNENkIdzVyPn5QxoSdOwTD4ipke28pqpjgAgjVrAsVzAyaH7+V4p
	bSYYSyuOSS8FsGQGWarXevlWWZFFAGwaopM/XDDz8SGFM5AQRbYI4Xkj++QijzJPOPOu
	derqJbozpvaNdDoTrPcqOlqVM2MBUF8w7MnXCfjcHUzd+lJYiuD5IjAHtLu5CH3Rph2m
	Sk63xPwPqc+nTzAkqCcs17rPjLPdQvl9XPikP01LqoHM405v1Km9BIXrFHKuCiJlL3pE
	Hy+wN19FFHvb4Z/BPBYsEBgGiYsUiXtGYBLiW9gIzJhdcw4NpkLnL5UOXKzzXqoee3bU
	N6xQ==
MIME-Version: 1.0
X-Received: by 10.152.205.1 with SMTP id lc1mr7240269lac.51.1427112488653;
	Mon, 23 Mar 2015 05:08:08 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Mon, 23 Mar 2015 05:08:08 -0700 (PDT)
In-Reply-To: <26724FB0BFCB3D4C91BDE184751AA3A428B7F119@SESTOEX04.enea.se>
References: <1426867164-18526-1-git-send-email-tudor.florea@enea.com>
	<CADkTA4N=1XZX1YKbLLWY-rJ3yRDQGPKZR0gYPLg2GC7f4f6rLA@mail.gmail.com>
	<26724FB0BFCB3D4C91BDE184751AA3A428B7F119@SESTOEX04.enea.se>
Date: Mon, 23 Mar 2015 08:08:08 -0400
Message-ID: <CADkTA4NMzwUXyqKcLa_v6EY-N6quVxofv4o6ZpSxjTRP84yv0Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Tudor Florea <Tudor.Florea@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/1] python-cmd2: update checksum
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
X-List-Received-Date: Mon, 23 Mar 2015 12:08:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2015 at 3:23 AM, Tudor Florea <Tudor.Florea@enea.com> wrote=
:
>
>
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Monday, March 23, 2015 04:51
>> To: Tudor Florea
>> Cc: meta-virtualization@yoctoproject.org
>> Subject: Re: [meta-virtualization] [PATCH 1/1] python-cmd2: update
>> checksum
>>
>> On Fri, Mar 20, 2015 at 11:59 AM, Tudor Florea <tudor.florea@enea.com>
>> wrote:
>> > Signed-off-by: Tudor Florea <tudor.florea@enea.com>
>>
>> To follow the conventions of oe-core, we want/need to log a reason for
>> a checksum
>> change, when the associated version hasn't changed.
>>
>> What happened ? Did the upstream re-pack the repo ? Something else ?
>>
>
> [Tudor Florea] I'm not sure about the history behind but I guess the expl=
anation is in the commit 1bd3d61e2c24a8f404ee41fb291c401a9fc9c937 the recip=
e python-cmd2_0.6.8.bb was updated from python-cmd2_0.6.7.bb without updati=
ng accordingly the checksum for the new ${SRCNAME}-${PV}.tar.gz used from u=
pstream.

Aha! That very well could be. In theory sstate should have triggered the
entire rebuild .. but this wouldn't be the first time that I've
updated a package
and had the download not re-trigger.

I'll double check today and apply the change.

Cheers,

Bruce

>
> Regards,
>   Tudor.
>
>> Bruce
>>
>>
>> > ---
>> >  meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta-openstack/recipes-devtools/python/python-
>> cmd2_0.6.8.bb b/meta-openstack/recipes-devtools/python/python-
>> cmd2_0.6.8.bb
>> > index 9558cc6..4d5d29d 100644
>> > --- a/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb
>> > +++ b/meta-openstack/recipes-devtools/python/python-cmd2_0.6.8.bb
>> > @@ -9,8 +9,8 @@ SRCNAME =3D "cmd2"
>> >
>> >  SRC_URI =3D
>> "http://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-
>> ${PV}.tar.gz"
>> >
>> > -SRC_URI[md5sum] =3D "842df29ff2f72d64d7f0d917039c0e51"
>> > -SRC_URI[sha256sum] =3D
>> "8e98c7a1cfd106183559240b269e7cd9fe97e8342b5c05295f591aab6fd2f4f0"
>> > +SRC_URI[md5sum] =3D "c32c9a897e010c977b50c1ddc13f09fe"
>> > +SRC_URI[sha256sum] =3D
>> "ac780d8c31fc107bf6b4edcbcea711de4ff776d59d89bb167f8819d2d83764a8"
>> >
>> >  S =3D "${WORKDIR}/${SRCNAME}-${PV}"
>> >
>> > --
>> > 1.9.1
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
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

