Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AF042E00294
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:40:58 -0800 (PST)
Received: by mail-la0-f48.google.com with SMTP id m13so5625381lah.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 06:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZD/ch+ybrbxEZPgSVztrfT2dKQ3v9oJN7/QOLmAfBss=;
	b=rtea3wZ0K+mcTNrB1xqUUQmSjAVzHCzrzNT+6Awd8Ncbb5MlIqgFtJj83ZsfucAaMS
	gI7IFYfXdNDZML9JpjlFOrpiuHC0RLifT6cY7O4koZLJOVYLWJV6E+u7pDbGzLOAex6X
	82wcg/dJYyMlgHad4qSTMnb/OJ1cfvhLR00G2d3NHGPatarc2s4+/qDVX5Vg5Z7KhGrZ
	nB9DvlhXwsjDMZ+GN435sIXe9LNblMhrM9AY8uk4sCOcnpyt8KghSTVWR9cLT80k4k+K
	ajRBeX34o7Et2CIti7hN1aIb+xVLR1iyy5yuArsjuL8MQz9E8R+Ml6YqqXR1DiuLCIUW
	StdQ==
MIME-Version: 1.0
Received: by 10.112.46.199 with SMTP id x7mr998929lbm.109.1354804857338; Thu,
	06 Dec 2012 06:40:57 -0800 (PST)
Received: by 10.114.77.164 with HTTP; Thu, 6 Dec 2012 06:40:57 -0800 (PST)
In-Reply-To: <50C0AA48.1040508@gmail.com>
References: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
	<1354802601-10840-7-git-send-email-david.c.nystrom@gmail.com>
	<CADkTA4NZfY+P=2U7jdk4wY-SFJP-Ns4MMDtauy=HorkFRNHyWg@mail.gmail.com>
	<50C0AA48.1040508@gmail.com>
Date: Thu, 6 Dec 2012 09:40:57 -0500
Message-ID: <CADkTA4MjJH0xrEwLxbmqZTWp3+4XEk1Nf=xPFUXtFH1g+srmYg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCHv3 06/14] Added openbsd-netcat recipe, libvirt dependency
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
X-List-Received-Date: Thu, 06 Dec 2012 14:40:59 -0000
Content-Type: multipart/alternative; boundary=bcaec554056842fa1504d030166f

--bcaec554056842fa1504d030166f
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 6, 2012 at 9:23 AM, David Nystr=F6m <david.c.nystrom@gmail.com>=
wrote:

> On 12/06/2012 03:20 PM, Bruce Ashfield wrote:
>
>> On Thu, Dec 6, 2012 at 9:03 AM, <david.c.nystrom@gmail.com> wrote:
>>
>>  From: David Nystr=F6m <david.nystrom@enea.com>
>>>
>>> ---
>>>   recipes-networking/netcat/open**bsd-netcat_1.6.bb<http://openbsd-netc=
at_1.6.bb>|   29
>>> +++++++++++++++++++++++
>>>   1 file changed, 29 insertions(+)
>>>   create mode 100644 recipes-networking/netcat/open**bsd-netcat_1.6.bb<=
http://openbsd-netcat_1.6.bb>
>>>
>>>
>> Random comment. I was surprised that this wasn't already in the
>> meta-networking
>> layer, so I went to have a look. And indeed I don't see it.
>>
>> Is that consistent with what other people see ? This seems like it could
>> go
>> in another
>> layer at some point.
>>
>> At a glance, I'm not seeing the libvirt dependency. Am I overlooking it
>> somehow ?
>>
>> Cheers,
>>
>> Bruce
>>
>>
> A good explanation is here:
> https://bugs.archlinux.org/**task/22068<https://bugs.archlinux.org/task/2=
2068>
>
>
Aha.  I read the shortlog as meaning something else (or maybe I'm still
misunderstanding). I thought you were saying that netcat had a dependency
on libvirt, but it looks like it's more of a libvirt dependency on netcat
(the
way I translate things).

Cheers,

Bruce


>
>
>>
>>> diff --git a/recipes-networking/netcat/**openbsd-netcat_1.6.bbb/**
>>> recipes-networking/netcat/
>>> openbsd-netcat_1.6.bb
>>> new file mode 100644
>>> index 0000000..1ae3f37
>>> --- /dev/null
>>> +++ b/recipes-networking/netcat/op**enbsd-netcat_1.6.bb<http://openbsd-=
netcat_1.6.bb>
>>> @@ -0,0 +1,29 @@
>>> +DESCRIPTION =3D "OpenBSD Netcat"
>>> +HOMEPAGE =3D "http://code.google.com/p/**openbsd-netcat/<http://code.g=
oogle.com/p/openbsd-netcat/>
>>> "
>>> +SECTION =3D "console/network"
>>> +LICENSE =3D "BSD-3-Clause"
>>> +PR =3D "r0"
>>> +
>>> +SRCREV =3D "5"
>>> +
>>> +SRC_URI =3D "svn://
>>> openbsd-netcat.googlecode.com/**svn;module=3Dtrunk;protocol=3Dhttp<http=
://openbsd-netcat.googlecode.com/svn;module=3Dtrunk;protocol=3Dhttp>
>>> **"
>>> +S =3D "${WORKDIR}/trunk"
>>> +
>>> +inherit update-alternatives gettext
>>> +
>>> +do_configure[noexec] =3D "1"
>>> +
>>> +do_compile() {
>>> +       cd ${S}
>>> +       oe_runmake
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
>>> --
>>> 1.7.9.5
>>>
>>> ______________________________**_________________
>>> meta-virtualization mailing list
>>> meta-virtualization@**yoctoproject.org<meta-virtualization@yoctoproject=
.org>
>>> https://lists.yoctoproject.**org/listinfo/meta-**virtualization<https:/=
/lists.yoctoproject.org/listinfo/meta-virtualization>
>>>
>>>
>>
>>
>>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--bcaec554056842fa1504d030166f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, D=
ec 6, 2012 at 9:23 AM, David Nystr=F6m <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:david.c.nystrom@gmail.com" target=3D"_blank">david.c.nystrom@gmail.com<=
/a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 12/06/2012 03:20 PM, Br=
uce Ashfield wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Thu, Dec 6, 2012 at 9:03 AM, &lt;<a href=3D"mailto:david.c.nystrom@gmail=
.com" target=3D"_blank">david.c.nystrom@gmail.com</a>&gt; wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: David Nystr=F6m &lt;<a href=3D"mailto:david.nystrom@enea.com" target=
=3D"_blank">david.nystrom@enea.com</a>&gt;<br>
<br>
---<br>
=A0 recipes-networking/netcat/<a href=3D"http://openbsd-netcat_1.6.bb" targ=
et=3D"_blank">open<u></u>bsd-netcat_1.6.bb</a> | =A0 29<br>
+++++++++++++++++++++++<br>
=A0 1 file changed, 29 insertions(+)<br>
=A0 create mode 100644 recipes-networking/netcat/<a href=3D"http://openbsd-=
netcat_1.6.bb" target=3D"_blank">open<u></u>bsd-netcat_1.6.bb</a><br>
<br>
</blockquote>
<br>
Random comment. I was surprised that this wasn&#39;t already in the<br>
meta-networking<br>
layer, so I went to have a look. And indeed I don&#39;t see it.<br>
<br>
Is that consistent with what other people see ? This seems like it could go=
<br>
in another<br>
layer at some point.<br>
<br>
At a glance, I&#39;m not seeing the libvirt dependency. Am I overlooking it=
<br>
somehow ?<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
</blockquote>
<br></div>
A good explanation is here:<br>
<a href=3D"https://bugs.archlinux.org/task/22068" target=3D"_blank">https:/=
/bugs.archlinux.org/<u></u>task/22068</a><div class=3D"HOEnZb"><div class=
=3D"h5"><br></div></div></blockquote><div><br></div><div>Aha. =A0I read the=
 shortlog as meaning something else (or maybe I&#39;m still</div>
<div>misunderstanding). I thought you were saying that netcat had a depende=
ncy</div><div>on libvirt, but it looks like it&#39;s more of a libvirt=A0de=
pendency=A0on netcat (the</div><div>way I translate things).</div><div><br>
</div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
diff --git a/recipes-networking/netcat/<u></u>openbsd-netcat_1.6.bbb/<u></u=
>recipes-networking/netcat/<br>
<a href=3D"http://openbsd-netcat_1.6.bb" target=3D"_blank">openbsd-netcat_1=
.6.bb</a><br>
new file mode 100644<br>
index 0000000..1ae3f37<br>
--- /dev/null<br>
+++ b/recipes-networking/netcat/<a href=3D"http://openbsd-netcat_1.6.bb" ta=
rget=3D"_blank">op<u></u>enbsd-netcat_1.6.bb</a><br>
@@ -0,0 +1,29 @@<br>
+DESCRIPTION =3D &quot;OpenBSD Netcat&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://code.google.com/p/openbsd-netcat/" ta=
rget=3D"_blank">http://code.google.com/p/<u></u>openbsd-netcat/</a>&quot;<b=
r>
+SECTION =3D &quot;console/network&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+PR =3D &quot;r0&quot;<br>
+<br>
+SRCREV =3D &quot;5&quot;<br>
+<br>
+SRC_URI =3D &quot;svn://<br>
<a href=3D"http://openbsd-netcat.googlecode.com/svn;module=3Dtrunk;protocol=
=3Dhttp" target=3D"_blank">openbsd-netcat.googlecode.com/<u></u>svn;module=
=3Dtrunk;protocol=3Dhttp</a><u></u>&quot;<br>
+S =3D &quot;${WORKDIR}/trunk&quot;<br>
+<br>
+inherit update-alternatives gettext<br>
+<br>
+do_configure[noexec] =3D &quot;1&quot;<br>
+<br>
+do_compile() {<br>
+ =A0 =A0 =A0 cd ${S}<br>
+ =A0 =A0 =A0 oe_runmake<br>
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
--<br>
1.7.9.5<br>
<br>
______________________________<u></u>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@<u></u>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.<u></u>org/listinfo/meta-<u></u>v=
irtualization</a><br>
<br>
</blockquote>
<br>
<br>
<br>
</blockquote>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;<br>
</div>

--bcaec554056842fa1504d030166f--
