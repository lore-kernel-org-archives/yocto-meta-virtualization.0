Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 27247E00CCB; Tue, 22 Aug 2017 19:40:00 -0700 (PDT)
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
	*      [209.85.217.171 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.217.171 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17C33E00B8E
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 19:39:58 -0700 (PDT)
Received: by mail-ua0-f171.google.com with SMTP id j45so1519425uaf.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 19:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ieEDeAcEo8W7U2ZE2S29ure+4e1HuV2QSdOw6cSGFwU=;
	b=KNwmicFP1ZAcU9khzzW8ggz8XwXJehodzWQGwkXBaAWBTOhGMoi6d0eCgceVQ23FKb
	5vJ289LgF9dCDucBQ4FqOzZ5FfP1rG2LRBrbj/ZnxQ261HI2zO0NMIicQrkW+uf30dOO
	IR8AbzOfMl6v/jkyrsMDujcXKov2l+HGO2s44wzAfUhK+Cm1pRQT+HoJn2xyYk7CsGN5
	nwrYI+nC1ckgM3iYfzJbRCAX9pUNxkTFf6XlsAmSBllMQJlOlO11ygDH24FT2VnAjVC9
	QtEMVvZ8cRpbX3Fn/AcqSrXfr6AUWwNLyAnvSZ7+GCmdAOvL5+ISFMnuKz7PrkmwVDpB
	dp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ieEDeAcEo8W7U2ZE2S29ure+4e1HuV2QSdOw6cSGFwU=;
	b=DwuOVHZNl50TtqJ04gZswcOaDvZx/0LyDJBZ9qCLN/Eg+O+vo+0caGKEp888LMz2B+
	vjKaFbs2do2q8JO5pxQEkMz056XDwyx5wgIkSLuw2Sa1svn6TMc6zp54SUlv4MGWnxjX
	OJsfA/WZx+1X6EOLn/qGe+IJkoiwtgBZpVHkTBxp001cuqlejN12jcYRGU0+cZR0Rrrd
	pV/ZyFWBoK2igkzfnhbIk0hTXPm2Kj3QHsQDHHvGcpyOrcQiNSnovSP6yG4mHgsI+TvT
	RXf7JvjhJpxSS2Z+mpsZCF7aoKhGQ+7bGjd4l7fDORp9g7lfD3AUkZuhzoyLUFDj+Cfj
	CnmQ==
X-Gm-Message-State: AHYfb5it+bYnDuplxjiPzQjxrjJqCAxqOvEBIBK1G/PA0jM3u4H1ZkPQ
	HXOuSLlIyLBinaXfbMf70TjT/vKynA==
X-Received: by 10.176.23.77 with SMTP id k13mr796206uaf.128.1503455998037;
	Tue, 22 Aug 2017 19:39:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Tue, 22 Aug 2017 19:39:57 -0700 (PDT)
In-Reply-To: <20170822155002.57793-1-jason.wessel@windriver.com>
References: <20170822155002.57793-1-jason.wessel@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 22 Aug 2017 22:39:57 -0400
Message-ID: <CADkTA4MxkTD2C9-7Qx3Bw_-AiO7qm+XgdpV2E9oG5EODznmt4A@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] go-systemd: Fix QA dependency problem
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
X-List-Received-Date: Wed, 23 Aug 2017 02:40:00 -0000
Content-Type: multipart/alternative; boundary="f4030436207eb2d760055762a0f2"

--f4030436207eb2d760055762a0f2
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Aug 22, 2017 at 11:50 AM, Jason Wessel <jason.wessel@windriver.com>
wrote:

> ERROR: go-systemd-4+gitb4a58d95188dd092ae20072bac14cece0e67c388-r0
> do_package_qa: QA Issue:
> /usr/local/go/src/github.com/coreos/go-systemd/test contained in
> package go-systemd requires /bin/bash, but no providers found in
> RDEPENDS_go-systemd? [file-rdeps]
>
> Resolved with proper dependency to bash.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  recipes-devtools/go/go-systemd_git.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/recipes-devtools/go/go-systemd_git.bb b/recipes-devtools/go/
> go-systemd_git.bb
> index 5cbab92..b61c97a 100644
> --- a/recipes-devtools/go/go-systemd_git.bb
> +++ b/recipes-devtools/go/go-systemd_git.bb
> @@ -12,9 +12,7 @@ SRC_URI = "git://${PKG_NAME}.git"
>  SRCREV = "b4a58d95188dd092ae20072bac14cece0e67c388"
>  PV = "4+git${SRCREV}"
>
> -DEPENDS += " \
> -    bash \
> -"
> +RDEPENDS_${PN} += "bash"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.11.0
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

--f4030436207eb2d760055762a0f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, Aug 22, 2017 at 11:50 A=
M, Jason Wessel <span dir=3D"ltr">&lt;<a href=3D"mailto:jason.wessel@windri=
ver.com" target=3D"_blank">jason.wessel@windriver.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">ERROR: go-systemd-4+<wbr>gitb4a58d95188d=
d092ae20072bac1<wbr>4cece0e67c388-r0<br>
do_package_qa: QA Issue:<br>
/usr/local/go/src/<a href=3D"http://github.com/coreos/go-systemd/test" rel=
=3D"noreferrer" target=3D"_blank">github.com/<wbr>coreos/go-systemd/test</a=
> contained in<br>
package go-systemd requires /bin/bash, but no providers found in<br>
RDEPENDS_go-systemd? [file-rdeps]<br>
<br>
Resolved with proper dependency to bash.<br>
<br>
Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.co=
m">jason.wessel@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/go/<a href=3D"http://go-systemd_git.bb" rel=3D"noref=
errer" target=3D"_blank">go-<wbr>systemd_git.bb</a> | 4 +---<br>
=C2=A01 file changed, 1 insertion(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-devtools/go/<a href=3D"http://go-systemd_git.bb" rel=
=3D"noreferrer" target=3D"_blank">go-<wbr>systemd_git.bb</a> b/recipes-devt=
ools/go/<a href=3D"http://go-systemd_git.bb" rel=3D"noreferrer" target=3D"_=
blank">go-<wbr>systemd_git.bb</a><br>
index 5cbab92..b61c97a 100644<br>
--- a/recipes-devtools/go/<a href=3D"http://go-systemd_git.bb" rel=3D"noref=
errer" target=3D"_blank">go-<wbr>systemd_git.bb</a><br>
+++ b/recipes-devtools/go/<a href=3D"http://go-systemd_git.bb" rel=3D"noref=
errer" target=3D"_blank">go-<wbr>systemd_git.bb</a><br>
@@ -12,9 +12,7 @@ SRC_URI =3D &quot;git://${PKG_NAME}.git&quot;<br>
=C2=A0SRCREV =3D &quot;<wbr>b4a58d95188dd092ae20072bac14ce<wbr>ce0e67c388&q=
uot;<br>
=C2=A0PV =3D &quot;4+git${SRCREV}&quot;<br>
<br>
-DEPENDS +=3D &quot; \<br>
-=C2=A0 =C2=A0 bash \<br>
-&quot;<br>
+RDEPENDS_${PN} +=3D &quot;bash&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.11.0<br>
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

--f4030436207eb2d760055762a0f2--
