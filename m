Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D94F1E01F84; Thu, 14 Jun 2018 01:34:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E31BE01F7B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Jun 2018 01:34:19 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id j13-v6so8055984lfb.13
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Jun 2018 01:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tLgeBgi7h4TcsG9g2MsihMtb3zgygg+KNeJ/BfxxWWI=;
	b=vcCd/bNrGiQ06sKMjoVbEz35ht9fbs/nOC3XzdtYoECwNXfpb6Cu3sjmUPU0YsxykR
	cmWtARLYu2JdJxXCH7i/BZwBvPHDOZHokorfkLaWFtu6xL7XOryGMBSRIQY3UET3B3S2
	al66DDqWGjeS1E9VIJP1iZala98U36LNqoGLjixCFFXfuxnTbiYQbo6y8qp4QFJ9fe46
	L5NcC6C35JUijbCk3a4ugHSHuohSJ+rpSEhy3B+l6EiQObsdDM4S2xAc9VF2WHJWPNov
	/Ex5TU4Gx0VUoHuQqR5I67da/BARRWN5OPeI9bOxXpdt0kWIzqw3K78sxx9dwLy0bebg
	AmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tLgeBgi7h4TcsG9g2MsihMtb3zgygg+KNeJ/BfxxWWI=;
	b=heJOlf5KTDmbcKdhwD0ec+tLApfdNLlhq8OgbuH6ZMV15N9n/jdWOW+pXN4/kOtAMs
	uJVgJkGOMNDwBX5/2U4Z6yEY+75dOJTdAeiIDm7n37Q6gDDgMXrG1P7jBk77QzVn3+VI
	6nY58/X3SbzumE5YFpxo54vDfL6V+ZHk2eZ7BmLiAfzDITYbjntURK5mI72l407PqLhu
	YObw+B0UB3Lg75oNvcXDE3oA+9HalyC8tFcwuyHPbcD+jq4T7B8KfvlrEWstXHji3px/
	89lEdWV4hwIFiK7UREABKXF7x3BEcuVap3Y5SEs/zxd1lYU24j5u7ucp3QXCgv15kKh+
	JkLQ==
X-Gm-Message-State: APt69E1vqp66dys1AGOTaKHIB5DtPVlUsIzz3ssMlW/OKwGLgHoDyfMJ
	NLLdJ1Ce3jTZ7AYQ4oLAI9m/HurhZcoEhPn+fYF+vw==
X-Google-Smtp-Source: ADUXVKLOe17O463gL4YyCF7JO/dblBzaPxGFncItyh3wAxEHumZZCkpYmFzYU8VEj3kD4ZolykfAIv+5nHSWuwzbIIE=
X-Received: by 2002:a19:a892:: with SMTP id
	r140-v6mr5233179lfe.39.1528965258368; 
	Thu, 14 Jun 2018 01:34:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 01:34:17
	-0700 (PDT)
In-Reply-To: <1528934083-8907-1-git-send-email-ricardo@opensourcefoundries.com>
References: <1528934083-8907-1-git-send-email-ricardo@opensourcefoundries.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Jun 2018 04:34:17 -0400
Message-ID: <CADkTA4M-LZoMqqUBstYZxCW30Ba7yvt3yZNso3vfmjKU_JdCJQ@mail.gmail.com>
To: Ricardo Salveti <ricardo@opensourcefoundries.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] tini: fix license
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
X-List-Received-Date: Thu, 14 Jun 2018 08:34:22 -0000
Content-Type: multipart/alternative; boundary="000000000000195a53056e95f7dc"

--000000000000195a53056e95f7dc
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Jun 13, 2018 at 7:54 PM, Ricardo Salveti <
ricardo@opensourcefoundries.com> wrote:

> tini is licensed under the MIT license instead of Apache-2.0.
>
> Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
> ---
>  recipes-containers/tini/tini_0.18.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/tini/tini_0.18.0.bb
> b/recipes-containers/tini/tini_0.18.0.bb
> index 7c124a8..373d886 100644
> --- a/recipes-containers/tini/tini_0.18.0.bb
> +++ b/recipes-containers/tini/tini_0.18.0.bb
> @@ -10,7 +10,7 @@ SRC_URI = " \
>    file://0001-Do-not-strip-the-output-binary-allow-yocto-to-do-thi.patch
> \
>    "
>
> -LICENSE = "Apache-2.0"
> +LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=ffc9091894702bc5dcf4cc0085561ef5"
>
>  S = "${WORKDIR}/git"
> --
> 2.7.4
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

--000000000000195a53056e95f7dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Jun 13, 2018 at 7:54 PM=
, Ricardo Salveti <span dir=3D"ltr">&lt;<a href=3D"mailto:ricardo@opensourc=
efoundries.com" target=3D"_blank">ricardo@opensourcefoundries.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">tini is licensed under the M=
IT license instead of Apache-2.0.<br>
<br>
Signed-off-by: Ricardo Salveti &lt;<a href=3D"mailto:ricardo@opensourcefoun=
dries.com">ricardo@opensourcefoundries.<wbr>com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/tini/<a href=3D"http://tini_0.18.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">tini_<wbr>0.18.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/tini/<a href=3D"http://tini_0.18.0.bb" rel=
=3D"noreferrer" target=3D"_blank">tini<wbr>_0.18.0.bb</a> b/recipes-contain=
ers/tini/<a href=3D"http://tini_0.18.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">tini<wbr>_0.18.0.bb</a><br>
index 7c124a8..373d886 100644<br>
--- a/recipes-containers/tini/<a href=3D"http://tini_0.18.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">tini<wbr>_0.18.0.bb</a><br>
+++ b/recipes-containers/tini/<a href=3D"http://tini_0.18.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">tini<wbr>_0.18.0.bb</a><br>
@@ -10,7 +10,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0file://0001-Do-not-strip-the-<wbr>output-binary-allow-yocto-to=
-<wbr>do-thi.patch \<br>
=C2=A0 =C2=A0&quot;<br>
<br>
-LICENSE =3D &quot;Apache-2.0&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>ffc9091894702bc5=
dcf4cc0085561e<wbr>f5&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.7.4<br>
<br>
-- <br>
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

--000000000000195a53056e95f7dc--
