Return-Path: <erik.boto@pelagicore.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8D75E009A1; Tue,  9 Jun 2015 06:29:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.216.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B92EE00974
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Jun 2015 06:28:59 -0700 (PDT)
Received: by qcxw10 with SMTP id w10so6032395qcx.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 09 Jun 2015 06:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=2P319kZFFxLoiHgzA1A6bXfRjfBx/7Pt6DfXDPw8iJ0=;
	b=FRGL/hBPJpzxlJvQIGiMxpt6i3Wwt4kr19dGKPS/tKiesQQCsW+K3oAAXa/z1FPPPn
	inYiYdqY0aunw5FFv9GTMxB3S3/Kfn0cyebbe0aNOpr9K/d+GkOUb+GF61lOlMGnPeE9
	V0Gr8be8Z07MhTEWNmiRfcFUsxeq0plQ7sHiPnLFqnzLIo7NOt7lYn3+xZYh0wMlRacn
	QszjztsjGFsDEJGM7U0ByzPpX+biH4FLbJjC6Fy9kwD3OV5fGcAZ7S2A+uD90B86cDBW
	XM50+dE6MlijjKVLBKD8Lko7nwE//BhQXs51h/xx2sVx3gbWCGw4Zh5v1QB2+NPs2kmj
	yvNA==
X-Gm-Message-State: ALoCoQltQJBXn96JZIcZgAptswPSz7us9KRxBsYkX6rB3PtSEXmXI8XbWeb34ATk9Cuv/vdFPMv8
MIME-Version: 1.0
X-Received: by 10.140.105.198 with SMTP id c64mr25626282qgf.61.1433856538968; 
	Tue, 09 Jun 2015 06:28:58 -0700 (PDT)
Received: by 10.96.184.134 with HTTP; Tue, 9 Jun 2015 06:28:58 -0700 (PDT)
In-Reply-To: <CADkTA4Nm7OmnO9xT=rQ+wU15eocOZw5y_64K19pq6OOcPXuJeQ@mail.gmail.com>
References: <1433826846-6684-1-git-send-email-erik.boto@pelagicore.com>
	<CADkTA4Nm7OmnO9xT=rQ+wU15eocOZw5y_64K19pq6OOcPXuJeQ@mail.gmail.com>
Date: Tue, 9 Jun 2015 15:28:58 +0200
Message-ID: <CA+AhUGw2AECXV=nw95y_FANgoPzmpcmy1J1iLmac2mbXnyb5XA@mail.gmail.com>
From: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@pelagicore.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: install lxc.service if DISTRO_FEATURES contains systemd
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
X-List-Received-Date: Tue, 09 Jun 2015 13:29:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2015 at 3:02 PM, Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
> On Tue, Jun 9, 2015 at 1:14 AM, Erik Bot=C3=B6 <erik.boto@pelagicore.com>=
 wrote:
>> Signed-off-by: Erik Bot=C3=B6 <erik.boto@pelagicore.com>
>> ---
>>  recipes-containers/lxc/lxc_1.0.7.bb | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lx=
c/lxc_1.0.7.bb
>> index f79ba76..948dd0f 100644
>> --- a/recipes-containers/lxc/lxc_1.0.7.bb
>> +++ b/recipes-containers/lxc/lxc_1.0.7.bb
>> @@ -94,6 +94,11 @@ do_install_append() {
>>         for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; d=
o \
>>             sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
>>
>> +       if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
>> +           install -d ${D}${systemd_unitdir}/system/
>> +           cp ${S}/config/init/systemd/lxc.service ${D}${systemd_unitdi=
r}/system/
>> +       fi
>
> We actually don't need this, I introduced a similar copy in January of
> this year, and subsequently
> removed it, since the line:
>
> EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit',
> '--with-init-script=3Dsysvinit', '--with-init-script=3Dsystemd', d)}"
>
> Takes care of the proper generation and install of the service files
> (and sysvinit scripts).

I think it's a valid use case to have both systemd and sysvinit in
DISTRO_FEATURES. With the current recipe the service-file won't be
installed and the systemd.bbclass will complain.

I noticed that lxc configure accept multiple values (comma separated)
for --with-init-script, so this should work:

EXTRA_OECONF +=3D "--with-init-script=3D\
${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit,', '', d)}\
${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"

I'll send a new version of the patch.

Cheers,
Erik

>
> If we are having issues with startup, we need to see what broke since
> I made the change
> and tested it.
>
> Also note that SYSTEMD_AUTO_ENABLE_${PN}-setup is currently set to "disab=
le", so
> you do need to enable the systemd init parts as well.
>
> Bruce
>
>
>> +
>>         if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'fals=
e', d)}; then
>>             install -d ${D}${sysconfdir}/init.d
>>             cp ${S}/config/init/sysvinit/lxc ${D}${sysconfdir}/init.d
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



--=20
Erik Bot=C3=B6
M.Sc.E.E.
SENIOR SOFTWARE ENGINEER

Pelagicore AB
Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden
Mobile: +46 (0)768 817 203
E-Mail: erik.boto@pelagicore.com

PELAGICORE Experience Change

