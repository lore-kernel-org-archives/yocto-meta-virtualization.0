Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A5246E00D8C; Thu, 17 Aug 2017 08:54:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, RCVD_IN_DNSWL_NONE, RCVD_IN_SORBS_SPAM,
	URIBL_SBL autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.195 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	*  1.6 URIBL_SBL Contains an URL's NS IP listed in the SBL blocklist
	*      [URIs: yoctoproject.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10D00E00D57
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Aug 2017 08:54:08 -0700 (PDT)
Received: by mail-qk0-f195.google.com with SMTP id a77so6384037qkb.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Aug 2017 08:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PjI+g3vynC2KbnB9Adraq5A2XiW2JFXan1KL+SjO1hc=;
	b=G/eZGRoEDIVVtUQj9dQE6tytzLLutfZleX6xdjdc/flCzXYx544Bz/9jt7Io5alB9U
	VQc2rBbwU88U1j4roPqJkSN8YWFPsruFbTYL9c0+YAyMUt6BhAeAbfuVssNUHfGlx73H
	OlP2eToGOeyryo68orLEAbJx1Vcy+laJwzV1es05Iyb8O8/2nqPXU91re33fHOkXyXLD
	xwPYLTEBvPYV53dspfiqUW5I/p3FYQuwPJ23sVaLWGIg2MpLb9a6yw/cOu7UYiz7Gr7w
	oieMGx7b0azzrMO1isHla2q2MJxe8zicdP8vHUi8cDJfzUW80+va35y3voU/y04dWp7a
	9Qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PjI+g3vynC2KbnB9Adraq5A2XiW2JFXan1KL+SjO1hc=;
	b=uIWbf6ZOclLFJ8kq+MpO+XbF2dNAYusm9MM5fZszTkJFE0dAGXsZEJSN4VsTCzkfni
	kCVqxdHxdXUsMMaHwsCtjuKIJkmE/6atrPqttyw+VDe/sf6PVezIPZmWccYYNIpDJz7h
	OUv38lZtAVVepuEqepPlX9Xtb0P73x4ND27VX5PmWsYokpu4Zqafz5/1WbeNFjqsti3d
	VMF5Kq/sWDAFcCaNlo64EI4o3P8f5KLdhpMp6EWxVWqVdGos/neheaDu+PIZ/v/sk14r
	QTLAe4iTfqmpcyK/nmx+0exYar4Xn4ltDzJERX8EgU2KXhP2WrZTR8vnUzfaC27NU2Hz
	6sRg==
X-Gm-Message-State: AHYfb5jmnD0JpsPU58qy8aTeTIhNNuLT4yuHZQCiD0frgrqxeO7KvvVy
	NZE1UkFVSFT+8yNLqGU9E8knNrVpKA==
X-Received: by 10.233.232.149 with SMTP id a143mr8115292qkg.339.1502985247513; 
	Thu, 17 Aug 2017 08:54:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.194.139 with HTTP; Thu, 17 Aug 2017 08:54:07 -0700 (PDT)
In-Reply-To: <1502948903-3992-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1502948903-3992-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 17 Aug 2017 11:54:07 -0400
Message-ID: <CADkTA4PWVbtSLM8owxi7kCioQ1CuLwK=2fmgAfp3qU-qqjc39A@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] nss-pam-ldapd: upgrade to 0.9.8
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
X-List-Received-Date: Thu, 17 Aug 2017 15:54:08 -0000
Content-Type: multipart/alternative; boundary="94eb2c03e442c7dfe50556f505b6"

--94eb2c03e442c7dfe50556f505b6
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Aug 17, 2017 at 1:48 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
wrote:

> Upgrade nss-pam-ldapd from 0.9.7 to 0.9.8.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../nss-pam-ldapd/{nss-pam-ldapd_0.9.7.bb => nss-pam-ldapd_0.9.8.bb}  |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-support/nss-pam-ldapd/{nss-pam-ldapd_0.9.7.bb =>
> nss-pam-ldapd_0.9.8.bb} (91%)
>
> diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.7.bb
> b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
> similarity index 91%
> rename from recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.7.bb
> rename to recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
> index fd73b9c..a309c1e 100644
> --- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.7.bb
> +++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
> @@ -22,8 +22,8 @@ SRC_URI = "\
>
>  inherit autotools
>
> -SRC_URI[md5sum] = "912f2a5ead193d2defc6c525423e84e8"
> -SRC_URI[sha256sum] = "0db88d6518bf7ffb01b44f8f8841ec
> e5162906982ce2c9e45e6afff90d3783eb"
> +SRC_URI[md5sum] = "8c99fdc54f4bf9aca8c5f53fdb1403ff"
> +SRC_URI[sha256sum] = "ef7362e7f2003da8c7beb7bcc03c30
> 494acf712625aaac8badc6e7eb16f3453f"
>
>  DEPENDS += "libpam openldap"
>
> --
> 2.7.4
>
>
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

--94eb2c03e442c7dfe50556f505b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, Aug 17, 2017 at 1:48 AM=
, Huang Qiyu <span dir=3D"ltr">&lt;<a href=3D"mailto:huangqy.fnst@cn.fujits=
u.com" target=3D"_blank">huangqy.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Upgrade nss-pam-ldapd from 0.9.7 to 0.9.8=
.<br>
<br>
Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com=
">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../nss-pam-ldapd/{<a href=3D"http://nss-pam-ldapd_0.9.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">nss-pam-<wbr>ldapd_0.9.7.bb</a> =3D&gt; <a hre=
f=3D"http://nss-pam-ldapd_0.9.8.bb" rel=3D"noreferrer" target=3D"_blank">ns=
s-pam-ldapd_0.9.8.bb</a>}=C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename recipes-support/nss-pam-ldapd/<wbr>{<a href=3D"http://nss-pam-=
ldapd_0.9.7.bb" rel=3D"noreferrer" target=3D"_blank">nss-pam-ldapd_0.9.7.bb=
</a> =3D&gt; <a href=3D"http://nss-pam-ldapd_0.9.8.bb" rel=3D"noreferrer" t=
arget=3D"_blank">nss-pam-ldapd_0.9.8.bb</a>} (91%)<br>
<br>
diff --git a/recipes-support/nss-pam-<wbr>ldapd/<a href=3D"http://nss-pam-l=
dapd_0.9.7.bb" rel=3D"noreferrer" target=3D"_blank">nss-pam-ldapd_0.9.7.bb<=
/a> b/recipes-support/nss-pam-<wbr>ldapd/<a href=3D"http://nss-pam-ldapd_0.=
9.8.bb" rel=3D"noreferrer" target=3D"_blank">nss-pam-ldapd_0.9.8.bb</a><br>
similarity index 91%<br>
rename from recipes-support/nss-pam-ldapd/<a href=3D"http://nss-pam-ldapd_0=
.9.7.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>nss-pam-ldapd_0.9.7.bb</=
a><br>
rename to recipes-support/nss-pam-ldapd/<a href=3D"http://nss-pam-ldapd_0.9=
.8.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>nss-pam-ldapd_0.9.8.bb</a>=
<br>
index fd73b9c..a309c1e 100644<br>
--- a/recipes-support/nss-pam-<wbr>ldapd/<a href=3D"http://nss-pam-ldapd_0.=
9.7.bb" rel=3D"noreferrer" target=3D"_blank">nss-pam-ldapd_0.9.7.bb</a><br>
+++ b/recipes-support/nss-pam-<wbr>ldapd/<a href=3D"http://nss-pam-ldapd_0.=
9.8.bb" rel=3D"noreferrer" target=3D"_blank">nss-pam-ldapd_0.9.8.bb</a><br>
@@ -22,8 +22,8 @@ SRC_URI =3D &quot;\<br>
<br>
=C2=A0inherit autotools<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>912f2a5ead193d2defc6c525423e84<wbr>e8&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>0db88d6518bf7ffb01b44f8f8841ec<wbr>e5162=
906982ce2c9e45e6afff90d37<wbr>83eb&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>8c99fdc54f4bf9aca8c5f53fdb1403<wbr>ff&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>ef7362e7f2003da8c7beb7bcc03c30<wbr>494ac=
f712625aaac8badc6e7eb16f3<wbr>453f&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;libpam openldap&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
<br>
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

--94eb2c03e442c7dfe50556f505b6--
