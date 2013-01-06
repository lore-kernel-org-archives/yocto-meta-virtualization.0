Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DEFC8E00706
	for <meta-virtualization@yoctoproject.org>;
	Sat,  5 Jan 2013 16:53:16 -0800 (PST)
Received: by mail-pa0-f41.google.com with SMTP id bj3so9971378pad.14
	for <meta-virtualization@yoctoproject.org>;
	Sat, 05 Jan 2013 16:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CBPXhUWJIf3ghppaR4ceNs2Lq3jef8Y7sF2OnzYy70c=;
	b=OxwXiB7Hd6v3fq4EIJF0vkwG14AbHoRM6RxeYgN/4QuSInUAq+bAb7HK0DyD8CoVHX
	jeVoEb0Gu6nNH/GDjQ+4ThvBLbq001NJuqL4vFNiv09OXpkzPKlz/mAvKv3momE8DRFU
	krDoXyA3dAdM0lw/0qUIE06Gz1bpy8m3ZBLgGe0b45SUuXlQ8Jd1lD2KKY/b/G2XcJeO
	SwD43DWbOvSxnrWLSTDz5Zj1Q4lUir7MAhvp2smoFY+0sL7V+h4AJlRSNQenvnzg2KLf
	o6dUwgKELx/tQ9aXgeiU5uY1eBd3vJq3bQXoWUJ3/mydjdrRHWDSjMUlToC4peDeEM1K
	o2ag==
MIME-Version: 1.0
Received: by 10.66.86.71 with SMTP id n7mr166409680paz.77.1357433596668; Sat,
	05 Jan 2013 16:53:16 -0800 (PST)
Received: by 10.68.1.68 with HTTP; Sat, 5 Jan 2013 16:53:16 -0800 (PST)
In-Reply-To: <0BF1DE0F-6CAD-4128-811E-EB9C6BBD1566@gmail.com>
References: <1357393406-11707-1-git-send-email-lei.yang@windriver.com>
	<50E830EF.6030102@gmail.com>
	<CAHsH0E8wu6gn4bnqiDr8AtexVc7kq4zdL3jVWWzOOnqx1zMrZQ@mail.gmail.com>
	<50E83CC7.60608@enea.com>
	<CADkTA4Mx6EQGPb2c7qgjQ0eqQ0P4eFyxnTj38nB2gN=z5KY29Q@mail.gmail.com>
	<0BF1DE0F-6CAD-4128-811E-EB9C6BBD1566@gmail.com>
Date: Sat, 5 Jan 2013 19:53:16 -0500
Message-ID: <CADkTA4MugpvRrVGjefpOspwj4ZAOvAk8cYFnm=vqxxFYM0vo5Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Lei Yang <yanglei.fage@gmail.com>
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
X-List-Received-Date: Sun, 06 Jan 2013 00:53:17 -0000
Content-Type: multipart/alternative; boundary=f46d042de92d55ec6404d294234a

--f46d042de92d55ec6404d294234a
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 5, 2013 at 7:28 PM, Lei Yang <yanglei.fage@gmail.com> wrote:

> Hi Bruce
>
> I checked the netcat with my phone in meta-networking ,It's not the bsd
> netcat,in libvirt or my vert-test,we need to use bsd netcat,they are
> different source.
>

That was understood, and what I meant by:

"If there are any specific meta-virt requirements for netcat, we should
either use bbappends (and
depend on meta-networking, or use the combo-layer tools to pull the support
directly) or better yet
get them merged into meta-networking."

The solution is not to carry a similar netcat in meta-virt, but to have a
single netcat source, which
is meta-virtualization.

There's no rush to merge this, there's no impending releases, so we should
take our time and
unify the support, not create a very similar structure in meta-virt.

Cheers,

Bruce



>
> Lei
>
> Sent from my iPhone
>
> On 2013-1-6, at 2:44, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
>
>
>
> On Sat, Jan 5, 2013 at 9:46 AM, David Nystr=F6m <david.nystrom@enea.com>w=
rote:
>
>>
>>
>> On 01/05/2013 03:26 PM, lei yang wrote:
>>
>>> On Sat, Jan 5, 2013 at 5:55 AM, David Nystr=F6m <david.c.nystrom@gmail.=
com>
>>> wrote:
>>>
>>>> On 01/05/2013 02:43 PM, lei.yang@windriver.com wrote:
>>>>
>>>>>
>>>>> From: Lei Yang <lei.yang@windriver.com>
>>>>>
>>>>> I know we have the patches in debian dir in the previous version,
>>>>> but I meet lots of patch error.so I change it to debian.org version
>>>>>
>>>>> The background I do this change is:
>>>>> I'm a kvm tester,without patches it will meet error when I do the
>>>>> migrate
>>>>> testing with  -incoming "exec:nc -l 5200" it meets error:
>>>>> "nc: Protocol no available."
>>>>>
>>>>> You can reproduce it simplely with "nc -l 5200" on your board
>>>>>
>>>>> Lei
>>>>>
>>>>> Signed-off-by: Lei Yang <lei.yang@windriver.com>
>>>>> ---
>>>>>
>>>>
>>>>
>>>> [snip]
>>>>
>>>>
>>>>  +do_compile() {
>>>>> +       cd ${S}
>>>>> +        while read line; do patch -p1 <debian/patches/$line; done
>>>>> <debian/patches/series
>>>>>
>>>>
>>>>
>>>> Is this line really needed ?
>>>> I cant seem to find any file called debian/patches/* in ${S}.
>>>>
>>>>
>>> Yes it needed, http://ftp.debian.org/debian/**
>>> pool/main/n/netcat-openbsd/**netcat-openbsd_1.89-4.diff.gz<http://ftp.d=
ebian.org/debian/pool/main/n/netcat-openbsd/netcat-openbsd_1.89-4.diff.gz>
>>> will be download, and gunzip by bitbake automaticlly, then it find
>>> .diff (or patch) it will automatically apply(before I thought only
>>> .patch will be applied, now I find .diff will be applied ) then you
>>> will see the debian/patches dir  created by .dff
>>>
>>> logs:
>>> lyang0@pek-lpgtest1:/**buildarea1/lyang0/kvm_rr$ ls
>>> build/netcat-openbsd-1.89-r0/**netcat-openbsd-1.89.orig/
>>> atomicio.c      atomicio.o      Makefile        nc.1
>>> netcat.c.orig   openbsd-compat/ .pc/            socks.o
>>> atomicio.h      debian/         nc              netcat.c
>>> netcat.o        patches/        socks.c
>>>
>>>
>>>
>>>>  +       pkgrel=3D4
>>>>> +       oe_runmake CFLAGS=3D"$CFLAGS -DDEBIAN_VERSION=3D\"\\\"${**
>>>>> pkgrel}\\\"\""
>>>>>
>>>>
>>>>
>>>> I assume this has been tested with package_rpm as well.
>>>>
>>>>
>>>>
>>> Yes, I'm a tester .welcome any testing work to let me do freely
>>>
>>> lyang0@pek-lpgtest1:/**buildarea1/lyang0/kvm_rr$ cat
>>> build/netcat-openbsd-1.89-r0/**deploy-rpms/x86_64/netcat-**openbsd-
>>> netcat-openbsd-1.89-r0.x86_64.**rpm
>>> netcat-openbsd-dbg-1.89-r0.**x86_64.rpm
>>> netcat-openbsd-dev-1.89-r0.**x86_64.rpm
>>>
>>>
>> Thanks Lei,
>> I'll merge this as soon as I can, I seem to be unable to push at the
>> moment. I'll try to resolv this asap.
>>
>>
>>
> I think we should hold on this merge completely. netcat is already covere=
d
> by meta-networking, so
> we should be consolidating patches and support there.
>
> If there are any specific meta-virt requirements for netcat, we should
> either use bbappends (and
> depend on meta-networking, or use the combo-layer tools to pull the
> support directly) or better yet
> get them merged into meta-networking.
>
> Cheers,
>
> Bruce
>
>
>>
>>>
>>>
>>>  +}
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
>>>>> diff --git a/recipes-networking/netcat/op**enbsd-netcat_1.6.bb<http:/=
/openbsd-netcat_1.6.bb>
>>>>> b/recipes-networking/netcat/op**enbsd-netcat_1.6.bb<http://openbsd-ne=
tcat_1.6.bb>
>>>>> deleted file mode 100644
>>>>> index 1ae3f37..0000000
>>>>> --- a/recipes-networking/netcat/op**enbsd-netcat_1.6.bb<http://openbs=
d-netcat_1.6.bb>
>>>>> +++ /dev/null
>>>>> @@ -1,29 +0,0 @@
>>>>> -DESCRIPTION =3D "OpenBSD Netcat"
>>>>> -HOMEPAGE =3D "http://code.google.com/p/**openbsd-netcat/<http://code=
.google.com/p/openbsd-netcat/>
>>>>> "
>>>>> -SECTION =3D "console/network"
>>>>> -LICENSE =3D "BSD-3-Clause"
>>>>> -PR =3D "r0"
>>>>> -
>>>>> -SRCREV =3D "5"
>>>>> -
>>>>> -SRC_URI =3D
>>>>> "svn://openbsd-netcat.**googlecode.com/svn;module=3D**
>>>>> trunk;protocol=3Dhttp<http://openbsd-netcat.googlecode.com/svn;module=
=3Dtrunk;protocol=3Dhttp>
>>>>> "
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
>>>>>
>>>>>
>>>> ______________________________**_________________
>>>> meta-virtualization mailing list
>>>> meta-virtualization@**yoctoproject.org<meta-virtualization@yoctoprojec=
t.org>
>>>> https://lists.yoctoproject.**org/listinfo/meta-**virtualization<https:=
//lists.yoctoproject.org/listinfo/meta-virtualization>
>>>>
>>> ______________________________**_________________
>>> meta-virtualization mailing list
>>> meta-virtualization@**yoctoproject.org<meta-virtualization@yoctoproject=
.org>
>>> https://lists.yoctoproject.**org/listinfo/meta-**virtualization<https:/=
/lists.yoctoproject.org/listinfo/meta-virtualization>
>>>
>>>  ______________________________**_________________
>> meta-virtualization mailing list
>> meta-virtualization@**yoctoproject.org<meta-virtualization@yoctoproject.=
org>
>> https://lists.yoctoproject.**org/listinfo/meta-**virtualization<https://=
lists.yoctoproject.org/listinfo/meta-virtualization>
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d042de92d55ec6404d294234a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Sat, Jan 5, 2013 at 7:28 PM, Lei Yang <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:yanglei.fage@gmail.com" target=3D"_blank">yanglei.fage@gmail.=
com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex"><div dir=3D"auto"><div>Hi Bruce=A0</div><div><br></div><d=
iv>I checked the netcat with my phone in meta-networking ,It&#39;s not the =
bsd netcat,in libvirt or my vert-test,we need to use bsd netcat,they are di=
fferent source.</div>
</div></blockquote><div><br></div><div style>That was understood, and what=
 I meant by:</div><div style><span style=3D"color:rgb(80,0,80)"><br></span>=
</div><div style><span style=3D"color:rgb(80,0,80)">&quot;If there are any =
specific meta-virt requirements for netcat, we should either use bbappends =
(and</span></div>
<div style><span style=3D"color:rgb(80,0,80)">depend on meta-networking, o=
r use the combo-layer tools to pull the support directly) or better</span><=
span style=3D"color:rgb(80,0,80)">=A0yet</span></div><div style><span style=
=
=3D"color:rgb(80,0,80)">get them merged into meta-networking.&quot;</span>=
</div>
<div style><span style=3D"color:rgb(80,0,80)"><br></span></div><div style>=
<span style=3D"color:rgb(80,0,80)">The solution is not to carry a similar n=
etcat in meta-virt, but to have a single netcat source, which</span></div><=
div style>
<font color=3D"#500050">is meta-virtualization.</font></div><div style><fo=
nt color=3D"#500050"><br></font></div><div style><font color=3D"#500050">Th=
ere&#39;s no rush to merge this, there&#39;s no impending releases, so we s=
hould take our time and</font></div>
<div style><font color=3D"#500050">unify the support, not create a very si=
milar structure in meta-virt.</font></div><div style><font color=3D"#500050=
"><br></font></div><div style><font color=3D"#500050">Cheers,</font></div><=
div style>
<font color=3D"#500050"><br></font></div><div style><font color=3D"#500050=
">Bruce</font></div><div><br></div><div>=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
<div dir=3D"auto"><div><br></div><div>Lei<br><br></div><div><div class=3D"=
h5"><div><br>On 2013-1-6, at 2:44, Bruce Ashfield &lt;<a href=3D"mailto:bru=
ce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; w=
rote:<br>
<br></div><blockquote type=3D"cite"><div><div dir=3D"ltr"><br><div class=
=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Sat, Jan 5, 2013 at=
 9:46 AM, David Nystr=F6m <span dir=3D"ltr">&lt;<a href=3D"mailto:david.nys=
trom@enea.com" target=3D"_blank">david.nystrom@enea.com</a>&gt;</span> wrot=
e:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex"><div><div><br>
<br>
On 01/05/2013 03:26 PM, lei yang wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex">
On Sat, Jan 5, 2013 at 5:55 AM, David Nystr=F6m &lt;<a href=3D"mailto:davi=
d.c.nystrom@gmail.com" target=3D"_blank">david.c.nystrom@gmail.com</a>&gt; =
wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex">
On 01/05/2013 02:43 PM, <a href=3D"mailto:lei.yang@windriver.com" target=
=3D"_blank">lei.yang@windriver.com</a> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex">
<br>
From: Lei Yang &lt;<a href=3D"mailto:lei.yang@windriver.com" target=3D"_bl=
ank">lei.yang@windriver.com</a>&gt;<br>
<br>
I know we have the patches in debian dir in the previous version,<br>
but I meet lots of patch error.so I change it to <a href=3D"http://debian.=
org" target=3D"_blank">debian.org</a> version<br>
<br>
The background I do this change is:<br>
I&#39;m a kvm tester,without patches it will meet error when I do the migr=
ate<br>
testing with =A0-incoming &quot;exec:nc -l 5200&quot; it meets error:<br>
&quot;nc: Protocol no available.&quot;<br>
<br>
You can reproduce it simplely with &quot;nc -l 5200&quot; on your board<br=
>
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
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex">
+do_compile() {<br>
+ =A0 =A0 =A0 cd ${S}<br>
+ =A0 =A0 =A0 =A0while read line; do patch -p1 &lt;debian/patches/$line; d=
one<br>
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
will see the debian/patches dir =A0created by .dff<br>
<br>
logs:<br>
lyang0@pek-lpgtest1:/<u></u>buildarea1/lyang0/kvm_rr$ ls<br>
build/netcat-openbsd-1.89-r0/<u></u>netcat-openbsd-1.89.orig/<br>
atomicio.c =A0 =A0 =A0atomicio.o =A0 =A0 =A0Makefile =A0 =A0 =A0 =A0nc.1<b=
r>
netcat.c.orig =A0 openbsd-compat/ .pc/ =A0 =A0 =A0 =A0 =A0 =A0socks.o<br>
atomicio.h =A0 =A0 =A0debian/ =A0 =A0 =A0 =A0 nc =A0 =A0 =A0 =A0 =A0 =A0 =
=A0netcat.c<br>
netcat.o =A0 =A0 =A0 =A0patches/ =A0 =A0 =A0 =A0socks.c<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex">
+ =A0 =A0 =A0 pkgrel=3D4<br>
+ =A0 =A0 =A0 oe_runmake CFLAGS=3D&quot;$CFLAGS -DDEBIAN_VERSION=3D\&quot;=
\\\&quot;${<u></u>pkgrel}\\\&quot;\&quot;&quot;<br>
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
build/netcat-openbsd-1.89-r0/<u></u>deploy-rpms/x86_64/netcat-<u></u>openb=
sd-<br>
netcat-openbsd-1.89-r0.x86_64.<u></u>rpm<br>
netcat-openbsd-dbg-1.89-r0.<u></u>x86_64.rpm<br>
netcat-openbsd-dev-1.89-r0.<u></u>x86_64.rpm<br>
<br>
</blockquote>
<br></div></div>
Thanks Lei,<br>
I&#39;ll merge this as soon as I can, I seem to be unable to push at the m=
oment. I&#39;ll try to resolv this asap.<div><div><br>
<br></div></div></blockquote><div><br></div><div>I think we should hold on=
 this merge completely. netcat is already covered by meta-networking, so</d=
iv><div>we should be consolidating patches and support there.</div>
<div><br></div><div>If there are any specific meta-virt requirements for n=
etcat, we should either use bbappends (and</div><div>depend on meta-network=
ing, or use the combo-layer tools to pull the support directly) or better y=
et</div>

<div>get them merged into meta-networking.</div><div><br></div><div>Cheers=
,</div><div><br></div><div>Bruce</div><div>=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">

<div><div>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex">
<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex">

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
-DESCRIPTION =3D &quot;OpenBSD Netcat&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://code.google.com/p/openbsd-netcat/" t=
arget=3D"_blank">http://code.google.com/p/<u></u>openbsd-netcat/</a>&quot;<=
br>
-SECTION =3D &quot;console/network&quot;<br>
-LICENSE =3D &quot;BSD-3-Clause&quot;<br>
-PR =3D &quot;r0&quot;<br>
-<br>
-SRCREV =3D &quot;5&quot;<br>
-<br>
-SRC_URI =3D<br>
&quot;svn://<a href=3D"http://openbsd-netcat.googlecode.com/svn;module=3Dt=
runk;protocol=3Dhttp" target=3D"_blank">openbsd-netcat.<u></u>googlecode.co=
m/svn;module=3D<u></u>trunk;protocol=3Dhttp</a>&quot;<br>
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
>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end&quot;
</div></div>
</div></blockquote></div></div></div></blockquote></div><br><br clear=3D"a=
ll"><div><br></div>-- <br>&quot;Thou shalt not follow the NULL pointer, for=
 chaos and madness await thee at its end&quot;
</div></div>

--f46d042de92d55ec6404d294234a--
