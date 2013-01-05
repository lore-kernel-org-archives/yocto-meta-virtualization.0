Return-Path: <yanglei.fage@gmail.com>
Received: from mail-bk0-f53.google.com (mail-bk0-f53.google.com
	[209.85.214.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47577E004D1
	for <meta-virtualization@yoctoproject.org>;
	Sat,  5 Jan 2013 06:26:14 -0800 (PST)
Received: by mail-bk0-f53.google.com with SMTP id j5so7703873bkw.12
	for <meta-virtualization@yoctoproject.org>;
	Sat, 05 Jan 2013 06:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=+yEgfmv/DAJSBPJwF7e80c7/J0p2QPy1aK4N7Lr+wtk=;
	b=xulq2JcitHmWpE1ITJio1SI3n+vnMHC7saPF6GLkCfu0FNUY0xdXMiWrRrKqjWpIFj
	SWq6ATXBtf3Y+eegEsYFZ7daH4EdaWIZQfR4FNi1JqrYXSMm0jUg41ZF9PRxMD4H3X1v
	15hYG5/bS+/r8W6ojr9+O6Yzxj1+RNQWeT14rRddfpXg/+xE/TocgIKaRqIDK5K/eDcl
	ACjKC7wsIkwZ/xCgKo+SmCP6IPuWoVNq/W5oYo0V0jTbuUh9494/JETO8hXHgl1unnQg
	gLwxgQf1ESQBsIKGFR52YgEy2wdmTDrluUGCx9FiGV6QMB81auPQjge4I7h9W1wMnMTX
	kZCQ==
MIME-Version: 1.0
Received: by 10.204.5.202 with SMTP id 10mr26859600bkw.135.1357395972856; Sat,
	05 Jan 2013 06:26:12 -0800 (PST)
Received: by 10.204.11.86 with HTTP; Sat, 5 Jan 2013 06:26:12 -0800 (PST)
In-Reply-To: <50E830EF.6030102@gmail.com>
References: <1357393406-11707-1-git-send-email-lei.yang@windriver.com>
	<50E830EF.6030102@gmail.com>
Date: Sat, 5 Jan 2013 06:26:12 -0800
Message-ID: <CAHsH0E8wu6gn4bnqiDr8AtexVc7kq4zdL3jVWWzOOnqx1zMrZQ@mail.gmail.com>
From: lei yang <yanglei.fage@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
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
X-List-Received-Date: Sat, 05 Jan 2013 14:26:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 5, 2013 at 5:55 AM, David Nystr=F6m <david.c.nystrom@gmail.com>=
 wrote:
> On 01/05/2013 02:43 PM, lei.yang@windriver.com wrote:
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
>>
>> Lei
>>
>> Signed-off-by: Lei Yang <lei.yang@windriver.com>
>> ---
>
>
> [snip]
>
>
>> +do_compile() {
>> +       cd ${S}
>> +        while read line; do patch -p1 <debian/patches/$line; done
>> <debian/patches/series
>
>
> Is this line really needed ?
> I cant seem to find any file called debian/patches/* in ${S}.
>

Yes it needed, http://ftp.debian.org/debian/pool/main/n/netcat-openbsd/netc=
at-openbsd_1.89-4.diff.gz
will be download, and gunzip by bitbake automaticlly, then it find
.diff (or patch) it will automatically apply(before I thought only
.patch will be applied, now I find .diff will be applied ) then you
will see the debian/patches dir  created by .dff

logs:
lyang0@pek-lpgtest1:/buildarea1/lyang0/kvm_rr$ ls
build/netcat-openbsd-1.89-r0/netcat-openbsd-1.89.orig/
atomicio.c      atomicio.o      Makefile        nc.1
netcat.c.orig   openbsd-compat/ .pc/            socks.o
atomicio.h      debian/         nc              netcat.c
netcat.o        patches/        socks.c


>
>> +       pkgrel=3D4
>> +       oe_runmake CFLAGS=3D"$CFLAGS -DDEBIAN_VERSION=3D\"\\\"${pkgrel}\=
\\"\""
>
>
> I assume this has been tested with package_rpm as well.
>
>

Yes, I'm a tester .welcome any testing work to let me do freely

lyang0@pek-lpgtest1:/buildarea1/lyang0/kvm_rr$ cat
build/netcat-openbsd-1.89-r0/deploy-rpms/x86_64/netcat-openbsd-
netcat-openbsd-1.89-r0.x86_64.rpm
netcat-openbsd-dbg-1.89-r0.x86_64.rpm
netcat-openbsd-dev-1.89-r0.x86_64.rpm




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

