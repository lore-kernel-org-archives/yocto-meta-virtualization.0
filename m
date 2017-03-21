Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2831BE00961; Tue, 21 Mar 2017 07:14:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.181 listed in dnsbl.sorbs.net]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FF17E0093F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Mar 2017 07:14:13 -0700 (PDT)
Received: by mail-qt0-f181.google.com with SMTP id i34so131886432qtc.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Mar 2017 07:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6XR47RjygLEC0XSGa9Z0jPZWA4X5RW/6xMcH3rDPDMk=;
	b=scr2Av1HFTNAsJ3saNhP5cjny8pfN++yjCGB+Onqh60fgA8qx7U1zZP14HZXhJ+S1w
	sA06USAWjKef26WC5T0ZZtMO80YmbGIurLn31J+NnCbtv8abOAmby33ST5vRG2MoWUqQ
	N18EGpEpHDoJtDjzQpRhDR2gPhEAK3bBVuZszyaonZULDkVEB87jiwXWkbaWueX1lX7l
	021XnRsBfC7a7OMvXkVpgK0Ik1aQ9biS1Gww0pWe/TipXlkD2AkJBlM34xt4vG74+4s1
	g/l/zfT0qsHYWPd3hSqDaNKq/Rzu088Cy32Y/TW3aIgRVXHJA7AXgsMrrBSHgVssLKdc
	LHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6XR47RjygLEC0XSGa9Z0jPZWA4X5RW/6xMcH3rDPDMk=;
	b=rE+E6hk8/JBgnZws72PmI/7ICAZlFhPAC9z82BUsRDqoYsHL/hhAhzcO01na8uCEjJ
	bad8lN44AyQ7MGZQLwAnD+HUcUZJMY+60bSKb6Nos+0y/1wRwH0zCYuf4cAxb3Obv1wc
	zX51jKlM0hffFYxH9a8Pj+nnriogEdIz1A2scCaavTKDMYzOKbV7i99ZFsYZ2RaQ2YNp
	WmpXE0xH3UN4Ef6DawrfDFrh5UcLRuFnGe1/gV+MAQBiGnLDFfI7es3N68z7RoEaH6BU
	OzDS5etZYHx/UnnVjemNC2bn0c5yeNapsIMqHN7UNxSVVU8ReISHGfWTzMh4uRcJ2fAm
	ZCOA==
X-Gm-Message-State: AFeK/H15KtlC0/h1r+QdnMR0pU2rnTGLw+yJ62SBMpMZglYhQ65ud80lITl5OugR1fQuWR/rqIPuL9bmfLiPVQ==
X-Received: by 10.237.48.37 with SMTP id 34mr15716053qte.117.1490105653012;
	Tue, 21 Mar 2017 07:14:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Tue, 21 Mar 2017 07:14:12 -0700 (PDT)
In-Reply-To: <CAMKF1sp4eCOMzpxRq4K6o+SQ2wkT+VJF9xo0nnAe-x-O_04n8Q@mail.gmail.com>
References: <20170321035947.13930-1-raj.khem@gmail.com>
	<20170321035947.13930-4-raj.khem@gmail.com>
	<CADkTA4OwEoC4CMZPtFtBrsbCUq_YSKO+fcLf5gn4OjdUn0Rgmw@mail.gmail.com>
	<CAMKF1sp4eCOMzpxRq4K6o+SQ2wkT+VJF9xo0nnAe-x-O_04n8Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Mar 2017 10:14:12 -0400
Message-ID: <CADkTA4O_VmjbpR2191=r9MQxB+OQtJ7DMPOvJ-fWiuzqZBMOUA@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Mar 2017 14:14:16 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c9bbe204364054b3e4261

--94eb2c0c9bbe204364054b3e4261
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 21, 2017 at 9:55 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Tue, Mar 21, 2017 at 5:17 AM Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>
>> On Mon, Mar 20, 2017 at 11:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  recipes-devtools/protobuf/protobuf-native_3.1.0.bb | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
>> b/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
>> index 47fb401..c32f627 100644
>> --- a/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
>> +++ b/recipes-devtools/protobuf/protobuf-native_3.1.0.bb
>> @@ -8,14 +8,12 @@ LICENSE = "BSD-3-Clause"
>>
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
>>
>> -PR = "r0"
>>
>>
>> This is mixing changes. Either put it in the commit log, or split the
>> change. Either
>> way works for me.
>>
>
> This is virtually a nop
>

I'm aware, but that's not the point.

Proper commit log standards are don't mix changes. It's trivial to add it
in the log or split the change.


>
>> We also have no justification as to why we actually want shared libs ?
>> I'd like
>> to understand why, since someone will eventually ask me :D
>>
>
> Protobuf-c needs the shared libraries to build
>

So that belongs in the log, along with the error message. Otherwise, we are
just creating
an unmaintainable jumble of crap.

Bruce


>
>> Bruce
>>
>>
>> -
>>  SRC_URI[md5sum] = "14a532a7538551d5def317bfca41dace"
>>  SRC_URI[sha256sum] = "0a0ae63cbffc274efb573bdde9a253
>> e3f32e458c41261df51c5dbc5ad541e8f7"
>>  SRC_URI = "https://github.com/google/protobuf/archive/v3.1.0.tar.
>> gz;downloadfilename=protobuf-3.1.0.tar.gz \
>>         "
>>
>> -EXTRA_OECONF += " --with-protoc=echo --disable-shared"
>> +EXTRA_OECONF += " --with-protoc=echo"
>>
>>  inherit native autotools
>>
>> --
>> 2.12.0
>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its end"
>>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c0c9bbe204364054b3e4261
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Mar 21, 2017 at 9:55 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div><br></div></div>=
<div><br><div class=3D"gmail_quote"><span class=3D""><div>On Tue, Mar 21, 2=
017 at 5:17 AM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div class=3D"m_-7078722685098439997gmail_msg"><d=
iv class=3D"gmail_extra m_-7078722685098439997gmail_msg"><div class=3D"gmai=
l_quote m_-7078722685098439997gmail_msg">On Mon, Mar 20, 2017 at 11:59 PM, =
Khem Raj <span class=3D"m_-7078722685098439997gmail_msg">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" class=3D"m_-7078722685098439997gmail_msg" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br class=3D"m_-7078722685=
098439997gmail_msg"><blockquote class=3D"gmail_quote m_-7078722685098439997=
gmail_msg" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" c=
lass=3D"m_-7078722685098439997gmail_msg" target=3D"_blank">raj.khem@gmail.c=
om</a>&gt;<br class=3D"m_-7078722685098439997gmail_msg">
---<br class=3D"m_-7078722685098439997gmail_msg">
=C2=A0recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0.bb"=
 rel=3D"noreferrer" class=3D"m_-7078722685098439997gmail_msg" target=3D"_bl=
ank">pro<wbr>tobuf-native_3.1.0.bb</a> | 4 +---<br class=3D"m_-707872268509=
8439997gmail_msg">
=C2=A01 file changed, 1 insertion(+), 3 deletions(-)<br class=3D"m_-7078722=
685098439997gmail_msg">
<br class=3D"m_-7078722685098439997gmail_msg">
diff --git a/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.=
1.0.bb" rel=3D"noreferrer" class=3D"m_-7078722685098439997gmail_msg" target=
=3D"_blank">pr<wbr>otobuf-native_3.1.0.bb</a> b/recipes-devtools/protobuf/<=
a href=3D"http://protobuf-native_3.1.0.bb" rel=3D"noreferrer" class=3D"m_-7=
078722685098439997gmail_msg" target=3D"_blank">pr<wbr>otobuf-native_3.1.0.b=
b</a><br class=3D"m_-7078722685098439997gmail_msg">
index 47fb401..c32f627 100644<br class=3D"m_-7078722685098439997gmail_msg">
--- a/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0.bb"=
 rel=3D"noreferrer" class=3D"m_-7078722685098439997gmail_msg" target=3D"_bl=
ank">pr<wbr>otobuf-native_3.1.0.bb</a><br class=3D"m_-7078722685098439997gm=
ail_msg">
+++ b/recipes-devtools/protobuf/<a href=3D"http://protobuf-native_3.1.0.bb"=
 rel=3D"noreferrer" class=3D"m_-7078722685098439997gmail_msg" target=3D"_bl=
ank">pr<wbr>otobuf-native_3.1.0.bb</a><br class=3D"m_-7078722685098439997gm=
ail_msg">
@@ -8,14 +8,12 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br class=3D"m_-70787=
22685098439997gmail_msg">
<br class=3D"m_-7078722685098439997gmail_msg">
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>35953c752efc9299=
b184f91bef5400<wbr>95&quot;<br class=3D"m_-7078722685098439997gmail_msg">
<br class=3D"m_-7078722685098439997gmail_msg">
-PR =3D &quot;r0&quot;<br class=3D"m_-7078722685098439997gmail_msg"></block=
quote><div class=3D"m_-7078722685098439997gmail_msg"><br class=3D"m_-707872=
2685098439997gmail_msg"></div></div></div></div><div class=3D"m_-7078722685=
098439997gmail_msg"><div class=3D"gmail_extra m_-7078722685098439997gmail_m=
sg"><div class=3D"gmail_quote m_-7078722685098439997gmail_msg"><div class=
=3D"m_-7078722685098439997gmail_msg">This is mixing changes. Either put it =
in the commit log, or split the change. Either</div><div class=3D"m_-707872=
2685098439997gmail_msg">way works for me.</div></div></div></div></blockquo=
te><div><br></div></span><div>This is virtually a nop</div></div></div></bl=
ockquote><div><br></div><div>I&#39;m aware, but that&#39;s not the point.</=
div><div><br></div><div>Proper commit log standards are don&#39;t mix chang=
es. It&#39;s trivial to add it in the log or split the change.</div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"gmail_quo=
te"><span class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"m_-707872=
2685098439997gmail_msg"><div class=3D"gmail_extra m_-7078722685098439997gma=
il_msg"><div class=3D"gmail_quote m_-7078722685098439997gmail_msg"><div cla=
ss=3D"m_-7078722685098439997gmail_msg"></div><div class=3D"m_-7078722685098=
439997gmail_msg"><br class=3D"m_-7078722685098439997gmail_msg"></div><div c=
lass=3D"m_-7078722685098439997gmail_msg">We also have no justification as t=
o why we actually want shared libs ? I&#39;d like</div><div class=3D"m_-707=
8722685098439997gmail_msg">to understand why, since someone will eventually=
 ask me :D</div></div></div></div></blockquote><div><br></div></span><div>P=
rotobuf-c needs the shared libraries to build</div></div></div></blockquote=
><div><br></div><div>So that belongs in the log, along with the error messa=
ge. Otherwise, we are just creating</div><div>an unmaintainable jumble of c=
rap.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div><div class=3D"gmail_quote"><span class=3D""><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div class=3D"m_-7078722685098439997gmail_msg"><div clas=
s=3D"gmail_extra m_-7078722685098439997gmail_msg"><div class=3D"gmail_quote=
 m_-7078722685098439997gmail_msg"><div class=3D"m_-7078722685098439997gmail=
_msg"></div><div class=3D"m_-7078722685098439997gmail_msg"><br class=3D"m_-=
7078722685098439997gmail_msg"></div><div class=3D"m_-7078722685098439997gma=
il_msg">Bruce</div></div></div></div><div class=3D"m_-7078722685098439997gm=
ail_msg"><div class=3D"gmail_extra m_-7078722685098439997gmail_msg"><div cl=
ass=3D"gmail_quote m_-7078722685098439997gmail_msg"><div class=3D"m_-707872=
2685098439997gmail_msg">=C2=A0</div><blockquote class=3D"gmail_quote m_-707=
8722685098439997gmail_msg" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
-<br class=3D"m_-7078722685098439997gmail_msg">
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>14a532a7538551d5def317bfca41da<wbr>ce&=
quot;<br class=3D"m_-7078722685098439997gmail_msg">
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>0a0ae63cbffc274efb573bdde9a253<wbr>=
e3f32e458c41261df51c5dbc5ad541<wbr>e8f7&quot;<br class=3D"m_-70787226850984=
39997gmail_msg">
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/google/protobuf/archi=
ve/v3.1.0.tar.gz;downloadfilename=3Dprotobuf-3.1.0.tar.gz" rel=3D"noreferre=
r" class=3D"m_-7078722685098439997gmail_msg" target=3D"_blank">https://gith=
ub.com/google/<wbr>protobuf/archive/v3.1.0.tar.<wbr>gz;downloadfilename=3Dp=
rotobuf-<wbr>3.1.0.tar.gz</a> \<br class=3D"m_-7078722685098439997gmail_msg=
">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br class=3D"m_-7078722685098439997gmail_=
msg">
<br class=3D"m_-7078722685098439997gmail_msg">
-EXTRA_OECONF +=3D &quot; --with-protoc=3Decho --disable-shared&quot;<br cl=
ass=3D"m_-7078722685098439997gmail_msg">
+EXTRA_OECONF +=3D &quot; --with-protoc=3Decho&quot;<br class=3D"m_-7078722=
685098439997gmail_msg">
<br class=3D"m_-7078722685098439997gmail_msg">
=C2=A0inherit native autotools<br class=3D"m_-7078722685098439997gmail_msg"=
>
<span class=3D"m_-7078722685098439997m_7058911133789292871HOEnZb m_-7078722=
685098439997gmail_msg"><font color=3D"#888888" class=3D"m_-7078722685098439=
997gmail_msg"><br class=3D"m_-7078722685098439997gmail_msg">
--<br class=3D"m_-7078722685098439997gmail_msg">
2.12.0<br class=3D"m_-7078722685098439997gmail_msg">
<br class=3D"m_-7078722685098439997gmail_msg">
</font></span></blockquote></div></div></div><div class=3D"m_-7078722685098=
439997gmail_msg"><div class=3D"gmail_extra m_-7078722685098439997gmail_msg"=
><br class=3D"m_-7078722685098439997gmail_msg"><br clear=3D"all" class=3D"m=
_-7078722685098439997gmail_msg"><div class=3D"m_-7078722685098439997gmail_m=
sg"><br class=3D"m_-7078722685098439997gmail_msg"></div>-- <br class=3D"m_-=
7078722685098439997gmail_msg"><div class=3D"m_-7078722685098439997m_7058911=
133789292871gmail_signature m_-7078722685098439997gmail_msg" data-smartmail=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div></blockquote></span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c0c9bbe204364054b3e4261--
