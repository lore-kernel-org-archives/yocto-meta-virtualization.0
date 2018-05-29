Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ED21DE00B4C; Tue, 29 May 2018 07:24:47 -0700 (PDT)
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
	*      [209.85.128.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AAFEAE009D4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:24:45 -0700 (PDT)
Received: by mail-wr0-f172.google.com with SMTP id u12-v6so25839386wrn.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=swkwh2EC9vd/iUH0puw3YEz2nFnAiOHagIncp2sQYkI=;
	b=AufMeNqrIlG7+wsGURr4h/pyfZnjJ23x5HeZoW+CZX8AnKgZF/t7hmaea7Iz82Hs3r
	cQEBKHg8ij3GDdV8lvWX6xCFkV31u5qwvF8O9szayMguIgzuNPqTZ7PgNEZgjCP0+dX3
	H8Y3nBagfGv/a3hUuDeJP8qCq9vJxyVSvdTjCFipKyCIa/CurCn8wV9Q/W0tiAvtIxbo
	4w9uAk/EyTATXYK+9/chrg3eluxsSuuHuxgfaVdFVfZqqpYyukqBVA850OhA4grBi3A2
	VABEQXB04HykTMfHKfpoOU8zFUFyE5SZb2or9SSASUo54w1AVLZ13sq8T7nuh5Q5ziue
	rjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=swkwh2EC9vd/iUH0puw3YEz2nFnAiOHagIncp2sQYkI=;
	b=P1vPZB+TUfkyDlz/pJXtrKbPXeYizcmvCYHnXWYNz/jv4UTFtphtW+fqg2lfHUwbLg
	nlwESghvmBlq2ze4ZB3QJmrRcpZZTh39Vcs4f5ePEtEkD1Jr8IiTRFo7O+k7dFTf0HB8
	3A0yTTg09hKwJ8aZCLFLXHUlAllIJk+z6tjWSdy+oaD3frPh0OtIO7TTcg3K/8Ht9BFd
	36+9hl4ouos+afCnf6Rx7Pl5ahK5Iz9I4n1zA3McohQJ/HCacKyNz5iEpra3+Ge/0IbK
	biDGqJEjw8JBJbb4sBXr6wUDQ8+P6SDbJ1iKeEdcXDYGoFaEAHoyULasOdewAG7t9kpC
	WMqQ==
X-Gm-Message-State: ALKqPwdTgkNSSLKKBkLXu6b0rJBWyR1oUiTqO3WGKkRak3KEl/Yqqctq
	TroWuXTiR6MXR+tsz5qYcH7fKLfNNItsavuOTMsZeg==
X-Google-Smtp-Source: ADUXVKLLQo4J5v3X0SlDIHsE+B2s57Lwgld5VAcc5iDuK0NPyK8ALVARUzm8Il0Aj4pSUxgLwtVJI018ALBJ4Q4ibeY=
X-Received: by 2002:a19:a2c2:: with SMTP id
	l185-v6mr9362849lfe.135.1527603884696; 
	Tue, 29 May 2018 07:24:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3307:0:0:0:0:0 with HTTP; Tue, 29 May 2018 07:24:44
	-0700 (PDT)
In-Reply-To: <1526416033-11819-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1526416033-11819-1-git-send-email-leimaohui@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 May 2018 10:24:44 -0400
Message-ID: <CADkTA4MosTnu4Ks8qL4j_yOrwNhJaO05rGQY=_gK4BZbcwDgkA@mail.gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [oe-virtualization][meta-cloud-services][PATCH] nss-pam-ldapd: fix SRC_URI and DEPENDS
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
X-List-Received-Date: Tue, 29 May 2018 14:24:48 -0000
Content-Type: multipart/alternative; boundary="000000000000e7b1c3056d58feca"

--000000000000e7b1c3056d58feca
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, May 15, 2018 at 4:27 PM, Lei Maohui <leimaohui@cn.fujitsu.com>
wrote:

> - Fix SRC_URI, modified ${PN} to ${BPN}
> - Added krb5 into DEPENDS
>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
> b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
> index a309c1e..404aeca 100644
> --- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
> +++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.8.bb
> @@ -15,7 +15,7 @@ SECTION = "base"
>  FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>
>  SRC_URI = "\
> -       http://arthurdejong.org/nss-pam-ldapd/${PN}-${PV}.tar.gz \
> +       http://arthurdejong.org/nss-pam-ldapd/${BPN}-${PV}.tar.gz \
>         file://nslcd.init \
>         file://nslcd.service \
>         "
> @@ -25,7 +25,7 @@ inherit autotools
>  SRC_URI[md5sum] = "8c99fdc54f4bf9aca8c5f53fdb1403ff"
>  SRC_URI[sha256sum] = "ef7362e7f2003da8c7beb7bcc03c30
> 494acf712625aaac8badc6e7eb16f3453f"
>
> -DEPENDS += "libpam openldap"
> +DEPENDS += "libpam openldap krb5"
>
>  EXTRA_OECONF = "\
>         --disable-pynslcd \
> --
> 1.9.1
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

--000000000000e7b1c3056d58feca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, May 15, 2018 at 4:27 PM=
, Lei Maohui <span dir=3D"ltr">&lt;<a href=3D"mailto:leimaohui@cn.fujitsu.c=
om" target=3D"_blank">leimaohui@cn.fujitsu.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">- Fix SRC_URI, modified ${PN} to ${BPN}<br>
- Added krb5 into DEPENDS<br>
<br>
Signed-off-by: Lei Maohui &lt;<a href=3D"mailto:leimaohui@cn.fujitsu.com">l=
eimaohui@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0recipes-support/nss-pam-ldapd/<a href=3D"http://nss-pam-ldapd_0.9.8.b=
b" rel=3D"noreferrer" target=3D"_blank"><wbr>nss-pam-ldapd_0.9.8.bb</a> | 4=
 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-support/nss-pam-<wbr>ldapd/<a href=3D"http://nss-pam-l=
dapd_0.9.8.bb" rel=3D"noreferrer" target=3D"_blank">nss-pam-ldapd_0.9.8.bb<=
/a> b/recipes-support/nss-pam-<wbr>ldapd/<a href=3D"http://nss-pam-ldapd_0.=
9.8.bb" rel=3D"noreferrer" target=3D"_blank">nss-pam-ldapd_0.9.8.bb</a><br>
index a309c1e..404aeca 100644<br>
--- a/recipes-support/nss-pam-<wbr>ldapd/<a href=3D"http://nss-pam-ldapd_0.=
9.8.bb" rel=3D"noreferrer" target=3D"_blank">nss-pam-ldapd_0.9.8.bb</a><br>
+++ b/recipes-support/nss-pam-<wbr>ldapd/<a href=3D"http://nss-pam-ldapd_0.=
9.8.bb" rel=3D"noreferrer" target=3D"_blank">nss-pam-ldapd_0.9.8.bb</a><br>
@@ -15,7 +15,7 @@ SECTION =3D &quot;base&quot;<br>
=C2=A0FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/files:&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://arthurdejong.org/nss-pam-ldap=
d/${PN}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://arthurdej=
ong.org/nss-<wbr>pam-ldapd/${PN}-${PV}.tar.gz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://arthurdejong.org/nss-pam-ldap=
d/${BPN}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://arthurde=
jong.org/nss-<wbr>pam-ldapd/${BPN}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://nslcd.init \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://nslcd.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
@@ -25,7 +25,7 @@ inherit autotools<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>8c99fdc54f4bf9aca8c5f53fdb1403<wbr>ff&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>ef7362e7f2003da8c7beb7bcc03c30<wbr>=
494acf712625aaac8badc6e7eb16f3<wbr>453f&quot;<br>
<br>
-DEPENDS +=3D &quot;libpam openldap&quot;<br>
+DEPENDS +=3D &quot;libpam openldap krb5&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-pynslcd \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
1.9.1<br>
<br>
<br>
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

--000000000000e7b1c3056d58feca--
