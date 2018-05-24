Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45FE9E007AD; Thu, 24 May 2018 13:10:08 -0700 (PDT)
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
	*      [74.125.82.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A163E0044F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 May 2018 13:10:07 -0700 (PDT)
Received: by mail-wm0-f66.google.com with SMTP id x2-v6so1356481wmh.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 May 2018 13:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JOXfqyvcQszV6w+gOVPvZPVs2jXB6vOpakaLDALDvew=;
	b=BqBdLQFtYIAYpplrX3W+w6ip2dKIiA7foOhklZn1atZFwlNZS+F5UF37rmHB+owHdi
	QhUmjW9dTrnU1NP0tGE+axsk6fUKpEEMJp3zeZoVp+ND+rg7+FfR/mm1O+WXRNllk3Xd
	PZtGGQbj86U7tevo4EMgD8N5wlJ2ACt02b+ri3R9MagZvMY3M5wAxWqk61v419u3kAaO
	8oaVohlapy0iKekIWXDCcUGh22LNdvKNzoGYStrODygniQlJB5xxsnilwJ/skFe6krk7
	i7g08dB2RyTpRBgWlleMZaKht0OYXxqTurtTu7vEwS1fC5rR2mo2EwKALpcwFEgy6J+4
	yiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JOXfqyvcQszV6w+gOVPvZPVs2jXB6vOpakaLDALDvew=;
	b=opHsLv7xTOAyfXF1c4WhF7aZqzF9vBESSWG4SlgHupBIKejObThJ5P1mgAuVbP2B0u
	p3UgNsSGHPpFp3U/h/HGbONAH266L4rXwB4+d28+hVBzVZxU5taqpbHOCHRBsnwGIz+m
	Oh6GtVtMO88C8AV5ONTP3J1HIC3NPbLdhfZIEYS6budZ+PaedXJx50yTuYFA3ZXuAFAa
	TD1INwFmGz2LaGvoRsrcGqUwRR1HcCusYBGrkt0sqQH+g8TtnVCF0Ck9d4iqRigyq0Vq
	6vdYnTCIEjYIV+CjfxIdbVAX60etPGO3X+aCE3EMTEmqFDww+rE8m5b0pFMDYu00eViu
	uGTQ==
X-Gm-Message-State: ALKqPwf08BQaVcMDU5ZzElioTlbCP90cLCP6VVmEcq6jQ8ahNviqexjL
	N16xneACuPpffLT8tH1Za96WmezM6z9+ggMvYQQ=
X-Google-Smtp-Source: AB8JxZomMAyD9FU3OO9GN6HBlH9M98L68fT8ErOVP2XRVXi7Q1hMAjNgoVgVJnfa5RowF40QiMuf6PTWOXlkr5cP1ug=
X-Received: by 2002:a2e:9b4a:: with SMTP id
	o10-v6mr5689381ljj.49.1527192606279; 
	Thu, 24 May 2018 13:10:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Thu, 24 May 2018 13:10:05 -0700 (PDT)
In-Reply-To: <1527102177-10064-1-git-send-email-mark.asselstine@windriver.com>
References: <1527102177-10064-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 May 2018 16:10:05 -0400
Message-ID: <CADkTA4O74s1A8pHJk22k9R0s9uzDjc+bdWOp7UzZAeeLvpq2OQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] layer.conf: match layer dependencies as documented in the layer README
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
X-List-Received-Date: Thu, 24 May 2018 20:10:08 -0000
Content-Type: multipart/alternative; boundary="000000000000cd0d66056cf93c5b"

--000000000000cd0d66056cf93c5b
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, May 23, 2018 at 3:02 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> Several required layer dependencies have been added to the layer
> README but didn't have corresponding entries added to
> LAYERDEPENDS. Ensure these match.
>
> The 'selinux' layer dependency, is conditional on the 'xen'
> DISTRO_FEATURE but I see no way to make a conditional LAYERDEPENDS so
> this is left off for now.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  conf/layer.conf | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index fa2e015..eaef1b7 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -15,7 +15,13 @@ LICENSE_PATH += "${LAYERDIR}/files/custom-licenses"
>  # cause compatibility issues with other layers
>  LAYERVERSION_virtualization-layer = "1"
>  LAYERSERIES_COMPAT_virtualization-layer = "sumo"
> -LAYERDEPENDS_virtualization-layer = "core networking-layer"
> +LAYERDEPENDS_virtualization-layer = " \
> +    core \
> +    openembedded-layer \
> +    networking-layer \
> +    filesystems-layer \
> +    meta-python \
> +"
>
>  # Override security flags
>  require conf/distro/include/virt_security_flags.inc
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

--000000000000cd0d66056cf93c5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, May 23, 2018 at 3:02 PM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Several required layer dependenc=
ies have been added to the layer<br>
README but didn&#39;t have corresponding entries added to<br>
LAYERDEPENDS. Ensure these match.<br>
<br>
The &#39;selinux&#39; layer dependency, is conditional on the &#39;xen&#39;=
<br>
DISTRO_FEATURE but I see no way to make a conditional LAYERDEPENDS so<br>
this is left off for now.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0conf/layer.conf | 8 +++++++-<br>
=C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/conf/layer.conf b/conf/layer.conf<br>
index fa2e015..eaef1b7 100644<br>
--- a/conf/layer.conf<br>
+++ b/conf/layer.conf<br>
@@ -15,7 +15,13 @@ LICENSE_PATH +=3D &quot;${LAYERDIR}/files/custom-<wbr>li=
censes&quot;<br>
=C2=A0# cause compatibility issues with other layers<br>
=C2=A0LAYERVERSION_virtualization-<wbr>layer =3D &quot;1&quot;<br>
=C2=A0LAYERSERIES_COMPAT_<wbr>virtualization-layer =3D &quot;sumo&quot;<br>
-LAYERDEPENDS_virtualization-<wbr>layer =3D &quot;core networking-layer&quo=
t;<br>
+LAYERDEPENDS_virtualization-<wbr>layer =3D &quot; \<br>
+=C2=A0 =C2=A0 core \<br>
+=C2=A0 =C2=A0 openembedded-layer \<br>
+=C2=A0 =C2=A0 networking-layer \<br>
+=C2=A0 =C2=A0 filesystems-layer \<br>
+=C2=A0 =C2=A0 meta-python \<br>
+&quot;<br>
<br>
=C2=A0# Override security flags<br>
=C2=A0require conf/distro/include/virt_<wbr>security_flags.inc<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">-- <br>
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

--000000000000cd0d66056cf93c5b--
