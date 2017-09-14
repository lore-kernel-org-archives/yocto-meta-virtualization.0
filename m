Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D34B4E00CED; Thu, 14 Sep 2017 13:31:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.213.68 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.68 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED45EE00CF1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Sep 2017 13:31:01 -0700 (PDT)
Received: by mail-vk0-f68.google.com with SMTP id t10so124829vke.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Sep 2017 13:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8+BJR5T4x7R/IDW3afrHS+6HMHZ95LwgfcVDWi+Tx9Y=;
	b=Hpr1owHvQGBbnbsZt7qqyefuL7CnJblea2Ndtet2W8CzOIXOggkNig0BLZik02tmwI
	vy+bbn7qLdx1hsZyln1ugyL3paL9w6v+Ka97Ei31nH5upf/cf8mKZBDoq4kgyAtdo7nI
	rcRDyuChRSddd7Cd30hMiGq56Zv8edc1bH/CLCV3QgTAPUIaRrB7PaxAkSHSfjAdqTWL
	3s1nmqU8Ka2mcCRKdKEnvEzJK42rUrb/8TXuwWuGL9xlC5bHtULR5VwGwci4GEsyOKcu
	T74arQ+CrRL6b5KHDMHdIFumou77YRtT8q5xq415K1xr95YJVsp3cd1im/JNtYMwyImP
	ae5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8+BJR5T4x7R/IDW3afrHS+6HMHZ95LwgfcVDWi+Tx9Y=;
	b=MEri6YyVi+sGbkXPpceeCrz31rO9l0mjWsuIkSpcthgcZ3VtiY9/X2u5A1O/HSWdSz
	2IvpjGWjH4KxXRNHQmFxITLlC2cj3TpeK3JEqlyx/3FnnXMsHYovkKeFuBn1bR4gQLk9
	OnhKx8KIndzMHb9kYQIMZNR8zBf1XIt7bADn/gD7NwQ9F9Zc/x6a2wGrtvkenGnTpzog
	/r2EJoU5nehF4hxBVqZKhzDMQEmRqExeTDaAoM8QOjmyOvXr9rgc1U6l6yidQ4Bb7h72
	+WXT32cR4OzYfUAHQAP0GgoJ6AYjUXh1+Rv3PFj6OZwjWkdW3vPB3HrqptpOEGWtGZKb
	8/ew==
X-Gm-Message-State: AHPjjUj3k7pC18qAKKdd+7HERLjEEZ51ap52QcYprECZ+CYeR3e8fVkF
	XHOtJzuxjGj8L8GPyRA4+7u3Wxox9dGoKvD+P5Y=
X-Google-Smtp-Source: AOwi7QABNDu9F9bbppgV5k10yEbddM6pGSKoJD1ndUz7Q4VtDoXDsPzy1sKRk6zGPZRBeJuMmS2xmqr1xHu/CVOjNJw=
X-Received: by 10.31.115.129 with SMTP id o123mr16187015vkc.79.1505421060944; 
	Thu, 14 Sep 2017 13:31:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.59.18 with HTTP; Thu, 14 Sep 2017 13:31:00 -0700 (PDT)
In-Reply-To: <1505351781-17082-1-git-send-email-christopher.w.clark@gmail.com>
References: <1505351781-17082-1-git-send-email-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Sep 2017 16:31:00 -0400
Message-ID: <CADkTA4PXJ4PGpntvrbz9QS-XF1HjAZBFuphrx_ZJsXb5CeYQNg@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH] xen: Add menuconfig task and enable menuconfig from devshell
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
X-List-Received-Date: Thu, 14 Sep 2017 20:31:53 -0000
Content-Type: multipart/alternative; boundary="94eb2c14c7c293465405592c27c3"

--94eb2c14c7c293465405592c27c3
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Sep 13, 2017 at 9:16 PM, <christopher.w.clark@gmail.com> wrote:

> From: Christopher Clark <christopher.clark6@baesystems.com>
>
> Xen supports Kconfig for configuring optional build settings.
> This commit adds the menuconfig task to simplify interactive use:
>
>     bitbake xen -c menuconfig
>
> and also ensures that menuconfig works when using the devshell.
> This change adds ncurses-native as a build dependency.
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>
> Please use my gmail address for any correspondence.
>
>  recipes-extended/xen/xen.inc | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index ab69987..3ca38fb 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -30,6 +30,7 @@ DEPENDS = " \
>      flex-native \
>      file-native \
>      iasl-native \
> +    ncurses-native \
>      util-linux-native \
>      xz-native \
>      bridge-utils \
> @@ -1006,3 +1007,37 @@ do_deploy() {
>  }
>
>  addtask deploy after do_populate_sysroot
> +
> +# Enable use of menuconfig directly from bitbake and also within the
> devshell
> +OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
> +HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
> +HOSTLDFLAGS = "${BUILD_LDFLAGS}"
> +TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
> +do_devshell[depends] += "ncurses-native:do_populate_sysroot"
> +
> +KCONFIG_CONFIG_COMMAND ??= "menuconfig"
> +python do_menuconfig() {
> +    import shutil
> +
> +    try:
> +        mtime = os.path.getmtime("xen/.config")
> +        shutil.copy("xen/.config", "xen/.config.orig")
> +    except OSError:
> +        mtime = 0
> +
> +    oe_terminal("${SHELL} -c \"cd xen; XEN_CONFIG_EXPERT=y make %s; if [
> \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to
> continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
> +        d.getVar('PN') + ' Configuration', d)
> +
> +    try:
> +        newmtime = os.path.getmtime("xen/.config")
> +    except OSError:
> +        newmtime = 0
> +
> +    if newmtime > mtime:
> +        bb.note("Configuration changed, recompile will be forced")
> +        bb.build.write_taint('do_compile', d)
> +}
> +do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
> +do_menuconfig[nostamp] = "1"
> +do_menuconfig[dirs] = "${B}"
> +addtask menuconfig after do_configure
> --
> 2.7.4
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c14c7c293465405592c27c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Sep 13, 2017 at 9:16 PM=
,  <span dir=3D"ltr">&lt;<a href=3D"mailto:christopher.w.clark@gmail.com" t=
arget=3D"_blank">christopher.w.clark@gmail.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">From: Christopher Clark &lt;<a href=3D"mailto:c=
hristopher.clark6@baesystems.com">christopher.clark6@<wbr>baesystems.com</a=
>&gt;<br>
<br>
Xen supports Kconfig for configuring optional build settings.<br>
This commit adds the menuconfig task to simplify interactive use:<br>
<br>
=C2=A0 =C2=A0 bitbake xen -c menuconfig<br>
<br>
and also ensures that menuconfig works when using the devshell.<br>
This change adds ncurses-native as a build dependency.<br>
<br>
Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.clark6@b=
aesystems.com">christopher.clark6@<wbr>baesystems.com</a>&gt;<br>
---<br>
<br>
Please use my gmail address for any correspondence.<br>
<br>
=C2=A0recipes-extended/xen/xen.inc | 35 ++++++++++++++++++++++++++++++<wbr>=
+++++<br>
=C2=A01 file changed, 35 insertions(+)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index ab69987..3ca38fb 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -30,6 +30,7 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0flex-native \<br>
=C2=A0 =C2=A0 =C2=A0file-native \<br>
=C2=A0 =C2=A0 =C2=A0iasl-native \<br>
+=C2=A0 =C2=A0 ncurses-native \<br>
=C2=A0 =C2=A0 =C2=A0util-linux-native \<br>
=C2=A0 =C2=A0 =C2=A0xz-native \<br>
=C2=A0 =C2=A0 =C2=A0bridge-utils \<br>
@@ -1006,3 +1007,37 @@ do_deploy() {<br>
=C2=A0}<br>
<br>
=C2=A0addtask deploy after do_populate_sysroot<br>
+<br>
+# Enable use of menuconfig directly from bitbake and also within the devsh=
ell<br>
+OE_TERMINAL_EXPORTS +=3D &quot;HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO&quot;=
<br>
+HOST_EXTRACFLAGS =3D &quot;${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot;<br>
+HOSTLDFLAGS =3D &quot;${BUILD_LDFLAGS}&quot;<br>
+TERMINFO =3D &quot;${STAGING_DATADIR_NATIVE}/<wbr>terminfo&quot;<br>
+do_devshell[depends] +=3D &quot;ncurses-native:do_populate_<wbr>sysroot&qu=
ot;<br>
+<br>
+KCONFIG_CONFIG_COMMAND ??=3D &quot;menuconfig&quot;<br>
+python do_menuconfig() {<br>
+=C2=A0 =C2=A0 import shutil<br>
+<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtime =3D os.path.getmtime(&quot;xen/.config&q=
uot;<wbr>)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copy(&quot;xen/.config&quot;, &quot;xen=
/.config.orig&quot;)<br>
+=C2=A0 =C2=A0 except OSError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtime =3D 0<br>
+<br>
+=C2=A0 =C2=A0 oe_terminal(&quot;${SHELL} -c \&quot;cd xen; XEN_CONFIG_EXPE=
RT=3Dy make %s; if [ \$? -ne 0 ]; then echo &#39;Command failed.&#39;; prin=
tf &#39;Press any key to continue... &#39;; read r; fi\&quot;&quot; % d.get=
Var(&#39;KCONFIG_CONFIG_<wbr>COMMAND&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&#39;PN&#39;) + &#39; Configuration&#=
39;, d)<br>
+<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 newmtime =3D os.path.getmtime(&quot;xen/.confi=
g&quot;<wbr>)<br>
+=C2=A0 =C2=A0 except OSError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 newmtime =3D 0<br>
+<br>
+=C2=A0 =C2=A0 if newmtime &gt; mtime:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;Configuration changed, recompile=
 will be forced&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.write_taint(&#39;do_<wbr>compile&#39;=
, d)<br>
+}<br>
+do_menuconfig[depends] +=3D &quot;ncurses-native:do_populate_<wbr>sysroot&=
quot;<br>
+do_menuconfig[nostamp] =3D &quot;1&quot;<br>
+do_menuconfig[dirs] =3D &quot;${B}&quot;<br>
+addtask menuconfig after do_configure<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--94eb2c14c7c293465405592c27c3--
