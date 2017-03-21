Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 538F8E00992; Tue, 21 Mar 2017 07:48:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.176 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E17C2E0093F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Mar 2017 07:48:21 -0700 (PDT)
Received: by mail-qt0-f176.google.com with SMTP id i34so132742907qtc.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Mar 2017 07:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+RwDFXfs5gQEgc5jAyyYRlhsdzao8yfUOoJtzAwmocw=;
	b=CRfgJKrz9eR8vi+x9Ka90TkGofSqLhuIRs379tNldloJ0QLGjr1Ab7DQ6HruB2krHl
	juPnK2kpCQF/DGKez5VD0Z+j5NlmZoRIGAV4WErd3eJ4P7hwfC7Zf0vK5Rbx9ym93LjM
	0n0dAT/yudqmdY4bZaC7ie3FOSsaQDvi+mPW4rpaUfLt062Ml1vDknqla9ZGzuzwf6WH
	RohM4kBUEOor6zAOaelBIiLAJ6dZFYgHb37dN0qI8K/LskJMI6zHwetuelx6IbL9S6Go
	QTZR9SmjRifhvLi4+ok9jth/2e1sfWy6XFHYhhbxsU2pVR8/+Y0CjoUZV++cdNFVTk9C
	J3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+RwDFXfs5gQEgc5jAyyYRlhsdzao8yfUOoJtzAwmocw=;
	b=GggPhJXg9uMLoirTR2nYMZ645dz6H1icK+Z06c2qpT1EUICCcvoAAcdjUL//VrDugJ
	jwwHYMWP6P4ujGZsc3LOSv6AfllYKR+f6uotxaerbzy2SRaF+V5orubngrXfrNTEhSrJ
	DasYz07SFiW2PLPGqaktI7MJoeOEEZDjnhr6Ua/2+rcF0/r+f8ugJFejV/BaaSmj+i/U
	iBF2yzEX8fxtmFCUzAfOEmbYZwtpREjFwAvDiV0cq4fmHXFSVjnuZykd5zsHIRKsq6VO
	VyvnLkGFwr4tbUk5kWNF9nxEl7/3pV9Y1fkKax7GC42OOevjsmtgaVvzZ913kZkhceJl
	KEJA==
X-Gm-Message-State: AFeK/H3CzRHLfkvRUy9ePfVpWC2MRkvct2p06hT5+rmy8TijI96RY9qFZZEzWoFTF1rfNfIXewrd4RAsbWu2WA==
X-Received: by 10.237.44.198 with SMTP id g64mr36250195qtd.87.1490107700719;
	Tue, 21 Mar 2017 07:48:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Tue, 21 Mar 2017 07:48:20 -0700 (PDT)
In-Reply-To: <CADkTA4O_VmjbpR2191=r9MQxB+OQtJ7DMPOvJ-fWiuzqZBMOUA@mail.gmail.com>
References: <20170321035947.13930-1-raj.khem@gmail.com>
	<20170321035947.13930-4-raj.khem@gmail.com>
	<CADkTA4OwEoC4CMZPtFtBrsbCUq_YSKO+fcLf5gn4OjdUn0Rgmw@mail.gmail.com>
	<CAMKF1sp4eCOMzpxRq4K6o+SQ2wkT+VJF9xo0nnAe-x-O_04n8Q@mail.gmail.com>
	<CADkTA4O_VmjbpR2191=r9MQxB+OQtJ7DMPOvJ-fWiuzqZBMOUA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Mar 2017 10:48:20 -0400
Message-ID: <CADkTA4PA8QMrsFYtt=GWpeQRWzy_yQLSc5htFB5+khX3Qf763Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [[PATCH 4/6] protobuf-native: Enable shared libs
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
X-List-Received-Date: Tue, 21 Mar 2017 14:48:23 -0000
Content-Type: multipart/alternative; boundary=94eb2c1249f62dd4bf054b3ebc7f

--94eb2c1249f62dd4bf054b3ebc7f
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 21, 2017 at 10:14 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Tue, Mar 21, 2017 at 9:55 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>>
>> On Tue, Mar 21, 2017 at 5:17 AM Bruce Ashfield <bruce.ashfield@gmail.com>
>> wrote:
>>
>>> On Mon, Mar 20, 2017 at 11:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  recipes-devtools/protobuf/protobuf-native_3.1.0.bb | 4 +---
>>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
>>> b/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
>>> index 47fb401..c32f627 100644
>>> --- a/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
>>> +++ b/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
>>> @@ -8,14 +8,12 @@ LICENSE = "BSD-3-Clause"
>>>
>>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752e
>>> fc9299b184f91bef540095"
>>>
>>> -PR = "r0"
>>>
>>>
>>> This is mixing changes. Either put it in the commit log, or split the
>>> change. Either
>>> way works for me.
>>>
>>
>> This is virtually a nop
>>
>
> I'm aware, but that's not the point.
>
> Proper commit log standards are don't mix changes. It's trivial to add it
> in the log or split the change.
>
>
>>
>>> We also have no justification as to why we actually want shared libs ?
>>> I'd like
>>> to understand why, since someone will eventually ask me :D
>>>
>>
>> Protobuf-c needs the shared libraries to build
>>
>
> So that belongs in the log, along with the error message. Otherwise, we
> are just creating
> an unmaintainable jumble of crap.
>

.. and if you just send me the details, I can always add it and do the
split myself. I've just
never seen this in my builds, so I don't have it to add.

Bruce


>
> Bruce
>
>
>>
>>> Bruce
>>>
>>>
>>> -
>>>  SRC_URI[md5sum] = "14a532a7538551d5def317bfca41dace"
>>>  SRC_URI[sha256sum] = "0a0ae63cbffc274efb573bdde9a25
>>> 3e3f32e458c41261df51c5dbc5ad541e8f7"
>>>  SRC_URI = "https://github.com/google/protobuf/archive/v3.1.0.tar.gz;
>>> downloadfilename=protobuf-3.1.0.tar.gz \
>>>         "
>>>
>>> -EXTRA_OECONF += " --with-protoc=echo --disable-shared"
>>> +EXTRA_OECONF += " --with-protoc=echo"
>>>
>>>  inherit native autotools
>>>
>>> --
>>> 2.12.0
>>>
>>>
>>>
>>>
>>> --
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end"
>>>
>>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c1249f62dd4bf054b3ebc7f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Mar 21, 2017 at 10:14 AM, Bruce Ashfield <span dir=3D"ltr">&lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfiel=
d@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><sp=
an class=3D"">On Tue, Mar 21, 2017 at 9:55 AM, Khem Raj <span dir=3D"ltr">&=
lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div><br></=
div></div><div><br><div class=3D"gmail_quote"><span><div>On Tue, Mar 21, 20=
17 at 5:17 AM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com=
" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div class=3D"m_-8198184957307271808m_-70787226850=
98439997gmail_msg"><div class=3D"gmail_extra m_-8198184957307271808m_-70787=
22685098439997gmail_msg"><div class=3D"gmail_quote m_-8198184957307271808m_=
-7078722685098439997gmail_msg">On Mon, Mar 20, 2017 at 11:59 PM, Khem Raj <=
span class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg">&lt;<a=
 href=3D"mailto:raj.khem@gmail.com" class=3D"m_-8198184957307271808m_-70787=
22685098439997gmail_msg" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span=
> wrote:<br class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg"=
><blockquote class=3D"gmail_quote m_-8198184957307271808m_-7078722685098439=
997gmail_msg" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br class=3D"m_-8198184957307271808m_-70=
78722685098439997gmail_msg">
---<br class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg">
=C2=A0recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0.bb"=
 rel=3D"noreferrer" class=3D"m_-8198184957307271808m_-7078722685098439997gm=
ail_msg" target=3D"_blank">pro<wbr>tobuf-native_3.1.0.bb</a> | 4 +---<br cl=
ass=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg">
=C2=A01 file changed, 1 insertion(+), 3 deletions(-)<br class=3D"m_-8198184=
957307271808m_-7078722685098439997gmail_msg">
<br class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg">
diff --git a/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.=
1.0.bb" rel=3D"noreferrer" class=3D"m_-8198184957307271808m_-70787226850984=
39997gmail_msg" target=3D"_blank">pr<wbr>otobuf-native_3.1.0.bb</a> b/recip=
es-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0.bb" rel=3D"nor=
eferrer" class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg" ta=
rget=3D"_blank">pr<wbr>otobuf-native_3.1.0.bb</a><br class=3D"m_-8198184957=
307271808m_-7078722685098439997gmail_msg">
index 47fb401..c32f627 100644<br class=3D"m_-8198184957307271808m_-70787226=
85098439997gmail_msg">
--- a/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0.bb"=
 rel=3D"noreferrer" class=3D"m_-8198184957307271808m_-7078722685098439997gm=
ail_msg" target=3D"_blank">pr<wbr>otobuf-native_3.1.0.bb</a><br class=3D"m_=
-8198184957307271808m_-7078722685098439997gmail_msg">
+++ b/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0.bb"=
 rel=3D"noreferrer" class=3D"m_-8198184957307271808m_-7078722685098439997gm=
ail_msg" target=3D"_blank">pr<wbr>otobuf-native_3.1.0.bb</a><br class=3D"m_=
-8198184957307271808m_-7078722685098439997gmail_msg">
@@ -8,14 +8,12 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br class=3D"m_-81981=
84957307271808m_-7078722685098439997gmail_msg">
<br class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg">
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D35953c752e<wbr>fc9299=
b184f91bef540095&quot;<br class=3D"m_-8198184957307271808m_-707872268509843=
9997gmail_msg">
<br class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg">
-PR =3D &quot;r0&quot;<br class=3D"m_-8198184957307271808m_-707872268509843=
9997gmail_msg"></blockquote><div class=3D"m_-8198184957307271808m_-70787226=
85098439997gmail_msg"><br class=3D"m_-8198184957307271808m_-707872268509843=
9997gmail_msg"></div></div></div></div><div class=3D"m_-8198184957307271808=
m_-7078722685098439997gmail_msg"><div class=3D"gmail_extra m_-8198184957307=
271808m_-7078722685098439997gmail_msg"><div class=3D"gmail_quote m_-8198184=
957307271808m_-7078722685098439997gmail_msg"><div class=3D"m_-8198184957307=
271808m_-7078722685098439997gmail_msg">This is mixing changes. Either put i=
t in the commit log, or split the change. Either</div><div class=3D"m_-8198=
184957307271808m_-7078722685098439997gmail_msg">way works for me.</div></di=
v></div></div></blockquote><div><br></div></span><div>This is virtually a n=
op</div></div></div></blockquote><div><br></div></span><div>I&#39;m aware, =
but that&#39;s not the point.</div><div><br></div><div>Proper commit log st=
andards are don&#39;t mix changes. It&#39;s trivial to add it in the log or=
 split the change.</div><span class=3D""><div>=C2=A0<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div><div class=3D"gmail_quote"><span><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div class=3D"m_-8198184957307271808m_-7078722685098439997gma=
il_msg"><div class=3D"gmail_extra m_-8198184957307271808m_-7078722685098439=
997gmail_msg"><div class=3D"gmail_quote m_-8198184957307271808m_-7078722685=
098439997gmail_msg"><div class=3D"m_-8198184957307271808m_-7078722685098439=
997gmail_msg"></div><div class=3D"m_-8198184957307271808m_-7078722685098439=
997gmail_msg"><br class=3D"m_-8198184957307271808m_-7078722685098439997gmai=
l_msg"></div><div class=3D"m_-8198184957307271808m_-7078722685098439997gmai=
l_msg">We also have no justification as to why we actually want shared libs=
 ? I&#39;d like</div><div class=3D"m_-8198184957307271808m_-707872268509843=
9997gmail_msg">to understand why, since someone will eventually ask me :D</=
div></div></div></div></blockquote><div><br></div></span><div>Protobuf-c ne=
eds the shared libraries to build</div></div></div></blockquote><div><br></=
div></span><div>So that belongs in the log, along with the error message. O=
therwise, we are just creating</div><div>an unmaintainable jumble of crap.<=
/div></div></div></div></blockquote><div><br></div><div>.. and if you just =
send me the details, I can always add it and do the split myself. I&#39;ve =
just</div><div>never seen this in my builds, so I don&#39;t have it to add.=
</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><span class=3D"HOEnZb"><font color=3D"#888888"><div><br></div><div>Br=
uce</div></font></span><span class=3D""><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div><div class=3D"gmail_quote"><span><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg=
"><div class=3D"gmail_extra m_-8198184957307271808m_-7078722685098439997gma=
il_msg"><div class=3D"gmail_quote m_-8198184957307271808m_-7078722685098439=
997gmail_msg"><div class=3D"m_-8198184957307271808m_-7078722685098439997gma=
il_msg"></div><div class=3D"m_-8198184957307271808m_-7078722685098439997gma=
il_msg"><br class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg"=
></div><div class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg"=
>Bruce</div></div></div></div><div class=3D"m_-8198184957307271808m_-707872=
2685098439997gmail_msg"><div class=3D"gmail_extra m_-8198184957307271808m_-=
7078722685098439997gmail_msg"><div class=3D"gmail_quote m_-8198184957307271=
808m_-7078722685098439997gmail_msg"><div class=3D"m_-8198184957307271808m_-=
7078722685098439997gmail_msg">=C2=A0</div><blockquote class=3D"gmail_quote =
m_-8198184957307271808m_-7078722685098439997gmail_msg" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
-<br class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg">
=C2=A0SRC_URI[md5sum] =3D &quot;14a532a7538551d5def317bfca41d<wbr>ace&quot;=
<br class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg">
=C2=A0SRC_URI[sha256sum] =3D &quot;0a0ae63cbffc274efb573bdde9a25<wbr>3e3f32=
e458c41261df51c5dbc5ad54<wbr>1e8f7&quot;<br class=3D"m_-8198184957307271808=
m_-7078722685098439997gmail_msg">
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archi=
ve/v3.1.0.tar.gz;downloadfilename=3Dprotobuf-3.1.0.tar.gz" rel=3D"noreferre=
r" class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg" target=
=3D"_blank">https://github.com/google/pro<wbr>tobuf/archive/v3.1.0.tar.gz;<=
wbr>downloadfilename=3Dprotobuf-3.1.<wbr>0.tar.gz</a> \<br class=3D"m_-8198=
184957307271808m_-7078722685098439997gmail_msg">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br class=3D"m_-8198184957307271808m_-707=
8722685098439997gmail_msg">
<br class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg">
-EXTRA_OECONF +=3D &quot; --with-protoc=3Decho --disable-shared&quot;<br cl=
ass=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg">
+EXTRA_OECONF +=3D &quot; --with-protoc=3Decho&quot;<br class=3D"m_-8198184=
957307271808m_-7078722685098439997gmail_msg">
<br class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg">
=C2=A0inherit native autotools<br class=3D"m_-8198184957307271808m_-7078722=
685098439997gmail_msg">
<span class=3D"m_-8198184957307271808m_-7078722685098439997m_70589111337892=
92871HOEnZb m_-8198184957307271808m_-7078722685098439997gmail_msg"><font co=
lor=3D"#888888" class=3D"m_-8198184957307271808m_-7078722685098439997gmail_=
msg"><br class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg">
--<br class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg">
2.12.0<br class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg">
<br class=3D"m_-8198184957307271808m_-7078722685098439997gmail_msg">
</font></span></blockquote></div></div></div><div class=3D"m_-8198184957307=
271808m_-7078722685098439997gmail_msg"><div class=3D"gmail_extra m_-8198184=
957307271808m_-7078722685098439997gmail_msg"><br class=3D"m_-81981849573072=
71808m_-7078722685098439997gmail_msg"><br clear=3D"all" class=3D"m_-8198184=
957307271808m_-7078722685098439997gmail_msg"><div class=3D"m_-8198184957307=
271808m_-7078722685098439997gmail_msg"><br class=3D"m_-8198184957307271808m=
_-7078722685098439997gmail_msg"></div>-- <br class=3D"m_-819818495730727180=
8m_-7078722685098439997gmail_msg"><div class=3D"m_-8198184957307271808m_-70=
78722685098439997m_7058911133789292871gmail_signature m_-819818495730727180=
8m_-7078722685098439997gmail_msg" data-smartmail=3D"gmail_signature">&quot;=
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end&quot;</div>
</div></div></blockquote></span></div></div>
</blockquote></span></div><span class=3D""><br><br clear=3D"all"><div><br><=
/div>-- <br><div class=3D"m_-8198184957307271808gmail_signature" data-smart=
mail=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for =
chaos and madness await thee at its end&quot;</div>
</span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c1249f62dd4bf054b3ebc7f--
