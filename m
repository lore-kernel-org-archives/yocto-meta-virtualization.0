Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2A20E00BBF; Mon, 14 Aug 2017 09:07:38 -0700 (PDT)
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
	*      [209.85.220.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F7F5E00A39
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Aug 2017 09:07:37 -0700 (PDT)
Received: by mail-qk0-f193.google.com with SMTP id x77so9687659qka.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Aug 2017 09:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DIfd5Bl0OuRlMIjVLsAlaHZdtK4HURIOZgEezK0ZyYE=;
	b=HWDx8f+SJjMG/L6GRUt23T5z58+zZSe0OJCbVHpPNncD3p2kKntMMcj3b1X31WzVT3
	kIJ0yUsS/XKQmlYH2GkIe3TnjEFbLiAocim9TGMkxp+0W00Q0Ilp6/AQf3xrKrmczDwL
	oTLsqiGRgr4RGva2KZw14Zpsvm2/Qd/ahFwkqJxAkG8b9j4VvBmcJu4ZiGkEbHfRuBoh
	QR7xrj9uJCilX+Mu1HREaQkAXlpRdo8Iiqa88BiNj2D8jfhp9C4Ef9htwGL92YNCuB0z
	F/dln29vQX3NrpxaqF/g9sMOcpGm4eo03AChpA+kbvvpspNvIj08LlCxDQ+dbQxqgS4m
	oTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DIfd5Bl0OuRlMIjVLsAlaHZdtK4HURIOZgEezK0ZyYE=;
	b=N61ewMkU1dzXXJ+kDZPWOzkRy4NxKXVA5jBdyl0jUdr/4RwSxdo8lTFkp04xqHfANc
	rbsDGpMcTDXjXuQ8idv8lRC1grcuiR6VBiAyYnHlqoX8sACW+DHTEOGA/mXwJfgENORa
	D8oPKzROwQnLCFTajoiNhJFoPd3aqz5DndUPSXHhYHeYiuMcxBO3J7fd/Q3wk5IOhmH6
	rjeHFaaWRspc/F3I52H1wmHIQC6dpEZyeCnSUdaL2nP1eBeICN6HDhkf5EwKoh9lphzv
	YAMjzkVMa4oRe6OtUzKwbGMmjopJ7APVnaO12RsMIJmxf4trSD+GAdOlfKVML0Ya/euH
	9yiQ==
X-Gm-Message-State: AHYfb5j4gU3V1EJM0e6LPPmlVcV/0t52XiALuyJbTPLTBoREI8ZUo9tB
	0LKZ0hK4bxXe5roq9TkAcfztmaye1Q==
X-Received: by 10.55.162.214 with SMTP id l205mr29468618qke.265.1502726857308; 
	Mon, 14 Aug 2017 09:07:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.194.139 with HTTP; Mon, 14 Aug 2017 09:07:36 -0700 (PDT)
In-Reply-To: <eeb8f15b-bc35-022a-078f-0fb4ba8cb389@gentoo.org>
References: <1502328524-4230-1-git-send-email-christopher.w.clark@gmail.com>
	<eeb8f15b-bc35-022a-078f-0fb4ba8cb389@gentoo.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 14 Aug 2017 12:07:36 -0400
Message-ID: <CADkTA4PUaEuDnVgnbGtSzDFy5Y==2hiDc-kMAWO3u8ySsPZJ3A@mail.gmail.com>
To: Doug Goldstein <cardoe@gentoo.org>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/3] xen: Add Xen recipe for 4.9.0
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
X-List-Received-Date: Mon, 14 Aug 2017 16:07:38 -0000
Content-Type: multipart/alternative; boundary="001a114f0c1a863fb10556b8dc4e"

--001a114f0c1a863fb10556b8dc4e
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 10, 2017 at 2:33 PM, Doug Goldstein <cardoe@gentoo.org> wrote:

> On 8/9/17 8:28 PM, christopher.w.clark@gmail.com wrote:
> > From: Christopher Clark <christopher.w.clark@gmail.com>
> >
> > Add recipe for Xen 4.9.0 and update xen.inc to package new items.
> >
> > Christopher Clark (3):
> >   xen: Package libxendevicemodel, introduced in Xen 4.9
> >   xen: Package .pc packageconfig files into dev packages
> >   xen: add recipe for Xen 4.9.0
> >
> >  recipes-extended/xen/xen.inc      | 78 ++++++++++++++++++++++++++++++
> ++-------
> >  recipes-extended/xen/xen_4.9.0.bb | 10 +++++
> >  2 files changed, 74 insertions(+), 14 deletions(-)
> >  create mode 100644 recipes-extended/xen/xen_4.9.0.bb
> >
>
> ACK to this series. We can drop the existing xen 4.8 recipe with the 3rd
> commit and just keep 4.9.0 in master.
>

merged.

I removed 4.8 in an additional commit. If I missed some parts, someone can
send followup patches.

Bruce


>
> --
> Doug Goldstein
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114f0c1a863fb10556b8dc4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Aug 10, 2017 at 2:33 PM, Doug Goldstein <span dir=3D"ltr">&lt;<=
a href=3D"mailto:cardoe@gentoo.org" target=3D"_blank">cardoe@gentoo.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 8/=
9/17 8:28 PM, <a href=3D"mailto:christopher.w.clark@gmail.com">christopher.=
w.clark@gmail.com</a> wrote:<br>
&gt; From: Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@gmai=
l.com">christopher.w.clark@gmail.com</a><wbr>&gt;<br>
&gt;<br>
&gt; Add recipe for Xen 4.9.0 and update xen.inc to package new items.<br>
&gt;<br>
&gt; Christopher Clark (3):<br>
&gt;=C2=A0 =C2=A0xen: Package libxendevicemodel, introduced in Xen 4.9<br>
&gt;=C2=A0 =C2=A0xen: Package .pc packageconfig files into dev packages<br>
&gt;=C2=A0 =C2=A0xen: add recipe for Xen 4.9.0<br>
&gt;<br>
&gt;=C2=A0 recipes-extended/xen/xen.inc=C2=A0 =C2=A0 =C2=A0 | 78 ++++++++++=
++++++++++++++++++++<wbr>++-------<br>
&gt;=C2=A0 recipes-extended/xen/<a href=3D"http://xen_4.9.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen_4.9.<wbr>0.bb</a> | 10 +++++<br>
&gt;=C2=A0 2 files changed, 74 insertions(+), 14 deletions(-)<br>
&gt;=C2=A0 create mode 100644 recipes-extended/xen/<a href=3D"http://xen_4.=
9.0.bb" rel=3D"noreferrer" target=3D"_blank">xen_4.9.<wbr>0.bb</a><br>
&gt;<br>
<br>
</span>ACK to this series. We can drop the existing xen 4.8 recipe with the=
 3rd<br>
commit and just keep 4.9.0 in master.<br></blockquote><div><br></div><div>m=
erged.</div><div><br></div><div>I removed 4.8 in an additional commit. If I=
 missed some parts, someone can send followup patches.</div><div><br></div>=
<div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Doug Goldstein<br>
<br>
</font></span><br>--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div>

--001a114f0c1a863fb10556b8dc4e--
