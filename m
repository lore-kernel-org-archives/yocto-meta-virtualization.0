Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1480DE006E9; Mon, 19 Sep 2016 13:02:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5528E006B3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Sep 2016 13:02:53 -0700 (PDT)
Received: by mail-qk0-f194.google.com with SMTP id z143so10504114qka.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Sep 2016 13:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dhnLfYqPPaIE6QKCOaGiIJ/iJXBP3qpZRidwkUYKczk=;
	b=sFpvNXYTT2q+uLK1eJBswAy2O6v2OdO9MBSWPf7Rk25/57b/DWRswKK6nNrYCee4/b
	ji662K5+eOQAc6t5VW0pyWs+iC06DXRZ6NbY3oR/afrYsBYtLGDBNq61UMfBtJ3QWsXE
	+kVspO2wET/CGMUr07SPqVR7pc16GS4dcqbnuJHvwVwDK7XCtpDNEzBjfFLYLkeOfTUl
	EKSLfE/N2/r4cL4B1UmBNh3eRWhIeSj5pWz6shYU+knDvA43UoQJTvVU8vYin307rqJe
	LoIRTcRzsEH6NhgAjXomMi8U4I0lNm9dzfQsosyjOwoqchfJ0+Xo4ngOXwBVBuwB3AKH
	6QyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dhnLfYqPPaIE6QKCOaGiIJ/iJXBP3qpZRidwkUYKczk=;
	b=i6UdU3RIOqa7PkeiXCpBX22JkaDhGg86EdEK7TwQKgYgmre3oUPAsLOrCWlwv/9rhi
	XQjxuskThUza18g8qzW/87IkJupU/wZ1KHt4lGbztoDDQ3QSrRa0lAsA0yxkV7x5BQpa
	+nMz5GzBChBut6X9lLjVtUmr7yci9WEXu/rACNnsOWGNH6kIoPAnpaD+K9zhijipWAC/
	6rdrhLO0ITZ4gDPxjXiPTtfN+H313gcscHgWBl86pBdrpRlB2Y96jWaR/byzMeCg6rja
	Ye0w7NHnQntBKUM/zw22snUtDGyvwWY3v05hFkhayM+1MYdkZXtj096DJ94sOD+KZJzr
	qwHA==
X-Gm-Message-State: AE9vXwPNm6al/4kun1UEqqSamFq0fSmJb7kx7Zr+R5GlUmxAPdEnB1cD0W6nkv6QYkPD+TbeemYSFaCdIQE6hw==
X-Received: by 10.55.138.66 with SMTP id m63mr32422101qkd.159.1474315372540;
	Mon, 19 Sep 2016 13:02:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.38.166 with HTTP; Mon, 19 Sep 2016 13:02:51 -0700 (PDT)
In-Reply-To: <1473830825-3279-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
References: <1473830825-3279-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 19 Sep 2016 16:02:51 -0400
Message-ID: <CADkTA4Mz88Dt6SFQibi6dzvWXaatUzCEpm7ijDWz3WeJutr4zw@mail.gmail.com>
To: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] nss-pam-ldapd: 0.9.6 -> 0.9.7
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
X-List-Received-Date: Mon, 19 Sep 2016 20:02:56 -0000
Content-Type: multipart/alternative; boundary=94eb2c060f22113dc4053ce1ccc5

--94eb2c060f22113dc4053ce1ccc5
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Wed, Sep 14, 2016 at 1:27 AM, Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
wrote:

> Upgrade nss-pam-ldapd from 0.9.6 to 0.9.7.
>
> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
> ---
>  .../nss-pam-ldapd/{nss-pam-ldapd_0.9.6.bb => nss-pam-ldapd_0.9.7.bb}  |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-support/nss-pam-ldapd/{nss-pam-ldapd_0.9.6.bb =>
> nss-pam-ldapd_0.9.7.bb} (91%)
>
> diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.6.bb
> b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.7.bb
> similarity index 91%
> rename from recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.6.bb
> rename to recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.7.bb
> index c6601fc..fd73b9c 100644
> --- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.6.bb
> +++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.7.bb
> @@ -22,8 +22,8 @@ SRC_URI = "\
>
>  inherit autotools
>
> -SRC_URI[md5sum] = "fa5ec49cb54428d6c73e244a11021695"
> -SRC_URI[sha256sum] = "101d5a7fa10549cc77be48d07f2b81
> 41f59182f10f2cc0fea93efd13c3a5a6f2"
> +SRC_URI[md5sum] = "912f2a5ead193d2defc6c525423e84e8"
> +SRC_URI[sha256sum] = "0db88d6518bf7ffb01b44f8f8841ec
> e5162906982ce2c9e45e6afff90d3783eb"
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

--94eb2c060f22113dc4053ce1ccc5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Wed, Sep 14, 2016 at 1:27 AM, W=
ang Xin <span dir=3D"ltr">&lt;<a href=3D"mailto:wangxin2015.fnst@cn.fujitsu=
.com" target=3D"_blank">wangxin2015.fnst@cn.fujitsu.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Upgrade nss-pam-ldapd from 0.9.6 to 0.=
9.7.<br>
<br>
Signed-off-by: Wang Xin &lt;<a href=3D"mailto:wangxin2015.fnst@cn.fujitsu.c=
om">wangxin2015.fnst@cn.fujitsu.<wbr>com</a>&gt;<br>
---<br>
=C2=A0.../nss-pam-ldapd/{<a href=3D"http://nss-pam-ldapd_0.9.6.bb" rel=3D"n=
oreferrer" target=3D"_blank">nss-pam-<wbr>ldapd_0.9.6.bb</a> =3D&gt; <a hre=
f=3D"http://nss-pam-ldapd_0.9.7.bb" rel=3D"noreferrer" target=3D"_blank">ns=
s-pam-ldapd_0.9.7.bb</a>}=C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename recipes-support/nss-pam-ldapd/<wbr>{<a href=3D"http://nss-pam-=
ldapd_0.9.6.bb" rel=3D"noreferrer" target=3D"_blank">nss-pam-ldapd_0.9.6.bb=
</a> =3D&gt; <a href=3D"http://nss-pam-ldapd_0.9.7.bb" rel=3D"noreferrer" t=
arget=3D"_blank">nss-pam-ldapd_0.9.7.bb</a>} (91%)<br>
<br>
diff --git a/recipes-support/nss-pam-<wbr>ldapd/<a href=3D"http://nss-pam-l=
dapd_0.9.6.bb" rel=3D"noreferrer" target=3D"_blank">nss-pam-ldapd_0.9.6.bb<=
/a> b/recipes-support/nss-pam-<wbr>ldapd/<a href=3D"http://nss-pam-ldapd_0.=
9.7.bb" rel=3D"noreferrer" target=3D"_blank">nss-pam-ldapd_0.9.7.bb</a><br>
similarity index 91%<br>
rename from recipes-support/nss-pam-ldapd/<a href=3D"http://nss-pam-ldapd_0=
.9.6.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>nss-pam-ldapd_0.9.6.bb</=
a><br>
rename to recipes-support/nss-pam-ldapd/<a href=3D"http://nss-pam-ldapd_0.9=
.7.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>nss-pam-ldapd_0.9.7.bb</a>=
<br>
index c6601fc..fd73b9c 100644<br>
--- a/recipes-support/nss-pam-<wbr>ldapd/<a href=3D"http://nss-pam-ldapd_0.=
9.6.bb" rel=3D"noreferrer" target=3D"_blank">nss-pam-ldapd_0.9.6.bb</a><br>
+++ b/recipes-support/nss-pam-<wbr>ldapd/<a href=3D"http://nss-pam-ldapd_0.=
9.7.bb" rel=3D"noreferrer" target=3D"_blank">nss-pam-ldapd_0.9.7.bb</a><br>
@@ -22,8 +22,8 @@ SRC_URI =3D &quot;\<br>
<br>
=C2=A0inherit autotools<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>fa5ec49cb54428d6c73e244a110216<wbr>95&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>101d5a7fa10549cc77be48d07f2b81<wbr>41f59=
182f10f2cc0fea93efd13c3a5<wbr>a6f2&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>912f2a5ead193d2defc6c525423e84<wbr>e8&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>0db88d6518bf7ffb01b44f8f8841ec<wbr>e5162=
906982ce2c9e45e6afff90d37<wbr>83eb&quot;<br>
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
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--94eb2c060f22113dc4053ce1ccc5--
