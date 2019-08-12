Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EE9D8E00CD5; Mon, 12 Aug 2019 08:05:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.167.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1760AE00961
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 08:05:10 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id a30so11389602lfk.12
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 08:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MAJ+kpyKGgrZw+jUOaCuj9LOAY9wcGCisj/LNJgm6X4=;
	b=ZP7GCkuHZt8AbXPjZndSb7CdJ0ja2o10zYbbuJf7I3K+349Taz3rTYRikrR5zmGIAN
	9RJPmszrKG4c2vMr9lmCc3afX+4YfnvPajaVAW3cw9UKcalOkNl4tBbd+GpQfSMpenIz
	M0K0hegtDUDf7yT1JzFcvReFRAzIiA6ajWBvLUTL8qmA+kSV0GsOzNJHNnrEoXztZ9hu
	D6ubcEIvftqKqe0PzQXFQUpqd5SEVvReKjdQFmHIdoakVuaWhss3usqJhlBbU++vMV3N
	hB/CmeQwRCIvY+tEyy1LTS4WLJPGvrTZoCG4Mnaj1HcRNCJl2D9ortma15ajlAsNlf2Q
	6Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MAJ+kpyKGgrZw+jUOaCuj9LOAY9wcGCisj/LNJgm6X4=;
	b=TDtEEgi7OnVvuCUC/C2/NflEN7B1dgs3ClbHmVasSmYtoVLYSlYIg3KiCSBCDcuOse
	GAQZVxMT8sNPulSML3h+VHQzG/+iWOXrSFoJnP2rH6uZc3R2fTWNuDRAubCTQ6BGM2cI
	39fEtXN7n+HXzP/9hxMU8/M3ZwDpIYNwVEZJ34Y410PYfg/DV6R9j+IXSGxpXbc56GIV
	xxFFmJyTR9rxf922MAFJHCW1UGd1n4tKDGjFPjgI5WS1Igo9AXr4x66OacksbVs1yOdR
	W5ZkoJS+qUih5ZCTHcAOZ0RvFbBiB90fZELnEwm0J6wMjbiNt1iGvcIJCeCKBB9eLmh7
	EEmQ==
X-Gm-Message-State: APjAAAV2Nc2o7J9ASUKDKRbomEN1pKiiYeuu/EXRtPZlDqUX4ra/b+wz
	GNL8WglZFqBL78vXnl2gazvsLqpcFKPwtEn98nw=
X-Google-Smtp-Source: APXvYqyPzjnaXSMC+HhXBMdxRFd9223a7jxirS07aaDnOVkRKrrYyASAYqtouE1FUfus/kIlRAeDr5TlM2N4qKYP69U=
X-Received: by 2002:ac2:59dd:: with SMTP id x29mr19994069lfn.140.1565622309886;
	Mon, 12 Aug 2019 08:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190809024238.23902-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190809024238.23902-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Aug 2019 11:04:57 -0400
Message-ID: <CADkTA4Ob8sdgMgq+6T41KmnaAvOkw3QkC9BwUOMgHSY94RdG0A@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] irqbalance: upgrade 1.5.0 -> 1.6.0
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
X-List-Received-Date: Mon, 12 Aug 2019 15:05:12 -0000
Content-Type: multipart/alternative; boundary="000000000000a21dc7058fecd938"

--000000000000a21dc7058fecd938
Content-Type: text/plain; charset="UTF-8"

staged in master-next

Bruce

On Thu, Aug 8, 2019 at 10:43 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  recipes-extended/irqbalance/irqbalance_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-extended/irqbalance/irqbalance_git.bb
> b/recipes-extended/irqbalance/irqbalance_git.bb
> index 0571b1b..7755e8e 100644
> --- a/recipes-extended/irqbalance/irqbalance_git.bb
> +++ b/recipes-extended/irqbalance/irqbalance_git.bb
> @@ -4,10 +4,10 @@
>
>  require irqbalance.inc
>
> -# commit tagged as version 1.5.0
> +# commit tagged as version 1.6.0
>  #
> -SRCREV = "e783d132e96a7ccc2a60ac8b87802ab782bb27be"
> -PV = "1.5.0"
> +SRCREV = "b47eea84cbb93f533b0cba2f1aaf9ca4da8706b9"
> +PV = "1.6.0"
>
>  SRC_URI = "git://github.com/Irqbalance/irqbalance \
>             file://add-initscript.patch \
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a21dc7058fecd938
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">sta=
ged in master-next</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Aug 8, 2019 at 10:43 PM Zang Ruochen &lt;<a href=3D"mailto:zan=
grc.fnst@cn.fujitsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">From: Yuan Chao &lt;<a h=
ref=3D"mailto:yuanc.fnst@cn.fujitsu.com" target=3D"_blank">yuanc.fnst@cn.fu=
jitsu.com</a>&gt;<br>
<br>
Signed-off-by: Yuan Chao &lt;<a href=3D"mailto:yuanc.fnst@cn.fujitsu.com" t=
arget=3D"_blank">yuanc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/irqbalance/<a href=3D"http://irqbalance_git.bb" rel=
=3D"noreferrer" target=3D"_blank">irqbalance_git.bb</a> | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-extended/irqbalance/<a href=3D"http://irqbalance_git.b=
b" rel=3D"noreferrer" target=3D"_blank">irqbalance_git.bb</a> b/recipes-ext=
ended/irqbalance/<a href=3D"http://irqbalance_git.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">irqbalance_git.bb</a><br>
index 0571b1b..7755e8e 100644<br>
--- a/recipes-extended/irqbalance/<a href=3D"http://irqbalance_git.bb" rel=
=3D"noreferrer" target=3D"_blank">irqbalance_git.bb</a><br>
+++ b/recipes-extended/irqbalance/<a href=3D"http://irqbalance_git.bb" rel=
=3D"noreferrer" target=3D"_blank">irqbalance_git.bb</a><br>
@@ -4,10 +4,10 @@<br>
<br>
=C2=A0require irqbalance.inc<br>
<br>
-# commit tagged as version 1.5.0<br>
+# commit tagged as version 1.6.0<br>
=C2=A0#<br>
-SRCREV =3D &quot;e783d132e96a7ccc2a60ac8b87802ab782bb27be&quot;<br>
-PV =3D &quot;1.5.0&quot;<br>
+SRCREV =3D &quot;b47eea84cbb93f533b0cba2f1aaf9ca4da8706b9&quot;<br>
+PV =3D &quot;1.6.0&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/Irqbalance/irqba=
lance" rel=3D"noreferrer" target=3D"_blank">github.com/Irqbalance/irqbalanc=
e</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://add-initscript.patch \<br>
-- <br>
2.7.4<br>
<br>
<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--000000000000a21dc7058fecd938--
