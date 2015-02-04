Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AC257E0086E; Tue,  3 Feb 2015 21:25:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04197E00828
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Feb 2015 21:25:24 -0800 (PST)
Received: by mail-la0-f48.google.com with SMTP id pv20so56043439lab.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Feb 2015 21:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=n+v+bdcWGOPs1Hmfw0+qSVAp0TBFJrSqHSl0uocuq4Q=;
	b=eNjR8bnBYN3HhYj0CzZ2bBb87G1AC/iyRXorL1pfVTMa5MwhqGR+TrGesgPUe89KXn
	ZaO3sN6KhkVicmtcTcuLKxL1Eq9RtkkrHOuyaXhJ65vFQHLVEomaCy6+dWgKnnsg9ziS
	hu1LAZKkRRF2dvpS17sxWIZxQFLJfCM+B2d3QIhSnZFsdXFEA296wDsglIZ+L2d5jafj
	i7V7gk9sTDVPFObKGNKDTdkJtLZxraR46yzFUSEGCvu6CdNvTkQ7ycwne38eJq85rjDL
	S6robUxVeTJxfaOl87cFQuVTeMsSRT/ku6gJo70iEdMw1kwgd7ElC5SYR7gQH4IzvaTI
	JXKA==
MIME-Version: 1.0
X-Received: by 10.152.5.72 with SMTP id q8mr10896588laq.57.1423027522084; Tue,
	03 Feb 2015 21:25:22 -0800 (PST)
Received: by 10.114.182.115 with HTTP; Tue, 3 Feb 2015 21:25:22 -0800 (PST)
In-Reply-To: <CABZSBQcyJT093UnpZ4QDA4OQVNQFY8P+suWVTP2=ap4iysbiOQ@mail.gmail.com>
References: <fa0c0be68aa042b6bede0c2f644a2c42@BN1BFFO11FD008.protection.gbl>
	<CABZSBQfHtwWRJ62pW3XnAQRBX6HW06d3fqUDG8=zqNv5f+R5-w@mail.gmail.com>
	<CABZSBQc4u6OArq-jaz=WJCQ06RVmv3q3Z=Mw016LDvkz=FfPxA@mail.gmail.com>
	<CABZSBQcyJT093UnpZ4QDA4OQVNQFY8P+suWVTP2=ap4iysbiOQ@mail.gmail.com>
Date: Wed, 4 Feb 2015 00:25:22 -0500
Message-ID: <CABZSBQcVSi=C+_P+YLte93F6UfzB5k_=93QDxN434iw61NtoVA@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Nathan Rossi <nathan.rossi@xilinx.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [RFC 0/8] Update to Xen 4.5.0 and add AArch64 support
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
X-List-Received-Date: Wed, 04 Feb 2015 05:25:29 -0000
Content-Type: multipart/alternative; boundary=089e01419c42f5a604050e3c69f0

--089e01419c42f5a604050e3c69f0
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 4, 2015 at 12:21 AM, Chris Patterson <cjp256@gmail.com> wrote:

>
>
> On Mon, Feb 2, 2015 at 2:15 AM, Chris Patterson <cjp256@gmail.com> wrote:
>
>>
>>
>> On Thu, Jan 29, 2015 at 11:44 PM, Chris Patterson <cjp256@gmail.com>
>> wrote:
>>
>>> Nice! :)  I'll try to take this for a test drive this weekend and
>>> provide some feedback.
>>>
>>> On Thu, Jan 29, 2015 at 10:31 PM, Nathan Rossi <nathan.rossi@xilinx.com>
>>> wrote:
>>>
>>>> This patch series updates the Xen recipes to use version 4.5.0 as well
>>>> as
>>>> refactoring and adding support for AArch64.
>>>>
>>>> The first 6 patches of this series are relatively trivial changes:
>>>> adding
>>>> additional files to packages, updating dependencies and adding support
>>>> for
>>>> additional architectures ontop of x86-64. The most important change is
>>>> the
>>>> moving of some x86 of the packages from xen-base RDEPENDS to
>>>> RRECOMMENDS.
>>>>
>>>> Patches 7 and 8 are the reason for this set being a RFC instead of just
>>>> a patch
>>>> set, I am after feedback regarding the changes I have made for these
>>>> patches.
>>>> In these two patches I disabled the building of xen-qemu and seabios
>>>> from
>>>> within the xen build system. There are a number of issues in wrapping
>>>> the xen
>>>> build system within OE (including source fetching and cross building).
>>>>
>>>>
>> +1 with this approach. I'm sure that the qemu rev included with the xen
>> release is better tested and has some appropriate patches for xen users.
>> However, the oe-core qemu recipe is in much better shape.  Someone could
>> break it out into its own recipe, if so desired.
>>
>>
>>> Instead of building qemu from within xen, I have configured the qemu
>>>> which is
>>>> part of oe-core to build with xen support (PACKAGECONFIG_append =
>>>> "xen"). Since
>>>> xen support is available in mainline qemu this allows for easier
>>>> support of the
>>>> xen device emulation via qemu. The PACKAGECONFIG option in oe-core does
>>>> need to
>>>> be updated to point to the correct depends (which is seperate to this
>>>> patch
>>>> set).
>>>>
>>>>
>> Agreed, maybe document in README? In my local.conf, I added:
>> PACKAGECONFIG_append_pn-qemu = " xen "
>>
>>
>>> SeaBIOS is disabled due to fetching issues as well as only being
>>>> supported on
>>>> x86. I have not worked out the issues around this yet. I am querying as
>>>> to
>>>> whether supporting it is desired, if so should it be via the xen build
>>>> system
>>>> or as a seperate recipe?
>>>>
>>>>
>> +1 to breaking it out as a separate recipe, but it is important for us
>> x86 hvm users :)  If you'd like, I could attempt to port the recipe we use
>> on openxt to meta-virtualization.
>>
>>
>
> Actually, it seems to go beyond just the rom bin(s) with hvmloader.  What
> about making it arch dependent feature?
>
>

My mailing list foo is weak this week.  Please ignore the above comment, I
forgot that was in the old draft. :)


> Thanks,
>>>>
>>>> Nathan
>>>>
>>>> Nathan Rossi (8):
>>>>   xen: Fix and refactor common include
>>>>   xen: Add Build and Target architecture mapping
>>>>   xen: Move x86/arch specific components into RRECOMMENDS
>>>>   xen: Fix up architecture specific steps
>>>>   xen: Add aarch64 as compatible host
>>>>   xen-*image-minimal: Setup conditional based on MACHINE_FEATURES
>>>>   xen: Update recipe to 4.5.0
>>>>   xen-image-minimal: Install qemu instead of xen-qemu
>>>>
>>>>  recipes-extended/images/xen-guest-image-minimal.bb |   2 +-
>>>>  recipes-extended/images/xen-image-minimal.bb       |   6 +-
>>>>  ...lask-avoid-installing-policy-file-as-boot.patch |  26 -----
>>>>  recipes-extended/xen/xen-arch.inc                  |  18 ++++
>>>>  recipes-extended/xen/xen.inc                       | 113
>>>> +++++++++++++++++----
>>>>  recipes-extended/xen/xen_4.3.1.bb                  |  24 -----
>>>>  recipes-extended/xen/xen_4.5.0.bb                  |  36 +++++++
>>>>  7 files changed, 150 insertions(+), 75 deletions(-)
>>>>  delete mode 100644
>>>> recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
>>>>  create mode 100644 recipes-extended/xen/xen-arch.inc
>>>>  delete mode 100644 recipes-extended/xen/xen_4.3.1.bb
>>>>  create mode 100644 recipes-extended/xen/xen_4.5.0.bb
>>>>
>>>> --
>>>> 2.1.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> meta-virtualization mailing list
>>>> meta-virtualization@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>>
>>>
>>>
>> I did some really basic testing of xen-image-minimal. I built against
>> master on a x86-64 host for an intel x86-64 target.
>>
>> For my build, I had to set TUNE_CCARGS="" for xen as the -mno-sse flag
>> required in xen/arch/x86/Rules.mk was conflicting with the standard tune
>> args.  I'm not sure the most appropriate way to do this, but that's how I
>> worked around it.  Any ideas on a better way to handle this?
>>
>> Without addressing seabios, I couldn't do much to validate running
>> guests, but otherwise it seem to run fine. We'll have to figure out
>> something here.
>>
>> Nice work!
>>
>> Cheers,
>> -Chris
>>
>>
> Hey Nathan.  I made some progress on splitting out the firmware-related
> packages on top of your patches.  I added a xen-hvmloader recipe that would
> somehow need to be included in the image, but only for x86. I still have
> some work to do, but my latest build seems to be usable for basic x86 hvm.
>
> Work in progress @
> https://github.com/cjp256/meta-virtualization/tree/master
>
>

--089e01419c42f5a604050e3c69f0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Feb 4, 2015 at 12:21 AM, Chris Patterson <span dir=3D"ltr">&lt;=
<a href=3D"mailto:cjp256@gmail.com" target=3D"_blank">cjp256@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
<div><div class=3D"h5">On Mon, Feb 2, 2015 at 2:15 AM, Chris Patterson <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:cjp256@gmail.com" target=3D"_blank">cjp=
256@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote"><span>On Thu, Jan 29, 2015 at 11:44 PM, Chris Patterson <=
span dir=3D"ltr">&lt;<a href=3D"mailto:cjp256@gmail.com" target=3D"_blank">=
cjp256@gmail.com</a>&gt;</span> wrote:<br></span><span><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr">Nice! :) =C2=A0I&#39;ll try =
to take this for a test drive this weekend and provide some feedback.</div>=
<div><div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu,=
 Jan 29, 2015 at 10:31 PM, Nathan Rossi <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:nathan.rossi@xilinx.com" target=3D"_blank">nathan.rossi@xilinx.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thi=
s patch series updates the Xen recipes to use version 4.5.0 as well as<br>
refactoring and adding support for AArch64.<br>
<br>
The first 6 patches of this series are relatively trivial changes: adding<b=
r>
additional files to packages, updating dependencies and adding support for<=
br>
additional architectures ontop of x86-64. The most important change is the<=
br>
moving of some x86 of the packages from xen-base RDEPENDS to RRECOMMENDS.<b=
r>
<br>
Patches 7 and 8 are the reason for this set being a RFC instead of just a p=
atch<br>
set, I am after feedback regarding the changes I have made for these patche=
s.<br>
In these two patches I disabled the building of xen-qemu and seabios from<b=
r>
within the xen build system. There are a number of issues in wrapping the x=
en<br>
build system within OE (including source fetching and cross building).<br>
<br></blockquote></div></div></div></div></blockquote><div>=C2=A0</div></sp=
an><span><div>+1 with this approach. I&#39;m sure that the qemu rev include=
d with the xen=20
release is better tested and has some appropriate patches for xen=20
users.=C2=A0 However, the oe-core qemu recipe is in much better shape.=C2=
=A0=20
Someone could break it out into its own recipe, if so desired.<br>=C2=A0<br=
></div></span><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div><=
div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
Instead of building qemu from within xen, I have configured the qemu which =
is<span><br>
part of oe-core to build with xen support (PACKAGECONFIG_append =3D &quot;x=
en&quot;). Since<br>
xen support is available in mainline qemu this allows for easier support of=
 the<br>
xen device emulation via qemu. The PACKAGECONFIG option in oe-core does nee=
d to<br>
be updated to point to the correct depends (which is seperate to this patch=
<br>
set).<br>
<br></span></blockquote></div></div></div></div></blockquote><div>=C2=A0</d=
iv><span><div>Agreed, maybe document in README? In my local.conf, I added:<=
br>PACKAGECONFIG_append_pn-qemu =3D &quot; xen &quot;<br>=C2=A0<br></div></=
span><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
SeaBIOS is disabled due to fetching issues as well as only being supported =
on<span><br>
x86. I have not worked out the issues around this yet. I am querying as to<=
br>
whether supporting it is desired, if so should it be via the xen build syst=
em<br>
or as a seperate recipe?<br>
<br></span></blockquote></div></div></div></div></blockquote><span><div><sp=
an><br></span>+1 to breaking it out as a separate recipe,=20
but it is important for us x86 hvm users :)=C2=A0 If you&#39;d like, I coul=
d=20
attempt to port the recipe we use on openxt to meta-virtualization.<br>=C2=
=A0<br></div></span></div></div></div></blockquote><div><br></div></div></d=
iv><div>Actually, it seems to go beyond just the rom bin(s) with hvmloader.=
=C2=A0 What about making it arch dependent feature?<br></div><div><div clas=
s=3D"h5"><div>=C2=A0</div></div></div></div></div></div></blockquote><div><=
br>My mailing list foo is weak this week.=C2=A0 Please ignore the above com=
ment, I forgot that was in the old draft. :)<br>=C2=A0<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail=
_extra"><div class=3D"gmail_quote"><div><div class=3D"h5"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra=
"><div class=3D"gmail_quote"><span><div></div></span><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div><div><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks,<div><div><br>
Nathan<br>
<br>
Nathan Rossi (8):<br>
=C2=A0 xen: Fix and refactor common include<br>
=C2=A0 xen: Add Build and Target architecture mapping<br>
=C2=A0 xen: Move x86/arch specific components into RRECOMMENDS<br>
=C2=A0 xen: Fix up architecture specific steps<br>
=C2=A0 xen: Add aarch64 as compatible host<br>
=C2=A0 xen-*image-minimal: Setup conditional based on MACHINE_FEATURES<br>
=C2=A0 xen: Update recipe to 4.5.0<br>
=C2=A0 xen-image-minimal: Install qemu instead of xen-qemu<br>
<br>
=C2=A0recipes-extended/images/<a href=3D"http://xen-guest-image-minimal.bb"=
 target=3D"_blank">xen-guest-image-minimal.bb</a> |=C2=A0 =C2=A02 +-<br>
=C2=A0recipes-extended/images/<a href=3D"http://xen-image-minimal.bb" targe=
t=3D"_blank">xen-image-minimal.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A06 +-<br>
=C2=A0...lask-avoid-installing-policy-file-as-boot.patch |=C2=A0 26 -----<b=
r>
=C2=A0recipes-extended/xen/xen-arch.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 18 ++++<br>
=C2=A0recipes-extended/xen/xen.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 113 +++++++++++++++++----<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_4.3.1.bb" target=3D"_blank=
">xen_4.3.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 24 -----<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_4.5.0.bb" target=3D"_blank=
">xen_4.5.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 36 +++++++<br>
=C2=A07 files changed, 150 insertions(+), 75 deletions(-)<br>
=C2=A0delete mode 100644 recipes-extended/xen/files/flask-avoid-installing-=
policy-file-as-boot.patch<br>
=C2=A0create mode 100644 recipes-extended/xen/xen-arch.inc<br>
=C2=A0delete mode 100644 recipes-extended/xen/<a href=3D"http://xen_4.3.1.b=
b" target=3D"_blank">xen_4.3.1.bb</a><br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://xen_4.5.0.b=
b" target=3D"_blank">xen_4.5.0.bb</a><br>
<span><font color=3D"#888888"><br>
--<br>
2.1.1<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</font></span></div></div></blockquote></div><br></div></div></div></blockq=
uote><span><div><br><div>I did some really basic testing of xen-image-minim=
al. I built against master on a x86-64 host for an intel x86-64 target.=C2=
=A0 <br><br><div>For
 my build, I had to set TUNE_CCARGS=3D&quot;&quot; for xen as the -mno-sse =
flag=20
required in xen/arch/x86/Rules.mk was conflicting with the standard tune
 args.=C2=A0 I&#39;m not sure the most appropriate way to do this, but that=
&#39;s how
 I worked around it.=C2=A0 Any ideas on a better way to handle this?<br><br=
>Without
 addressing seabios, I couldn&#39;t do much to validate running guests, but=
=20
otherwise it seem to run fine. We&#39;ll have to figure out something here.=
<br></div></div><br>Nice work!<br><br>Cheers,<br>-Chris <br></div></span></=
div><br></div></div>
</blockquote></div></div></div><br>Hey Nathan.=C2=A0 I made some progress o=
n splitting out the firmware-related packages on top of your patches.=C2=A0=
 I added a xen-hvmloader recipe that would somehow need to be included in t=
he image, but only for x86. I still have some work to do, but my latest bui=
ld seems to be usable for basic x86 hvm. <br><br>Work in progress @ <a href=
=3D"https://github.com/cjp256/meta-virtualization/tree/master" target=3D"_b=
lank">https://github.com/cjp256/meta-virtualization/tree/master</a><br><br>=
</div></div>
</blockquote></div><br></div></div>

--089e01419c42f5a604050e3c69f0--
