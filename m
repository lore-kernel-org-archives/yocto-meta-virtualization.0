Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 216BBE00C4D; Tue, 29 May 2018 07:29:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.51 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2116BE009D4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:29:51 -0700 (PDT)
Received: by mail-wm0-f51.google.com with SMTP id t11-v6so41255731wmt.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zhg5kWGZXGmiKuKIkhJ+tAHWNlKrzdtbClklZI84P9I=;
	b=qM1TSyWHsgGYOtIWIN429zR3dg6RKiYGaJKKjSRkp8oxggoAu0EB2AVYmLAHgbbYLl
	jrBqxDG/RwmQqHFc5eKvKRNIQw0zn+SEGVXuU1VngyFx7Za7EIOMt1Tp2qYfXV1AqInR
	N/1UA1Ufaccbf8w8F3+EqL+K0ThB5m2eflCS+nyRU7lKCeoElRpoU7UmMMia7MRJSINM
	2bLdi3Af8Cfip/WcAnU9cVx+4HEFcRjAVLo1KefRyjjp5haWAfwZ/1WRgbYv+82me7Ak
	bp5o5Fz1+jRZc5KRUKmkpPr1ZH25oQrxTUYJoFLkriRpcBx8T0Q16h/OziAdlZsvGNgZ
	/aUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zhg5kWGZXGmiKuKIkhJ+tAHWNlKrzdtbClklZI84P9I=;
	b=sWGDrUigMpXOWckFIqWDlKrjBh8JvtiwEJEuC+mcRsHvVQOvPhwy8fv1l7mC5bOONv
	laXVQEcYn40W/cNEh6K12vYVnqq2DhR9GAJlEXfOZMYZRc+hRga+SrcBX9A6Il4TNjBA
	wT2mdjeq0dpSn/b39pbQGPpH3oiykawmoNmN6KKJedF8EH86IjBpNBTPz2ZBdb2mMbRn
	4S+7LnbkfP89y84gll0iL+EjkejPEjj06O+3sU1U5n88PFzOZ7ezRYUIPjC23T22ZfvL
	YmibZQAM+sWt3Fm+C/42AIRU8IqkK6CetE/7XfIRcmnNusctrQW54s8udjMdHGIb3CR1
	5QzQ==
X-Gm-Message-State: ALKqPweAYE8HCkoWOnrYahbD7lui1ATqwMMYYKWnaXGKeIiatSnZG5UH
	1HirUj1hI6BpythAyeFvZ+UpaEfh60ALA+pfQ10=
X-Google-Smtp-Source: ADUXVKJe/kQgWr0AasXyzl+XFS34bPOhOTp0n8OY162Bn/L7ca59pVVV5VWowELrHCATNjGlhieJ36b2B+oxi05XFQE=
X-Received: by 2002:a2e:5358:: with SMTP id
	t24-v6mr2599793ljd.129.1527604191029; 
	Tue, 29 May 2018 07:29:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3307:0:0:0:0:0 with HTTP; Tue, 29 May 2018 07:29:50
	-0700 (PDT)
In-Reply-To: <1527531687-1057-1-git-send-email-mark.asselstine@windriver.com>
References: <1527531687-1057-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 May 2018 10:29:50 -0400
Message-ID: <CADkTA4NF7uVZvcL9ea8wxLqowa6UngKTSgesieKm0NzWun1xLg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] irqbalance: uprev to v1.4.0
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
X-List-Received-Date: Tue, 29 May 2018 14:29:53 -0000
Content-Type: multipart/alternative; boundary="00000000000029ef9f056d59111d"

--00000000000029ef9f056d59111d
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, May 28, 2018 at 2:21 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> This is a minor bugfix release that was just release by the upstream
> project about 2 weeks ago.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../irqbalance/{irqbalance_1.3.0.bb => irqbalance_1.4.0.bb}           |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-extended/irqbalance/{irqbalance_1.3.0.bb =>
> irqbalance_1.4.0.bb} (74%)
>
> diff --git a/recipes-extended/irqbalance/irqbalance_1.3.0.bb
> b/recipes-extended/irqbalance/irqbalance_1.4.0.bb
> similarity index 74%
> rename from recipes-extended/irqbalance/irqbalance_1.3.0.bb
> rename to recipes-extended/irqbalance/irqbalance_1.4.0.bb
> index 5581a8b..1aee7ca 100644
> --- a/recipes-extended/irqbalance/irqbalance_1.3.0.bb
> +++ b/recipes-extended/irqbalance/irqbalance_1.4.0.bb
> @@ -4,8 +4,8 @@
>
>  require irqbalance.inc
>
> -SRC_URI[md5sum] = "53ee393adcfbc8e5ab23cbbd920df687"
> -SRC_URI[sha256sum] = "41c2c0842d8fb24240d8069b389cd8
> d1669625a40009a17ad886967845dc6e43"
> +SRC_URI[md5sum] = "26ee6db57c4509737e541e98773a39f5"
> +SRC_URI[sha256sum] = "62de71510a2496fcf027efb0b288dd
> 48e53e9efc931fa573c95580cad6264d07"
>
>  SRC_URI = "https://github.com/Irqbalance/irqbalance/archive/
> v${PV}.tar.gz;downloadfilename=irqbalance-${PV}.tar.gz \
>             file://add-initscript.patch \
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

--00000000000029ef9f056d59111d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Mon, May 28, 2018 at 2:21 PM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">This is a minor bugfix release t=
hat was just release by the upstream<br>
project about 2 weeks ago.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0.../irqbalance/{<a href=3D"http://irqbalance_1.3.0.bb" rel=3D"norefer=
rer" target=3D"_blank">irqbalance_1.<wbr>3.0.bb</a> =3D&gt; <a href=3D"http=
://irqbalance_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">irqbalance_1.4=
.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename recipes-extended/irqbalance/{<a href=3D"http://irqbalance_1.3.=
0.bb" rel=3D"noreferrer" target=3D"_blank">i<wbr>rqbalance_1.3.0.bb</a> =3D=
&gt; <a href=3D"http://irqbalance_1.4.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">irqbalance_1.4.0.bb</a>} (74%)<br>
<br>
diff --git a/recipes-extended/irqbalance/<a href=3D"http://irqbalance_1.3.0=
.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>irqbalance_1.3.0.bb</a> b/re=
cipes-extended/irqbalance/<a href=3D"http://irqbalance_1.4.0.bb" rel=3D"nor=
eferrer" target=3D"_blank"><wbr>irqbalance_1.4.0.bb</a><br>
similarity index 74%<br>
rename from recipes-extended/irqbalance/<a href=3D"http://irqbalance_1.3.0.=
bb" rel=3D"noreferrer" target=3D"_blank">ir<wbr>qbalance_1.3.0.bb</a><br>
rename to recipes-extended/irqbalance/<a href=3D"http://irqbalance_1.4.0.bb=
" rel=3D"noreferrer" target=3D"_blank">ir<wbr>qbalance_1.4.0.bb</a><br>
index 5581a8b..1aee7ca 100644<br>
--- a/recipes-extended/irqbalance/<a href=3D"http://irqbalance_1.3.0.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>irqbalance_1.3.0.bb</a><br>
+++ b/recipes-extended/irqbalance/<a href=3D"http://irqbalance_1.4.0.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>irqbalance_1.4.0.bb</a><br>
@@ -4,8 +4,8 @@<br>
<br>
=C2=A0require irqbalance.inc<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>53ee393adcfbc8e5ab23cbbd920df6<wbr>87&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>41c2c0842d8fb24240d8069b389cd8<wbr>d1669=
625a40009a17ad886967845dc<wbr>6e43&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>26ee6db57c4509737e541e98773a39<wbr>f5&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>62de71510a2496fcf027efb0b288dd<wbr>48e53=
e9efc931fa573c95580cad626<wbr>4d07&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/Irqbalance/irqbalance=
/archive/v${PV}.tar.gz;downloadfilename=3Dirqbalance-${PV}.tar.gz" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/<wbr>Irqbalance/irqbalance/=
archive/<wbr>v${PV}.tar.gz;<wbr>downloadfilename=3Dirqbalance-${<wbr>PV}.ta=
r.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://add-initscript.patch \<br>
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

--00000000000029ef9f056d59111d--
