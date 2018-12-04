Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0ED6FE00C90; Tue,  4 Dec 2018 15:18:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.41 listed in list.dnswl.org]
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4206E00C62
	for <meta-virtualization@yoctoproject.org>;
	Tue,  4 Dec 2018 15:18:44 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id c16so13293404lfj.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 04 Dec 2018 15:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kTpSNPVszPBiY06g+k7xG/t9bP6r3jGk6PA29FKWfwo=;
	b=KQwirdgXpSVlVwynqeLmC+O5fdpAwJO6hptcoYZz2aasLa1okSUBODkIdk7zT8vMIj
	e0roDoVDuV7R27nMNvL3OXn9S+tG98MiCGrrhuTm2uQGlrDsLBYdJAJBYgAdQShpBjHV
	4TJzT0VCv+/Bpf9uzl551KjL/rA23s9+k0ByM3XC6zk8x+EbbpmObOJqbWvJZPBROk4q
	ahSzWtUStOzG2asTKNp2ixHzEOgqNKNvMeNsrVKI6hrpM2mcsFgiBKjKaC8MIETyqR8L
	uorSdg4x02aFgtJFQ8g04Spk/d+DDYW4yF79Qg2PHSBmueRIN/TDCM79QQtTf6ZXlp6M
	l2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kTpSNPVszPBiY06g+k7xG/t9bP6r3jGk6PA29FKWfwo=;
	b=geOH7pAUISPWRNT3qH/ebhOmxPQ+PAiD2rHHGRe/3yifDJhm6+fxjDMck+ygCymNUT
	UrtgffCPPDeQJ4QMBdRLypymZJg72H1UgqT6dil5wEy+VcarXnKlGY9Rlq61qcuaxnm8
	7R6jjPzdt8tJxBSiCi9fnDYhnI4cdLl7sp+6/LnkTOFl7c9YXdE8wzr5+WSfcwWAUZEd
	f3ij4c9eBDcyYzhymvr9TxCbKE4ENg8g//AX3Apu1m2QretGni6NEcyxZZ67/BM1ju6y
	LdXtkfSrAUUrbRTsnQ4O9091yzFq/hRG+bEUMmQaEs9OXbq06QsKF4yqXEOt1SLRDuSh
	Rvqg==
X-Gm-Message-State: AA+aEWbDMmcNnI9D7LhTs/kaxakHqUJRc4t/fiw2xoGMr0ledzmpPb2T
	zvWFLo4ClWnBiFy1vOiNIY36Ew2gFTaNEyLB0yp+NlwqOYM=
X-Google-Smtp-Source: AFSGD/WUILeD1afExI9J3MEoQhpFuD7jHPiqBx++Yqo+mzMxe8hunBGmMzg18hZAGOxsSkp8L+T94vtOLILS7/2RkTA=
X-Received: by 2002:a19:ced3:: with SMTP id e202mr12955884lfg.13.1543965523566;
	Tue, 04 Dec 2018 15:18:43 -0800 (PST)
MIME-Version: 1.0
References: <1543614413-14710-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1543614413-14710-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 4 Dec 2018 18:18:30 -0500
Message-ID: <CADkTA4NNYVdWKudt9cP01+v03BhufGUMH9c6eNh7eZh0QwXt=A@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] lxcfs: uprev from v3.0.1 to v3.0.3
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
X-List-Received-Date: Tue, 04 Dec 2018 23:18:46 -0000
Content-Type: multipart/alternative; boundary="00000000000093e478057c3a7c9f"

--00000000000093e478057c3a7c9f
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Nov 30, 2018 at 4:47 PM Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> A very small # of new commits. Most are minor bug fixes, no feature
> work. I looked at adding ptests but the tests are mostly in an
> unusable state at the moment, for example several require cgm despite
> cgmanager being deprecated. So I have opted to continue without them
> and only when we can work with upstream to improve their testing can
> we seriously consider adding them.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-containers/lxcfs/{lxcfs_3.0.1.bb => lxcfs_3.0.3.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-containers/lxcfs/{lxcfs_3.0.1.bb => lxcfs_3.0.3.bb} (84%)
>
> diff --git a/recipes-containers/lxcfs/lxcfs_3.0.1.bb
> b/recipes-containers/lxcfs/lxcfs_3.0.3.bb
> similarity index 84%
> rename from recipes-containers/lxcfs/lxcfs_3.0.1.bb
> rename to recipes-containers/lxcfs/lxcfs_3.0.3.bb
> index 576027f..b6b6ac6 100644
> --- a/recipes-containers/lxcfs/lxcfs_3.0.1.bb
> +++ b/recipes-containers/lxcfs/lxcfs_3.0.3.bb
> @@ -10,8 +10,8 @@ SRC_URI = " \
>  "
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
> -SRC_URI[md5sum] = "fa49872fc45846125455199a2cce18f1"
> -SRC_URI[sha256sum] =
> "016c317f13392bebccba338511f537332fb2fdbaf62a5f6d77307b38a348f41f"
> +SRC_URI[md5sum] = "bfc41f949caeabd0468189480222f25e"
> +SRC_URI[sha256sum] =
> "890aa30d960d9b1e53b0c0712bf645c1f1924f750e32cd090f368c1338bd462f"
>
>  DEPENDS += "fuse"
>  RDEPENDS_${PN} += "fuse"
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
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000093e478057c3a7c9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Nov 30, 2018 at 4:4=
7 PM Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver.com">m=
ark.asselstine@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">A very small # of new commits. Most are minor b=
ug fixes, no feature<br>
work. I looked at adding ptests but the tests are mostly in an<br>
unusable state at the moment, for example several require cgm despite<br>
cgmanager being deprecated. So I have opted to continue without them<br>
and only when we can work with upstream to improve their testing can<br>
we seriously consider adding them.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/lxcfs/{<a href=3D"http://lxcfs_3.0.1.bb" rel=3D"no=
referrer" target=3D"_blank">lxcfs_3.0.1.bb</a> =3D&gt; <a href=3D"http://lx=
cfs_3.0.3.bb" rel=3D"noreferrer" target=3D"_blank">lxcfs_3.0.3.bb</a>} | 4 =
++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename recipes-containers/lxcfs/{<a href=3D"http://lxcfs_3.0.1.bb" re=
l=3D"noreferrer" target=3D"_blank">lxcfs_3.0.1.bb</a> =3D&gt; <a href=3D"ht=
tp://lxcfs_3.0.3.bb" rel=3D"noreferrer" target=3D"_blank">lxcfs_3.0.3.bb</a=
>} (84%)<br>
<br>
diff --git a/recipes-containers/lxcfs/<a href=3D"http://lxcfs_3.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">lxcfs_3.0.1.bb</a> b/recipes-containers/l=
xcfs/<a href=3D"http://lxcfs_3.0.3.bb" rel=3D"noreferrer" target=3D"_blank"=
>lxcfs_3.0.3.bb</a><br>
similarity index 84%<br>
rename from recipes-containers/lxcfs/<a href=3D"http://lxcfs_3.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">lxcfs_3.0.1.bb</a><br>
rename to recipes-containers/lxcfs/<a href=3D"http://lxcfs_3.0.3.bb" rel=3D=
"noreferrer" target=3D"_blank">lxcfs_3.0.3.bb</a><br>
index 576027f..b6b6ac6 100644<br>
--- a/recipes-containers/lxcfs/<a href=3D"http://lxcfs_3.0.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">lxcfs_3.0.1.bb</a><br>
+++ b/recipes-containers/lxcfs/<a href=3D"http://lxcfs_3.0.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">lxcfs_3.0.3.bb</a><br>
@@ -10,8 +10,8 @@ SRC_URI =3D &quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57&quot;<br>
-SRC_URI[md5sum] =3D &quot;fa49872fc45846125455199a2cce18f1&quot;<br>
-SRC_URI[sha256sum] =3D &quot;016c317f13392bebccba338511f537332fb2fdbaf62a5=
f6d77307b38a348f41f&quot;<br>
+SRC_URI[md5sum] =3D &quot;bfc41f949caeabd0468189480222f25e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;890aa30d960d9b1e53b0c0712bf645c1f1924f750e32c=
d090f368c1338bd462f&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;fuse&quot;<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;fuse&quot;<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">- Thou shalt not follow the NULL pointer, for chaos and mad=
ness await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, =
Star Trek II<br><br></div>

--00000000000093e478057c3a7c9f--
