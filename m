Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B11FDE00B57; Tue, 30 May 2017 23:30:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.218.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.218.44 listed in dnsbl.sorbs.net]
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46E68E00B47
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 May 2017 23:30:11 -0700 (PDT)
Received: by mail-oi0-f44.google.com with SMTP id b204so4052046oii.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 May 2017 23:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=mXZyxJyth1yr1W59IsLM5FsdTIIWNYv8Om5JgxE0inI=;
	b=brAKFld5DVWDA1ny5S3xx8pqRXzVrhXGe+Vs3QpKmBN/B7Mgt2ve6hBZDE5TOnav8Q
	Rb0TOAA29beTSA6NG8tuXLg0IzbrL20rhD/PpOWhPKd9xFJdORByuiX4FfHarQq570XD
	UPHFjfp/isLfp8TkD2t95lC6K0qGdWq9UIkTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=mXZyxJyth1yr1W59IsLM5FsdTIIWNYv8Om5JgxE0inI=;
	b=Si2/7hnA3QhWfNk4g/vtPq/sieqGX+PVENJPXeyIEEEvmFAS5YFxJMGnJcjVpMmlAt
	4+JB5IRhkpf+tl0tAnuXg72iFIl/rcQRHycNmutoQcqSE8uezcppDHBvEmgYmVw+pUeT
	sBXRFUegY5sz8aezczy58kjCLNdNSt8kEXPE1FFK1oRA9RPvFuv5s72Qje47RbsxM2RA
	jSRWa4UbkZCp+OKeNVEQBr2PDPC8nsjDbJWBcriPsAXacjcIWGaBdLxM4kZ7SLK+fH4V
	IXNJndiH1YrJ5mNCAmbpP3lJskq6+C0etC5SDl6ZCz9hGrXgjjP/6T9eoH7wmzqEKZhE
	BU1g==
X-Gm-Message-State: AODbwcBmvyAWHnsPgeIJbn/QmvVi2pInGTij0GGfxayJLYZ+woL7gYJd
	Ua3aHzr0y7rO5A/x1V4NJtTySisNckYHDgg=
X-Received: by 10.157.43.180 with SMTP id u49mr5162787ota.182.1496212211036;
	Tue, 30 May 2017 23:30:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.29.8 with HTTP; Tue, 30 May 2017 23:30:10 -0700 (PDT)
In-Reply-To: <1495806738.26945.17.camel@linux.intel.com>
References: <CAFL6qn6e_8xtUkh+uX3seA=OeTok04+Rsp2a7LmEgE2AOsa=TA@mail.gmail.com>
	<1495806738.26945.17.camel@linux.intel.com>
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Wed, 31 May 2017 08:30:10 +0200
Message-ID: <CAFL6qn6cG2BtTgpO+cU2ayTD1pGjp0nekw0YQZRa5=879rcyWA@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Re: [yocto] xen-guest-image-minimal building error
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
X-List-Received-Date: Wed, 31 May 2017 06:30:14 -0000
Content-Type: multipart/alternative; boundary="001a1145c590590ded0550cc0d37"

--001a1145c590590ded0550cc0d37
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm trying to build an a xen guest image for the zcu102 board with the
master branch of Yocto, but I'm having a trouble. The building process
stops due to the next error:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'python-smartpm-native'. Close matches:
  python-rpm-native
  python-mako-native
  python-py-native
ERROR: Required build target 'xen-guest-image-minimal' has no buildable
providers.
Missing or unbuildable dependency chain was: ['xen-guest-image-minimal',
'python-smartpm-native']

Does any body know how could I solve this issue?

Best regards,
Pello

2017-05-26 15:52 GMT+02:00 Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com>:

> Please do include all mailing lists when asking for help. I suggest just
> posting your question into the 'proper' one and provide more info
> (layers, setup etc.)
>
> Leo
>
> On Fri, 2017-05-26 at 09:53 +0200, Pello Heriz wrote:
> > Hi all,
> >
> >
> > I'm trying to build an a xen guest image for the zcu102 board with the
> > master branch of Yocto, but I'm having a trouble. The building process
> > stops due to the next error:
> >
> > NOTE: Resolving any missing task queue dependencies
> > ERROR: Nothing PROVIDES 'python-smartpm-native'. Close matches:
> >   python-rpm-native
> >   python-mako-native
> >   python-py-native
> > ERROR: Required build target 'xen-guest-image-minimal' has no
> > buildable providers.
> > Missing or unbuildable dependency chain was:
> > ['xen-guest-image-minimal', 'python-smartpm-native']
> >
> >
> > Does any body know how could I solve this issue?
> >
> >
> > Best regards,
> >
> > Pello
> >
> > --
> > _______________________________________________
> > yocto mailing list
> > yocto@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/yocto
>
>
>

--001a1145c590590ded0550cc0d37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-size:12.8px"><div><div><div>Hi all,<br>=
<br></div>I&#39;m trying to build an a xen guest image for the zcu102 board=
 with the master branch of Yocto, but I&#39;m having a trouble. The buildin=
g process stops due to the next error:<br><br>NOTE: Resolving any missing t=
ask queue dependencies<br>ERROR: Nothing PROVIDES &#39;python-smartpm-nativ=
e&#39;. Close matches:<br>=C2=A0 python-rpm-native<br>=C2=A0 python-mako-na=
tive<br>=C2=A0 python-py-native<br>ERROR: Required build target &#39;xen-gu=
est-image-minimal&#39; has no buildable providers.<br>Missing or unbuildabl=
e dependency chain was: [&#39;xen-guest-image-minimal&#39;, &#39;python-sma=
rtpm-native&#39;]<br><br></div>Does any body know how could I solve this is=
sue?<br><br></div>Best regards,=C2=A0<br></div><span style=3D"font-size:12.=
8px">Pello</span><br></div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">2017-05-26 15:52 GMT+02:00 Leonardo Sandoval <span dir=3D"ltr">&l=
t;<a href=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_=
blank">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span>:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Please do include all mailing lists when asking fo=
r help. I suggest just<br>
posting your question into the &#39;proper&#39; one and provide more info<b=
r>
(layers, setup etc.)<br>
<br>
Leo<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Fri, 2017-05-26 at 09:53 +0200, Pello Heriz wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt;<br>
&gt; I&#39;m trying to build an a xen guest image for the zcu102 board with=
 the<br>
&gt; master branch of Yocto, but I&#39;m having a trouble. The building pro=
cess<br>
&gt; stops due to the next error:<br>
&gt;<br>
&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt; ERROR: Nothing PROVIDES &#39;python-smartpm-native&#39;. Close matches=
:<br>
&gt;=C2=A0 =C2=A0python-rpm-native<br>
&gt;=C2=A0 =C2=A0python-mako-native<br>
&gt;=C2=A0 =C2=A0python-py-native<br>
&gt; ERROR: Required build target &#39;xen-guest-image-minimal&#39; has no<=
br>
&gt; buildable providers.<br>
&gt; Missing or unbuildable dependency chain was:<br>
&gt; [&#39;xen-guest-image-minimal&#39;, &#39;python-smartpm-native&#39;]<b=
r>
&gt;<br>
&gt;<br>
&gt; Does any body know how could I solve this issue?<br>
&gt;<br>
&gt;<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Pello<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; yocto mailing list<br>
&gt; <a href=3D"mailto:yocto@yoctoproject.org">yocto@yoctoproject.org</a><b=
r>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/yocto" rel=3D"noref=
errer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listinfo/yocto=
</a><br>
<br>
<br>
</font></span></blockquote></div><br></div>

--001a1145c590590ded0550cc0d37--
