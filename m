Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D827AE00706
	for <meta-virtualization@yoctoproject.org>;
	Sat,  5 Jan 2013 10:44:03 -0800 (PST)
Received: by mail-la0-f44.google.com with SMTP id fr10so11941739lab.31
	for <meta-virtualization@yoctoproject.org>;
	Sat, 05 Jan 2013 10:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=RZ4KYwobnk7eP/nPC45TXVnWbKj6jb9om32+XjOPl7o=;
	b=xieLOBCp09H67smEg2LjAN4pOZC8/OvuiwzOznPgOAktEqNI8rjS6Tni+zGVmwOQxe
	lg36cyMX+/4kAHd4rpHgUFLwWI4jj9CXPLP396ZxOtcqIUbb5u2drS7mC5IEdBZLQqQA
	IzQ/t1qpoPGeEkinn6iIK+Lz1hpslzsgOApXSaT+wnliwBY9HM+KT+mZlXlFdZswCkyv
	7BPfzrctH5LpRrnfEQMW0bCoHhafrLgrUXGx3paUTwcNrmKBQKUj5YU3qmPQKeVFZOuh
	glPZLdRPJG7CaHMhLdlkKedPVeSWU471p9TLS1fMv07M6J2WRcQmyEvThNhtbDouOdCP
	WVGw==
MIME-Version: 1.0
Received: by 10.112.54.6 with SMTP id f6mr23009146lbp.71.1357411442024; Sat,
	05 Jan 2013 10:44:02 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Sat, 5 Jan 2013 10:44:01 -0800 (PST)
In-Reply-To: <50E83CC7.60608@enea.com>
References: <1357393406-11707-1-git-send-email-lei.yang@windriver.com>
	<50E830EF.6030102@gmail.com>
	<CAHsH0E8wu6gn4bnqiDr8AtexVc7kq4zdL3jVWWzOOnqx1zMrZQ@mail.gmail.com>
	<50E83CC7.60608@enea.com>
Date: Sat, 5 Jan 2013 13:44:01 -0500
Message-ID: <CADkTA4Mx6EQGPb2c7qgjQ0eqQ0P4eFyxnTj38nB2gN=z5KY29Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
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
X-List-Received-Date: Sat, 05 Jan 2013 18:44:04 -0000
Content-Type: multipart/alternative; boundary=bcaec5540070d0e0b004d28efa2c

--bcaec5540070d0e0b004d28efa2c
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 5, 2013 at 9:46 AM, David Nystr=F6m <david.nystrom@enea.com>wro=
te:

>
>
> On 01/05/2013 03:26 PM, lei yang wrote:
>
>> On Sat, Jan 5, 2013 at 5:55 AM, David Nystr=F6m <david.c.nystrom@gmail.c=
om>
>> wrote:
>>
>>> On 01/05/2013 02:43 PM, lei.yang@windriver.com wrote:
>>>
>>>>
>>>> From: Lei Yang <lei.yang@windriver.com>
>>>>
>>>> I know we have the patches in debian dir in the previous version,
>>>> but I meet lots of patch error.so I change it to debian.org version
>>>>
>>>> The background I do this change is:
>>>> I'm a kvm tester,without patches it will meet error when I do the
>>>> migrate
>>>> testing with  -incoming "exec:nc -l 5200" it meets error:
>>>> "nc: Protocol no available."
>>>>
>>>> You can reproduce it simplely with "nc -l 5200" on your board
>>>>
>>>> Lei
>>>>
>>>> Signed-off-by: Lei Yang <lei.yang@windriver.com>
>>>> ---
>>>>
>>>
>>>
>>> [snip]
>>>
>>>
>>>  +do_compile() {
>>>> +       cd ${S}
>>>> +        while read line; do patch -p1 <debian/patches/$line; done
>>>> <debian/patches/series
>>>>
>>>
>>>
>>> Is this line really needed ?
>>> I cant seem to find any file called debian/patches/* in ${S}.
>>>
>>>
>> Yes it needed, http://ftp.debian.org/debian/**pool/main/n/netcat-openbsd=
/
>> **netcat-openbsd_1.89-4.diff.gz<http://ftp.debian.org/debian/pool/main/n=
/netcat-openbsd/netcat-openbsd_1.89-4.diff.gz>
>> will be download, and gunzip by bitbake automaticlly, then it find
>> .diff (or patch) it will automatically apply(before I thought only
>> .patch will be applied, now I find .diff will be applied ) then you
>> will see the debian/patches dir  created by .dff
>>
>> logs:
>> lyang0@pek-lpgtest1:/**buildarea1/lyang0/kvm_rr$ ls
>> build/netcat-openbsd-1.89-r0/**netcat-openbsd-1.89.orig/
>> atomicio.c      atomicio.o      Makefile        nc.1
>> netcat.c.orig   openbsd-compat/ .pc/            socks.o
>> atomicio.h      debian/         nc              netcat.c
>> netcat.o        patches/        socks.c
>>
>>
>>
>>>  +       pkgrel=3D4
>>>> +       oe_runmake CFLAGS=3D"$CFLAGS -DDEBIAN_VERSION=3D\"\\\"${**
>>>> pkgrel}\\\"\""
>>>>
>>>
>>>
>>> I assume this has been tested with package_rpm as well.
>>>
>>>
>>>
>> Yes, I'm a tester .welcome any testing work to let me do freely
>>
>> lyang0@pek-lpgtest1:/**buildarea1/lyang0/kvm_rr$ cat
>> build/netcat-openbsd-1.89-r0/**deploy-rpms/x86_64/netcat-**openbsd-
>> netcat-openbsd-1.89-r0.x86_64.**rpm
>> netcat-openbsd-dbg-1.89-r0.**x86_64.rpm
>> netcat-openbsd-dev-1.89-r0.**x86_64.rpm
>>
>>
> Thanks Lei,
> I'll merge this as soon as I can, I seem to be unable to push at the
> moment. I'll try to resolv this asap.
>
>
>
I think we should hold on this merge completely. netcat is already covered
by meta-networking, so
we should be consolidating patches and support there.

If there are any specific meta-virt requirements for netcat, we should
either use bbappends (and
depend on meta-networking, or use the combo-layer tools to pull the support
directly) or better yet
get them merged into meta-networking.

Cheers,

Bruce


>
>>
>>
>>  +}
>>>> +
>>>> +do_install() {
>>>> +       install -d ${D}${bindir}
>>>> +       install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
>>>> +}
>>>> +
>>>> +ALTERNATIVE_${PN} =3D "nc"
>>>> +ALTERNATIVE_PRIORITY =3D "101"
>>>> +
>>>> +BBCLASSEXTEND =3D "nativesdk"
>>>> diff --git a/recipes-networking/netcat/op**enbsd-netcat_1.6.bb<http://=
openbsd-netcat_1.6.bb>
>>>> b/recipes-networking/netcat/op**enbsd-netcat_1.6.bb<http://openbsd-net=
cat_1.6.bb>
>>>> deleted file mode 100644
>>>> index 1ae3f37..0000000
>>>> --- a/recipes-networking/netcat/op**enbsd-netcat_1.6.bb<http://openbsd=
-netcat_1.6.bb>
>>>> +++ /dev/null
>>>> @@ -1,29 +0,0 @@
>>>> -DESCRIPTION =3D "OpenBSD Netcat"
>>>> -HOMEPAGE =3D "http://code.google.com/p/**openbsd-netcat/<http://code.=
google.com/p/openbsd-netcat/>
>>>> "
>>>> -SECTION =3D "console/network"
>>>> -LICENSE =3D "BSD-3-Clause"
>>>> -PR =3D "r0"
>>>> -
>>>> -SRCREV =3D "5"
>>>> -
>>>> -SRC_URI =3D
>>>> "svn://openbsd-netcat.**googlecode.com/svn;module=3D**trunk;protocol=
=3Dhttp<http://openbsd-netcat.googlecode.com/svn;module=3Dtrunk;protocol=3D=
http>
>>>> "
>>>> -S =3D "${WORKDIR}/trunk"
>>>> -
>>>> -inherit update-alternatives gettext
>>>> -
>>>> -do_configure[noexec] =3D "1"
>>>> -
>>>> -do_compile() {
>>>> -       cd ${S}
>>>> -       oe_runmake
>>>> -}
>>>> -
>>>> -do_install() {
>>>> -       install -d ${D}${bindir}
>>>> -       install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
>>>> -}
>>>> -
>>>> -ALTERNATIVE_${PN} =3D "nc"
>>>> -ALTERNATIVE_PRIORITY =3D "101"
>>>> -
>>>> -BBCLASSEXTEND =3D "nativesdk"
>>>>
>>>>
>>> ______________________________**_________________
>>> meta-virtualization mailing list
>>> meta-virtualization@**yoctoproject.org<meta-virtualization@yoctoproject=
.org>
>>> https://lists.yoctoproject.**org/listinfo/meta-**virtualization<https:/=
/lists.yoctoproject.org/listinfo/meta-virtualization>
>>>
>> ______________________________**_________________
>> meta-virtualization mailing list
>> meta-virtualization@**yoctoproject.org<meta-virtualization@yoctoproject.=
org>
>> https://lists.yoctoproject.**org/listinfo/meta-**virtualization<https://=
lists.yoctoproject.org/listinfo/meta-virtualization>
>>
>>  ______________________________**_________________
> meta-virtualization mailing list
> meta-virtualization@**yoctoproject.org<meta-virtualization@yoctoproject.o=
rg>
> https://lists.yoctoproject.**org/listinfo/meta-**virtualization<https://l=
ists.yoctoproject.org/listinfo/meta-virtualization>
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--bcaec5540070d0e0b004d28efa2c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Sat, Jan 5, 2013 at 9:46 AM, David Nystr=F6m <span dir=3D"ltr">&=
lt;<a href=3D"mailto:david.nystrom@enea.com" target=3D"_blank">david.nystro=
m@enea.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 01/05/2013 03:26 PM, lei yang wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Sat, Jan 5, 2013 at 5:55 AM, David Nystr=F6m &lt;<a href=3D"mailto:david=
.c.nystrom@gmail.com" target=3D"_blank">david.c.nystrom@gmail.com</a>&gt; w=
rote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 01/05/2013 02:43 PM, <a href=3D"mailto:lei.yang@windriver.com" target=3D=
"_blank">lei.yang@windriver.com</a> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
From: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.com" target=3D"_bla=
nk">lei.yang@windriver.com</a>&gt;<br>
<br>
I know we have the patches in debian dir in the previous version,<br>
but I meet lots of patch error.so I change it to <a href=3D"http://debian.o=
rg" target=3D"_blank">debian.org</a> version<br>
<br>
The background I do this change is:<br>
I&#39;m a kvm tester,without patches it will meet error when I do the migra=
te<br>
testing with =A0-incoming &quot;exec:nc -l 5200&quot; it meets error:<br>
&quot;nc: Protocol no available.&quot;<br>
<br>
You can reproduce it simplely with &quot;nc -l 5200&quot; on your board<br>
<br>
Lei<br>
<br>
Signed-off-by: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.com" targe=
t=3D"_blank">lei.yang@windriver.com</a>&gt;<br>
---<br>
</blockquote>
<br>
<br>
[snip]<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+do_compile() {<br>
+ =A0 =A0 =A0 cd ${S}<br>
+ =A0 =A0 =A0 =A0while read line; do patch -p1 &lt;debian/patches/$line; do=
ne<br>
&lt;debian/patches/series<br>
</blockquote>
<br>
<br>
Is this line really needed ?<br>
I cant seem to find any file called debian/patches/* in ${S}.<br>
<br>
</blockquote>
<br>
Yes it needed, <a href=3D"http://ftp.debian.org/debian/pool/main/n/netcat-o=
penbsd/netcat-openbsd_1.89-4.diff.gz" target=3D"_blank">http://ftp.debian.o=
rg/debian/<u></u>pool/main/n/netcat-openbsd/<u></u>netcat-openbsd_1.89-4.di=
ff.gz</a><br>

will be download, and gunzip by bitbake automaticlly, then it find<br>
.diff (or patch) it will automatically apply(before I thought only<br>
.patch will be applied, now I find .diff will be applied ) then you<br>
will see the debian/patches dir =A0created by .dff<br>
<br>
logs:<br>
lyang0@pek-lpgtest1:/<u></u>buildarea1/lyang0/kvm_rr$ ls<br>
build/netcat-openbsd-1.89-r0/<u></u>netcat-openbsd-1.89.orig/<br>
atomicio.c =A0 =A0 =A0atomicio.o =A0 =A0 =A0Makefile =A0 =A0 =A0 =A0nc.1<br=
>
netcat.c.orig =A0 openbsd-compat/ .pc/ =A0 =A0 =A0 =A0 =A0 =A0socks.o<br>
atomicio.h =A0 =A0 =A0debian/ =A0 =A0 =A0 =A0 nc =A0 =A0 =A0 =A0 =A0 =A0 =
=A0netcat.c<br>
netcat.o =A0 =A0 =A0 =A0patches/ =A0 =A0 =A0 =A0socks.c<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+ =A0 =A0 =A0 pkgrel=3D4<br>
+ =A0 =A0 =A0 oe_runmake CFLAGS=3D&quot;$CFLAGS -DDEBIAN_VERSION=3D\&quot;\=
\\&quot;${<u></u>pkgrel}\\\&quot;\&quot;&quot;<br>
</blockquote>
<br>
<br>
I assume this has been tested with package_rpm as well.<br>
<br>
<br>
</blockquote>
<br>
Yes, I&#39;m a tester .welcome any testing work to let me do freely<br>
<br>
lyang0@pek-lpgtest1:/<u></u>buildarea1/lyang0/kvm_rr$ cat<br>
build/netcat-openbsd-1.89-r0/<u></u>deploy-rpms/x86_64/netcat-<u></u>openbs=
d-<br>
netcat-openbsd-1.89-r0.x86_64.<u></u>rpm<br>
netcat-openbsd-dbg-1.89-r0.<u></u>x86_64.rpm<br>
netcat-openbsd-dev-1.89-r0.<u></u>x86_64.rpm<br>
<br>
</blockquote>
<br></div></div>
Thanks Lei,<br>
I&#39;ll merge this as soon as I can, I seem to be unable to push at the mo=
ment. I&#39;ll try to resolv this asap.<div class=3D"HOEnZb"><div class=3D"=
h5"><br>
<br></div></div></blockquote><div><br></div><div style>I think we should ho=
ld on this merge completely. netcat is already covered by meta-networking, =
so</div><div style>we should be consolidating patches and support there.</d=
iv>
<div style><br></div><div style>If there are any specific meta-virt require=
ments for netcat, we should either use bbappends (and</div><div style>depen=
d on meta-networking, or use the combo-layer tools to pull the support dire=
ctly) or better yet</div>
<div style>get them merged into meta-networking.</div><div><br></div><div s=
tyle>Cheers,</div><div style><br></div><div style>Bruce</div><div>=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+}<br>
+<br>
+do_install() {<br>
+ =A0 =A0 =A0 install -d ${D}${bindir}<br>
+ =A0 =A0 =A0 install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}<br>
+}<br>
+<br>
+ALTERNATIVE_${PN} =3D &quot;nc&quot;<br>
+ALTERNATIVE_PRIORITY =3D &quot;101&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
diff --git a/recipes-networking/netcat/<a href=3D"http://openbsd-netcat_1.6=
.bb" target=3D"_blank">op<u></u>enbsd-netcat_1.6.bb</a><br>
b/recipes-networking/netcat/<a href=3D"http://openbsd-netcat_1.6.bb" target=
=3D"_blank">op<u></u>enbsd-netcat_1.6.bb</a><br>
deleted file mode 100644<br>
index 1ae3f37..0000000<br>
--- a/recipes-networking/netcat/<a href=3D"http://openbsd-netcat_1.6.bb" ta=
rget=3D"_blank">op<u></u>enbsd-netcat_1.6.bb</a><br>
+++ /dev/null<br>
@@ -1,29 +0,0 @@<br>
-DESCRIPTION =3D &quot;OpenBSD Netcat&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://code.google.com/p/openbsd-netcat/" ta=
rget=3D"_blank">http://code.google.com/p/<u></u>openbsd-netcat/</a>&quot;<b=
r>
-SECTION =3D &quot;console/network&quot;<br>
-LICENSE =3D &quot;BSD-3-Clause&quot;<br>
-PR =3D &quot;r0&quot;<br>
-<br>
-SRCREV =3D &quot;5&quot;<br>
-<br>
-SRC_URI =3D<br>
&quot;svn://<a href=3D"http://openbsd-netcat.googlecode.com/svn;module=3Dtr=
unk;protocol=3Dhttp" target=3D"_blank">openbsd-netcat.<u></u>googlecode.com=
/svn;module=3D<u></u>trunk;protocol=3Dhttp</a>&quot;<br>
-S =3D &quot;${WORKDIR}/trunk&quot;<br>
-<br>
-inherit update-alternatives gettext<br>
-<br>
-do_configure[noexec] =3D &quot;1&quot;<br>
-<br>
-do_compile() {<br>
- =A0 =A0 =A0 cd ${S}<br>
- =A0 =A0 =A0 oe_runmake<br>
-}<br>
-<br>
-do_install() {<br>
- =A0 =A0 =A0 install -d ${D}${bindir}<br>
- =A0 =A0 =A0 install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}<br>
-}<br>
-<br>
-ALTERNATIVE_${PN} =3D &quot;nc&quot;<br>
-ALTERNATIVE_PRIORITY =3D &quot;101&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
<br>
</blockquote>
<br>
______________________________<u></u>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@<u></u>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.<u></u>org/listinfo/meta-<u></u>v=
irtualization</a><br>
</blockquote>
______________________________<u></u>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@<u></u>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.<u></u>org/listinfo/meta-<u></u>v=
irtualization</a><br>
<br>
</blockquote>
______________________________<u></u>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@<u></u>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.<u></u>org/listinfo/meta-<u></u>v=
irtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
</div></div>

--bcaec5540070d0e0b004d28efa2c--
