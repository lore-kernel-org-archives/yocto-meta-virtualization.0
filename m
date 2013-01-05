Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id D986DE0047F
	for <meta-virtualization@yoctoproject.org>;
	Sat,  5 Jan 2013 06:46:33 -0800 (PST)
Received: from [172.16.140.44] (172.16.140.44) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.2.318.1;
	Sat, 5 Jan 2013 15:46:32 +0100
Message-ID: <50E83CC7.60608@enea.com>
Date: Sat, 5 Jan 2013 15:46:31 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: lei yang <yanglei.fage@gmail.com>
References: <1357393406-11707-1-git-send-email-lei.yang@windriver.com>
	<50E830EF.6030102@gmail.com>
	<CAHsH0E8wu6gn4bnqiDr8AtexVc7kq4zdL3jVWWzOOnqx1zMrZQ@mail.gmail.com>
In-Reply-To: <CAHsH0E8wu6gn4bnqiDr8AtexVc7kq4zdL3jVWWzOOnqx1zMrZQ@mail.gmail.com>
X-Originating-IP: [172.16.140.44]
Cc: meta-virtualization@yoctoproject.org
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
X-List-Received-Date: Sat, 05 Jan 2013 14:46:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 01/05/2013 03:26 PM, lei yang wrote:
> On Sat, Jan 5, 2013 at 5:55 AM, David Nystr=F6m <david.c.nystrom@gmail.co=
m> wrote:
>> On 01/05/2013 02:43 PM, lei.yang@windriver.com wrote:
>>>
>>> From: Lei Yang <lei.yang@windriver.com>
>>>
>>> I know we have the patches in debian dir in the previous version,
>>> but I meet lots of patch error.so I change it to debian.org version
>>>
>>> The background I do this change is:
>>> I'm a kvm tester,without patches it will meet error when I do the migra=
te
>>> testing with  -incoming "exec:nc -l 5200" it meets error:
>>> "nc: Protocol no available."
>>>
>>> You can reproduce it simplely with "nc -l 5200" on your board
>>>
>>> Lei
>>>
>>> Signed-off-by: Lei Yang <lei.yang@windriver.com>
>>> ---
>>
>>
>> [snip]
>>
>>
>>> +do_compile() {
>>> +       cd ${S}
>>> +        while read line; do patch -p1 <debian/patches/$line; done
>>> <debian/patches/series
>>
>>
>> Is this line really needed ?
>> I cant seem to find any file called debian/patches/* in ${S}.
>>
>
> Yes it needed, http://ftp.debian.org/debian/pool/main/n/netcat-openbsd/ne=
tcat-openbsd_1.89-4.diff.gz
> will be download, and gunzip by bitbake automaticlly, then it find
> .diff (or patch) it will automatically apply(before I thought only
> .patch will be applied, now I find .diff will be applied ) then you
> will see the debian/patches dir  created by .dff
>
> logs:
> lyang0@pek-lpgtest1:/buildarea1/lyang0/kvm_rr$ ls
> build/netcat-openbsd-1.89-r0/netcat-openbsd-1.89.orig/
> atomicio.c      atomicio.o      Makefile        nc.1
> netcat.c.orig   openbsd-compat/ .pc/            socks.o
> atomicio.h      debian/         nc              netcat.c
> netcat.o        patches/        socks.c
>
>
>>
>>> +       pkgrel=3D4
>>> +       oe_runmake CFLAGS=3D"$CFLAGS -DDEBIAN_VERSION=3D\"\\\"${pkgrel}=
\\\"\""
>>
>>
>> I assume this has been tested with package_rpm as well.
>>
>>
>
> Yes, I'm a tester .welcome any testing work to let me do freely
>
> lyang0@pek-lpgtest1:/buildarea1/lyang0/kvm_rr$ cat
> build/netcat-openbsd-1.89-r0/deploy-rpms/x86_64/netcat-openbsd-
> netcat-openbsd-1.89-r0.x86_64.rpm
> netcat-openbsd-dbg-1.89-r0.x86_64.rpm
> netcat-openbsd-dev-1.89-r0.x86_64.rpm
>

Thanks Lei,
I'll merge this as soon as I can, I seem to be unable to push at the=20
moment. I'll try to resolv this asap.

>
>
>
>>> +}
>>> +
>>> +do_install() {
>>> +       install -d ${D}${bindir}
>>> +       install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
>>> +}
>>> +
>>> +ALTERNATIVE_${PN} =3D "nc"
>>> +ALTERNATIVE_PRIORITY =3D "101"
>>> +
>>> +BBCLASSEXTEND =3D "nativesdk"
>>> diff --git a/recipes-networking/netcat/openbsd-netcat_1.6.bb
>>> b/recipes-networking/netcat/openbsd-netcat_1.6.bb
>>> deleted file mode 100644
>>> index 1ae3f37..0000000
>>> --- a/recipes-networking/netcat/openbsd-netcat_1.6.bb
>>> +++ /dev/null
>>> @@ -1,29 +0,0 @@
>>> -DESCRIPTION =3D "OpenBSD Netcat"
>>> -HOMEPAGE =3D "http://code.google.com/p/openbsd-netcat/"
>>> -SECTION =3D "console/network"
>>> -LICENSE =3D "BSD-3-Clause"
>>> -PR =3D "r0"
>>> -
>>> -SRCREV =3D "5"
>>> -
>>> -SRC_URI =3D
>>> "svn://openbsd-netcat.googlecode.com/svn;module=3Dtrunk;protocol=3Dhttp=
"
>>> -S =3D "${WORKDIR}/trunk"
>>> -
>>> -inherit update-alternatives gettext
>>> -
>>> -do_configure[noexec] =3D "1"
>>> -
>>> -do_compile() {
>>> -       cd ${S}
>>> -       oe_runmake
>>> -}
>>> -
>>> -do_install() {
>>> -       install -d ${D}${bindir}
>>> -       install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
>>> -}
>>> -
>>> -ALTERNATIVE_${PN} =3D "nc"
>>> -ALTERNATIVE_PRIORITY =3D "101"
>>> -
>>> -BBCLASSEXTEND =3D "nativesdk"
>>>
>>
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

