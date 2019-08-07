Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C75BBE00CB9; Tue,  6 Aug 2019 20:14:35 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA7DEE0049C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Aug 2019 20:14:34 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id x25so84102771ljh.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 06 Aug 2019 20:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OtsH+Qbnz5p7Mwq2p3dJwIJVdaJCJVr8VAmt8y7dge8=;
	b=jslVFnhcTCzhTpYnRzelwaQFPWs9kbr1HKXm5x8HiVRqORXAehtZpLuScDfqXiRzdn
	JhckPLDxnjH5rYuL4sB0IkvAINy3sx0uJWvynIERtVPaAqS9Wmn1l/MA/TyGGzqQIxtb
	G5CVyl1OBsx9Ivr27sS/b/xVVv4twMmKnq6nGv+UYcTMa3Nos2Ce7cwoc1eEZ1CyHW16
	ltYDdTzsBRm2ImlRZBaZtgSS9aOXncZL/LANM8pWSKzptyrVLEJY897152aPJR6QarS/
	pjMDP0kkep7YWosl44+F+RbQ02T0T1Lndl8hJOPDOBT/M/MQyJ1A9Be5Ua0po/rGvGaW
	3v1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OtsH+Qbnz5p7Mwq2p3dJwIJVdaJCJVr8VAmt8y7dge8=;
	b=HTJmwlZNlk25pY94wWkYB7q8e6QJUujOeuxRxymslduZHXDVPahi07fDm5svkH/UuS
	4rYgOLIEIca3O4iieS0d3FlKyoen61r1mA6UyPaWQCTUhMevb5LQIHUiYMHFWHMbLNr+
	b6sAL/awW+wgRS9WToP0enBKvVhvDEB5iIaslardGJ+9FT414hfVbv16R4i2H6xA+8/o
	+KPTHybK36innDsPyHMc7o4XBDptIXs4Stm+GylA+riYbi+2Frha2gz/zoWeGFR7BUN7
	b6/7c5mL4XcVG8NyfpHJbp01+VKNouKB7OjHTznqGTNUvUEEfrWVlSre9f0JqDGv5PcP
	aZ9A==
X-Gm-Message-State: APjAAAXmv214n4lDzv6ZjD9VFNy+/zSnZsuAYtybfMpt1w0sfpt3zeYs
	ZZwQM9GfJ1N6lg4jVH264BLdzh5B3CxZVdi87Lk=
X-Google-Smtp-Source: APXvYqyMpysz3F+GpWvuAmgJPfvIP1mwqIXGpL8cmGxHRzZ+OIe7DYvpWZKkJmAFxS6Ov4MZdrweFG3MNHwswljNUXk=
X-Received: by 2002:a2e:93c5:: with SMTP id p5mr3406886ljh.79.1565147673831;
	Tue, 06 Aug 2019 20:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <1565074480-317469-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1565074480-317469-1-git-send-email-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Aug 2019 00:14:23 -0300
Message-ID: <CADkTA4N0-BU3g2iy3F=SkNd=Fjso-c3MY-jXEPANgrgDKUgUPQ@mail.gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] nagios-core/nagios-nrpe: use update-alternatives for /var/nagios
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
X-List-Received-Date: Wed, 07 Aug 2019 03:14:35 -0000
Content-Type: multipart/alternative; boundary="0000000000001ead41058f7e574c"

--0000000000001ead41058f7e574c
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Aug 6, 2019 at 3:54 AM <changqing.li@windriver.com> wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> fix below error:
> Error: Transaction check error:
>   file /var/nagios from install of nagios-core-4.4.3-r0.core2_64 conflicts
> with file from package nagios-nrpe-daemon-3.2.1-r0.core2_64
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-extended/nagios/nagios-core_4.4.3.bb | 6 +++++-
>  recipes-extended/nagios/nagios-nrpe_3.2.1.bb | 5 ++++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/nagios/nagios-core_4.4.3.bb
> b/recipes-extended/nagios/nagios-core_4.4.3.bb
> index fcf04e9..7a86653 100644
> --- a/recipes-extended/nagios/nagios-core_4.4.3.bb
> +++ b/recipes-extended/nagios/nagios-core_4.4.3.bb
> @@ -25,7 +25,7 @@ SRC_URI[sha256sum] =
> "bba8f0e8dc8cf72f7a7ae4e8ce9c60f5bd315629421b9ec34818a28b8d
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> -inherit autotools-brokensep update-rc.d systemd
> +inherit autotools-brokensep update-rc.d systemd update-alternatives
>
>  DEPENDS = "gd unzip-native"
>
> @@ -151,3 +151,7 @@ INITSCRIPT_NAME = "nagios"
>  INITSCRIPT_PARAMS = "defaults"
>
>  CVE_PRODUCT = "nagios_core"
> +
> +ALTERNATIVE_PRIORITY_${PN} = '20'
> +ALTERNATIVE_${PN} = "nagios"
> +ALTERNATIVE_LINK_NAME[nagios] = "${localstatedir}/nagios"
> diff --git a/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
> b/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
> index 3afa5dd..04917f7 100644
> --- a/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
> +++ b/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
> @@ -20,7 +20,7 @@ SRC_URI[sha256sum] =
> "8ad2d1846ab9011fdd2942b8fc0c99dfad9a97e57f4a3e6e394a4ead99
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> -inherit autotools-brokensep update-rc.d systemd
> +inherit autotools-brokensep update-rc.d systemd update-alternatives
>
>  # IP address of server which proxy should connect to
>  MONITORING_PROXY_SERVER_IP ??= "192.168.7.2"
> @@ -97,3 +97,6 @@ SYSTEMD_AUTO_ENABLE_${PN}-daemon = "enable"
>  INITSCRIPT_PACKAGES = "${PN}-daemon"
>  INITSCRIPT_NAME_${PN}-daemon = "nrpe"
>  INITSCRIPT_PARAMS_${PN}-daemon = "defaults"
> +
> +ALTERNATIVE_${PN}-daemon = "nagios"
> +ALTERNATIVE_LINK_NAME[nagios] = "${localstatedir}/nagios"
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

--0000000000001ead41058f7e574c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Au=
g 6, 2019 at 3:54 AM &lt;<a href=3D"mailto:changqing.li@windriver.com">chan=
gqing.li@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Changqing Li &lt;<a href=3D"mailto:changqing.li=
@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
<br>
fix below error:<br>
Error: Transaction check error:<br>
=C2=A0 file /var/nagios from install of nagios-core-4.4.3-r0.core2_64 confl=
icts with file from package nagios-nrpe-daemon-3.2.1-r0.core2_64<br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/nagios/<a href=3D"http://nagios-core_4.4.3.bb" rel=
=3D"noreferrer" target=3D"_blank">nagios-core_4.4.3.bb</a> | 6 +++++-<br>
=C2=A0recipes-extended/nagios/<a href=3D"http://nagios-nrpe_3.2.1.bb" rel=
=3D"noreferrer" target=3D"_blank">nagios-nrpe_3.2.1.bb</a> | 5 ++++-<br>
=C2=A02 files changed, 9 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-extended/nagios/<a href=3D"http://nagios-core_4.4.3.bb=
" rel=3D"noreferrer" target=3D"_blank">nagios-core_4.4.3.bb</a> b/recipes-e=
xtended/nagios/<a href=3D"http://nagios-core_4.4.3.bb" rel=3D"noreferrer" t=
arget=3D"_blank">nagios-core_4.4.3.bb</a><br>
index fcf04e9..7a86653 100644<br>
--- a/recipes-extended/nagios/<a href=3D"http://nagios-core_4.4.3.bb" rel=
=3D"noreferrer" target=3D"_blank">nagios-core_4.4.3.bb</a><br>
+++ b/recipes-extended/nagios/<a href=3D"http://nagios-core_4.4.3.bb" rel=
=3D"noreferrer" target=3D"_blank">nagios-core_4.4.3.bb</a><br>
@@ -25,7 +25,7 @@ SRC_URI[sha256sum] =3D &quot;bba8f0e8dc8cf72f7a7ae4e8ce9c=
60f5bd315629421b9ec34818a28b8d<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
<br>
-inherit autotools-brokensep update-rc.d systemd<br>
+inherit autotools-brokensep update-rc.d systemd update-alternatives<br>
<br>
=C2=A0DEPENDS =3D &quot;gd unzip-native&quot;<br>
<br>
@@ -151,3 +151,7 @@ INITSCRIPT_NAME =3D &quot;nagios&quot;<br>
=C2=A0INITSCRIPT_PARAMS =3D &quot;defaults&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;nagios_core&quot;<br>
+<br>
+ALTERNATIVE_PRIORITY_${PN} =3D &#39;20&#39;<br>
+ALTERNATIVE_${PN} =3D &quot;nagios&quot;<br>
+ALTERNATIVE_LINK_NAME[nagios] =3D &quot;${localstatedir}/nagios&quot;<br>
diff --git a/recipes-extended/nagios/<a href=3D"http://nagios-nrpe_3.2.1.bb=
" rel=3D"noreferrer" target=3D"_blank">nagios-nrpe_3.2.1.bb</a> b/recipes-e=
xtended/nagios/<a href=3D"http://nagios-nrpe_3.2.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">nagios-nrpe_3.2.1.bb</a><br>
index 3afa5dd..04917f7 100644<br>
--- a/recipes-extended/nagios/<a href=3D"http://nagios-nrpe_3.2.1.bb" rel=
=3D"noreferrer" target=3D"_blank">nagios-nrpe_3.2.1.bb</a><br>
+++ b/recipes-extended/nagios/<a href=3D"http://nagios-nrpe_3.2.1.bb" rel=
=3D"noreferrer" target=3D"_blank">nagios-nrpe_3.2.1.bb</a><br>
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] =3D &quot;8ad2d1846ab9011fdd2942b8fc0c=
99dfad9a97e57f4a3e6e394a4ead99<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
<br>
-inherit autotools-brokensep update-rc.d systemd<br>
+inherit autotools-brokensep update-rc.d systemd update-alternatives<br>
<br>
=C2=A0# IP address of server which proxy should connect to<br>
=C2=A0MONITORING_PROXY_SERVER_IP ??=3D &quot;192.168.7.2&quot;<br>
@@ -97,3 +97,6 @@ SYSTEMD_AUTO_ENABLE_${PN}-daemon =3D &quot;enable&quot;<b=
r>
=C2=A0INITSCRIPT_PACKAGES =3D &quot;${PN}-daemon&quot;<br>
=C2=A0INITSCRIPT_NAME_${PN}-daemon =3D &quot;nrpe&quot;<br>
=C2=A0INITSCRIPT_PARAMS_${PN}-daemon =3D &quot;defaults&quot;<br>
+<br>
+ALTERNATIVE_${PN}-daemon =3D &quot;nagios&quot;<br>
+ALTERNATIVE_LINK_NAME[nagios] =3D &quot;${localstatedir}/nagios&quot;<br>
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
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--0000000000001ead41058f7e574c--
