Return-Path: <yanglei.fage@gmail.com>
Received: from mail-da0-f45.google.com (mail-da0-f45.google.com
	[209.85.210.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 119FEE00706
	for <meta-virtualization@yoctoproject.org>;
	Sat,  5 Jan 2013 16:28:53 -0800 (PST)
Received: by mail-da0-f45.google.com with SMTP id w4so8040620dam.4
	for <meta-virtualization@yoctoproject.org>;
	Sat, 05 Jan 2013 16:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:x-mailer:from:subject:date
	:to; bh=emXZ8Dtxfnb3mfImiq4e0a21444Wu0odI2nts26ZONc=;
	b=twDEadrkXQ6xwJI0m6Lv4HELirbpyNNg1stAdoWN1srQlEDqhfYj52sS5zKdbrnoXU
	qC80oNV9RzAbgl/Z3zOzpEaxIwvfpp4tkg86qa0jFg9iY0448BmqnIoF48pWXxRK1RWJ
	k0YjuQEH56dx5Wz/i71DEVWmflRMjCAvIdH6qbdNhvJsp/MxA0Og1t5PPiakX0O/Wqwj
	zR9OLo3mcx8YqZ9ELok/g+e0n9WhSlfTju1mUnwbRowM4HFCRcHQETTACKPInn9nPmAD
	z+TVTbJUZnGAsh6zfwXZGvqtqfnNQEjGQluTKsqndqUco5FJaKuVSosfXIZnwOWSrhNz
	9CSw==
X-Received: by 10.68.137.167 with SMTP id qj7mr172573174pbb.148.1357432132558; 
	Sat, 05 Jan 2013 16:28:52 -0800 (PST)
Received: from [10.5.51.252] ([114.247.10.75])
	by mx.google.com with ESMTPS id oj1sm34835267pbb.19.2013.01.05.16.28.43
	(version=SSLv3 cipher=OTHER); Sat, 05 Jan 2013 16:28:51 -0800 (PST)
References: <1357393406-11707-1-git-send-email-lei.yang@windriver.com>
	<50E830EF.6030102@gmail.com>
	<CAHsH0E8wu6gn4bnqiDr8AtexVc7kq4zdL3jVWWzOOnqx1zMrZQ@mail.gmail.com>
	<50E83CC7.60608@enea.com>
	<CADkTA4Mx6EQGPb2c7qgjQ0eqQ0P4eFyxnTj38nB2gN=z5KY29Q@mail.gmail.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <CADkTA4Mx6EQGPb2c7qgjQ0eqQ0P4eFyxnTj38nB2gN=z5KY29Q@mail.gmail.com>
Message-Id: <0BF1DE0F-6CAD-4128-811E-EB9C6BBD1566@gmail.com>
X-Mailer: iPhone Mail (10A403)
From: Lei Yang <yanglei.fage@gmail.com>
Date: Sun, 6 Jan 2013 08:28:35 +0800
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
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
X-List-Received-Date: Sun, 06 Jan 2013 00:28:53 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-5D6A6FB1-228A-4967-98D0-BF42D74715BC
Content-Transfer-Encoding: 7bit

--Apple-Mail-5D6A6FB1-228A-4967-98D0-BF42D74715BC
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Bruce=20

I checked the netcat with my phone in meta-networking ,It's not the bsd ne=
tcat,in libvirt or my vert-test,we need to use bsd netcat,they are differen=
t source.

Lei
On 2013-1-6, at 2:44, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

>=20
>=20
>=20
> On Sat, Jan 5, 2013 at 9:46 AM, David Nystr=C3=B6m <david.nystrom@enea.c=
om> wrote:
>>=20
>>=20
>> On 01/05/2013 03:26 PM, lei yang wrote:
>>> On Sat, Jan 5, 2013 at 5:55 AM, David Nystr=C3=B6m <david.c.nystrom@gm=
ail.com> wrote:
>>>> On 01/05/2013 02:43 PM, lei.yang@windriver.com wrote:
>>>>>=20
>>>>> From: Lei Yang <lei.yang@windriver.com>
>>>>>=20
>>>>> I know we have the patches in debian dir in the previous version,
>>>>> but I meet lots of patch error.so I change it to debian.org version
>>>>>=20
>>>>> The background I do this change is:
>>>>> I'm a kvm tester,without patches it will meet error when I do the mi=
grate
>>>>> testing with  -incoming "exec:nc -l 5200" it meets error:
>>>>> "nc: Protocol no available."
>>>>>=20
>>>>> You can reproduce it simplely with "nc -l 5200" on your board
>>>>>=20
>>>>> Lei
>>>>>=20
>>>>> Signed-off-by: Lei Yang <lei.yang@windriver.com>
>>>>> ---
>>>>=20
>>>>=20
>>>> [snip]
>>>>=20
>>>>=20
>>>>> +do_compile() {
>>>>> +       cd ${S}
>>>>> +        while read line; do patch -p1 <debian/patches/$line; done
>>>>> <debian/patches/series
>>>>=20
>>>>=20
>>>> Is this line really needed ?
>>>> I cant seem to find any file called debian/patches/* in ${S}.
>>>=20
>>> Yes it needed, http://ftp.debian.org/debian/pool/main/n/netcat-openbsd=
/netcat-openbsd_1.89-4.diff.gz
>>> will be download, and gunzip by bitbake automaticlly, then it find
>>> .diff (or patch) it will automatically apply(before I thought only
>>> .patch will be applied, now I find .diff will be applied ) then you
>>> will see the debian/patches dir  created by .dff
>>>=20
>>> logs:
>>> lyang0@pek-lpgtest1:/buildarea1/lyang0/kvm_rr$ ls
>>> build/netcat-openbsd-1.89-r0/netcat-openbsd-1.89.orig/
>>> atomicio.c      atomicio.o      Makefile        nc.1
>>> netcat.c.orig   openbsd-compat/ .pc/            socks.o
>>> atomicio.h      debian/         nc              netcat.c
>>> netcat.o        patches/        socks.c
>>>=20
>>>=20
>>>>=20
>>>>> +       pkgrel=3D4
>>>>> +       oe_runmake CFLAGS=3D"$CFLAGS -DDEBIAN_VERSION=3D\"\\\"${pkgr=
el}\\\"\""
>>>>=20
>>>>=20
>>>> I assume this has been tested with package_rpm as well.
>>>=20
>>> Yes, I'm a tester .welcome any testing work to let me do freely
>>>=20
>>> lyang0@pek-lpgtest1:/buildarea1/lyang0/kvm_rr$ cat
>>> build/netcat-openbsd-1.89-r0/deploy-rpms/x86_64/netcat-openbsd-
>>> netcat-openbsd-1.89-r0.x86_64.rpm
>>> netcat-openbsd-dbg-1.89-r0.x86_64.rpm
>>> netcat-openbsd-dev-1.89-r0.x86_64.rpm
>>=20
>> Thanks Lei,
>> I'll merge this as soon as I can, I seem to be unable to push at the mo=
ment. I'll try to resolv this asap.
>=20
> I think we should hold on this merge completely. netcat is already cover=
ed by meta-networking, so
> we should be consolidating patches and support there.
>=20
> If there are any specific meta-virt requirements for netcat, we should e=
ither use bbappends (and
> depend on meta-networking, or use the combo-layer tools to pull the supp=
ort directly) or better yet
> get them merged into meta-networking.
>=20
> Cheers,
>=20
> Bruce
>  
>>>=20
>>>=20
>>>=20
>>>>> +}
>>>>> +
>>>>> +do_install() {
>>>>> +       install -d ${D}${bindir}
>>>>> +       install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
>>>>> +}
>>>>> +
>>>>> +ALTERNATIVE_${PN} =3D "nc"
>>>>> +ALTERNATIVE_PRIORITY =3D "101"
>>>>> +
>>>>> +BBCLASSEXTEND =3D "nativesdk"
>>>>> diff --git a/recipes-networking/netcat/openbsd-netcat_1.6.bb
>>>>> b/recipes-networking/netcat/openbsd-netcat_1.6.bb
>>>>> deleted file mode 100644
>>>>> index 1ae3f37..0000000
>>>>> --- a/recipes-networking/netcat/openbsd-netcat_1.6.bb
>>>>> +++ /dev/null
>>>>> @@ -1,29 +0,0 @@
>>>>> -DESCRIPTION =3D "OpenBSD Netcat"
>>>>> -HOMEPAGE =3D "http://code.google.com/p/openbsd-netcat/"
>>>>> -SECTION =3D "console/network"
>>>>> -LICENSE =3D "BSD-3-Clause"
>>>>> -PR =3D "r0"
>>>>> -
>>>>> -SRCREV =3D "5"
>>>>> -
>>>>> -SRC_URI =3D
>>>>> "svn://openbsd-netcat.googlecode.com/svn;module=3Dtrunk;protocol=3Dh=
ttp"
>>>>> -S =3D "${WORKDIR}/trunk"
>>>>> -
>>>>> -inherit update-alternatives gettext
>>>>> -
>>>>> -do_configure[noexec] =3D "1"
>>>>> -
>>>>> -do_compile() {
>>>>> -       cd ${S}
>>>>> -       oe_runmake
>>>>> -}
>>>>> -
>>>>> -do_install() {
>>>>> -       install -d ${D}${bindir}
>>>>> -       install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
>>>>> -}
>>>>> -
>>>>> -ALTERNATIVE_${PN} =3D "nc"
>>>>> -ALTERNATIVE_PRIORITY =3D "101"
>>>>> -
>>>>> -BBCLASSEXTEND =3D "nativesdk"
>>>>=20
>>>> _______________________________________________
>>>> meta-virtualization mailing list
>>>> meta-virtualization@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end"

--Apple-Mail-5D6A6FB1-228A-4967-98D0-BF42D74715BC
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=
=
=3Dutf-8"></head><body dir=3D"auto"><div>Hi Bruce&nbsp;</div><div><br></di=
v><div>I checked the netcat with my phone in meta-networking ,It's not the =
bsd netcat,in libvirt or my vert-test,we need to use bsd netcat,they are di=
fferent source.</div><div><br></div><div>Lei<br><br></div><div><br>On 2013-=
1-6, at 2:44, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com=
">bruce.ashfield@gmail.com</a>&gt; wrote:<br><br></div><blockquote type=3D"=
cite"><div><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div cla=
ss=3D"gmail_quote">On Sat, Jan 5, 2013 at 9:46 AM, David Nystr=C3=B6m <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:david.nystrom@enea.com" target=3D"_blank=
">david.nystrom@enea.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5"><br=
>
<br>
On 01/05/2013 03:26 PM, lei yang wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
On Sat, Jan 5, 2013 at 5:55 AM, David Nystr=C3=B6m &lt;<a href=3D"mailto:d=
avid.c.nystrom@gmail.com" target=3D"_blank">david.c.nystrom@gmail.com</a>&g=
t; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
On 01/05/2013 02:43 PM, <a href=3D"mailto:lei.yang@windriver.com" target=
=3D"_blank">lei.yang@windriver.com</a> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br>
From: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.com" target=3D"_bl=
ank">lei.yang@windriver.com</a>&gt;<br>
<br>
I know we have the patches in debian dir in the previous version,<br>
but I meet lots of patch error.so I change it to <a href=3D"http://debian.=
org" target=3D"_blank">debian.org</a> version<br>
<br>
The background I do this change is:<br>
I'm a kvm tester,without patches it will meet error when I do the migrate<=
br>
testing with &nbsp;-incoming "exec:nc -l 5200" it meets error:<br>
"nc: Protocol no available."<br>
<br>
You can reproduce it simplely with "nc -l 5200" on your board<br>
<br>
Lei<br>
<br>
Signed-off-by: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.com" targ=
et=3D"_blank">lei.yang@windriver.com</a>&gt;<br>
---<br>
</blockquote>
<br>
<br>
[snip]<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
+do_compile() {<br>
+ &nbsp; &nbsp; &nbsp; cd ${S}<br>
+ &nbsp; &nbsp; &nbsp; &nbsp;while read line; do patch -p1 &lt;debian/patc=
hes/$line; done<br>
&lt;debian/patches/series<br>
</blockquote>
<br>
<br>
Is this line really needed ?<br>
I cant seem to find any file called debian/patches/* in ${S}.<br>
<br>
</blockquote>
<br>
Yes it needed, <a href=3D"http://ftp.debian.org/debian/pool/main/n/netcat-=
openbsd/netcat-openbsd_1.89-4.diff.gz" target=3D"_blank">http://ftp.debian.=
org/debian/<u></u>pool/main/n/netcat-openbsd/<u></u>netcat-openbsd_1.89-4.d=
iff.gz</a><br>

will be download, and gunzip by bitbake automaticlly, then it find<br>
.diff (or patch) it will automatically apply(before I thought only<br>
.patch will be applied, now I find .diff will be applied ) then you<br>
will see the debian/patches dir &nbsp;created by .dff<br>
<br>
logs:<br>
lyang0@pek-lpgtest1:/<u></u>buildarea1/lyang0/kvm_rr$ ls<br>
build/netcat-openbsd-1.89-r0/<u></u>netcat-openbsd-1.89.orig/<br>
atomicio.c &nbsp; &nbsp; &nbsp;atomicio.o &nbsp; &nbsp; &nbsp;Makefile &nb=
sp; &nbsp; &nbsp; &nbsp;nc.1<br>
netcat.c.orig &nbsp; openbsd-compat/ .pc/ &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;socks.o<br>
atomicio.h &nbsp; &nbsp; &nbsp;debian/ &nbsp; &nbsp; &nbsp; &nbsp; nc &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;netcat.c<br>
netcat.o &nbsp; &nbsp; &nbsp; &nbsp;patches/ &nbsp; &nbsp; &nbsp; &nbsp;so=
cks.c<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
+ &nbsp; &nbsp; &nbsp; pkgrel=3D4<br>
+ &nbsp; &nbsp; &nbsp; oe_runmake CFLAGS=3D"$CFLAGS -DDEBIAN_VERSION=3D\"\=
\\"${<u></u>pkgrel}\\\"\""<br>
</blockquote>
<br>
<br>
I assume this has been tested with package_rpm as well.<br>
<br>
<br>
</blockquote>
<br>
Yes, I'm a tester .welcome any testing work to let me do freely<br>
<br>
lyang0@pek-lpgtest1:/<u></u>buildarea1/lyang0/kvm_rr$ cat<br>
build/netcat-openbsd-1.89-r0/<u></u>deploy-rpms/x86_64/netcat-<u></u>openb=
sd-<br>
netcat-openbsd-1.89-r0.x86_64.<u></u>rpm<br>
netcat-openbsd-dbg-1.89-r0.<u></u>x86_64.rpm<br>
netcat-openbsd-dev-1.89-r0.<u></u>x86_64.rpm<br>
<br>
</blockquote>
<br></div></div>
Thanks Lei,<br>
I'll merge this as soon as I can, I seem to be unable to push at the momen=
t. I'll try to resolv this asap.<div class=3D"HOEnZb"><div class=3D"h5"><br=
>
<br></div></div></blockquote><div><br></div><div style=3D"">I think we sho=
uld hold on this merge completely. netcat is already covered by meta-networ=
king, so</div><div style=3D"">we should be consolidating patches and suppor=
t there.</div>
<div style=3D""><br></div><div style=3D"">If there are any specific meta-v=
irt requirements for netcat, we should either use bbappends (and</div><div =
style=3D"">depend on meta-networking, or use the combo-layer tools to pull =
the support directly) or better yet</div>
<div style=3D"">get them merged into meta-networking.</div><div><br></div>=
<div style=3D"">Cheers,</div><div style=3D""><br></div><div style=3D"">Bruc=
e</div><div>&nbsp;</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+}<br>
+<br>
+do_install() {<br>
+ &nbsp; &nbsp; &nbsp; install -d ${D}${bindir}<br>
+ &nbsp; &nbsp; &nbsp; install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}<br>
+}<br>
+<br>
+ALTERNATIVE_${PN} =3D "nc"<br>
+ALTERNATIVE_PRIORITY =3D "101"<br>
+<br>
+BBCLASSEXTEND =3D "nativesdk"<br>
diff --git a/recipes-networking/netcat/<a href=3D"http://openbsd-netcat_1.=
6.bb" target=3D"_blank">op<u></u>enbsd-netcat_1.6.bb</a><br>
b/recipes-networking/netcat/<a href=3D"http://openbsd-netcat_1.6.bb" targe=
t=3D"_blank">op<u></u>enbsd-netcat_1.6.bb</a><br>
deleted file mode 100644<br>
index 1ae3f37..0000000<br>
--- a/recipes-networking/netcat/<a href=3D"http://openbsd-netcat_1.6.bb" t=
arget=3D"_blank">op<u></u>enbsd-netcat_1.6.bb</a><br>
+++ /dev/null<br>
@@ -1,29 +0,0 @@<br>
-DESCRIPTION =3D "OpenBSD Netcat"<br>
-HOMEPAGE =3D "<a href=3D"http://code.google.com/p/openbsd-netcat/" target=
=
=3D"_blank">http://code.google.com/p/<u></u>openbsd-netcat/</a>"<br>
-SECTION =3D "console/network"<br>
-LICENSE =3D "BSD-3-Clause"<br>
-PR =3D "r0"<br>
-<br>
-SRCREV =3D "5"<br>
-<br>
-SRC_URI =3D<br>
"svn://<a href=3D"http://openbsd-netcat.googlecode.com/svn;module=3Dtrunk;=
protocol=3Dhttp" target=3D"_blank">openbsd-netcat.<u></u>googlecode.com/svn=
;module=3D<u></u>trunk;protocol=3Dhttp</a>"<br>
-S =3D "${WORKDIR}/trunk"<br>
-<br>
-inherit update-alternatives gettext<br>
-<br>
-do_configure[noexec] =3D "1"<br>
-<br>
-do_compile() {<br>
- &nbsp; &nbsp; &nbsp; cd ${S}<br>
- &nbsp; &nbsp; &nbsp; oe_runmake<br>
-}<br>
-<br>
-do_install() {<br>
- &nbsp; &nbsp; &nbsp; install -d ${D}${bindir}<br>
- &nbsp; &nbsp; &nbsp; install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}<br>
-}<br>
-<br>
-ALTERNATIVE_${PN} =3D "nc"<br>
-ALTERNATIVE_PRIORITY =3D "101"<br>
-<br>
-BBCLASSEXTEND =3D "nativesdk"<br>
<br>
</blockquote>
<br>
______________________________<u></u>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">=
meta-virtualization@<u></u>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" ta=
rget=3D"_blank">https://lists.yoctoproject.<u></u>org/listinfo/meta-<u></u>=
virtualization</a><br>
</blockquote>
______________________________<u></u>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">=
meta-virtualization@<u></u>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" ta=
rget=3D"_blank">https://lists.yoctoproject.<u></u>org/listinfo/meta-<u></u>=
virtualization</a><br>
<br>
</blockquote>
______________________________<u></u>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">=
meta-virtualization@<u></u>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" ta=
rget=3D"_blank">https://lists.yoctoproject.<u></u>org/listinfo/meta-<u></u>=
virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br=
>"Thou shalt not follow the NULL pointer, for chaos and madness await thee =
at its end"
</div></div>
</div></blockquote></body></html>

--Apple-Mail-5D6A6FB1-228A-4967-98D0-BF42D74715BC--
