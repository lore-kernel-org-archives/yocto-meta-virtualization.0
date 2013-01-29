Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E41F2E002AB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 05:54:50 -0800 (PST)
Received: by mail-la0-f41.google.com with SMTP id fo12so311114lab.14
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 05:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=yhc/MPGK4B/noblnQrPS+W5/pfZ43kjduT+/Pfjv0x8=;
	b=eCgGcfk7DoX4V8L0YTB2fW5HT52GR42SWM9t31Kp1Q05O5Fi+rBDAgzMeOouPjqQU/
	xAAKFK5qzUfF8WEDPiQWD5IU+Ju1z3fSAZkPhvlPyVhMHXE7M7U8KgvXEYhPBoWBLkIx
	HJSl/UvTlRZkc4Gd9mRRlO3PvKU+WZAPH+7F6QPYfViLBIJ56iT6wHBvRKuFdPVJM5Bt
	oSi0JKNJRciEVP6JMjDWiBzm0NPDua+4rfGajz9dIl33X6TpfTar9JGXGm6oeaLJWOOy
	oKy9MDsvgfZ2z240M8WGCkZSyGhhjXQWEWg64kyRBS2KUmPfkhezIH5QG2KKIiBk0VC9
	2nyQ==
MIME-Version: 1.0
X-Received: by 10.112.43.161 with SMTP id x1mr514736lbl.89.1359467689600; Tue,
	29 Jan 2013 05:54:49 -0800 (PST)
Received: by 10.112.40.169 with HTTP; Tue, 29 Jan 2013 05:54:49 -0800 (PST)
In-Reply-To: <5107D0DF.6040006@gmail.com>
References: <1359464500-16993-1-git-send-email-mihai.prica@intel.com>
	<1359464500-16993-2-git-send-email-mihai.prica@intel.com>
	<5107D0DF.6040006@gmail.com>
Date: Tue, 29 Jan 2013 08:54:49 -0500
Message-ID: <CADkTA4OsbnmQCZ+2wkPjY6hoq-ZHE4PSt1ozYgsb=9Ur0Fcfqg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] qemu: Enabled VGA output
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
X-List-Received-Date: Tue, 29 Jan 2013 13:54:51 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe2b2ab8e67904d46dbc33

--e0cb4efe2b2ab8e67904d46dbc33
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2013 at 8:38 AM, David Nystr=F6m <david.c.nystrom@gmail.com=
>wrote:

> On 01/29/2013 02:01 PM, Mihai Prica wrote:
>
>> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
>> ---
>>   recipes-devtools/qemu/qemu_1.**3.0.bbappend |    3 +++
>>   1 file changed, 3 insertions(+)
>>   create mode 100644 recipes-devtools/qemu/qemu_1.**3.0.bbappend
>>
>> diff --git a/recipes-devtools/qemu/qemu_**1.3.0.bbappend
>> b/recipes-devtools/qemu/qemu_**1.3.0.bbappend
>> new file mode 100644
>> index 0000000..2106825
>> --- /dev/null
>> +++ b/recipes-devtools/qemu/qemu_**1.3.0.bbappend
>> @@ -0,0 +1,3 @@
>> +# Enables QEMU to display the VGA output
>> +DEPENDS_append =3D " libsdl"
>> +SDL =3D "--enable-sdl"
>>
>>
> Should this really be in meta-virt, this seems a bit distro specific ?
>

Can PACKAGECONFIG or a DISTRO_FEATURES help here ? SDL for qemu is
probably a bad example, but keeping everything that we think is important
for
out of box experience, or proper operation, contained within a layer is a
good
thing .. but leaving it conditional on a distro setting for those that
really don't
want it, seems to strike the right balance.

Cheers,

Bruce


>
> Br,
> David
>
> ______________________________**_________________
> meta-virtualization mailing list
> meta-virtualization@**yoctoproject.org<meta-virtualization@yoctoproject.o=
rg>
> https://lists.yoctoproject.**org/listinfo/meta-**virtualization<https://l=
ists.yoctoproject.org/listinfo/meta-virtualization>
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e0cb4efe2b2ab8e67904d46dbc33
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Jan 29, 2013 at 8:38 AM, David Nystr=F6m <span dir=3D"ltr">=
&lt;<a href=3D"mailto:david.c.nystrom@gmail.com" target=3D"_blank">david.c.=
nystrom@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 01/29/2013 02:01 PM, Mi=
hai Prica wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Signed-off-by: Mihai Prica &lt;<a href=3D"mailto:mihai.prica@intel.com" tar=
get=3D"_blank">mihai.prica@intel.com</a>&gt;<br>
---<br>
=A0 recipes-devtools/qemu/qemu_1.<u></u>3.0.bbappend | =A0 =A03 +++<br>
=A0 1 file changed, 3 insertions(+)<br>
=A0 create mode 100644 recipes-devtools/qemu/qemu_1.<u></u>3.0.bbappend<br>
<br>
diff --git a/recipes-devtools/qemu/qemu_<u></u>1.3.0.bbappend b/recipes-dev=
tools/qemu/qemu_<u></u>1.3.0.bbappend<br>
new file mode 100644<br>
index 0000000..2106825<br>
--- /dev/null<br>
+++ b/recipes-devtools/qemu/qemu_<u></u>1.3.0.bbappend<br>
@@ -0,0 +1,3 @@<br>
+# Enables QEMU to display the VGA output<br>
+DEPENDS_append =3D &quot; libsdl&quot;<br>
+SDL =3D &quot;--enable-sdl&quot;<br>
<br>
</blockquote>
<br></div>
Should this really be in meta-virt, this seems a bit distro specific ?<br><=
/blockquote><div><br></div><div style>Can PACKAGECONFIG or a DISTRO_FEATURE=
S help here ? SDL for qemu is=A0</div><div style>probably a bad example, bu=
t keeping everything that we think is important for</div>
<div style>out of box experience, or proper operation, contained within a l=
ayer is a good</div><div style>thing .. but leaving it conditional on a dis=
tro setting for those that really don&#39;t</div><div style>want it, seems =
to strike the right balance.</div>
<div style><br></div><div style>Cheers,</div><div style><br></div><div styl=
e>Bruce</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Br,<br>
David<div class=3D"HOEnZb"><div class=3D"h5"><br>
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

--e0cb4efe2b2ab8e67904d46dbc33--
