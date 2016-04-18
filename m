Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 791DFE00EED; Mon, 18 Apr 2016 11:17:33 -0700 (PDT)
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
	*      [209.85.218.47 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA129E00C8D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Apr 2016 11:17:31 -0700 (PDT)
Received: by mail-oi0-f47.google.com with SMTP id x201so32852268oif.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Apr 2016 11:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=4LuJElGA+Ua6itiQoNxKVPPTvgQOtvVRBCmggyxAp48=;
	b=s4hc8b0dX2CBndJzDhLc/KJ6D0I5G00FpZKUxD1NQAEmM/LIhRuM2HHtDLGCU8IQw0
	itvR0U570+rW/ujtSiy7DiryKyga9R2EoJAmBBF0VpoOFNZs5Z0drwmTktrUiidcgcUg
	sE31CITwa7klhpG9gk+CA9u/Nn/MBsgsm0ubEGU3jn16X0Wy4SXcvanDqP93fRJtBTPc
	6PNrJrIgjYroklWg4DJjF5YKZsYT8SytGzjrnR4k+20WdVMHKabwbIWG/1e9OPcslGq1
	gto3UhrjCtD7uXWT8F9Tsbd1WFvKk5O3CkYz8Ee/faDITBtJV8UWJfMKqYNd8N+iHTqB
	fQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=4LuJElGA+Ua6itiQoNxKVPPTvgQOtvVRBCmggyxAp48=;
	b=lS6O2aLjKlG1i3bsg4TyKgyZark+Me3D5BrL1ww5KrV47Q9VuYmYj1gq5lN1DNLSVt
	TGkUSprHHM99NJkHM4RBPwbLotBukeHK83rzr2YAdVWiN68N0HlsrZF7kZDQQgGDm87S
	2W95//cBicKPtjuy/UgxvcHpDXXfS/4CogO2EmW+cwuGicH0g6rA53JHGU+z/9HAugQp
	USNfyEi0t9SFeqvK7fgDIlo704RjiJJQRjN7BuEF4zIVogHK1+5ixXkfc/weVyuVUZuT
	ohr5pHdjZpj25UIxNsmtI98mer+Kq5d4j2oestkrW5qin9CNhspDlBwXExB1HH1++jG7
	32Lg==
X-Gm-Message-State: AOPr4FXMmZy2KpxGTw6YEgbBK9f1FKz215SxojZHYPOjImkPsS6kr32/CuTCbhLKEUD8dkqPv9EKEw+LQV54SQ==
MIME-Version: 1.0
X-Received: by 10.202.90.3 with SMTP id o3mr16605970oib.96.1461003450554; Mon,
	18 Apr 2016 11:17:30 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Mon, 18 Apr 2016 11:17:30 -0700 (PDT)
In-Reply-To: <1460681485-15647-1-git-send-email-derek@asterius.io>
References: <1460681485-15647-1-git-send-email-derek@asterius.io>
Date: Mon, 18 Apr 2016 14:17:30 -0400
Message-ID: <CADkTA4Oiu1Nw6L5KTuu8E4dSpOsHpfx8-n2hfcU0bzFrYe7gJg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] irqbalance: update to 1.1.0
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
X-List-Received-Date: Mon, 18 Apr 2016 18:17:33 -0000
Content-Type: multipart/alternative; boundary=001a113d5edcafa2280530c65f28

--001a113d5edcafa2280530c65f28
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Thu, Apr 14, 2016 at 8:51 PM, Derek Straka <derek@asterius.io> wrote:

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../irqbalance/{irqbalance_1.0.9.bb => irqbalance_1.1.0.bb}         | 6
> +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename recipes-extended/irqbalance/{irqbalance_1.0.9.bb =>
> irqbalance_1.1.0.bb} (52%)
>
> diff --git a/recipes-extended/irqbalance/irqbalance_1.0.9.bb
> b/recipes-extended/irqbalance/irqbalance_1.1.0.bb
> similarity index 52%
> rename from recipes-extended/irqbalance/irqbalance_1.0.9.bb
> rename to recipes-extended/irqbalance/irqbalance_1.1.0.bb
> index fc91aa7..16efa95 100644
> --- a/recipes-extended/irqbalance/irqbalance_1.0.9.bb
> +++ b/recipes-extended/irqbalance/irqbalance_1.1.0.bb
> @@ -4,10 +4,10 @@
>
>  require irqbalance.inc
>
> -SRC_URI[md5sum] = "30174d3941c5452a1e4ecee394a76ff8"
> -SRC_URI[sha256sum] =
> "f1b8115948bb9f0bc36b9d7143ee8be751a294bc189d311408e753acc37169c3"
> +SRC_URI[md5sum] = "b15d975336080bcac4be0c1752d43cf3"
> +SRC_URI[sha256sum] =
> "91506e638b03bf27cf5da7dc250d58a753ce8a0288a20265fc7ff0266040706b"
>
> -SRC_URI = "
> https://github.com/Irqbalance/irqbalance/archive/v1.0.9.tar.gz;downloadfilename=irqbalance-1.0.9.tar.gz
> \
> +SRC_URI = "
> https://github.com/Irqbalance/irqbalance/archive/v${PV}.tar.gz;downloadfilename=irqbalance-${PV}.tar.gz
> \
>             file://add-initscript.patch \
>             file://irqbalance-Add-status-and-reload-commands.patch \
>             file://fix-configure-libcap-ng.patch \
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

--001a113d5edcafa2280530c65f28
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, Apr 14, 2016 at 8:51 PM=
, Derek Straka <span dir=3D"ltr">&lt;<a href=3D"mailto:derek@asterius.io" t=
arget=3D"_blank">derek@asterius.io</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@ast=
erius.io">derek@asterius.io</a>&gt;<br>
---<br>
=C2=A0.../irqbalance/{<a href=3D"http://irqbalance_1.0.9.bb" rel=3D"norefer=
rer" target=3D"_blank">irqbalance_1.0.9.bb</a> =3D&gt; <a href=3D"http://ir=
qbalance_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">irqbalance_1.1.0.bb=
</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename recipes-extended/irqbalance/{<a href=3D"http://irqbalance_1.0.=
9.bb" rel=3D"noreferrer" target=3D"_blank">irqbalance_1.0.9.bb</a> =3D&gt; =
<a href=3D"http://irqbalance_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>irqbalance_1.1.0.bb</a>} (52%)<br>
<br>
diff --git a/recipes-extended/irqbalance/<a href=3D"http://irqbalance_1.0.9=
.bb" rel=3D"noreferrer" target=3D"_blank">irqbalance_1.0.9.bb</a> b/recipes=
-extended/irqbalance/<a href=3D"http://irqbalance_1.1.0.bb" rel=3D"noreferr=
er" target=3D"_blank">irqbalance_1.1.0.bb</a><br>
similarity index 52%<br>
rename from recipes-extended/irqbalance/<a href=3D"http://irqbalance_1.0.9.=
bb" rel=3D"noreferrer" target=3D"_blank">irqbalance_1.0.9.bb</a><br>
rename to recipes-extended/irqbalance/<a href=3D"http://irqbalance_1.1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">irqbalance_1.1.0.bb</a><br>
index fc91aa7..16efa95 100644<br>
--- a/recipes-extended/irqbalance/<a href=3D"http://irqbalance_1.0.9.bb" re=
l=3D"noreferrer" target=3D"_blank">irqbalance_1.0.9.bb</a><br>
+++ b/recipes-extended/irqbalance/<a href=3D"http://irqbalance_1.1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">irqbalance_1.1.0.bb</a><br>
@@ -4,10 +4,10 @@<br>
<br>
=C2=A0require irqbalance.inc<br>
<br>
-SRC_URI[md5sum] =3D &quot;30174d3941c5452a1e4ecee394a76ff8&quot;<br>
-SRC_URI[sha256sum] =3D &quot;f1b8115948bb9f0bc36b9d7143ee8be751a294bc189d3=
11408e753acc37169c3&quot;<br>
+SRC_URI[md5sum] =3D &quot;b15d975336080bcac4be0c1752d43cf3&quot;<br>
+SRC_URI[sha256sum] =3D &quot;91506e638b03bf27cf5da7dc250d58a753ce8a0288a20=
265fc7ff0266040706b&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://github.com/Irqbalance/irqbalance/arch=
ive/v1.0.9.tar.gz;downloadfilename=3Dirqbalance-1.0.9.tar.gz" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/Irqbalance/irqbalance/archive/v1=
.0.9.tar.gz;downloadfilename=3Dirqbalance-1.0.9.tar.gz</a> \<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/Irqbalance/irqbalance/arch=
ive/v${PV}.tar.gz;downloadfilename=3Dirqbalance-${PV}.tar.gz" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/Irqbalance/irqbalance/archive/v$=
{PV}.tar.gz;downloadfilename=3Dirqbalance-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://add-initscript.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://irqbalance-Add-status-and-=
reload-commands.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-configure-libcap-ng.pa=
tch \<br>
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

--001a113d5edcafa2280530c65f28--
