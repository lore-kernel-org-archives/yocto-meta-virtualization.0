Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68311E00EED; Mon, 18 Apr 2016 11:17:50 -0700 (PDT)
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
	*      [209.85.214.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B48C9E00C8D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Apr 2016 11:17:46 -0700 (PDT)
Received: by mail-ob0-f181.google.com with SMTP id bg3so101252280obb.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Apr 2016 11:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=HdtPFAxDAnFygmZAbHuAjm//mCb24/5zeMEDLFQfSvs=;
	b=cGnd8gugPhV/ZO/JNvI5lnR95sVlCxBAaRPl5iHDsJKvSQVbZ2yoz7Agai/8trAOsW
	nBjcdjr7QL9llCyvMinVokmYfXZ14S7M2GCAtSpk+ib3P+G7v3PL+8dbKwkLtpQV8ZnN
	JaWcC7pcbvBbMZr0JdeWf20uPIHgLYtid/LJ8Tx1X33TVwPdpRdaDI4aWLEpqc9wUqNp
	IZhD3E/uPRzA81MqLLOrMy5oumq7yd6UYM674UKHrqykdJrbnvnLkC9gUzliS6ugTCup
	vDIwjo7S0vPsc3ZHfW3+psTVlKM3yYNY8iJcpx4HpDxIJH2nOMVJlzWxntBUYEEar7wB
	DR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=HdtPFAxDAnFygmZAbHuAjm//mCb24/5zeMEDLFQfSvs=;
	b=ddqt081oMW42Gw2aNqv5tb0D6hS9ZtrOcP8hu7jOkUn2MPIk/o5/Eg6nEbogY1Q3ZB
	vxayzexsmwxHQV8zvF0//blW71807hi8mJAeD10IWMlYeo44yC/Y2VarcyJIw1U7ekfJ
	R8lSjC7X/Wu/IOOOrrb8trBYJZnINvhJy5AAcb+ABCut9bx2g2oyYcZEZC7HKeVaegwX
	wl971kCGCFDQ5cSemvaqO4G6OBxOoVWgPOzCbw6ab64hSsWutw8WCsWN+hkYpfvS5fnd
	/CQI+yT3fzMS4EHgVoIifcmZR0nfeBgp8jfbkVt6UUljvGCmQdi5RuZjZ57ZsKoNZkuE
	1png==
X-Gm-Message-State: AOPr4FWFTn5r+sgFMpl2meXX+eFEGbR7OxLlO2nypV3Cwv/p0pNhcd5GnG7qJsLzfNTqsmhU21SRXeKcQaB1pQ==
MIME-Version: 1.0
X-Received: by 10.60.118.73 with SMTP id kk9mr6727157oeb.64.1461003465809;
	Mon, 18 Apr 2016 11:17:45 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Mon, 18 Apr 2016 11:17:45 -0700 (PDT)
In-Reply-To: <1460681694-16457-1-git-send-email-derek@asterius.io>
References: <1460681694-16457-1-git-send-email-derek@asterius.io>
Date: Mon, 18 Apr 2016 14:17:45 -0400
Message-ID: <CADkTA4MC7hkUXuirs4tgd2sjM5yCM_KW=ALEYtW-PHOCVnRCnQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] dev86: update to version 0.16.20
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
X-List-Received-Date: Mon, 18 Apr 2016 18:17:50 -0000
Content-Type: multipart/alternative; boundary=047d7b41cbcc9885ae0530c660b5

--047d7b41cbcc9885ae0530c660b5
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Thu, Apr 14, 2016 at 8:54 PM, Derek Straka <derek@asterius.io> wrote:

> Also supress the warnings about executables being already stripped
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  recipes-extended/dev86/{dev86_0.16.19.bb => dev86_0.16.20.bb} | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename recipes-extended/dev86/{dev86_0.16.19.bb => dev86_0.16.20.bb}
> (82%)
>
> diff --git a/recipes-extended/dev86/dev86_0.16.19.bb
> b/recipes-extended/dev86/dev86_0.16.20.bb
> similarity index 82%
> rename from recipes-extended/dev86/dev86_0.16.19.bb
> rename to recipes-extended/dev86/dev86_0.16.20.bb
> index 0402c99..38dbf8d 100644
> --- a/recipes-extended/dev86/dev86_0.16.19.bb
> +++ b/recipes-extended/dev86/dev86_0.16.20.bb
> @@ -7,8 +7,8 @@ PR="r0"
>
>  SRC_URI="http://v3.sk/~lkundrak/dev86/archive/Dev86src-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "442e98e1afa23fe00d40c5a996385942"
> -SRC_URI[sha256sum] =
> "33398b87ca85e2b69e4062cf59f2f7354af46da5edcba036c6f97bae17b8d00e"
> +SRC_URI[md5sum] = "567cf460d132f9d8775dd95f9208e49a"
> +SRC_URI[sha256sum] =
> "61817a378c8c8ba65f36c6792d457a305dc4eedae8cdc8b6233bf2bb28e5fe8d"
>
>  S = "${WORKDIR}/dev86-${PV}"
>
> @@ -35,3 +35,4 @@ do_install() {
>  }
>  COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
>  FILES_${PN} += "${libdir}/bcc"
> +INSANE_SKIP_${PN} = "already-stripped"
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

--047d7b41cbcc9885ae0530c660b5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, Apr 14, 2016 at 8:54 PM=
, Derek Straka <span dir=3D"ltr">&lt;<a href=3D"mailto:derek@asterius.io" t=
arget=3D"_blank">derek@asterius.io</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Also supress the warnings about executables being already s=
tripped<br>
<br>
Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io">derek@=
asterius.io</a>&gt;<br>
---<br>
=C2=A0recipes-extended/dev86/{<a href=3D"http://dev86_0.16.19.bb" rel=3D"no=
referrer" target=3D"_blank">dev86_0.16.19.bb</a> =3D&gt; <a href=3D"http://=
dev86_0.16.20.bb" rel=3D"noreferrer" target=3D"_blank">dev86_0.16.20.bb</a>=
} | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
=C2=A0rename recipes-extended/dev86/{<a href=3D"http://dev86_0.16.19.bb" re=
l=3D"noreferrer" target=3D"_blank">dev86_0.16.19.bb</a> =3D&gt; <a href=3D"=
http://dev86_0.16.20.bb" rel=3D"noreferrer" target=3D"_blank">dev86_0.16.20=
.bb</a>} (82%)<br>
<br>
diff --git a/recipes-extended/dev86/<a href=3D"http://dev86_0.16.19.bb" rel=
=3D"noreferrer" target=3D"_blank">dev86_0.16.19.bb</a> b/recipes-extended/d=
ev86/<a href=3D"http://dev86_0.16.20.bb" rel=3D"noreferrer" target=3D"_blan=
k">dev86_0.16.20.bb</a><br>
similarity index 82%<br>
rename from recipes-extended/dev86/<a href=3D"http://dev86_0.16.19.bb" rel=
=3D"noreferrer" target=3D"_blank">dev86_0.16.19.bb</a><br>
rename to recipes-extended/dev86/<a href=3D"http://dev86_0.16.20.bb" rel=3D=
"noreferrer" target=3D"_blank">dev86_0.16.20.bb</a><br>
index 0402c99..38dbf8d 100644<br>
--- a/recipes-extended/dev86/<a href=3D"http://dev86_0.16.19.bb" rel=3D"nor=
eferrer" target=3D"_blank">dev86_0.16.19.bb</a><br>
+++ b/recipes-extended/dev86/<a href=3D"http://dev86_0.16.20.bb" rel=3D"nor=
eferrer" target=3D"_blank">dev86_0.16.20.bb</a><br>
@@ -7,8 +7,8 @@ PR=3D&quot;r0&quot;<br>
<br>
=C2=A0SRC_URI=3D&quot;<a href=3D"http://v3.sk/~lkundrak/dev86/archive/Dev86=
src-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://v3.sk/~lkundr=
ak/dev86/archive/Dev86src-${PV}.tar.gz</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;442e98e1afa23fe00d40c5a996385942&quot;<br>
-SRC_URI[sha256sum] =3D &quot;33398b87ca85e2b69e4062cf59f2f7354af46da5edcba=
036c6f97bae17b8d00e&quot;<br>
+SRC_URI[md5sum] =3D &quot;567cf460d132f9d8775dd95f9208e49a&quot;<br>
+SRC_URI[sha256sum] =3D &quot;61817a378c8c8ba65f36c6792d457a305dc4eedae8cdc=
8b6233bf2bb28e5fe8d&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/dev86-${PV}&quot;<br>
<br>
@@ -35,3 +35,4 @@ do_install() {<br>
=C2=A0}<br>
=C2=A0COMPATIBLE_HOST =3D &quot;(i.86|x86_64).*-linux&quot;<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}/bcc&quot;<br>
+INSANE_SKIP_${PN} =3D &quot;already-stripped&quot;<br>
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
</div>

--047d7b41cbcc9885ae0530c660b5--
