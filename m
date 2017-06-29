Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02A33E00B65; Thu, 29 Jun 2017 12:42:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.53 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.53 listed in dnsbl.sorbs.net]
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B96C5E00BF6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jun 2017 12:42:48 -0700 (PDT)
Received: by mail-lf0-f53.google.com with SMTP id h22so58716385lfk.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jun 2017 12:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OOxRBWrItCLERoOxr0rCVdJcxD+3qXfqv0ncpAGaL58=;
	b=koQLVZgiq6LckQHB8asurx5SwQ7h9KpZzY8Jt8jN/YnrT5kHddEIs/o7UxHZ2me9Wq
	fxKrCPHdko0YKsMvtVYU661vTeHX99r/+G2HL2AkctPGOnRtxLSRmgzblBLYOirS3P8y
	5n8RLDvZS3an90z2USm8vM8O/gZgHjmoB+xddx/EYkukL8wRRfVHL9gKQUJttrLPvUbP
	XaIg/xLY6/Dqm9w/S/fnNR7R+bk6/pPA3Zv77iOgUKifzHTbDQs4lKZMhumNAJ8ypQe8
	JQDydOgZoSE2tmniIVsmteyTxT4csnHXBMCbHNPSSVgLe+5Rvg4Yu38sihSdAbm/CS6p
	w6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OOxRBWrItCLERoOxr0rCVdJcxD+3qXfqv0ncpAGaL58=;
	b=mK3Wi05zSAd/psX8aHw3nfYgJyRXJI/s/Gtv1mtkdd2rWuneMcrpIgQZpgOJwMY9fu
	cdE4DkZorfaObuyVTQhI5yfSlcb1MGi4GSUfOVVoOBl/BYRsfnItRFYXEGAE06AOK7SQ
	1pGOEjZfMxIGkAxKsfbOCWSwr4CEEq0H43UI0xCiP26OfQEbbcrEUcgZHQZ1DR8zlrc+
	h8P6baLR9i2QpXY2/jSiz4GB66zs651TSsxZK7w7e7ADzhAhrAhj/xn+E1934SjuNV1x
	VHx6SwJ7dxXLVAud678VMJ8EpzWhX2Iuz8jniELRrjWHQKgjq0sJfjZQYhucxEXV281C
	O8Iw==
X-Gm-Message-State: AKS2vOz5OvVMxxUrFE/s2hUDcQzPL4JsGcln81kaTX5CAk0Lxk+LbZlJ
	d29nz4hM+h/I2uGuIGzCy1y5FanSUw==
X-Received: by 10.46.21.3 with SMTP id s3mr5274604ljd.47.1498765367235; Thu,
	29 Jun 2017 12:42:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Thu, 29 Jun 2017 12:42:46 -0700 (PDT)
In-Reply-To: <1498639968-17391-1-git-send-email-zhe.he@windriver.com>
References: <1498639968-17391-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Jun 2017 15:42:46 -0400
Message-ID: <CADkTA4OPOc37q-GnHiS3j7az+cPR+YYNqmH8yRw1TeBW=ZLVkQ@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-pyparsing: Move from meta-openstack to meta-cloud-services
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
X-List-Received-Date: Thu, 29 Jun 2017 19:42:51 -0000
Content-Type: multipart/alternative; boundary="f403045f727850d95505531e815c"

--f403045f727850d95505531e815c
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Jun 28, 2017 at 4:52 AM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> It's not an openstack specific package.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  .../python/python-pyparsing_2.0.1.bb
>   | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename {meta-openstack/recipes-devtools => recipes-devtools}/python/pytho
> n-pyparsing_2.0.1.bb (100%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-
> pyparsing_2.0.1.bb b/recipes-devtools/python/python-pyparsing_2.0.1.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-
> pyparsing_2.0.1.bb
> rename to recipes-devtools/python/python-pyparsing_2.0.1.bb
> --
> 2.8.1
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

--f403045f727850d95505531e815c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Jun 28, 2017 at 4:52 AM=
,  <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"=
_blank">zhe.he@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
<br>
It&#39;s not an openstack specific package.<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
---<br>
=C2=A0.../python/<a href=3D"http://python-pyparsing_2.0.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">python-pyparsing_2.<wbr>0.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A01 file changed, 0 insertions(+), 0 deletions(-)<br>
=C2=A0rename {meta-openstack/recipes-<wbr>devtools =3D&gt; recipes-devtools=
}/python/<a href=3D"http://python-pyparsing_2.0.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">pytho<wbr>n-pyparsing_2.0.1.bb</a> (100%)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-pyparsing_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr=
>pyparsing_2.0.1.bb</a> b/recipes-devtools/python/<a href=3D"http://python-=
pyparsing_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-pypars=
ing_2.0.1.bb</a><br>
similarity index 100%<br>
rename from meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://p=
ython-pyparsing_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>=
pyparsing_2.0.1.bb</a><br>
rename to recipes-devtools/python/<a href=3D"http://python-pyparsing_2.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">python<wbr>-pyparsing_2.0.1.bb</a>=
<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
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
</div>

--f403045f727850d95505531e815c--
