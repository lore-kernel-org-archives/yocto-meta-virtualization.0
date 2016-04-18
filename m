Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45BF7E00F04; Mon, 18 Apr 2016 11:18:35 -0700 (PDT)
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
	*      [209.85.218.51 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 813DAE00C8D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Apr 2016 11:18:33 -0700 (PDT)
Received: by mail-oi0-f51.google.com with SMTP id x201so32882217oif.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Apr 2016 11:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=0jiXrq4ib+KUOnVFHD6wlKAx4EzZmpYesn2WUp6f6NM=;
	b=hHcieFWRGAoafHHuyrTCA5rgIibVXQFEdbYqgr4i6ejMtWFfRI9Lv+9QUh8kGhcan0
	5lpFMQHmADkFoKsf3IQblf7zwfccxIsgZMPAO5+RxTTA/IgWvri2GAfrLZn8CEjVKqu6
	Ha6cabn2FIopWi6MFKKzcRKysmAJgaQbf+wH5fwqIbACvHlAqXxJBibYyKXAsGo8NBF4
	+1jjam2yf+ndBJP7heiIbnyhxU5aQxfR6dyNFGQOnkQ0WlPq6vek+/IgEJsc3Ycg7gt8
	DbAhDgBdGc1zWtFjJCMWzgS6nEvokCPCqDBmJ7hxhE3RxUkV+kH7PUB4JkQAo4Pi9yxw
	9msw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=0jiXrq4ib+KUOnVFHD6wlKAx4EzZmpYesn2WUp6f6NM=;
	b=e0wiQwCDYd3XCLPDqgzT1N/Ew4kyPylJKUe0oDb7p28OIfMqarHZP95P61v+naj8xL
	avPfpF440uzFW2wFT2TThZLDKXFcK7CdJRXPV+tIxGfIiahYilaS1qJjlVO2LS820KP1
	ZWCfCfBRovTc58wVW8SfhIuTt95BNvPttJgcvnMwcFOU6wgF0Y3Lj6CxYUiC4DREeF2z
	FIhX6gUR7KTNNaJxJmOS+vVntYXDPsw8Cr1MXDdiz9MLK5xdITFkwanYokka+syGPW4G
	HPoijrK4OUT8WWr/zyO2bjRhELnXRPFqdiwP4XvQzh1b5XH3OpRcOK4R3OPebs5O/2U9
	3zAw==
X-Gm-Message-State: AOPr4FV0ZOP27cila0BhtXKT4gmnrNFvcpeNWR9Jq2U+vmzLGnLbAULSmANgTLVJVlZ/H7aie1W2LOB2VhOIUA==
MIME-Version: 1.0
X-Received: by 10.202.190.65 with SMTP id o62mr16588498oif.109.1461003512755; 
	Mon, 18 Apr 2016 11:18:32 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Mon, 18 Apr 2016 11:18:32 -0700 (PDT)
In-Reply-To: <1460961953-22532-1-git-send-email-zhe.he@windriver.com>
References: <1460961953-22532-1-git-send-email-zhe.he@windriver.com>
Date: Mon, 18 Apr 2016 14:18:32 -0400
Message-ID: <CADkTA4PKaUBnX6iyP+LOJo3KohowEJAj--u5tg4wQ0O_GNJOzQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: ptest: Fix python path
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
X-List-Received-Date: Mon, 18 Apr 2016 18:18:35 -0000
Content-Type: multipart/alternative; boundary=001a113d706264f0cc0530c6635e

--001a113d706264f0cc0530c6635e
Content-Type: text/plain; charset=UTF-8

Looks like the patch to the actual recipe is missing. Can you resend ?
Right now,
there's no way to apply this.

Bruce

On Mon, Apr 18, 2016 at 2:45 AM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> For now PYTHON just happens to be the same as TARGET_PYTHON so we get the
> right
> python binary. This patch sets PYTHON to TARGET_PYTHON since ptest is
> going to
> be run on target.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  tests/atlocal.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/atlocal.in b/tests/atlocal.in
> index 5815c6c..db2d2c9 100644
> --- a/tests/atlocal.in
> +++ b/tests/atlocal.in
> @@ -5,7 +5,7 @@ EGREP='@EGREP@'
>  PERL='@PERL@'
>
>  if test x"$PYTHON" = x; then
> -    PYTHON='@PYTHON@'
> +    PYTHON='@TARGET_PYTHON@'
>  fi
>
>  PYTHONPATH=$abs_top_srcdir/python:$abs_top_builddir/tests:$PYTHONPATH
> --
> 1.9.1
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

--001a113d706264f0cc0530c6635e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like the patch to the actual recipe is missing. Can =
you resend ? Right now,<div>there&#39;s no way to apply this.</div><div><br=
></div><div>Bruce</div><div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On Mon, Apr 18, 2016 at 2:45 AM,  <span dir=3D"ltr">&lt;<a href=
=3D"mailto:zhe.he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: He Zhe &lt;<a hr=
ef=3D"mailto:zhe.he@windriver.com">zhe.he@windriver.com</a>&gt;<br>
<br>
For now PYTHON just happens to be the same as TARGET_PYTHON so we get the r=
ight<br>
python binary. This patch sets PYTHON to TARGET_PYTHON since ptest is going=
 to<br>
be run on target.<br>
<br>
Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
---<br>
=C2=A0tests/<a href=3D"http://atlocal.in" rel=3D"noreferrer" target=3D"_bla=
nk">atlocal.in</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/tests/<a href=3D"http://atlocal.in" rel=3D"noreferrer" target=
=3D"_blank">atlocal.in</a> b/tests/<a href=3D"http://atlocal.in" rel=3D"nor=
eferrer" target=3D"_blank">atlocal.in</a><br>
index 5815c6c..db2d2c9 100644<br>
--- a/tests/<a href=3D"http://atlocal.in" rel=3D"noreferrer" target=3D"_bla=
nk">atlocal.in</a><br>
+++ b/tests/<a href=3D"http://atlocal.in" rel=3D"noreferrer" target=3D"_bla=
nk">atlocal.in</a><br>
@@ -5,7 +5,7 @@ EGREP=3D&#39;@EGREP@&#39;<br>
=C2=A0PERL=3D&#39;@PERL@&#39;<br>
<br>
=C2=A0if test x&quot;$PYTHON&quot; =3D x; then<br>
-=C2=A0 =C2=A0 PYTHON=3D&#39;@PYTHON@&#39;<br>
+=C2=A0 =C2=A0 PYTHON=3D&#39;@TARGET_PYTHON@&#39;<br>
=C2=A0fi<br>
<br>
=C2=A0PYTHONPATH=3D$abs_top_srcdir/python:$abs_top_builddir/tests:$PYTHONPA=
TH<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
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
</div></div></div>

--001a113d706264f0cc0530c6635e--
