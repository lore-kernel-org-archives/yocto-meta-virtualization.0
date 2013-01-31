Return-Path: <B29882@freescale.com>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe004.messaging.microsoft.com [65.55.88.14])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8353E006CC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Jan 2013 23:08:24 -0800 (PST)
Received: from mail230-tx2-R.bigfish.com (10.9.14.235) by
	TX2EHSOBE014.bigfish.com (10.9.40.34) with Microsoft SMTP Server id
	14.1.225.23; Thu, 31 Jan 2013 07:08:24 +0000
Received: from mail230-tx2 (localhost [127.0.0.1])	by
	mail230-tx2-R.bigfish.com (Postfix) with ESMTP id 3E2F71C031B;
	Thu, 31 Jan 2013 07:08:24 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 7
X-BigFish: VS7(zzbb2dI98dI9371I1432Izz1ee6h1de0h1202h1e76h1d1ah1d2ahzz17326ah8275dh8275bh1835farz2dh2a8h668h839h8e2h8e3h947hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh15d0h162dh1631h1758h18e1h1946hbe9i1155h)
Received: from mail230-tx2 (localhost.localdomain [127.0.0.1]) by mail230-tx2
	(MessageSwitch) id 1359616103322814_27745;
	Thu, 31 Jan 2013 07:08:23 +0000 (UTC)
Received: from TX2EHSMHS036.bigfish.com (unknown [10.9.14.246])	by
	mail230-tx2.bigfish.com (Postfix) with ESMTP id 4BDD2500046;
	Thu, 31 Jan 2013 07:08:23 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS036.bigfish.com
	(10.9.99.136) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 31 Jan 2013 07:08:23 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.50]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0318.003; Thu, 31 Jan 2013 07:08:23 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: lei yang <lei.yang@windriver.com>
Thread-Topic: [meta-virtualization] [PATCH] This package provides: -
	multipath: scans the system for multipathed devices,
	assembles - multipathd:
	waits for maps events then execs multipath - kpartx: maps linear
	devmaps to device partitions, which makes multipath...
Thread-Index: AQHN/4Eygni0nhEDIU6bzGMELhsXWZhjBCIAgAAAQwA=
Date: Thu, 31 Jan 2013 07:08:23 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A866F30@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1358910962-6960-1-git-send-email-lei.yang@windriver.com>
	<70CC66F5C30A414DADDA6973E4CA391A866F23@039-SN1MPN1-002.039d.mgd.msft.net>
	<510A1818.7080402@windriver.com>
In-Reply-To: <510A1818.7080402@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] This package provides: - multipath: scans the system for multipathed devices, assembles - multipathd: waits for maps events then execs multipath - kpartx: maps linear devmaps to device partitions, which makes multipath...
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2013 07:08:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <014CF0C860121F4D8D1AEF7DAD8D92B5@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2013 at 1:07 AM, lei yang <lei.yang@windriver.com> wrote:
> On 01/31/2013 03:04 PM, McClintock Matthew-B29882 wrote:
>>
>> On Tue, Jan 22, 2013 at 9:16 PM,  <lei.yang@windriver.com> wrote:
>>>
>>> From: Lei Yang <lei.yang@windriver.com>
>>>
>>> Now,It can be used for kvm disk img partion mounting for me.
>>
>> Looks like the first subject line is way to long.... ;)
>
>
> Yes, I have resent

Ahh, ok sorry. I should have read all messages.

-M

>
> Lei
>
>
>
>
>> -M
>>
>>> Signed-off-by: Lei Yang <lei.yang@windriver.com>
>>> ---
>>>   .../multipath-tools/multipath-tools_git.bb         |   46
>>> ++++++++++++++++++++
>>>   1 files changed, 46 insertions(+), 0 deletions(-)
>>>   create mode 100644
>>> recipes-extended/multipath-tools/multipath-tools_git.bb
>>>
>>> diff --git a/recipes-extended/multipath-tools/multipath-tools_git.bb
>>> b/recipes-extended/multipath-tools/multipath-tools_git.bb
>>> new file mode 100644
>>> index 0000000..633b9f2
>>> --- /dev/null
>>> +++ b/recipes-extended/multipath-tools/multipath-tools_git.bb
>>> @@ -0,0 +1,46 @@
>>> +SUMMARY =3D "Tools to Manage Multipathed Devices with the device-mappe=
r"
>>> +DESCRIPTION =3D "This package provides the tools to manage multipathed
>>> devices by \
>>> +instructing the device-mapper multipath module what to do"
>>> +
>>> +HOMEPAGE =3D "http://christophe.varoqui.free.fr/"
>>> +DEPENDS =3D "readline libaio lvm2"
>>> +LICENSE =3D "GPLv2"
>>> +
>>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7be2873b6270e45abacc503abbe=
2aa3d"
>>> +S=3D"${WORKDIR}/git"
>>> +
>>> +
>>> +SRC_URI =3D "git://git.opensvc.com/multipath-tools/.git;protocol=3Dhtt=
p"
>>> +
>>> +SRCREV =3D "d3683ab18b386e9b3b54b59a122c689e9ebdf5cf"
>>> +PV =3D "0.4.9+gitr${SRCPV}"
>>> +
>>> +inherit autotools
>>> +
>>> +EXTRA_OEMAKE=3D"LIB=3D${libdir} exec_prefix=3D${exec_prefix} libdir=3D=
${libdir}"
>>> +
>>> +PACKAGES =3D+ "libmpathpersist mpathpersist kpartx libmultipath multip=
ath
>>> multipathd libmultipath-dev libmpathpersist-dev"
>>> +
>>> +
>>> +RDEPENDS_${PN} +=3D "libmpathpersist mpathpersist kpartx libmultipath
>>> multipath multipathd udev"
>>> +
>>> +do_install_append () {
>>> +       ln -sf libmpathpersist.so.0 ${D}${libdir}/libmpathpersist.so
>>> +       ln -sf libmultipath.so.0 ${D}${libdir}/libmultipath.so
>>> +}
>>> +
>>> +ALLOW_EMPTY_${PN} =3D "1"
>>> +FILES_${PN}     =3D ""
>>> +
>>> +FILES_libmpathpersist =3D "${libdir}/libmpathpersist*.so.0"
>>> +FILES_mpathpersist =3D "${sbindir}/mpathpersist"
>>> +FILES_kpartx =3D "${sbindir}/kpartx ${base_libdir}/udev/"
>>> +FILES_libmultipath =3D "${libdir}/libcheck*.so ${libdir}/libpri*.so
>>> ${libdir}/libmultipath*.so.0"
>>> +FILES_multipath =3D "${sbindir}/multipath ${sysconfdir}"
>>> +FILES_multipathd =3D "${sbindir}/multipathd ${base_libdir}"
>>> +
>>> +#put the symbol link lib in -dev
>>> +FILES_libmultipath-dev =3D "${libdir}/libmultipath*.so"
>>> +FILES_libmpathpersist-dev =3D "${libdir}/libmpathpersist*.so"
>>> +
>>> +
>>> --
>>> 1.7.1
>>>
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization=


