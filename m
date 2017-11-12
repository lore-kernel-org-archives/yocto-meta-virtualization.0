Return-Path: <vlsireddy@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2BE6E00D3A; Sat, 11 Nov 2017 20:03:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (vlsireddy[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.67 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.67 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BF4EE00D3A
	for <meta-virtualization@yoctoproject.org>;
	Sat, 11 Nov 2017 20:03:44 -0800 (PST)
Received: by mail-wm0-f67.google.com with SMTP id r68so9048091wmr.1
	for <meta-virtualization@yoctoproject.org>;
	Sat, 11 Nov 2017 20:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IgowAcF1ZSxJIogXO5r85kzK5Ym4u1TVIgDG0buxqDU=;
	b=vD3KXXUVQZzbsz0eLIRO3y1N4ZrjmcdzF2p+NxCT5dxSpYBHE4Lz2umXSk3sgn7iZO
	P3zB7GzknTeqG9vUIQzP97L/e7UB+viar7Qs11N77Wwh1stZNHAk1vdz5K+jfiTxzOLm
	wXL9TWWkyyl0c7O9aWwhDdeoR8Lgpfk6au7stmpRy50JfxeoBXzgBgQFZErDpBp5oa5D
	3XloLUi583QAjL1wYGRFnvM6USifcB+zwCNkUVh1gJ9Lzq/4i1IHioJLy0xaGdUzmFua
	1hXELY/zKoscttI+oDSngJw9yPGOnfjAvVPZi7lSCpG2Fs8AgOobirEXybrNRxoSEzbU
	5VFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IgowAcF1ZSxJIogXO5r85kzK5Ym4u1TVIgDG0buxqDU=;
	b=KztmveOiQOCwQ404ZaNtATI3AY+P+9D47georK8inMNRroonSsctbzx4P6uptSALnc
	obeW//UNVSGuETqxIMmZ/LrXfdPcTHu1D+7vRzwDKAdlmxt/owaX9w12dLB6if2FWGLf
	J16mSQgpTlXnM6tgAMnC5cusimeM02lnNGkAuDEThVYGQXC8mStDGbSK8r36ujIMHsc5
	KLXjexEG0qebZIZOj5EfrdYhOT/EeCo/RcGRQ1sbdRzYHPKbnl1d3n914MFA5uLshhsN
	YXXzRkU1NJCMgemaZ9yRdmlqx7QK0/Ar1MFSE6XH8H0efea9zWHRCywtS1AGH/eRz1rg
	Fhew==
X-Gm-Message-State: AJaThX5dvNCVIqQ4FNNyCE4P3Y7ILhNIyn6Bqa3hSq+hCjVEigmQXadh
	/hMCJf1o9Ed/WrU6SjZN2vBG654OLzBd0oTd/1U=
X-Google-Smtp-Source: AGs4zMZnxSJTP7lXWWDctbbJZw9faHpFziay728AdvDYywvNY4tawO1s9dUhqMHkoY8rkLsC0EniUnQaHcmKeAClbJI=
X-Received: by 10.28.180.65 with SMTP id d62mr3564160wmf.95.1510459423821;
	Sat, 11 Nov 2017 20:03:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.87.208 with HTTP; Sat, 11 Nov 2017 20:03:43 -0800 (PST)
In-Reply-To: <CADkTA4NXiDWTsmQHO+WtO4qxGCe4st4368=O54ApDF4J-QgTXQ@mail.gmail.com>
References: <CAGQ4JX0waag2sfdSmPSvFe609-V6s2HTEYgrG=Qz9OSio1SWMA@mail.gmail.com>
	<CADkTA4NXiDWTsmQHO+WtO4qxGCe4st4368=O54ApDF4J-QgTXQ@mail.gmail.com>
From: Ravi chandra reddy <vlsireddy@gmail.com>
Date: Sat, 11 Nov 2017 23:03:43 -0500
Message-ID: <CAGQ4JX2jzoZZPeJ0aWvf+Z3hU5Qh8gWJs2DxQ-0ZoN=oAxk24g@mail.gmail.com>
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
X-List-Received-Date: Sun, 12 Nov 2017 04:03:45 -0000
Content-Type: multipart/alternative; boundary="001a114a6f406795ab055dc13da3"

--001a114a6f406795ab055dc13da3
Content-Type: text/plain; charset="UTF-8"

Hi Bruce,
              1. I downloaded 1.2.0 version and i tried to build on AARCH64
compiler and i see compilation failure.
              2. issue is fixed on Jan 15 and file is compressed and put as
release on Jan 10. In other words, release 1.2.0 does *NOT *compile with
AARCH64 same way as 1.1.0. [unless someone goes and fix in

vi
tmp/work/aarch64-xilinx-linux/irqbalance/1.2.0-r0/irqbalance-1.2.0/procinterrupts.c

              3. I have written to Author of new release package. I will
await his response and post patch.
              4. Let me know of other alternatives.

Thanks
RC Reddy

On Fri, Nov 10, 2017 at 10:48 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Fri, Nov 10, 2017 at 9:43 PM, Ravi chandra reddy <vlsireddy@gmail.com>
> wrote:
> > Hi All,
> >
> > 1. based on this link
> >
> > http://layers.openembedded.org/layerindex/branch/master/
> layer/meta-virtualization/
> >
> > 2. i see the irqbalance is of version 1.1.0 [Dec 4, 2015]
> >
> > 3. Building meta-virtualization library for irqbalance failed for
> AARHC64.
> >
> > 4. The Issue is simple bug [i fixed in my downloaded, untar'ed
> code],looks
> > someone also fixed the code and new version 1.2.0 does include this fix.
> >
> > [https://github.com/Irqbalance/irqbalance/commit/
> 1dccd034a90b2f0221423632de65cbf84d05ebfb#diff-
> 69b8dbcfbbf11746aa38c26a4604e551]
> >
> > 5. Is there any reason why irqbalance is NOT updated to 1.2.0 in
> > meta-virtualization.
>
> Nope, no reason.
>
> Send a patch to upgrade it, and it'll be 1.2.0 :D
>
> Bruce
>
> >
> > 6. According to github, version 1.2.0 has Aarch64 support
> > [https://github.com/Irqbalance/irqbalance/releases]
> >
> > Thanks
> > RC Reddy
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>

--001a114a6f406795ab055dc13da3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bruce,<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 1. I downloaded 1.2.0 version and i tried to build on AARCH64 compil=
er and i see compilation failure.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 2. issue is fixed on Jan 15 and file is compressed and pu=
t as release on Jan 10. In other words, release 1.2.0 does <b>NOT </b>compi=
le with AARCH64 same way as 1.1.0. [unless someone goes and fix in=C2=A0</d=
iv><div><br></div><div>vi tmp/work/aarch64-xilinx-linux/irqbalance/1.2.0-r0=
/irqbalance-1.2.0/procinterrupts.c<br></div><div><br></div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3. I have written to Author of new r=
elease package. I will await his response and post patch.</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4. Let me know of other alternati=
ves.=C2=A0</div><div><br></div><div>Thanks</div><div>RC Reddy</div></div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Nov 10, 201=
7 at 10:48 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce=
.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Fri, Nov 1=
0, 2017 at 9:43 PM, Ravi chandra reddy &lt;<a href=3D"mailto:vlsireddy@gmai=
l.com">vlsireddy@gmail.com</a>&gt; wrote:<br>
&gt; Hi All,<br>
&gt;<br>
&gt; 1. based on this link<br>
&gt;<br>
&gt; <a href=3D"http://layers.openembedded.org/layerindex/branch/master/lay=
er/meta-virtualization/" rel=3D"noreferrer" target=3D"_blank">http://layers=
.openembedded.<wbr>org/layerindex/branch/master/<wbr>layer/meta-virtualizat=
ion/</a><br>
&gt;<br>
&gt; 2. i see the irqbalance is of version 1.1.0 [Dec 4, 2015]<br>
&gt;<br>
&gt; 3. Building meta-virtualization library for irqbalance failed for AARH=
C64.<br>
&gt;<br>
&gt; 4. The Issue is simple bug [i fixed in my downloaded, untar&#39;ed cod=
e],looks<br>
&gt; someone also fixed the code and new version 1.2.0 does include this fi=
x.<br>
&gt;<br>
&gt; [<a href=3D"https://github.com/Irqbalance/irqbalance/commit/1dccd034a9=
0b2f0221423632de65cbf84d05ebfb#diff-69b8dbcfbbf11746aa38c26a4604e551" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/<wbr>Irqbalance/irqbal=
ance/commit/<wbr>1dccd034a90b2f0221423632de65cb<wbr>f84d05ebfb#diff-<wbr>69=
b8dbcfbbf11746aa38c26a4604e5<wbr>51</a>]<br>
&gt;<br>
&gt; 5. Is there any reason why irqbalance is NOT updated to 1.2.0 in<br>
&gt; meta-virtualization.<br>
<br>
</span>Nope, no reason.<br>
<br>
Send a patch to upgrade it, and it&#39;ll be 1.2.0 :D<br>
<br>
Bruce<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; 6. According to github, version 1.2.0 has Aarch64 support<br>
&gt; [<a href=3D"https://github.com/Irqbalance/irqbalance/releases" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/<wbr>Irqbalance/irqbalance=
/releases</a><wbr>]<br>
&gt;<br>
&gt; Thanks<br>
&gt; RC Reddy<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@<wbr>yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/=
listinfo/meta-<wbr>virtualization</a><br>
&gt;<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</font></span></blockquote></div><br></div>

--001a114a6f406795ab055dc13da3--
