Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6AF73E00EE7; Fri, 20 May 2016 09:38:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02408E00CE1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 May 2016 09:38:19 -0700 (PDT)
Received: by mail-oi0-f53.google.com with SMTP id v145so187283202oie.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 May 2016 09:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=dBicYslsPHUykjatodP4JMlbox4RHbd8QHXYA5j2iAU=;
	b=ugt4sKC8Srgd2YRKNCozY4Spmd67MOLAfImZejJuYN2RVjdEU/+3kx3XxCkgpC5lXE
	zn7EBlYBD+fKlPmk6d6mYRWs2N0T35RcimTi6SJRL8ZxODOXJicuYqZj1jwN3RTEn8r7
	IjlwHyVaceHsBdIEb1fCVAgb1wlevo9OQxj5WlJmFz0u8+mh5xVemBBvEOBUNrQk5CHx
	sOZE8B9ySAziqC2Nd+XJdLwo1SkJPTOozMfnRHkZHoA2I2CQrDWkrTqytPU3aVPCGqiQ
	bxp+kkZ6i32jAVMd9hhc56KS+Y2yB0rkcPoWotwRY8haFO4FGQfWMOY4ObhyDjpVKTFi
	7mNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=dBicYslsPHUykjatodP4JMlbox4RHbd8QHXYA5j2iAU=;
	b=ca9lgqnY2TpSBTPFG9QNQNbUX2uY81xDY6tfzyx6+u8Nm6o1Q4Yul3ZgKC2DT64evm
	g6D2dPE5US6G4Gi1s0ApgXQOM+UsCl5eP4/gmc8LvDrodY093xfp4jZe7pkCCgf0Q8jl
	6TNQNibb1iS+Q/LSFfxypRb/nEaOlIaGFqMyNwXyaHzt119THIsJ3qsgBe1nQDV5qzQ2
	2gN6k3RrmZuy2tUhCJooaJVW48CMxlYMKeXsfhdyT+qYNbwUeXVPMvusxXH6E2U7XN8K
	ZEATC42nWgjoNVCmsowKnmJGXpJM3fTkKoOGXjbPCkyoaG+CCbtCYscmMfsGHz8cwPmJ
	lYXw==
X-Gm-Message-State: AOPr4FWf3XDPdD8kVGCHbnDBnArEopIaYEk+3Oi5RQ9fNrNXx40WXi6Hw+5LJjSmrrlcsABtAtAlRalLdSf2rg==
MIME-Version: 1.0
X-Received: by 10.157.16.27 with SMTP id h27mr2726256ote.118.1463762299051;
	Fri, 20 May 2016 09:38:19 -0700 (PDT)
Received: by 10.157.32.198 with HTTP; Fri, 20 May 2016 09:38:19 -0700 (PDT)
In-Reply-To: <1463727448-32195-1-git-send-email-zumeng.chen@windriver.com>
References: <1463727448-32195-1-git-send-email-zumeng.chen@windriver.com>
Date: Fri, 20 May 2016 12:38:19 -0400
Message-ID: <CADkTA4PWOvm1mfOsaa1pq4R6BgpSMH0Wkc3mWzpF+25RazF_Cg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zumeng Chen <zumeng.chen@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Two patches for protobuf and criu
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
X-List-Received-Date: Fri, 20 May 2016 16:38:21 -0000
Content-Type: multipart/alternative; boundary=001a113dffc0dee673053348b7bf

--001a113dffc0dee673053348b7bf
Content-Type: text/plain; charset=UTF-8

On Fri, May 20, 2016 at 2:57 AM, Zumeng Chen <zumeng.chen@windriver.com>
wrote:

> Hi Bruce,
>
> I wonder if these two patches are fit for meta-virtualization, please
> help me to take a look, thanks a lot~
>

I've merged both patches to master.

I'm in the process of trying to drop protobuf* from meta-virtualization
since it is now being
updated in meta-oe. But meta-oe is at 2.6.1 which won't serve the needs of
meta-virt .. so
the dropping of the same version in meta-oe (2.6.1) and the re-introduction
of 2.5.x makes
sense.

Bruce


>
> Cheers,
> Zumeng
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

--001a113dffc0dee673053348b7bf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, May 20, 2016 at 2:57 AM, Zumeng Chen <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:zumeng.chen@windriver.com" target=3D"_blank">zumeng.chen@wind=
river.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Bruce=
,<br>
<br>
I wonder if these two patches are fit for meta-virtualization, please<br>
help me to take a look, thanks a lot~<br></blockquote><div><br></div><div>I=
&#39;ve merged both patches to master.</div><div><br></div><div>I&#39;m in =
the process of trying to drop protobuf* from meta-virtualization since it i=
s now being</div><div>updated in meta-oe. But meta-oe is at 2.6.1 which won=
&#39;t serve the needs of meta-virt .. so</div><div>the dropping of the sam=
e version in meta-oe (2.6.1) and the re-introduction of 2.5.x makes</div><d=
iv>sense.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<br>
Cheers,<br>
Zumeng<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a113dffc0dee673053348b7bf--
