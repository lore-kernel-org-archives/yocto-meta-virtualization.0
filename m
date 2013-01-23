Return-Path: <yanglei.fage@gmail.com>
Received: from mail-bk0-f42.google.com (mail-bk0-f42.google.com
	[209.85.214.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB2B0E00721
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 19:16:43 -0800 (PST)
Received: by mail-bk0-f42.google.com with SMTP id ji2so4138188bkc.29
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 19:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=UHkNBhsYTpnJfi23dSvbKlFyr2LQct03ktcZmZcu8FY=;
	b=0Ty3Kx1elvMBSRPFthaDdOQ/AZC/ApIqFhHwTsTG/5Hkf8FYpAEWqXfrhsMXAJYtgO
	IgfKrFVq1wwgX/cmN6MGgEQptaMUCga0uFDLtqnG+CCkHrpuCvnb3N5dagIZ/JevU6IP
	RrpTLCz0R6+le4Xg+SdnJm2RYXYJFlr6WKMn7jXF/QrYCdReuoHaRbEJTcmHlv6riapQ
	ByUMtZyMNMX2q5ZusTch/pbmLfg+t1f0mfqxaaGFdJxkGvri3AGo7mYFLiYGjs74bLCP
	xNHUop2KQN6YpoOXwhHYqmaiVpdoPU9Tt++xCiUljNA4nJ03tqA+4egBmW04121N4oGz
	pAFw==
MIME-Version: 1.0
X-Received: by 10.204.5.202 with SMTP id 10mr6209692bkw.135.1358911000019;
	Tue, 22 Jan 2013 19:16:40 -0800 (PST)
Received: by 10.204.11.86 with HTTP; Tue, 22 Jan 2013 19:16:39 -0800 (PST)
In-Reply-To: <50FE5110.7090104@enea.com>
References: <1358762433-11853-1-git-send-email-lei.yang@windriver.com>
	<50FE5110.7090104@enea.com>
Date: Wed, 23 Jan 2013 11:16:39 +0800
Message-ID: <CAHsH0E_-Fu9m4U4cOTJNWAXpTEhLnF2dX_Qzrwm0-Ki3hGiYCw@mail.gmail.com>
From: lei yang <yanglei.fage@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
Cc: meta-virtualization@yoctoproject.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] multipath-tools: Add multipath-tools recipe
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
X-List-Received-Date: Wed, 23 Jan 2013 03:16:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2013 at 4:42 PM, David Nystr=F6m <david.nystrom@enea.com> w=
rote:
> On Mon 21 Jan 2013 11:00:33 AM CET, lei.yang@windriver.com wrote:
>>
>> From: Lei Yang <lei.yang@windriver.com>
>>
>> This packages provides:
>> - multipath: scans the system for multipathed devices, assembles
>> - multipathd: waits for maps events then execs multipath
>> - kpartx: maps linear devmaps to device partitions, which makes
>> multipath maps partionable
>> ......
>>
>> Now,It can be used for kvm disk img partion for me.
>>
>> Signed-off-by: Lei Yang <lei.yang@windriver.com>
>> ---
>>   .../multipath-tools/multipath-tools_git.bb         |   46
>> ++++++++++++++++++++
>>   1 files changed, 46 insertions(+), 0 deletions(-)
>>   create mode 100644
>> meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
>>
>> diff --git
>> a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
>> b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
>> new file mode 100644
>> index 0000000..e9509d3
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
>> @@ -0,0 +1,46 @@
>> +SUMMARY =3D "Tools to Manage Multipathed Devices with the device-mapper=
"
>> +DESCRIPTION =3D "This package provides the tools to manage multipathed
>> devices by \
>> +instructing the device-mapper multipath module what to do"
>> +
>> +HOMEPAGE =3D "http://christophe.varoqui.free.fr/"
>> +DEPENDS =3D "readline libaio lvm2"
>> +LICENSE =3D "GPLv2"
>> +
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7be2873b6270e45abacc503abbe2=
aa3d"
>> +S=3D"${WORKDIR}/git"
>> +
>> +
>> +SRC_URI =3D "git://git.opensvc.com/multipath-tools/.git;protocol=3Dhttp=
"
>> +
>> +SRCREV =3D "d3683ab18b386e9b3b54b59a122c689e9ebdf5cf"
>> +PV =3D "0.4.9+gitr${SRCPV}"
>> +
>> +inherit autotools
>> +
>> +EXTRA_OEMAKE=3D"LIB=3D${libdir} exec_prefix=3D${exec_prefix} libdir=3D$=
{libdir}"
>> +
>> +PACKAGES =3D+ "libmpathpersist mpathpersist kpartx libmultipath multipa=
th
>> multipathd libmultipath-dev libmpathpersist-dev"
>> +
>> +
>> +RDEPENDS_${PN} +=3D "libmpathpersist mpathpersist kpartx libmultipath
>> multipath multipathd"
>> +
>
>
> Is RDEPENDS on udev not mandatory ?
>
>
>> +do_install_append () {
>> +       ln -sf libmpathpersist.so.0 ${D}${libdir}/libmpathpersist.so
>> +       ln -sf libmultipath.so.0 ${D}${libdir}/libmultipath.so
>> +}
>> +
>> +ALLOW_EMPTY_${PN} =3D "1"
>> +FILES_${PN}     =3D ""
>> +
>> +FILES_libmpathpersist =3D "${libdir}/libmpathpersist*.so.0"
>> +FILES_mpathpersist =3D "${sbindir}/mpathpersist"
>> +FILES_kpartx =3D "${sbindir}/kpartx ${base_libdir}/udev/"
>> +FILES_libmultipath =3D "${libdir}/libcheck*.so ${libdir}/libpri*.so
>> ${libdir}/libmultipath*.so.0"
>> +FILES_multipath =3D "${sbindir}/multipath ${sysconfdir}"
>> +FILES_multipathd =3D "${sbindir}/multipathd ${base_libdir}"
>> +
>> +#put the symbol link lib in -dev
>> +FILES_libmultipath-dev =3D "${libdir}/libmultipath*.so"
>> +FILES_libmpathpersist-dev =3D "${libdir}/libmpathpersist*.so"
>> +
>> +
>
>
> Whats the intended destination for this recipe ?
> If not accepted in meta-oe, We'll be happy to merge it in
> meta-virtualization.
>

sent to meta-virt


Lei



> Br,
> David
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

