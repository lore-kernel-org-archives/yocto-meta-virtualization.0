Return-Path: <vlsireddy@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3649FE00BEA; Tue, 14 Nov 2017 05:52:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (vlsireddy[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 376FFE00928
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Nov 2017 05:52:13 -0800 (PST)
Received: by mail-wr0-f172.google.com with SMTP id p96so17530527wrb.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Nov 2017 05:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F6u/W//sKzHNe5i2HHC9Q9o2Y1x96GowCzrACas+euQ=;
	b=snt/kIlboNeKBloUVBR3SmoawNvWQiixc8vlat++8pDwbOX/JMJX2Ot7L1DwOL0mdL
	RRM95VxHc++W1WuSX8Gea9GMYQtOZulMvKlDlUii8BVqquzjx85RNTbt8KAlqw8sm+On
	TX/E8lF7z9DZZt4mnYjqAcfA1nofMGp54YaJaQmInf1Ku4Kn/Z3QxhiXtzIiNaWJ0KAc
	8NkFz69xnbqrPOWHWd2gbgNuPbCuunw1L54l2+r0+N6blD1KIMDlEUcxTChfxpsMrcKw
	JnCr4bXOY2hE20K3m+B+NF5irQd9m8RIrcwnzWbWVqRhSwDLHi5J21MHgVBlxrGIzIXE
	/6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F6u/W//sKzHNe5i2HHC9Q9o2Y1x96GowCzrACas+euQ=;
	b=ZvEwoNV8cyu0zVyEDKNS9JeexcplTtMMk9Km9UB/Tj5gBb1guqkEVoY+jgm+/hGo/a
	9xGZGHV2N1FPxZ0j8ATmGV4ljCurvIIDvGzZgaExyAwRvmBZi+52Ix++Ne1Vl6X17j1Y
	tjsu1CyCH6aFL2lTXrCXfZmFtPiMNSbg8gQCfTqNT0lCnDC7bQQTZ88oBGsZ1Aj7Ya14
	KQGMYIyH+mj/Q1nlwaebOdSczwtRh3QfSvDMoYfQ+unh/2Gp6CuH4W6Jow27lNuuZNAR
	Xk76L/xTNfM/I9rdmu/pU1KFYb89jzue4vrO+eQrPluyE+WiOWnyX8m56pF411KBcx3z
	9/pQ==
X-Gm-Message-State: AJaThX582uQVrRZaEQMSh1fe7ksyC2sZ9NYY67/9Dk1jy5FxHB9XH4rl
	Y8ybK0DODy5729Q2k4rb9G+CQk8zheC3kPhwD10=
X-Google-Smtp-Source: AGs4zMbr01iX5NKSNyCPqY2H6kahcZTw0TK1zxZtav8iUTL9iEwYHtQjVBoRVamM5XmvC2rJ++M61vvFvM2SmdkyMX0=
X-Received: by 10.223.166.103 with SMTP id k94mr10295925wrc.22.1510667533082; 
	Tue, 14 Nov 2017 05:52:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.87.208 with HTTP; Tue, 14 Nov 2017 05:52:12 -0800 (PST)
In-Reply-To: <CADkTA4OvvidGf6_eS-vBkpr3n+sEdYySGfHGXYDr8Y6Py+1WHQ@mail.gmail.com>
References: <CAGQ4JX0waag2sfdSmPSvFe609-V6s2HTEYgrG=Qz9OSio1SWMA@mail.gmail.com>
	<CADkTA4NXiDWTsmQHO+WtO4qxGCe4st4368=O54ApDF4J-QgTXQ@mail.gmail.com>
	<CAGQ4JX2jzoZZPeJ0aWvf+Z3hU5Qh8gWJs2DxQ-0ZoN=oAxk24g@mail.gmail.com>
	<CADkTA4OvvidGf6_eS-vBkpr3n+sEdYySGfHGXYDr8Y6Py+1WHQ@mail.gmail.com>
From: Ravi chandra reddy <vlsireddy@gmail.com>
Date: Tue, 14 Nov 2017 08:52:12 -0500
Message-ID: <CAGQ4JX3z8uUmgo31VKssGVr2FyUaewTzZH5umOUVC7t+s3SQpQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Issue in irqbalance Code AARCH64-ARM-A53
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
X-List-Received-Date: Tue, 14 Nov 2017 13:52:15 -0000
Content-Type: multipart/alternative; boundary="f403045cf04eaee781055df1b19d"

--f403045cf04eaee781055df1b19d
Content-Type: text/plain; charset="UTF-8"

Hi Bruce,
               1. Author released 1.3.0 and i compiled it with AARCH64 and
it succeed.
               2. submitted irqbalance_1.3.0.bb patch.

Thanks

On Sun, Nov 12, 2017 at 8:23 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Sat, Nov 11, 2017 at 11:03 PM, Ravi chandra reddy
> <vlsireddy@gmail.com> wrote:
> > Hi Bruce,
> >               1. I downloaded 1.2.0 version and i tried to build on
> AARCH64
> > compiler and i see compilation failure.
> >               2. issue is fixed on Jan 15 and file is compressed and put
> as
> > release on Jan 10. In other words, release 1.2.0 does NOT compile with
> > AARCH64 same way as 1.1.0. [unless someone goes and fix in
> >
> > vi
> > tmp/work/aarch64-xilinx-linux/irqbalance/1.2.0-r0/irqbalance-1.2.0/
> procinterrupts.c
> >
> >               3. I have written to Author of new release package. I will
> > await his response and post patch.
> >               4. Let me know of other alternatives.
>
> upgrade to 1.2.0 and create a patch that fixes the compilation issues,
> submit that
> uprev + patch to the list.
>
> Bruce
>
> >
> > Thanks
> > RC Reddy
> >
> > On Fri, Nov 10, 2017 at 10:48 PM, Bruce Ashfield <
> bruce.ashfield@gmail.com>
> > wrote:
> >>
> >> On Fri, Nov 10, 2017 at 9:43 PM, Ravi chandra reddy <
> vlsireddy@gmail.com>
> >> wrote:
> >> > Hi All,
> >> >
> >> > 1. based on this link
> >> >
> >> >
> >> > http://layers.openembedded.org/layerindex/branch/master/
> layer/meta-virtualization/
> >> >
> >> > 2. i see the irqbalance is of version 1.1.0 [Dec 4, 2015]
> >> >
> >> > 3. Building meta-virtualization library for irqbalance failed for
> >> > AARHC64.
> >> >
> >> > 4. The Issue is simple bug [i fixed in my downloaded, untar'ed
> >> > code],looks
> >> > someone also fixed the code and new version 1.2.0 does include this
> fix.
> >> >
> >> >
> >> > [https://github.com/Irqbalance/irqbalance/commit/
> 1dccd034a90b2f0221423632de65cbf84d05ebfb#diff-
> 69b8dbcfbbf11746aa38c26a4604e551]
> >> >
> >> > 5. Is there any reason why irqbalance is NOT updated to 1.2.0 in
> >> > meta-virtualization.
> >>
> >> Nope, no reason.
> >>
> >> Send a patch to upgrade it, and it'll be 1.2.0 :D
> >>
> >> Bruce
> >>
> >> >
> >> > 6. According to github, version 1.2.0 has Aarch64 support
> >> > [https://github.com/Irqbalance/irqbalance/releases]
> >> >
> >> > Thanks
> >> > RC Reddy
> >> >
> >> > --
> >> > _______________________________________________
> >> > meta-virtualization mailing list
> >> > meta-virtualization@yoctoproject.org
> >> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >> >
> >>
> >>
> >>
> >> --
> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end"
> >
> >
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>

--f403045cf04eaee781055df1b19d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bruce,<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A01. Author released 1.3.0 and i compiled it with AARCH64 and it=
 succeed.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
2. submitted <a href=3D"http://irqbalance_1.3.0.bb">irqbalance_1.3.0.bb</a>=
 patch.</div><div><br></div><div>Thanks</div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On Sun, Nov 12, 2017 at 8:23 PM, Bruce As=
hfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" ta=
rget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><span class=3D"">On Sat, Nov 11, 2017 at 11:03 PM, Ra=
vi chandra reddy<br>
&lt;<a href=3D"mailto:vlsireddy@gmail.com">vlsireddy@gmail.com</a>&gt; wrot=
e:<br>
&gt; Hi Bruce,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01. I downloaded =
1.2.0 version and i tried to build on AARCH64<br>
&gt; compiler and i see compilation failure.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02. issue is fixe=
d on Jan 15 and file is compressed and put as<br>
&gt; release on Jan 10. In other words, release 1.2.0 does NOT compile with=
<br>
&gt; AARCH64 same way as 1.1.0. [unless someone goes and fix in<br>
&gt;<br>
&gt; vi<br>
&gt; tmp/work/aarch64-xilinx-linux/<wbr>irqbalance/1.2.0-r0/<wbr>irqbalance=
-1.2.0/<wbr>procinterrupts.c<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03. I have writte=
n to Author of new release package. I will<br>
&gt; await his response and post patch.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04. Let me know o=
f other alternatives.<br>
<br>
</span>upgrade to 1.2.0 and create a patch that fixes the compilation issue=
s,<br>
submit that<br>
uprev + patch to the list.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Bruce<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Thanks<br>
&gt; RC Reddy<br>
&gt;<br>
&gt; On Fri, Nov 10, 2017 at 10:48 PM, Bruce Ashfield &lt;<a href=3D"mailto=
:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Nov 10, 2017 at 9:43 PM, Ravi chandra reddy &lt;<a href=3D=
"mailto:vlsireddy@gmail.com">vlsireddy@gmail.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; Hi All,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; 1. based on this link<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"http://layers.openembedded.org/layerindex/branch/m=
aster/layer/meta-virtualization/" rel=3D"noreferrer" target=3D"_blank">http=
://layers.openembedded.<wbr>org/layerindex/branch/master/<wbr>layer/meta-vi=
rtualization/</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; 2. i see the irqbalance is of version 1.1.0 [Dec 4, 2015]<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; 3. Building meta-virtualization library for irqbalance failed=
 for<br>
&gt;&gt; &gt; AARHC64.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; 4. The Issue is simple bug [i fixed in my downloaded, untar&#=
39;ed<br>
&gt;&gt; &gt; code],looks<br>
&gt;&gt; &gt; someone also fixed the code and new version 1.2.0 does includ=
e this fix.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; [<a href=3D"https://github.com/Irqbalance/irqbalance/commit/1=
dccd034a90b2f0221423632de65cbf84d05ebfb#diff-69b8dbcfbbf11746aa38c26a4604e5=
51" rel=3D"noreferrer" target=3D"_blank">https://github.com/<wbr>Irqbalance=
/irqbalance/commit/<wbr>1dccd034a90b2f0221423632de65cb<wbr>f84d05ebfb#diff-=
<wbr>69b8dbcfbbf11746aa38c26a4604e5<wbr>51</a>]<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; 5. Is there any reason why irqbalance is NOT updated to 1.2.0=
 in<br>
&gt;&gt; &gt; meta-virtualization.<br>
&gt;&gt;<br>
&gt;&gt; Nope, no reason.<br>
&gt;&gt;<br>
&gt;&gt; Send a patch to upgrade it, and it&#39;ll be 1.2.0 :D<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; 6. According to github, version 1.2.0 has Aarch64 support<br>
&gt;&gt; &gt; [<a href=3D"https://github.com/Irqbalance/irqbalance/releases=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/<wbr>Irqbalance/i=
rqbalance/releases</a><wbr>]<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks<br>
&gt;&gt; &gt; RC Reddy<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; ______________________________<wbr>_________________<br>
&gt;&gt; &gt; meta-virtualization mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-=
virtualization@<wbr>yoctoproject.org</a><br>
&gt;&gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtu=
alization" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
<wbr>org/listinfo/meta-<wbr>virtualization</a><br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madnes=
s await<br>
&gt;&gt; thee at its end&quot;<br>
&gt;<br>
&gt;<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</div></div></blockquote></div><br></div>

--f403045cf04eaee781055df1b19d--
