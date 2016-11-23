Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 17B30E008CA; Wed, 23 Nov 2016 11:17:46 -0800 (PST)
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
	*      [209.85.216.196 listed in dnsbl.sorbs.net]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC005E0050B
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Nov 2016 11:17:43 -0800 (PST)
Received: by mail-qt0-f196.google.com with SMTP id n6so1330433qtd.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Nov 2016 11:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hNADhPicKu4bRsTo2EYXlAwuNr71vYQ/TTgkmae9TJA=;
	b=QfO2Whx5UK7WICyOdfYWgJ55xEoMx/1O7FS7YvsUW6wpIXj1CXj9VpnKByXE/I193S
	i/8K+0yVH5whzJ5mO/PTtKO6Dnc2VzKtpjVdCor7nDllug/BXbi96CzXD6b0YiBfXa2W
	tjHz0h9ct6o4aMBgFKLbjQuXGnmD4Azgd9QnFVcMyw6HCqajtb2p2KTKa4F5ujD2/65Z
	ld2DDwNZm64hLrR+6AyqxZ2yXXaAmvzLFmRS09RxM+Xq3NlA6oKQ9VS9VhbAgQh00Xf6
	5uGjZJYsVcZZ45UdPMuwsIYGfYrJ6hsqPhQ5/28evCQcgWH795hUpah73lA7GI9+83Yh
	AXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hNADhPicKu4bRsTo2EYXlAwuNr71vYQ/TTgkmae9TJA=;
	b=OfahZhap1g9s+gOTnJu0NFvWvDCG+9xX5UtLM0BVlAkAE8ziiZ8qdJ39KMKFc6jnAr
	p4FQCwTGyI3qYxXGCQLsYr7GzVUHt4MJV+ndGQbia50+3EDKa40XbP2ECZA+iJqMD5Cv
	VP884UJUEYlXy8//XYrCPuBTiwnB9hFtQVoOEUxNr0W8D4zXzrnUf+kUTBpbh1v1SOQA
	IXJf7TKsgwhs/EdsKiIvUhd6/bYK+l/E5KRrMPsnQzH4D5xMMOuifaE2jMNuLo/IlBGv
	RqVj6zQN7LJDY8u88l1U5i72Tl+V90MbQo/fxRQ6kMTgjRWneiFQlBPQVEBHhJrxqfA9
	H9YQ==
X-Gm-Message-State: AKaTC00vL2zRXZCywF1Fv8YA8/Rfqgr/F/eSfSkqBBH+OoY3eWc1jCPzsyeXf43UQsoO2DKfTcphwmmrwdQpvw==
X-Received: by 10.200.35.14 with SMTP id a14mr4023693qta.159.1479928662970;
	Wed, 23 Nov 2016 11:17:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.45.220 with HTTP; Wed, 23 Nov 2016 11:17:42 -0800 (PST)
In-Reply-To: <1479840976-10540-2-git-send-email-mark.asselstine@windriver.com>
References: <1479840976-10540-1-git-send-email-mark.asselstine@windriver.com>
	<1479840976-10540-2-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Nov 2016 14:17:42 -0500
Message-ID: <CADkTA4NnjFPBL9H1cnRp0ew4B_WBLAhVmLh+7-oTvtPCQ_FSAA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/4] lxc: updates to allow the creation of lxcbr0 with systemd
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
X-List-Received-Date: Wed, 23 Nov 2016 19:17:46 -0000
Content-Type: multipart/alternative; boundary=001a113f34ce3fd82b0541fcbef1

--001a113f34ce3fd82b0541fcbef1
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 22, 2016 at 1:56 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> The recipe is setup to create lxcbr0 when used with sysvinit but there
> are some gaps to getting this bridge working when the system is built
> with systemd. Using parts found in the upstream package as well as
> configurations hints from other distros we can fill in the gaps to
> allow lxcbr0 to be created at startup, with the lxc-networking package
> is included in the rootfs.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-containers/lxc/files/default.lxc-net | 30
> ++++++++++++++++++++++++++++
>  recipes-containers/lxc/files/dnsmasq.lxc     |  5 +++++
>  recipes-containers/lxc/lxc_2.0.0.bb          | 16 +++++++++++++--
>  3 files changed, 49 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-containers/lxc/files/default.lxc-net
>  create mode 100644 recipes-containers/lxc/files/dnsmasq.lxc
>
> diff --git a/recipes-containers/lxc/files/default.lxc-net
> b/recipes-containers/lxc/files/default.lxc-net
> new file mode 100644
> index 0000000..8013453
> --- /dev/null
> +++ b/recipes-containers/lxc/files/default.lxc-net
> @@ -0,0 +1,30 @@
> +# Sourced from package lxc.spec file
> +#
> +# Leave USE_LXC_BRIDGE as "true" if you want to use lxcbr0 for your
> +# containers.  Set to "false" if you'll use virbr0 or another existing
> +# bridge, or mavlan to your host's NIC.
> +USE_LXC_BRIDGE="true"
> +
> +# If you change the LXC_BRIDGE to something other than lxcbr0, then
> +# you will also need to update your /etc/lxc/default.conf as well as the
> +# configuration (/var/lib/lxc/<container>/config) for any containers
> +# already created using the default config to reflect the new bridge
> +# name.
> +# If you have the dnsmasq daemon installed, you'll also have to update
> +# /etc/dnsmasq.d/lxc and restart the system wide dnsmasq daemon.
> +LXC_BRIDGE="lxcbr0"
> +LXC_ADDR="10.0.3.1"
> +LXC_NETMASK="255.255.255.0"
> +LXC_NETWORK="10.0.3.0/24"
> +LXC_DHCP_RANGE="10.0.3.2,10.0.3.254"
> +LXC_DHCP_MAX="253"
> +# Uncomment the next line if you'd like to use a conf-file for the lxcbr0
> +# dnsmasq.  For instance, you can use 'dhcp-host=mail1,10.0.3.100' to have
> +# container 'mail1' always get ip address 10.0.3.100.
> +#LXC_DHCP_CONFILE=/etc/lxc/dnsmasq.conf
> +
> +# Uncomment the next line if you want lxcbr0's dnsmasq to resolve the .lxc
> +# domain.  You can then add "server=/lxc/10.0.3.1' (or your actual
> $LXC_ADDR)
> +# to /etc/dnsmasq.conf, after which 'container1.lxc' will resolve on your
> +# host.
> +#LXC_DOMAIN="lxc"
> diff --git a/recipes-containers/lxc/files/dnsmasq.lxc
> b/recipes-containers/lxc/files/dnsmasq.lxc
> new file mode 100644
> index 0000000..36be353
> --- /dev/null
> +++ b/recipes-containers/lxc/files/dnsmasq.lxc
> @@ -0,0 +1,5 @@
> +# Tell any system-wide dnsmasq instance to make sure to bind to interfaces
> +# instead of listening on 0.0.0.0
> +# WARNING: changes to this file will get lost if lxc is removed.
> +bind-interfaces
> +except-interface=lxcbr0
> diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc/
> lxc_2.0.0.bb
> index 5e45949..9e15508 100644
> --- a/recipes-containers/lxc/lxc_2.0.0.bb
> +++ b/recipes-containers/lxc/lxc_2.0.0.bb
> @@ -30,6 +30,8 @@ SRC_URI = "http://linuxcontainers.org/
> downloads/${BPN}-${PV}.tar.gz \
>         file://lxc-fix-B-S.patch \
>         file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
>         file://logs-optionally-use-base-filenames-to-report-src-fil.patch
> \
> +       file://default.lxc-net \
> +       file://dnsmasq.lxc \
>         "
>
>  SRC_URI[md5sum] = "04a7245a614cd3296b0ae9ceeeb83fbb"
> @@ -40,7 +42,7 @@ S = "${WORKDIR}/${BPN}-${PV}"
>  # Let's not configure for the host distro.
>  #
>  PTEST_CONF = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest',
> '--enable-tests', '', d)}"
> -EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
> +EXTRA_OECONF += "--with-distro=yocto ${PTEST_CONF}"
>

Is there a reason why ${DISTRO} doesn't work here ? I don't think we want
to hardcode
yocto as a distro.


>
>  EXTRA_OECONF += "--with-init-script=\
>  ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit,', '', d)}\
> @@ -76,6 +78,10 @@ SYSTEMD_PACKAGES = "${PN}-setup"
>  SYSTEMD_SERVICE_${PN}-setup = "lxc.service"
>  SYSTEMD_AUTO_ENABLE_${PN}-setup = "disable"
>
> +SYSTEMD_PACKAGES += "${PN}-networking"
> +SYSTEMD_SERVICE_${PN}-networking = "lxc-net.service"
> +SYSTEMD_AUTO_ENABLE_${PN}-networking = "enable"
> +
>  INITSCRIPT_PACKAGES = "${PN}-setup"
>  INITSCRIPT_NAME_{PN}-setup = "lxc"
>  INITSCRIPT_PARAMS_${PN}-setup = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
> @@ -89,7 +95,8 @@ PACKAGES =+ "${PN}-templates ${PN}-setup
> ${PN}-networking"
>  FILES_${PN}-templates += "${datadir}/lxc/templates"
>  RDEPENDS_${PN}-templates += "bash"
>
> -ALLOW_EMPTY_${PN}-networking = "1"
> +FILES_${PN}-networking += "/etc/default/lxc-net"
> +FILES_${PN}-networking += "/etc/dnsmasq.d/lxc"
>
>  FILES_${PN}-setup += "/etc/tmpfiles.d"
>  FILES_${PN}-setup += "/lib/systemd/system"
> @@ -126,6 +133,11 @@ do_install_append() {
>             if [ -d ${D}${exec_prefix}/lib/python* ]; then mv
> ${D}${exec_prefix}/lib/python* ${D}${libdir}/; fi
>             rmdir --ignore-fail-on-non-empty ${D}${exec_prefix}/lib
>         fi
> +
> +       install -d ${D}${sysconfdir}/default
> +       install -d ${D}${sysconfdir}/dnsmasq.d
> +       install -m 644 ${WORKDIR}/default.lxc-net
> ${D}${sysconfdir}/default/lxc-net
> +       install -m 644 ${WORKDIR}/dnsmasq.lxc ${D}${sysconfdir}/dnsmasq.d/
> lxc
>

Everything else looks good to me. If you install the -networking packge ..
you get
the networking configuration.

Bruce


>  }
>
>  EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
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

--001a113f34ce3fd82b0541fcbef1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Nov 22, 2016 at 1:56 PM, Mark Asselstine <span dir=3D"ltr">&lt;=
<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.ass=
elstine@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">The recipe is setup to create lxcbr0 when used with sysvinit but there<b=
r>
are some gaps to getting this bridge working when the system is built<br>
with systemd. Using parts found in the upstream package as well as<br>
configurations hints from other distros we can fill in the gaps to<br>
allow lxcbr0 to be created at startup, with the lxc-networking package<br>
is included in the rootfs.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0recipes-containers/lxc/files/<wbr>default.lxc-net | 30 ++++++++++++++=
++++++++++++++<br>
=C2=A0recipes-containers/lxc/files/<wbr>dnsmasq.lxc=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 5 +++++<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_2.<wbr>0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 16 +++++++++++++--<br>
=C2=A03 files changed, 49 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 recipes-containers/lxc/files/<wbr>default.lxc-net<=
br>
=C2=A0create mode 100644 recipes-containers/lxc/files/<wbr>dnsmasq.lxc<br>
<br>
diff --git a/recipes-containers/lxc/<wbr>files/default.lxc-net b/recipes-co=
ntainers/lxc/<wbr>files/default.lxc-net<br>
new file mode 100644<br>
index 0000000..8013453<br>
--- /dev/null<br>
+++ b/recipes-containers/lxc/<wbr>files/default.lxc-net<br>
@@ -0,0 +1,30 @@<br>
+# Sourced from package lxc.spec file<br>
+#<br>
+# Leave USE_LXC_BRIDGE as &quot;true&quot; if you want to use lxcbr0 for y=
our<br>
+# containers.=C2=A0 Set to &quot;false&quot; if you&#39;ll use virbr0 or a=
nother existing<br>
+# bridge, or mavlan to your host&#39;s NIC.<br>
+USE_LXC_BRIDGE=3D&quot;true&quot;<br>
+<br>
+# If you change the LXC_BRIDGE to something other than lxcbr0, then<br>
+# you will also need to update your /etc/lxc/default.conf as well as the<b=
r>
+# configuration (/var/lib/lxc/&lt;container&gt;/<wbr>config) for any conta=
iners<br>
+# already created using the default config to reflect the new bridge<br>
+# name.<br>
+# If you have the dnsmasq daemon installed, you&#39;ll also have to update=
<br>
+# /etc/dnsmasq.d/lxc and restart the system wide dnsmasq daemon.<br>
+LXC_BRIDGE=3D&quot;lxcbr0&quot;<br>
+LXC_ADDR=3D&quot;10.0.3.1&quot;<br>
+LXC_NETMASK=3D&quot;255.255.255.0&quot;<br>
+LXC_NETWORK=3D&quot;<a href=3D"http://10.0.3.0/24" rel=3D"noreferrer" targ=
et=3D"_blank">10.0.3.0/24</a>&quot;<br>
+LXC_DHCP_RANGE=3D&quot;10.0.3.2,10.<wbr>0.3.254&quot;<br>
+LXC_DHCP_MAX=3D&quot;253&quot;<br>
+# Uncomment the next line if you&#39;d like to use a conf-file for the lxc=
br0<br>
+# dnsmasq.=C2=A0 For instance, you can use &#39;dhcp-host=3Dmail1,10.0.3.1=
00&#39; to have<br>
+# container &#39;mail1&#39; always get ip address 10.0.3.100.<br>
+#LXC_DHCP_CONFILE=3D/etc/lxc/<wbr>dnsmasq.conf<br>
+<br>
+# Uncomment the next line if you want lxcbr0&#39;s dnsmasq to resolve the =
.lxc<br>
+# domain.=C2=A0 You can then add &quot;server=3D/lxc/<a href=3D"http://10.=
0.3.1" rel=3D"noreferrer" target=3D"_blank">10.0.3.1</a>&#39; (or your actu=
al $LXC_ADDR)<br>
+# to /etc/dnsmasq.conf, after which &#39;container1.lxc&#39; will resolve =
on your<br>
+# host.<br>
+#LXC_DOMAIN=3D&quot;lxc&quot;<br>
diff --git a/recipes-containers/lxc/<wbr>files/dnsmasq.lxc b/recipes-contai=
ners/lxc/<wbr>files/dnsmasq.lxc<br>
new file mode 100644<br>
index 0000000..36be353<br>
--- /dev/null<br>
+++ b/recipes-containers/lxc/<wbr>files/dnsmasq.lxc<br>
@@ -0,0 +1,5 @@<br>
+# Tell any system-wide dnsmasq instance to make sure to bind to interfaces=
<br>
+# instead of listening on 0.0.0.0<br>
+# WARNING: changes to this file will get lost if lxc is removed.<br>
+bind-interfaces<br>
+except-interface=3Dlxcbr0<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_<wbr>2.0.0.bb</a> b/recipes-containers/lx=
c/<a href=3D"http://lxc_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">lxc_=
<wbr>2.0.0.bb</a><br>
index 5e45949..9e15508 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.0.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.0.bb</a><br>
@@ -30,6 +30,8 @@ SRC_URI =3D &quot;<a href=3D"http://linuxcontainers.org/d=
ownloads/${BPN}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://l=
inuxcontainers.org/<wbr>downloads/${BPN}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-fix-B-S.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-doc-upgrade-to-use-<wbr>docbook-3.1-=
DTD.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://logs-optionally-use-<wbr>base-filenames-=
to-report-src-<wbr>fil.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://default.lxc-net \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://dnsmasq.lxc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>04a7245a614cd3296b0ae9ceeeb83f<wbr>bb&=
quot;<br>
@@ -40,7 +42,7 @@ S =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
=C2=A0# Let&#39;s not configure for the host distro.<br>
=C2=A0#<br>
=C2=A0PTEST_CONF =3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#=
39;, &#39;ptest&#39;, &#39;--enable-tests&#39;, &#39;&#39;, d)}&quot;<br>
-EXTRA_OECONF +=3D &quot;--with-distro=3D${DISTRO} ${PTEST_CONF}&quot;<br>
+EXTRA_OECONF +=3D &quot;--with-distro=3Dyocto ${PTEST_CONF}&quot;<br></blo=
ckquote><div><br></div><div>Is there a reason why ${DISTRO} doesn&#39;t wor=
k here ? I don&#39;t think we want to hardcode</div><div>yocto as a distro.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0EXTRA_OECONF +=3D &quot;--with-init-script=3D\<br>
=C2=A0${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;sysvinit&#3=
9;, &#39;sysvinit,&#39;, &#39;&#39;, d)}\<br>
@@ -76,6 +78,10 @@ SYSTEMD_PACKAGES =3D &quot;${PN}-setup&quot;<br>
=C2=A0SYSTEMD_SERVICE_${PN}-setup =3D &quot;lxc.service&quot;<br>
=C2=A0SYSTEMD_AUTO_ENABLE_${PN}-<wbr>setup =3D &quot;disable&quot;<br>
<br>
+SYSTEMD_PACKAGES +=3D &quot;${PN}-networking&quot;<br>
+SYSTEMD_SERVICE_${PN}-<wbr>networking =3D &quot;lxc-net.service&quot;<br>
+SYSTEMD_AUTO_ENABLE_${PN}-<wbr>networking =3D &quot;enable&quot;<br>
+<br>
=C2=A0INITSCRIPT_PACKAGES =3D &quot;${PN}-setup&quot;<br>
=C2=A0INITSCRIPT_NAME_{PN}-setup =3D &quot;lxc&quot;<br>
=C2=A0INITSCRIPT_PARAMS_${PN}-setup =3D &quot;${OS_DEFAULT_INITSCRIPT_<wbr>=
PARAMS}&quot;<br>
@@ -89,7 +95,8 @@ PACKAGES =3D+ &quot;${PN}-templates ${PN}-setup ${PN}-net=
working&quot;<br>
=C2=A0FILES_${PN}-templates +=3D &quot;${datadir}/lxc/templates&quot;<br>
=C2=A0RDEPENDS_${PN}-templates +=3D &quot;bash&quot;<br>
<br>
-ALLOW_EMPTY_${PN}-networking =3D &quot;1&quot;<br>
+FILES_${PN}-networking +=3D &quot;/etc/default/lxc-net&quot;<br>
+FILES_${PN}-networking +=3D &quot;/etc/dnsmasq.d/lxc&quot;<br>
<br>
=C2=A0FILES_${PN}-setup +=3D &quot;/etc/tmpfiles.d&quot;<br>
=C2=A0FILES_${PN}-setup +=3D &quot;/lib/systemd/system&quot;<br>
@@ -126,6 +133,11 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -d ${D}${exec_prefix}/lib/py=
thon* ]; then mv ${D}${exec_prefix}/lib/python* ${D}${libdir}/; fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rmdir --ignore-fail-on-non-empty =
${D}${exec_prefix}/lib<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/dnsmasq.d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${WORKDIR}/default.lxc-net ${D}$=
{sysconfdir}/default/lxc-<wbr>net<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${WORKDIR}/dnsmasq.lxc ${D}${sys=
confdir}/dnsmasq.d/<wbr>lxc<br></blockquote><div><br></div><div>Everything =
else looks good to me. If you install the -networking packge .. you get</di=
v><div>the networking configuration.</div><div><br></div><div>Bruce</div><d=
iv>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;TEST_DIR=3D${D}${PTEST_PATH}/<wbr>src/tests&q=
uot;<br>
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
</div></div>

--001a113f34ce3fd82b0541fcbef1--
