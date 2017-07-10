Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1D34E00BC2; Mon, 10 Jul 2017 08:49:13 -0700 (PDT)
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
	*      [209.85.215.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.42 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6868BE00B8B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jul 2017 08:49:11 -0700 (PDT)
Received: by mail-lf0-f42.google.com with SMTP id h22so65176618lfk.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jul 2017 08:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wyp4si4ZkTG+2CmP1m5fAVcPb4Tzi2AXH8Hc5wOKmr8=;
	b=dkXOy/MCDDVWqbZLa43PngwNXQFpsYzrFmHY45C/FKcX4LzzHg/a7QR6jX/+TQSICl
	doj1bc/BxPLXD4hwcn0jVHoXRhqn/RJE4RnUID12GtqPVKc3HbvbjSUi7v4FAFP9c0Q/
	YGjOK5h/W6uaqS8YACT22hu63dE63TVlrY5FjyUUdhxFhYOkvodoHfLnzjF755KPEhzz
	Olu+T6SDb+K0gyfnB+r4D7o2bVVEj+HdMHLsb52dvT/OcqK2dbKswg/61yqMUyOFU1HS
	sz3SSIUWGJu5z4zDFcmcsM4sT83TIRJB/u0cmG2gfnkDSO8b6jWORMs7ymqlWpaeaUJ3
	gdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wyp4si4ZkTG+2CmP1m5fAVcPb4Tzi2AXH8Hc5wOKmr8=;
	b=H/ZYSlv5NE6FJvy9AcY5AUFSErzaJWpvg8xpxhp5D11PUosZFX/Y76rFg0aBgqdua9
	RQ8dMugNOXzGXh5RSC+9e8/eqOKNl+NOeYWoz5PKeeeTMxd3tXlUltw/5rTuiuW6eEjI
	XbdOy8Y+9dSzF7KxP4CG4e6Ft0yOVctxsa7G8RxsJUqIOaG6mPLxMgY+AgUWeQfJPOPg
	KEkcyMSPiryWeIJJ8J1xxnKp19k+xwY22DKJQKIltH8N5+YPfZRbQz0WTAUBdtiFKhCy
	U1GjdCSDxiCKrOmD6ruAllKxF/zM0D0V2vjprJJZndx0QULPv5EpOF0qt4A56iZyU1jJ
	ggPA==
X-Gm-Message-State: AIVw1124qkeASzN+8+xi99kYRfqaJn2ERRLFqo4wAXmDc9NVOMoCxdYF
	wJ6ohC2uGQAC+ZPpsk4QCSX7uc0f2A==
X-Received: by 10.25.192.2 with SMTP id q2mr1738394lff.120.1499701750154; Mon,
	10 Jul 2017 08:49:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Mon, 10 Jul 2017 08:49:09 -0700 (PDT)
In-Reply-To: <DB5PR08MB0774FB29A185E93873FCE5F68ED50@DB5PR08MB0774.eurprd08.prod.outlook.com>
References: <DB5PR08MB0774FB29A185E93873FCE5F68ED50@DB5PR08MB0774.eurprd08.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Jul 2017 11:49:09 -0400
Message-ID: <CADkTA4NvNtp=VQtHdeVydwv1eWUZBekiCi91v05gS3PNv8Hmdw@mail.gmail.com>
To: Pieter Cardoen <pieter.cardoen@hotmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Container not found error
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
X-List-Received-Date: Mon, 10 Jul 2017 15:49:13 -0000
Content-Type: multipart/alternative; boundary="f403045e5612164dc80553f88668"

--f403045e5612164dc80553f88668
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 6, 2017 at 12:23 PM, Pieter Cardoen <pieter.cardoen@hotmail.com>
wrote:

> Dear
>
> When I start a container using this command:
>
>  docker run -it alpine /bin/sh
>
> I got an error:
>
> ERRO[0231] Handler for POST /v1.24/containers/
> 321f74a7c7ecc1614f62973dede2392dbcdd3a5ee995e04b5ae472c9c1ab6e6c/resize
> returned error: rpc error: code = 2 desc = containerd: container not found
>
> WARN[0231] failed to close stdin: rpc error: code = 2 desc = containerd:
> container not found
>
> I can't find a solution to start my containers.
>

I just constructed and ran a docker container on my target without any
issues.

Have you gotten any further in debugging this ?

What target/configuration/branch are you running ?

Bruce


>
> Thanks
> Pieter
>
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

--f403045e5612164dc80553f88668
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jul 6, 2017 at 12:23 PM, Pieter Cardoen <span dir=3D"ltr">&lt;<=
a href=3D"mailto:pieter.cardoen@hotmail.com" target=3D"_blank">pieter.cardo=
en@hotmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Dear=
<br>
<br>
When I start a container using this command:<br>
<br>
=C2=A0docker run -it alpine /bin/sh<br>
<br>
I got an error:<br>
<br>
ERRO[0231] Handler for POST /v1.24/containers/<wbr>321f74a7c7ecc1614f62973d=
ede239<wbr>2dbcdd3a5ee995e04b5ae472c9c1ab<wbr>6e6c/resize returned error: r=
pc error: code =3D 2 desc =3D containerd: container not found<br>
<br>
WARN[0231] failed to close stdin: rpc error: code =3D 2 desc =3D containerd=
: container not found<br>
<br>
I can&#39;t find a solution to start my containers.<br></blockquote><div><b=
r></div><div>I just constructed and ran a docker container on my target wit=
hout any issues.=C2=A0</div><div><br></div><div>Have you gotten any further=
 in debugging this ?</div><div><br></div><div>What target/configuration/bra=
nch are you running ?</div><div><br></div><div>Bruce</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Thanks<br>
<span class=3D"HOEnZb"><font color=3D"#888888">Pieter<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--f403045e5612164dc80553f88668--
