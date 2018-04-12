Return-Path: <fabio.berton@ossystems.com.br>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F359E00857; Thu, 12 Apr 2018 07:53:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.214.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCA73E00708
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Apr 2018 07:53:33 -0700 (PDT)
Received: by mail-it0-f52.google.com with SMTP id b5-v6so7689235itj.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Apr 2018 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qwPjuOeJtYmADuqXTAzEtYCGmi1YoNx19TtCh6Xct24=;
	b=IhwRsX1KrFScWi+B8dsYB668dVCsC888zEOELrQNu7EZ3AgAvfBhFD6HuPB65plgZ6
	ChBTotRI0MzriaFLaePQy4SshranieuIgjGY6lKiF6CZC3r+c++lvgl8FS1tU05Vz7qk
	EHsl/CwWP6a8tHhKhrkPwVxXC4vfGsa2OIDKTRKADLsdrnVFftPmfv+KhCd93zOh0PmH
	YKLC7TJEd9U04YCOaRZ4caLS2jkSNSGcb6qhrEgvHRZ63zPzQmEEwh6Sc1OF9apW7+Y3
	G9oRKirEIEN2UGPsglhfJUkj/Y668gRfImMoUzZ5GSrruEvV2hHSgssxwrwk9cOmdQ8W
	d/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qwPjuOeJtYmADuqXTAzEtYCGmi1YoNx19TtCh6Xct24=;
	b=qTc77Rka19VLM82RYsQXZUy6x4uyK9TUKwFqVIkUaYYyNNsgD4mmruOgMTmSIBDMe7
	l8NRJJiCuweNQ+cR+ytCAsLbkFQ43f//mR7cZpjUwICq3mjArx7LilnIj6h2LyC3LGNy
	Gays2XonjJp1Vjrflm3X8RgncJXiQyzUmDn+4cFruNReulsYaKjiRXFnaWYetQEVANSL
	n/fR/Le+oEcs42J5Bl25HNzxMI7pdIeGaFc8/I+zyGhI9KIdLEBDjlSkN0Vo4pXOC8Cs
	/nXxlCXur19WtfNIdamJMFRe7ThJ6W2PZAdFz/IubgVxTvPcJpofp+Q4O8Z/74HiEWhX
	PAhg==
X-Gm-Message-State: ALQs6tCrE5IsO1LF/Piu0LqRb2W0sudtpE5yMpJmzaS3GseasZAvtZkT
	Xo2HyCEx38ez68qsn9fuLZNyu3Tn86Z1LS2ksi39tQ==
X-Google-Smtp-Source: AIpwx48wAx5BzXzoJQYEP3tJazdR9NYp5grdc54ym+winiYU54wrioXSWjCNfPN+gyed4qNX1L1wjQ/q/cwtSiTU5kw=
X-Received: by 2002:a24:770c:: with SMTP id
	g12-v6mr1329870itc.137.1523544813105; 
	Thu, 12 Apr 2018 07:53:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.204 with HTTP; Thu, 12 Apr 2018 07:53:12 -0700 (PDT)
X-Originating-IP: [177.194.217.140]
In-Reply-To: <CADkTA4N48OksSNJrEYhdOf-34ForTLMUPes3QCyHQBkG2t8TUg@mail.gmail.com>
References: <20180322032718.353177-1-yunguo.wei@windriver.com>
	<CADkTA4N48OksSNJrEYhdOf-34ForTLMUPes3QCyHQBkG2t8TUg@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Thu, 12 Apr 2018 11:53:12 -0300
Message-ID: <CAAPZna0qO06oe4s_JWXJ1YxGrZvJrWukuiu-tt1=ny6s6vZWHw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] go-fsnotify: switch to new repository on github
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
X-List-Received-Date: Thu, 12 Apr 2018 14:53:35 -0000
Content-Type: multipart/alternative; boundary="000000000000628f800569a7ebfa"

--000000000000628f800569a7ebfa
Content-Type: text/plain; charset="UTF-8"

Hi!

Can this be backported to krogoth?

On Thu, Mar 22, 2018 at 2:02 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> merged.
>
> Bruce
>
> On Wed, Mar 21, 2018 at 11:27 PM, Yunguo Wei <yunguo.wei@windriver.com>
> wrote:
> > fsnotify is changed to new repository on gihub, so adapt this chanage
> > accordingly to avoid fetch failure.
> >
> > Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
> > ---
> >  recipes-devtools/go/go-fsnotify_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-devtools/go/go-fsnotify_git.bb
> b/recipes-devtools/go/go-fsnotify_git.bb
> > index e5bcf14..1d9fbdc 100644
> > --- a/recipes-devtools/go/go-fsnotify_git.bb
> > +++ b/recipes-devtools/go/go-fsnotify_git.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
> c38914c9a7ab03bb2b96d4baaee10769"
> >
> >  SRCNAME = "fsnotify"
> >
> > -PKG_NAME = "github.com/go-fsnotify/${SRCNAME}"
> > +PKG_NAME = "github.com/fsnotify/${SRCNAME}"
> >  SRC_URI = "git://${PKG_NAME}.git"
> >
> >  SRCREV = "836bfd95fecc0f1511dd66bdbf2b5b61ab8b00b6"
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--000000000000628f800569a7ebfa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi!</div><div class=3D"gmail_default" style=3D=
"font-family:monospace,monospace;font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-family:monospace,monospace;font-size:small">Can=
 this be backported to krogoth?</div></div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On Thu, Mar 22, 2018 at 2:02 AM, Bruce Ashfield <=
span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"=
_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">merged.<br>
<br>
Bruce<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Wed, Mar 21, 2018 at 11:27 PM, Yunguo Wei &lt;<a href=3D"mailto:yunguo.w=
ei@windriver.com">yunguo.wei@windriver.com</a>&gt; wrote:<br>
&gt; fsnotify is changed to new repository on gihub, so adapt this chanage<=
br>
&gt; accordingly to avoid fetch failure.<br>
&gt;<br>
&gt; Signed-off-by: Yunguo Wei &lt;<a href=3D"mailto:yunguo.wei@windriver.c=
om">yunguo.wei@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-devtools/go/<a href=3D"http://go-fsnotify_git.bb" rel=3D=
"noreferrer" target=3D"_blank">go-<wbr>fsnotify_git.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/recipes-devtools/go/<a href=3D"http://go-fsnotify_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-<wbr>fsnotify_git.bb</a> b/recipes=
-devtools/go/<a href=3D"http://go-fsnotify_git.bb" rel=3D"noreferrer" targe=
t=3D"_blank">go-<wbr>fsnotify_git.bb</a><br>
&gt; index e5bcf14..1d9fbdc 100644<br>
&gt; --- a/recipes-devtools/go/<a href=3D"http://go-fsnotify_git.bb" rel=3D=
"noreferrer" target=3D"_blank">go-<wbr>fsnotify_git.bb</a><br>
&gt; +++ b/recipes-devtools/go/<a href=3D"http://go-fsnotify_git.bb" rel=3D=
"noreferrer" target=3D"_blank">go-<wbr>fsnotify_git.bb</a><br>
&gt; @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>c=
38914c9a7ab03bb2b96d4baaee107<wbr>69&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCNAME =3D &quot;fsnotify&quot;<br>
&gt;<br>
&gt; -PKG_NAME =3D &quot;<a href=3D"http://github.com/go-fsnotify/${SRCNAME=
}" rel=3D"noreferrer" target=3D"_blank">github.com/go-fsnotify/${<wbr>SRCNA=
ME}</a>&quot;<br>
&gt; +PKG_NAME =3D &quot;<a href=3D"http://github.com/fsnotify/${SRCNAME}" =
rel=3D"noreferrer" target=3D"_blank">github.com/fsnotify/${<wbr>SRCNAME}</a=
>&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://${PKG_NAME}.git&quot;<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;<wbr>836bfd95fecc0f1511dd66bdbf2b5b<wbr>61ab8b0=
0b6&quot;<br>
&gt; --<br>
&gt; 2.11.0<br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@<wbr>yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/=
listinfo/meta-<wbr>virtualization</a><br>
<br>
<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div></div></blockquote></div><br></div>

--000000000000628f800569a7ebfa--
