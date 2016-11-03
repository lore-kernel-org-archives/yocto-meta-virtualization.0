Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91B47E00ACE; Thu,  3 Nov 2016 12:43:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.196 listed in dnsbl.sorbs.net]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D58B8E0050B
	for <meta-virtualization@yoctoproject.org>;
	Thu,  3 Nov 2016 12:43:55 -0700 (PDT)
Received: by mail-qk0-f196.google.com with SMTP id o68so4168507qkf.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 03 Nov 2016 12:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y+2bnYKmlJ36LoElxiifoGPUT1YgKpaDzj1i0yhU/ok=;
	b=eTM8DxJALVkv8AeaWZgLl1+nbVMUKsOevZxr96UIq6IY8y/fpzOlqvai/5gH/0zr3e
	Gg4qRA9Mcy8S2j2j14gRZ4fy7FkqYpKvONfXRdmby36GM3QPc3zeBXxskOufiM63+Hf0
	x+ft3ya6F9MulY/2qYZzh56eHCKjqeUJs8T06q2LWhNEzjhevoYXEyv8TQcBR5n3DTIC
	aUYGTSdsffxaXGjQ8gWxDNi/VUWK1aKP4lNU0SoB47sRrKvzSv8CZWpcBbMDERR84Zhj
	wg430SQtCaDHlao2aFmq9WBfS5fZn/wVlX6PG6TACeOb0EiHvDpMhweQ4Rx5fkaPDJsg
	D0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y+2bnYKmlJ36LoElxiifoGPUT1YgKpaDzj1i0yhU/ok=;
	b=bmerEXt1IqIbI9P7zhyYQ5WyIMuvHT9f7IcFBL9Hegv5P9oRln1lWx1iXJPy+2SBYL
	3rUUU5zwnXWM04ys9MkI78AwuLfzb0ihdt/FncSZPiNZaxVCi3U6Y0+0GEeZuS+ev4rF
	5Lfyc7l0PvqJeRGvxjPRn6s8K+yOP4D4EfnUADooRN87GThCrvfTUijeCSMtqhzHvybc
	LGak19bBvCX71oO0Twqj7pbFp6DP5Wwc+kqkjljI37d+c1h3TL8Q+A5NSW4c+zWRU5jX
	lllkdWUCRDM6OAAqtzfCnLbR/7QJMLXPuq54AyN/DQKpZzxSvGww/zAXkhRXZutV6qe9
	GNag==
X-Gm-Message-State: ABUngvdK9ljTeo0x4nKircAFG5Mi722dBMWotDfxETeNHVaGc4XxljDOyO6HYXX2g22EykXDEENUKRanhr6xbw==
X-Received: by 10.55.197.6 with SMTP id p6mr10519462qki.239.1478202234849;
	Thu, 03 Nov 2016 12:43:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.220 with HTTP; Thu, 3 Nov 2016 12:43:54 -0700 (PDT)
In-Reply-To: <1478167282-13037-1-git-send-email-s.lengfeld@phytec.de>
References: <CADkTA4PZsYZ3yGzqN6ZJe80k28eCKRfSZNWAtBro1bYpcqiraQ@mail.gmail.com>
	<1478167282-13037-1-git-send-email-s.lengfeld@phytec.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 3 Nov 2016 15:43:54 -0400
Message-ID: <CADkTA4N=8iGkwvWb+i45ZLfJcW3VsYo=1PdE=ZkkYqg29UzFRA@mail.gmail.com>
To: Stefan Lengfeld <s.lengfeld@phytec.de>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] docker: install script config-check.sh
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
X-List-Received-Date: Thu, 03 Nov 2016 19:43:56 -0000
Content-Type: multipart/alternative; boundary=001a1149a18c1d4fda05406ac794

--001a1149a18c1d4fda05406ac794
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 3, 2016 at 6:01 AM, Stefan Lengfeld <s.lengfeld@phytec.de>
wrote:

> The script /usr/share/docker/config-check.sh is very useful to test all
> kernel requirements for docker. A lot of embedded boards will use a
> custom kernel config that does not have all kernel features enabled by
> default. Install the script so kernel developer can easily enable the
> missing features.
>

Merged.

Bruce


>
> Signed-off-by: Stefan Lengfeld <s.lengfeld@phytec.de>
> ---
> v2: put script into additional package 'docker-contrib'
> v2: add package dependency to bash
> ---
>  recipes-containers/docker/docker_git.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/recipes-containers/docker/docker_git.bb
> b/recipes-containers/docker/docker_git.bb
> index 42a336e..cd9a69a 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -54,6 +54,8 @@ DEPENDS = "go-cross \
>      go-distribution-digest \
>      "
>
> +PACKAGES =+ "${PN}-contrib"
> +
>  DEPENDS_append_class-target = "lvm2"
>  RDEPENDS_${PN} = "curl aufs-util git cgroup-lite util-linux iptables"
>  RRECOMMENDS_${PN} = "lxc docker-registry rt-tests"
> @@ -125,6 +127,7 @@ do_install() {
>
>         mkdir -p ${D}/usr/share/docker/
>         cp ${WORKDIR}/hi.Dockerfile ${D}/usr/share/docker/
> +       install -m 0755 ${S}/contrib/check-config.sh ${D}/usr/share/docker/
>  }
>
>  inherit useradd
> @@ -133,6 +136,9 @@ GROUPADD_PARAM_${PN} = "-r docker"
>
>  FILES_${PN} += "/lib/systemd/system/*"
>
> +FILES_${PN}-contrib += "/usr/share/docker/check-config.sh"
> +RDEPENDS_${PN}-contrib += "bash"
> +
>  # DO NOT STRIP docker and dockerinit!!!
>  #
>  # Reason:
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

--001a1149a18c1d4fda05406ac794
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Nov 3, 2016 at 6:01 AM, Stefan Lengfeld <span dir=3D"ltr">&lt;<=
a href=3D"mailto:s.lengfeld@phytec.de" target=3D"_blank">s.lengfeld@phytec.=
de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""=
>The script /usr/share/docker/config-<wbr>check.sh is very useful to test a=
ll<br>
kernel requirements for docker. A lot of embedded boards will use a<br>
custom kernel config that does not have all kernel features enabled by<br>
default. Install the script so kernel developer can easily enable the<br>
missing features.<br></span></blockquote><div><br></div><div>Merged.</div><=
div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><span class=3D"">
<br>
Signed-off-by: Stefan Lengfeld &lt;<a href=3D"mailto:s.lengfeld@phytec.de">=
s.lengfeld@phytec.de</a>&gt;<br>
---<br>
</span>v2: put script into additional package &#39;docker-contrib&#39;<br>
v2: add package dependency to bash<br>
---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">dock<wbr>er_git.bb</a> | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=
=3D"noreferrer" target=3D"_blank">do<wbr>cker_git.bb</a> b/recipes-containe=
rs/docker/<a href=3D"http://docker_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">do<wbr>cker_git.bb</a><br>
index 42a336e..cd9a69a 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">do<wbr>cker_git.bb</a><br>
@@ -54,6 +54,8 @@ DEPENDS =3D &quot;go-cross \<br>
=C2=A0 =C2=A0 =C2=A0go-distribution-digest \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
+PACKAGES =3D+ &quot;${PN}-contrib&quot;<br>
+<br>
=C2=A0DEPENDS_append_class-target =3D &quot;lvm2&quot;<br>
=C2=A0RDEPENDS_${PN} =3D &quot;curl aufs-util git cgroup-lite util-linux ip=
tables&quot;<br>
=C2=A0RRECOMMENDS_${PN} =3D &quot;lxc docker-registry rt-tests&quot;<br>
@@ -125,6 +127,7 @@ do_install() {<br>
<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}/usr/share/docker/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/hi.Dockerfile ${D}/usr/share/dock=
er/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${S}/contrib/check-config.sh ${=
D}/usr/share/docker/<br>
=C2=A0}<br>
<br>
</span>=C2=A0inherit useradd<br>
@@ -133,6 +136,9 @@ GROUPADD_PARAM_${PN} =3D &quot;-r docker&quot;<br>
<br>
=C2=A0FILES_${PN} +=3D &quot;/lib/systemd/system/*&quot;<br>
<br>
+FILES_${PN}-contrib +=3D &quot;/usr/share/docker/check-<wbr>config.sh&quot=
;<br>
+RDEPENDS_${PN}-contrib +=3D &quot;bash&quot;<br>
+<br>
=C2=A0# DO NOT STRIP docker and dockerinit!!!<br>
=C2=A0#<br>
=C2=A0# Reason:<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a1149a18c1d4fda05406ac794--
