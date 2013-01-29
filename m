Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9FD8AE002AB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 06:13:31 -0800 (PST)
Received: by mail-lb0-f181.google.com with SMTP id gm6so763943lbb.26
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 06:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=XCjgXEK88gXce5udAQErWwFfxmcjSu7KT0Jjm3eP+5w=;
	b=q7/Sk99N/LQ9MUDi9D9PVpyOjTVM2RhcQvRV3C1vhl85cFeFIM4A6VA2skgWzhLV25
	S9NOKCkcbwT0PPzwXx28nTct5K4/6JYy2nKd+90LSpdgWuUNHhposJzVraaEc0azMn1F
	bL/utrQfifmKWDja0GTc62Zfujg1lqn82oexHa8sYaL5gMEVpixFpFVGC2rFvAVPFe+v
	SC3N7wwXPbogF4qW/S1iqSreyoszDDQmTc8Jo6FRLkBIzVwcxAte/U1KXQyXIBn9kM6W
	Go6D9/26jAmRQEK92nRQ/RHcxHL4u78a7cIg3H0SfxRYWcGdfpOYSnIKwnWKF8GRrpV3
	hj7g==
MIME-Version: 1.0
X-Received: by 10.152.104.36 with SMTP id gb4mr1325602lab.13.1359468810395;
	Tue, 29 Jan 2013 06:13:30 -0800 (PST)
Received: by 10.112.40.169 with HTTP; Tue, 29 Jan 2013 06:13:30 -0800 (PST)
In-Reply-To: <5107D8A6.6090900@gmail.com>
References: <1359464500-16993-1-git-send-email-mihai.prica@intel.com>
	<1359464500-16993-2-git-send-email-mihai.prica@intel.com>
	<5107D0DF.6040006@gmail.com>
	<CADkTA4OsbnmQCZ+2wkPjY6hoq-ZHE4PSt1ozYgsb=9Ur0Fcfqg@mail.gmail.com>
	<5107D8A6.6090900@gmail.com>
Date: Tue, 29 Jan 2013 09:13:30 -0500
Message-ID: <CADkTA4OG=cpis4aFTCKUsA-sUxUmTnp33COd+Bu4aEqHNk+mYg@mail.gmail.com>
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
X-List-Received-Date: Tue, 29 Jan 2013 14:13:32 -0000
Content-Type: multipart/alternative; boundary=f46d04083d1586def104d46dff0f

--f46d04083d1586def104d46dff0f
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2013 at 9:11 AM, David Nystr=F6m <david.c.nystrom@gmail.com=
>wrote:

> On Tue 29 Jan 2013 02:54:49 PM CET, Bruce Ashfield wrote:
>
>> On Tue, Jan 29, 2013 at 8:38 AM, David Nystr=F6m <david.c.nystrom@gmail.=
com
>> >**wrote:
>>
>>  On 01/29/2013 02:01 PM, Mihai Prica wrote:
>>>
>>>  Signed-off-by: Mihai Prica <mihai.prica@intel.com>
>>>> ---
>>>>    recipes-devtools/qemu/qemu_1.****3.0.bbappend |    3 +++
>>>>
>>>>    1 file changed, 3 insertions(+)
>>>>    create mode 100644 recipes-devtools/qemu/qemu_1.****3.0.bbappend
>>>>
>>>> diff --git a/recipes-devtools/qemu/qemu_****1.3.0.bbappend
>>>> b/recipes-devtools/qemu/qemu_****1.3.0.bbappend
>>>>
>>>> new file mode 100644
>>>> index 0000000..2106825
>>>> --- /dev/null
>>>> +++ b/recipes-devtools/qemu/qemu_****1.3.0.bbappend
>>>>
>>>> @@ -0,0 +1,3 @@
>>>> +# Enables QEMU to display the VGA output
>>>> +DEPENDS_append =3D " libsdl"
>>>> +SDL =3D "--enable-sdl"
>>>>
>>>>
>>>>  Should this really be in meta-virt, this seems a bit distro specific =
?
>>>
>>>
>> Can PACKAGECONFIG or a DISTRO_FEATURES help here ? SDL for qemu is
>> probably a bad example, but keeping everything that we think is importan=
t
>> for
>> out of box experience, or proper operation, contained within a layer is =
a
>> good
>> thing .. but leaving it conditional on a distro setting for those that
>> really don't
>> want it, seems to strike the right balance.
>>
>> Cheers,
>>
>> Bruce
>>
>
> Agree, but even in this case, this is something for oe-core to facilitate
> in the qemu recipe.
> Don't get me wrong, I'm not militant about anything, but I would rather
> like to avoid bbappends when possible,
> if oe-core won't accept a PACKAGECONFIG enabling sdl, then lets the merge
> it here.
>

Agreed, one less bbappend is a good thing, and we have a good fallback
position.

Bruce


>
> Br,
> David
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d04083d1586def104d46dff0f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Jan 29, 2013 at 9:11 AM, David Nystr=F6m <span dir=3D"ltr">=
&lt;<a href=3D"mailto:david.c.nystrom@gmail.com" target=3D"_blank">david.c.=
nystrom@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Tue 29 Jan 2013 02:54:4=
9 PM CET, Bruce Ashfield wrote:<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"im">
On Tue, Jan 29, 2013 at 8:38 AM, David Nystr=F6m &lt;<a href=3D"mailto:davi=
d.c.nystrom@gmail.com" target=3D"_blank">david.c.nystrom@gmail.com</a>&gt;<=
u></u>wrote:<br>
<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"im">
On 01/29/2013 02:01 PM, Mihai Prica wrote:<br>
<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"im">
Signed-off-by: Mihai Prica &lt;<a href=3D"mailto:mihai.prica@intel.com" tar=
get=3D"_blank">mihai.prica@intel.com</a>&gt;<br>
---<br></div>
=A0 =A0recipes-devtools/qemu/qemu_1.*<u></u>*3.0.bbappend | =A0 =A03 +++<di=
v class=3D"im"><br>
=A0 =A01 file changed, 3 insertions(+)<br></div>
=A0 =A0create mode 100644 recipes-devtools/qemu/qemu_1.*<u></u>*3.0.bbappen=
d<br>
<br>
diff --git a/recipes-devtools/qemu/qemu_*<u></u>*1.3.0.bbappend<br>
b/recipes-devtools/qemu/qemu_*<u></u>*1.3.0.bbappend<div class=3D"im"><br>
new file mode 100644<br>
index 0000000..2106825<br>
--- /dev/null<br></div>
+++ b/recipes-devtools/qemu/qemu_*<u></u>*1.3.0.bbappend<div class=3D"im"><=
br>
@@ -0,0 +1,3 @@<br>
+# Enables QEMU to display the VGA output<br>
+DEPENDS_append =3D &quot; libsdl&quot;<br>
+SDL =3D &quot;--enable-sdl&quot;<br>
<br>
<br>
</div></blockquote><div class=3D"im">
Should this really be in meta-virt, this seems a bit distro specific ?<br>
<br>
</div></blockquote><div class=3D"im">
<br>
Can PACKAGECONFIG or a DISTRO_FEATURES help here ? SDL for qemu is<br>
probably a bad example, but keeping everything that we think is important<b=
r>
for<br>
out of box experience, or proper operation, contained within a layer is a<b=
r>
good<br>
thing .. but leaving it conditional on a distro setting for those that<br>
really don&#39;t<br>
want it, seems to strike the right balance.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
</div></blockquote>
<br>
Agree, but even in this case, this is something for oe-core to facilitate i=
n the qemu recipe.<br>
Don&#39;t get me wrong, I&#39;m not militant about anything, but I would ra=
ther like to avoid bbappends when possible,<br>
if oe-core won&#39;t accept a PACKAGECONFIG enabling sdl, then lets the mer=
ge it here.<br></blockquote><div><br></div><div style>Agreed, one less bbap=
pend is a good thing, and we have a good fallback position.</div><div style=
>
<br></div><div style>Bruce</div><div>=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<br>
Br,<br>
David<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>&quot;Thou s=
halt not follow the NULL pointer, for chaos and madness await thee at its e=
nd&quot;
</div></div>

--f46d04083d1586def104d46dff0f--
