Return-Path: <yanglei.fage@gmail.com>
Received: from mail-bk0-f52.google.com (mail-bk0-f52.google.com
	[209.85.214.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96488E004D1
	for <meta-virtualization@yoctoproject.org>;
	Sat,  5 Jan 2013 05:14:07 -0800 (PST)
Received: by mail-bk0-f52.google.com with SMTP id w5so7646574bku.11
	for <meta-virtualization@yoctoproject.org>;
	Sat, 05 Jan 2013 05:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=GIK5v35A4xYNtlHWhKX26R/bxydDoiRq3O+Aq5jmhm8=;
	b=omYkYNeKnBCzoR0eOQok9sHcyKLN1p/InVrZpfFfmBLP0JuyHECbV8OGqMN5cE8e7Z
	oNmIg/Z+SV5ijSpIp0G8BFfivVGrLuQDuqxP04hdjbaJp7anQxXjE62E54bLgUORlkJi
	J/IVdyTSfjb3m8e98Sfk6J6HHygJTI+s3TUEFNRVDH/LnnB03kg3FpYGdWrR+BU/GBSw
	SmVugEhaj/+Rxx+z61KoiX47KQt664QkbDLWHrJ3eGoSCIRtyomeuwV1fBNnk+IiGkvQ
	lY79uIKPDKFt/2rdzVFrZCbMe/bUpbUOeU1R70YpGN3DJ/araFkoRrJ/8VnqnLH/CnCI
	y2MQ==
MIME-Version: 1.0
Received: by 10.204.5.205 with SMTP id 13mr28020291bkw.111.1357391646261; Sat,
	05 Jan 2013 05:14:06 -0800 (PST)
Received: by 10.204.11.86 with HTTP; Sat, 5 Jan 2013 05:14:06 -0800 (PST)
In-Reply-To: <50E810B0.8060709@gmail.com>
References: <1357375543-2001-1-git-send-email-lei.yang@windriver.com>
	<50E810B0.8060709@gmail.com>
Date: Sat, 5 Jan 2013 05:14:06 -0800
Message-ID: <CAHsH0E-SyAa3aPkjya7es6rnnUe2P3HEKZVbScWnzUMKf77NJQ@mail.gmail.com>
From: lei yang <yanglei.fage@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
Cc: lei.yang@windriver.com, meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] Update the netcat with debian patches to fix some error
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
X-List-Received-Date: Sat, 05 Jan 2013 13:14:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 5, 2013 at 3:38 AM, David Nystr=F6m <david.c.nystrom@gmail.com>=
 wrote:
>
> On 01/05/2013 09:45 AM, lei.yang@windriver.com wrote:
>>
>> From: Lei Yang <lei.yang@windriver.com>
>>
>> I know we have the patches in debian dir in the previous version,
>> but I meet lots of patch error.so I change it to debian.org version
>>
>> The background I do this change is:
>> I'm a kvm tester,without patches it will meet error when I do the migrat=
e
>> testing with  -incoming "exec:nc -l 5200" it meets error:
>> "nc: Protocol no available."
>>
>> You can reproduce it simplely with "nc -l 5200" on your board
>
>
> Hi Lei,
>
> Thanks for the patch, your .patch file needs an upstream status, if its t=
o
> be kept in the meta-virt layer.
>
> please see:
> https://wiki.yoctoproject.org/wiki/Best_Known_Methods_(BKMs)_for_Package_=
Updating#Patch_Upstreaming
>
>
>>
>> Lei
>>
>> Signed-off-by: Lei Yang <lei.yang@windriver.com>
>> ---
>>   recipes-extended/libvirt/libvirt_1.0.0.bb          |    2 +-
>>   .../netcat-openbsd/netcat-openbsd_1.89-4.patch     | 2793
>> ++++++++++++++++++++
>>   recipes-networking/netcat/netcat-openbsd_1.89.bb   |   32 +
>>   recipes-networking/netcat/openbsd-netcat_1.6.bb    |   29 -
>>   4 files changed, 2826 insertions(+), 30 deletions(-)
>>   create mode 100644
>> recipes-networking/netcat/netcat-openbsd/netcat-openbsd_1.89-4.patch
>>   create mode 100644 recipes-networking/netcat/netcat-openbsd_1.89.bb
>>   delete mode 100644 recipes-networking/netcat/openbsd-netcat_1.6.bb
>>
>> diff --git a/recipes-extended/libvirt/libvirt_1.0.0.bb
>> b/recipes-extended/libvirt/libvirt_1.0.0.bb
>> index 5374237..90d7dbb 100644
>> --- a/recipes-extended/libvirt/libvirt_1.0.0.bb
>> +++ b/recipes-extended/libvirt/libvirt_1.0.0.bb
>> @@ -11,7 +11,7 @@ DEPENDS =3D "bridge-utils gnutls libxml2 lvm2 avahi pa=
rted
>> curl libpcap util-linux
>>   # These might be included by PACKAGECONFIG
>>   #RRECOMMENDS+=3D "polkit qemu yajl libnl lxc netcf"
>>
>> -RDEPENDS_libvirt-libvirtd +=3D "bridge-utils iptables pm-utils dnsmasq
>> openbsd-netcat"
>> +RDEPENDS_libvirt-libvirtd +=3D "bridge-utils iptables pm-utils dnsmasq
>> netcat-openbsd"
>>   RDEPENDS_libvirt-libvirtd_append_x86-64 =3D " dmidecode"
>>   RDEPENDS_libvirt-libvirtd_append_x86 =3D " dmidecode"
>>
>
> [snip]
>
>
>> diff --git a/recipes-networking/netcat/netcat-openbsd_1.89.bb
>> b/recipes-networking/netcat/netcat-openbsd_1.89.bb
>> new file mode 100644
>> index 0000000..392a3fd
>> --- /dev/null
>> +++ b/recipes-networking/netcat/netcat-openbsd_1.89.bb
>> @@ -0,0 +1,32 @@
>> +DESCRIPTION =3D "OpenBSD Netcat"
>> +HOMEPAGE =3D "http://ftp.debian.org"
>> +SECTION =3D "console/network"
>> +LICENSE =3D "BSD-3-Clause"
>> +PR =3D "r0"
>> +
>> +SRC_URI =3D
>> "http://ftp.debian.org/debian/pool/main/n/netcat-openbsd/netcat-openbsd_=
1.89.orig.tar.gz
>> \
>> +           file://netcat-openbsd_1.89-4.patch"
>
>
> Hmm,
> I suspect there is no difference between above .patch file and upstream:
> http://ftp.debian.org/debian/pool/main/n/netcat-openbsd/netcat-openbsd_1.=
89-4.diff.gz
>
> Please reference the patch from this location to keep code size in meta-v=
irt
> low.
>


Yes, the patch comes from
http://ftp.debian.org/debian/pool/main/n/netcat-openbsd/netcat-openbsd_1.89=
-4.diff.gz
I don't know how to put two http location in one bb, do you have an
examle? or use wget in bb? seems not

and How could I fill the upstream status, should be pending? since
it's not in openbsd-netcat.googlecode.com now


Lei



>
>> +SRC_URI[md5sum] =3D "7238ce15aae43069e96ba7faf03f153e"
>> +SRC_URI[sha256sum] =3D
>> "72e844dde8a2a7cba61971d493758dbea9ef0b164bccef15fd4a36490dc77f2b"
>> +
>> +S =3D "${WORKDIR}/${PN}-${PV}.orig"
>> +inherit update-alternatives gettext
>> +
>> +do_configure[noexec] =3D "1"
>> +
>> +do_compile() {
>> +       cd ${S}
>> +       while read line; do patch -p1 <debian/patches/$line; done
>> <debian/patches/series
>> +       pkgrel=3D4
>> +       oe_runmake CFLAGS=3D"$CFLAGS -DDEBIAN_VERSION=3D\"\\\"${pkgrel}\=
\\"\""
>> +}
>> +
>> +do_install() {
>> +       install -d ${D}${bindir}
>> +       install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
>> +}
>> +
>> +ALTERNATIVE_${PN} =3D "nc"
>> +ALTERNATIVE_PRIORITY =3D "101"
>> +
>> +BBCLASSEXTEND =3D "nativesdk"
>> diff --git a/recipes-networking/netcat/openbsd-netcat_1.6.bb
>> b/recipes-networking/netcat/openbsd-netcat_1.6.bb
>> deleted file mode 100644
>> index 1ae3f37..0000000
>> --- a/recipes-networking/netcat/openbsd-netcat_1.6.bb
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -DESCRIPTION =3D "OpenBSD Netcat"
>> -HOMEPAGE =3D "http://code.google.com/p/openbsd-netcat/"
>> -SECTION =3D "console/network"
>> -LICENSE =3D "BSD-3-Clause"
>> -PR =3D "r0"
>> -
>> -SRCREV =3D "5"
>> -
>> -SRC_URI =3D
>> "svn://openbsd-netcat.googlecode.com/svn;module=3Dtrunk;protocol=3Dhttp"
>> -S =3D "${WORKDIR}/trunk"
>> -
>> -inherit update-alternatives gettext
>> -
>> -do_configure[noexec] =3D "1"
>> -
>> -do_compile() {
>> -       cd ${S}
>> -       oe_runmake
>> -}
>> -
>> -do_install() {
>> -       install -d ${D}${bindir}
>> -       install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
>> -}
>> -
>> -ALTERNATIVE_${PN} =3D "nc"
>> -ALTERNATIVE_PRIORITY =3D "101"
>> -
>> -BBCLASSEXTEND =3D "nativesdk"
>>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

