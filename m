Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 65CFEE0107D; Wed,  7 Sep 2016 04:59:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.178 listed in list.dnswl.org]
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29EFAE00F12
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Sep 2016 04:59:08 -0700 (PDT)
Received: by mail-qk0-f178.google.com with SMTP id v123so12002355qkh.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 07 Sep 2016 04:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=inJiC+AKwgcLl7iIchIhg986z+EZ3CZGeitmzo6RUM4=;
	b=0VLViNy0zmliCuC8iEsny+9E66XMgusAh2/2+Usa9iqW8FdzfHyK6Fb9u6Hol9YFKN
	5IJw/VmG1rLHCpm9VkgHr4A+UWFGVjqGIoQScODXjDjvbKD/LnniwD72Ydr/ASqkkJDQ
	N6lPGob8smMj7efBruYwUcwm8jG6GS1wdpMR9NDq2L9QdoBoep3/lO97izTaRPZ3MPgi
	xZrLk5XuLDmaiqZYTI0MRggF46yhypwN4qaGRkvWkmtxzJyTImlCac9nB1GoFXMjKgnV
	4rn/KtVYKjZnbF6mx/3wTq24CZ/WnO5NzadZ16mAkiJpXwBM5DS2NprY8LPwHoI6gGOx
	bXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=inJiC+AKwgcLl7iIchIhg986z+EZ3CZGeitmzo6RUM4=;
	b=UcjQ4xctJ+XXjfQMEd+XX7Utknw4tprkiJdWV0iQXZtIpWhTMgCVJIatWNWSvZHXAA
	qoXUjrE4UzBsaNw+rp/ZIvCRawDHxFlc0nxay3vW1y1iwX2bKvC6G00psgVl7k7mrV2a
	equzwX4OmtDE1u7IRqasv6qcQB+pgCnIx9ps0yQWJkYcd4yIGF8ivc+Aehaf7FgzpbO/
	O8r3SjtFRATmjpNRHemuaNBUn0xaDG16POTWQ68T2QzRvJC7JCu5JD58zwBDd0aGzPbv
	sYp9c4EQniUw2MaDXL+WciOTbClPZWi0Unp/fHXhOu9veSwYdUM4XktS2DgfGv+aARuL
	OO5A==
X-Gm-Message-State: AE9vXwN2+H/uxlJWK79TpZ+NM6+qKNXHfrnynaGrUiVb3vEKVju6JqtyfznSoB8YgZv9btTjUzEPeXyhHu9lcA==
X-Received: by 10.55.99.17 with SMTP id x17mr11302485qkb.261.1473249548188;
	Wed, 07 Sep 2016 04:59:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.47.189 with HTTP; Wed, 7 Sep 2016 04:59:07 -0700 (PDT)
In-Reply-To: <834c4425-d897-4086-d8f7-35ff10f8607c@embed.me.uk>
References: <1473235798-3525-1-git-send-email-jianchuan.wang@windriver.com>
	<834c4425-d897-4086-d8f7-35ff10f8607c@embed.me.uk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Sep 2016 07:59:07 -0400
Message-ID: <CADkTA4N-FO--RN=E9gYXyZn0=ey_WfPL2n+sa5zmU7QDSqjR3g@mail.gmail.com>
To: Jack Mitchell <ml@embed.me.uk>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/3] protobuf: uprev 3.0.0 from 2.6.1
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
X-List-Received-Date: Wed, 07 Sep 2016 11:59:12 -0000
Content-Type: multipart/alternative; boundary=94eb2c05a3c4fc438f053be9a3ba

--94eb2c05a3c4fc438f053be9a3ba
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 7, 2016 at 6:05 AM, Jack Mitchell <ml@embed.me.uk> wrote:

>
> On 07/09/16 09:09, jianchuan.wang@windriver.com wrote:
>
>> From: Jianchuan Wang <jianchuan.wang@windriver.com>
>>
>> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
>> ---
>>  .../criu/protobuf-native_2.6.1.bb                  | 21 -----
>>  .../criu/protobuf-native_3.0.0.bb                  | 21 +++++
>>  .../recipes-containers/criu/protobuf_2.6.1.bb      | 97
>> ----------------------
>>  .../recipes-containers/criu/protobuf_3.0.0.bb      | 97
>> ++++++++++++++++++++++
>>  4 files changed, 118 insertions(+), 118 deletions(-)
>>  delete mode 100644 meta-virtualization/recipes-containers/criu/
>> protobuf-native_2.6.1.bb
>>  create mode 100644 meta-virtualization/recipes-containers/criu/
>> protobuf-native_3.0.0.bb
>>  delete mode 100644 meta-virtualization/recipes-containers/criu/
>> protobuf_2.6.1.bb
>>  create mode 100644 meta-virtualization/recipes-containers/criu/
>> protobuf_3.0.0.bb
>>
>> >
> > <snip>
>
> Is there a reason not to use and update the version is meta-oe? Why the
> duplication?


See the meta-oe mailing list, where I discussed this not that long ago.

Up until now, I haven't been able to have stability or a fast patch merge
process into
the meta-go* or oe-meta-go layers.

I do builds with them from time to time .. after a period of stability,
I'll drop support
in favour of them .. but until that time, we keep our copies.

Bruce


>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c05a3c4fc438f053be9a3ba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Sep 7, 2016 at 6:05 AM, Jack Mitchell <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ml@embed.me.uk" target=3D"_blank">ml@embed.me.uk</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><br>
On 07/09/16 09:09, <a href=3D"mailto:jianchuan.wang@windriver.com" target=
=3D"_blank">jianchuan.wang@windriver.com</a> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Jianchuan Wang &lt;<a href=3D"mailto:jianchuan.wang@windriver.com" ta=
rget=3D"_blank">jianchuan.wang@windriver.com</a>&gt;<br>
<br>
Signed-off-by: Jianchuan Wang &lt;<a href=3D"mailto:jianchuan.wang@windrive=
r.com" target=3D"_blank">jianchuan.wang@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../criu/<a href=3D"http://protobuf-native_2.6.1.bb" rel=3D"noreferre=
r" target=3D"_blank">protobuf-native_2.6.<wbr>1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 21 -----<br>
=C2=A0.../criu/<a href=3D"http://protobuf-native_3.0.0.bb" rel=3D"noreferre=
r" target=3D"_blank">protobuf-native_3.0.<wbr>0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 21 +++++<br>
=C2=A0.../recipes-containers/criu/<a href=3D"http://protobuf_2.6.1.bb" rel=
=3D"noreferrer" target=3D"_blank">p<wbr>rotobuf_2.6.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 | 97 ----------------------<br>
=C2=A0.../recipes-containers/criu/<a href=3D"http://protobuf_3.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">p<wbr>rotobuf_3.0.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 | 97 ++++++++++++++++++++++<br>
=C2=A04 files changed, 118 insertions(+), 118 deletions(-)<br>
=C2=A0delete mode 100644 meta-virtualization/recipes-co<wbr>ntainers/criu/<=
a href=3D"http://protobuf-native_2.6.1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">protobuf-native_<wbr>2.6.1.bb</a><br>
=C2=A0create mode 100644 meta-virtualization/recipes-co<wbr>ntainers/criu/<=
a href=3D"http://protobuf-native_3.0.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">protobuf-native_<wbr>3.0.0.bb</a><br>
=C2=A0delete mode 100644 meta-virtualization/recipes-co<wbr>ntainers/criu/<=
a href=3D"http://protobuf_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">pr=
otobuf_2.6.1.<wbr>bb</a><br>
=C2=A0create mode 100644 meta-virtualization/recipes-co<wbr>ntainers/criu/<=
a href=3D"http://protobuf_3.0.0.bb" rel=3D"noreferrer" target=3D"_blank">pr=
otobuf_3.0.0.<wbr>bb</a><br>
<br>
</blockquote>
&gt;<br></span>
&gt; &lt;snip&gt;<br>
<br>
Is there a reason not to use and update the version is meta-oe? Why the dup=
lication?</blockquote><div><br></div><div>See the meta-oe mailing list, whe=
re I discussed this not that long ago.</div><div><br></div><div>Up until no=
w, I haven&#39;t been able to have stability or a fast patch merge process =
into</div><div>the meta-go* or oe-meta-go layers.=C2=A0</div><div><br></div=
><div>I do builds with them from time to time .. after a period of stabilit=
y, I&#39;ll drop support</div><div>in favour of them .. but until that time=
, we keep our copies.</div><div><br></div><div>Bruce</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5"><br>
-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproje<wbr>ct.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listi=
nfo/meta-virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--94eb2c05a3c4fc438f053be9a3ba--
