Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D61FE00CFB; Fri, 25 Dec 2015 19:53:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
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
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.41 listed in list.dnswl.org]
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37CC3E0088C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Dec 2015 19:53:18 -0800 (PST)
Received: by mail-vk0-f41.google.com with SMTP id a188so162242853vkc.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Dec 2015 19:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bx5McFibiVOXLtEtsmq4Zz16l5r/WjSqRvtB40HBObQ=;
	b=rqvJVh0RR/+MD5t/rRmWZTrhIWVF7IEw6U07O1IVL6UQeEM094h71udz3UdfT+cuwN
	HDPxzKQTdfSWq/O4fBUGgxJc4RTR2noCPT15QFTHuRJAczMaOuxbeEM11SbjaagQGirS
	9PEbAB+xZJ0R+T2NOraImn/SkHN6ApbDWwjRNtePUrLE2FwBvT3J4wl6SSwvxlO/BilR
	CHoXoEzq5NGX0V+0qQK1jwAwMxH0fvSxdA6pzVRYzEzQt6PvW0PAUfabK8kpMuZW+Nyi
	HQ9CSL3keNR1KND8oQ76cqHA/wjTRpYTwdh6eb0CyZCDsYPwC/FVp3z81N8bC/ypVKQj
	OHyQ==
MIME-Version: 1.0
X-Received: by 10.31.192.12 with SMTP id q12mr28364924vkf.96.1451101997882;
	Fri, 25 Dec 2015 19:53:17 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Fri, 25 Dec 2015 19:53:17 -0800 (PST)
In-Reply-To: <1450285722-14530-1-git-send-email-mbgrego@tycho.nsa.gov>
References: <1450285722-14530-1-git-send-email-mbgrego@tycho.nsa.gov>
Date: Fri, 25 Dec 2015 22:53:17 -0500
Message-ID: <CADkTA4MnmGDqMrx6e7shfk3858f1P=vsz-=dGJrcCBfcfF6+Ww@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Machon Gregory <mbgrego@tycho.nsa.gov>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [V2 Patch 1/2] Disables OCaml tools.
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
X-List-Received-Date: Sat, 26 Dec 2015 03:53:23 -0000
Content-Type: multipart/alternative; boundary=001a114394261de4680527c5032c

--001a114394261de4680527c5032c
Content-Type: text/plain; charset=UTF-8

I went ahead and merged both patches in this series (ocaml and xsm), since
going without  package config is fine for this .. and even though I didn't
see clear consensus
about the xsm patch, I grabbed it as well.

Incremental patches are appreciated if I got it wrong.

Bruce

On Wed, Dec 16, 2015 at 12:08 PM, Machon Gregory <mbgrego@tycho.nsa.gov>
wrote:

> There is currently no support for OCaml in OpenEmbedded.
>
> Signed-off-by: Machon Gregory <mbgrego@tycho.nsa.gov>
> ---
>  recipes-extended/xen/xen.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 00f1823..9e35459 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -712,6 +712,7 @@ EXTRA_OECONF += " \
>      --disable-pv-grub \
>      --disable-xenstore-stubdom \
>      --disable-rombios \
> +    --disable-ocamltools \
>      "
>
>  do_configure() {
> --
> 2.1.0
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

--001a114394261de4680527c5032c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I went ahead and merged both patches in this series (ocaml=
 and xsm), since<div>going without =C2=A0package config is fine for this ..=
 and even though I didn&#39;t see clear consensus</div><div>about the xsm p=
atch, I grabbed it as well.</div><div><br></div><div>Incremental patches ar=
e appreciated if I got it wrong.</div><div><br></div><div>Bruce</div></div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Dec 16, 2=
015 at 12:08 PM, Machon Gregory <span dir=3D"ltr">&lt;<a href=3D"mailto:mbg=
rego@tycho.nsa.gov" target=3D"_blank">mbgrego@tycho.nsa.gov</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">There is currently no support for =
OCaml in OpenEmbedded.<br>
<br>
Signed-off-by: Machon Gregory &lt;<a href=3D"mailto:mbgrego@tycho.nsa.gov">=
mbgrego@tycho.nsa.gov</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index 00f1823..9e35459 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -712,6 +712,7 @@ EXTRA_OECONF +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--disable-pv-grub \<br>
=C2=A0 =C2=A0 =C2=A0--disable-xenstore-stubdom \<br>
=C2=A0 =C2=A0 =C2=A0--disable-rombios \<br>
+=C2=A0 =C2=A0 --disable-ocamltools \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0do_configure() {<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.0<br>
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

--001a114394261de4680527c5032c--
