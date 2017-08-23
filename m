Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ACD79E00D61; Tue, 22 Aug 2017 19:49:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.217.171 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.217.171 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17002E00C14
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 19:49:00 -0700 (PDT)
Received: by mail-ua0-f171.google.com with SMTP id d12so1585714uag.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 19:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tk7Iq1tQDFeGjIOENA/uiwGUxjfdm0OZUFz06BgB63o=;
	b=fpyTmJQWTfxZtab7U9csCsdJxY0g9Ro6lLiCq9/rjwFtnNmeax4J6oXmR/ujf72EWP
	pZsPcboiJmLmj50zQCXOkmVwHbu2OWwUYmf/Lvm9Ab/mMK8R3HbCrzPQkQ7QiQfUJhiX
	ZjENkfLb7TkTUgf8gTWA2IOOhviswHvbPqVhm3/9P+DeBx71LutOlpEJMQCqlrBdYVRQ
	FOqM5oHxzh/cNOjNa3hXAF/K5HoF39QBygXPOMmvbOST5dtaSbQOz0kwUx6D0lZMRakD
	A0QxPlGpFj7gJX6KpzlIrjDWdWX0eBiIESSyVwPyEgcPZCgq92DNNqUWgwpMNsJHIYln
	9Wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tk7Iq1tQDFeGjIOENA/uiwGUxjfdm0OZUFz06BgB63o=;
	b=HD2o0gRY7HYOZzYqobRKUXgn0E3wbifjmMF5MYykWlw2q78H8E9EaM5Hbqy/oetlat
	ODmxONmCYpv7dl9lWXlJJ8WEZME477O7hk1KzXVXbou6tAQuoikPXDOEVohmaoMTXwOi
	NEa/yjDqgURjVEOTzIqvh/E8KjoYngU6zvHGMHAcHVs7UaB2MijOHUg1mIXm2dWJNAYo
	vwcu0e/ih+dInj3RxYLiPTB8oPK6dRYpytJK39eE/YTZPlWrSE1dZ23sRYiM9Q+RqSEZ
	DDRmxPcCXdWMr2HHwSebMtonpY2oFFwCnSa80nr4aY4OOPmT0L8Ba3drPhULSJu6n06X
	x2qA==
X-Gm-Message-State: AHYfb5jQtvTt4ze0Yn0IodBiWaw5BEnh3idzRJpxtPmYDyMjqVx/4vu6
	Ylri9ESYnKHNYKTsRmItbZ+zU1ZEAg==
X-Received: by 10.176.74.193 with SMTP id t1mr783373uae.41.1503456539974; Tue,
	22 Aug 2017 19:48:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Tue, 22 Aug 2017 19:48:59 -0700 (PDT)
In-Reply-To: <1503433550-26303-1-git-send-email-mark.asselstine@windriver.com>
References: <1503433550-26303-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 22 Aug 2017 22:48:59 -0400
Message-ID: <CADkTA4OY9upOB7p85d2ooaQfsgmFLsZv66N1K3RX_+K7H8pdzA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH] python-novaclient: drop DEPENDS for python-setuptools-git
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
X-List-Received-Date: Wed, 23 Aug 2017 02:49:01 -0000
Content-Type: multipart/alternative; boundary="f403045f905600223c055762c1c6"

--f403045f905600223c055762c1c6
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Aug 22, 2017 at 4:25 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> The upstream project dropped the use of setuptools-git when they moved
> to use pbr. There was a bug here anyway in that 'inherit setuptools'
> sets a DEPENDS which was then being blown away by the "DEPENDS = ...",
> but since we just don't need python-setuptools-git anymore we simply
> drop it.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-openstack/recipes-devtools/python/python-novaclient_git.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-
> novaclient_git.bb b/meta-openstack/recipes-devtools/python/python-
> novaclient_git.bb
> index a2775ec..1456bbc 100644
> --- a/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
> @@ -15,7 +15,6 @@ S = "${WORKDIR}/git"
>
>  inherit setuptools monitor rmargparse
>
> -DEPENDS = "python-setuptools-git"
>  DEPENDS += " \
>          python-pip \
>          python-pbr \
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

--f403045f905600223c055762c1c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, Aug 22, 2017 at 4:25 PM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">The upstream project dropped the=
 use of setuptools-git when they moved<br>
to use pbr. There was a bug here anyway in that &#39;inherit setuptools&#39=
;<br>
sets a DEPENDS which was then being blown away by the &quot;DEPENDS =3D ...=
&quot;,<br>
but since we just don&#39;t need python-setuptools-git anymore we simply<br=
>
drop it.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
novaclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>novacli=
ent_git.bb</a> | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-novaclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>=
novaclient_git.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a href=
=3D"http://python-novaclient_git.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython-<wbr>novaclient_git.bb</a><br>
index a2775ec..1456bbc 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
novaclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>novacli=
ent_git.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
novaclient_git.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>novacli=
ent_git.bb</a><br>
@@ -15,7 +15,6 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit setuptools monitor rmargparse<br>
<br>
-DEPENDS =3D &quot;python-setuptools-git&quot;<br>
=C2=A0DEPENDS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-pip \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0python-pbr \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
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

--f403045f905600223c055762c1c6--
