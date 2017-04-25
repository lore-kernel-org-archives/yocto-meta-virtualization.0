Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64C49E00AF0; Mon, 24 Apr 2017 19:52:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.194 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23525E00AE0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Apr 2017 19:51:56 -0700 (PDT)
Received: by mail-qk0-f194.google.com with SMTP id u75so6811416qka.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Apr 2017 19:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oAxxzJWSvsNE1h3y0X1kY+xKaTRAhjL+fxUIumgw3cY=;
	b=uC5fvSMq/JAqRZeIqH0cahhY+ix06yLj369PIZXkO+SsA2Aap3ylFgdUYco30T4T3g
	MEFeTVDVHepDRn8HIjIh/LL16WdEwWMaB4XIMO2Hjmp2heVs2qLjAD2Y8qFMaTKJ8PLG
	gMF/MPjrxHqRCg6W/D5Ld8GqPPNvVMApIsxe7pWOT8z8NNvTHeOStScYMHtbcVIGAzf6
	qaohO+QjCcPxZSMYqrYWG/09ZwqwmaeaK6r7jsadt/MkcbCFF7OWAtkQdrY4fXz1RQ+f
	HSBJSN3rP0vbP85N7nbbF6rz6w5rky1c1e8/jUlu87ZNhvw1/NF1YXBf3gFjnXIdnyga
	J1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oAxxzJWSvsNE1h3y0X1kY+xKaTRAhjL+fxUIumgw3cY=;
	b=uPfZ0z/6yq6ll35uGqolpOkH+7Wx3+Ww8T43ND83dHyI4Y5rh+kyEgKntJHm0Ef2OT
	+Ra1yNCjQmjMHNt2c6XVZCIdPwDFVslaL/jzX3xihzkic+fP3qS4DH5y1GNdSc8tKVk+
	JWb7wcWZ2XP3+ayuD6Q7yxK82KQKmmjd88J46fawv4c7fte1Zu1SahtTeIgCHI3a2VUD
	S54nSisCNVfL+69AGgalPuPTZD5quO8KB7pNKT9z4G/hte+P64cJD509tZgqNDPCTmOy
	atgfTaMh+AWmw4rVr8x6U6UAbJiIe1fmF+8Dp5b3WzAGZKV54eHgUntnwMKacZYq7yi7
	zOdA==
X-Gm-Message-State: AN3rC/5ODm6WnfSgzw0aVWbEehQf6cSjuSlG1WFa5ksalC4JuHbiUCvj
	46J79S+MOTLpmXThYhAh9QHqLZBECQ==
X-Received: by 10.55.42.220 with SMTP id q89mr21668800qkq.211.1493088715801;
	Mon, 24 Apr 2017 19:51:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.145.143 with HTTP; Mon, 24 Apr 2017 19:51:55 -0700 (PDT)
In-Reply-To: <20170419144220.115501-1-rob.woolley@windriver.com>
References: <20170419144220.115501-1-rob.woolley@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Apr 2017 22:51:55 -0400
Message-ID: <CADkTA4M9reC4REAHe2pMRWbehJ16aaNgGjAwSb=Ce-1EeQ7KbQ@mail.gmail.com>
To: Rob Woolley <rob.woolley@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: Fix conditional dependencies on polkit
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
X-List-Received-Date: Tue, 25 Apr 2017 02:52:00 -0000
Content-Type: multipart/alternative; boundary=001a1147b09e860d8d054df4ceaa

--001a1147b09e860d8d054df4ceaa
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Wed, Apr 19, 2017 at 10:42 AM, Rob Woolley <rob.woolley@windriver.com>
wrote:

> The DIRFILES variable was a temporary workaround to resolve a do_rootfs
> RPM package conflict between libvirt and polkit.
>
> This happened because of the different permissions and ownership that the
> packages placed on ${datadir}/usr/share/polkit-1/rules.d.
>
> The behaviour is now conditional based on how PACKAGECONFIG is set.  The
> polkit rules will be removed from the package if polkit is not enabled.
> If polkit is enabled the permissions and ownership are set to match those
> set by the polkit recipe.
>
> This uses the useradd enhancements for RSS.  It requires that shadow-native
> be included as a DEPENDS to provide the useradd command in the native
> sysroot.
>
> Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_1.3.5.bb | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb
> b/recipes-extended/libvirt/libvirt_1.3.5.bb
> index 7b55ead..a8e6f3f 100644
> --- a/recipes-extended/libvirt/libvirt_1.3.5.bb
> +++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
> @@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> b234ee4d69f5fce4486a80fdaf4a4263 \
>  SECTION = "console/tools"
>
>  DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap
> util-linux e2fsprogs pm-utils \
> -          iptables dnsmasq readline libtasn1 libxslt-native acl"
> +          iptables dnsmasq readline libtasn1 libxslt-native acl \
> +          ${@bb.utils.contains('PACKAGECONFIG', 'polkit',
> 'shadow-native', '', d)}"
>
>  # libvirt-guests.sh needs gettext.sh
>  #
> @@ -22,8 +23,6 @@ RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
>  #connman blocks the 53 port and libvirtd can't start its DNS service
>  RCONFLICTS_${PN}_libvirtd = "connman"
>
> -DIRFILES = ""
> -
>  SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
>             file://tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch
> \
>             file://libvirtd.sh \
> @@ -120,7 +119,8 @@ FILES_${PN}-libvirtd = " \
>  FILES_${PN}-virsh = "${bindir}/virsh"
>  FILES_${PN} += "${libdir}/libvirt/connection-driver \
>             ${datadir}/augeas \
> -           ${datadir}/polkit-1"
> +           ${@bb.utils.contains('PACKAGECONFIG', 'polkit',
> '${datadir}/polkit-1', '', d)} \
> +           "
>
>  FILES_${PN}-dbg += "${libdir}/libvirt/connection-driver/.debug
> ${libdir}/libvirt/lock-driver/.debug"
>  FILES_${PN}-staticdev += "${libdir}/*.a ${libdir}/libvirt/connection-driver/*.a
> ${libdir}/libvirt/lock-driver/*.a"
> @@ -254,6 +254,15 @@ do_install_append() {
>         echo "d root root 0755 ${localstatedir}/run/libvirt/qemu none" \
>              >> ${D}${sysconfdir}/default/volatiles/99_libvirt
>
> +       # Manually set permissions and ownership to match polkit recipe
> +       if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true',
> 'false', d)}; then
> +               install -d -m 0700 ${D}/${datadir}/polkit-1/rules.d
> +               chown polkitd ${D}/${datadir}/polkit-1/rules.d
> +               chgrp root ${D}/${datadir}/polkit-1/rules.d
> +       else
> +               rm -rf ${D}/${datadir}/polkit-1
> +       fi
> +
>         # Add hook support for libvirt
>         mkdir -p ${D}/etc/libvirt/hooks
>
> -- 2.11.0
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1147b09e860d8d054df4ceaa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Apr 19, 2017 at 10:42 A=
M, Rob Woolley <span dir=3D"ltr">&lt;<a href=3D"mailto:rob.woolley@windrive=
r.com" target=3D"_blank">rob.woolley@windriver.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">The DIRFILES variable was a temporary worka=
round to resolve a do_rootfs<br>
RPM package conflict between libvirt and polkit.<br>
<br>
This happened because of the different permissions and ownership that the<b=
r>
packages placed on ${datadir}/usr/share/polkit-1/<wbr>rules.d.<br>
<br>
The behaviour is now conditional based on how PACKAGECONFIG is set.=C2=A0 T=
he<br>
polkit rules will be removed from the package if polkit is not enabled.<br>
If polkit is enabled the permissions and ownership are set to match those<b=
r>
set by the polkit recipe.<br>
<br>
This uses the useradd enhancements for RSS.=C2=A0 It requires that shadow-n=
ative<br>
be included as a DEPENDS to provide the useradd command in the native<br>
sysroot.<br>
<br>
Signed-off-by: Rob Woolley &lt;<a href=3D"mailto:rob.woolley@windriver.com"=
>rob.woolley@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvi<wbr>rt_1.3.5.bb</a> | 17 +++++++++++++--=
--<br>
=C2=A01 file changed, 13 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" r=
el=3D"noreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a> b/recipes-ext=
ended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"noreferrer" target=
=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
index 7b55ead..a8e6f3f 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>b234ee=
4d69f5fce4486a80fdaf4a42<wbr>63 \<br>
=C2=A0SECTION =3D &quot;console/tools&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;bridge-utils gnutls libxml2 lvm2 avahi parted curl =
libpcap util-linux e2fsprogs pm-utils \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iptables dnsmasq readline libtasn1 libx=
slt-native acl&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iptables dnsmasq readline libtasn1 libx=
slt-native acl \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;<wbr>PACKAGEC=
ONFIG&#39;, &#39;polkit&#39;, &#39;shadow-native&#39;, &#39;&#39;, d)}&quot=
;<br>
<br>
=C2=A0# libvirt-guests.sh needs gettext.sh<br>
=C2=A0#<br>
@@ -22,8 +23,6 @@ RDEPENDS_libvirt-libvirtd_<wbr>append_x86 =3D &quot; dmid=
ecode&quot;<br>
=C2=A0#connman blocks the 53 port and libvirtd can&#39;t start its DNS serv=
ice<br>
=C2=A0RCONFLICTS_${PN}_libvirtd =3D &quot;connman&quot;<br>
<br>
-DIRFILES =3D &quot;&quot;<br>
-<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://libvirt.org/sources/libvirt-${PV}=
.tar.gz;name=3Dlibvirt" rel=3D"noreferrer" target=3D"_blank">http://libvirt=
.org/sources/<wbr>libvirt-${PV}.tar.gz;name=3D<wbr>libvirt</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://tools-add-libvirt-net-<wbr=
>rpc-to-virt-host-validate-<wbr>when.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libvirtd.sh \<br>
@@ -120,7 +119,8 @@ FILES_${PN}-libvirtd =3D &quot; \<br>
=C2=A0FILES_${PN}-virsh =3D &quot;${bindir}/virsh&quot;<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}/libvirt/connection-<wbr>driver \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/augeas \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/polkit-1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;<wbr>PA=
CKAGECONFIG&#39;, &#39;polkit&#39;, &#39;${datadir}/polkit-1&#39;, &#39;&#3=
9;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-dbg +=3D &quot;${libdir}/libvirt/connection-<wbr>driver/.=
debug ${libdir}/libvirt/lock-driver/<wbr>.debug&quot;<br>
=C2=A0FILES_${PN}-staticdev +=3D &quot;${libdir}/*.a ${libdir}/libvirt/conn=
ection-<wbr>driver/*.a ${libdir}/libvirt/lock-driver/<wbr>*.a&quot;<br>
@@ -254,6 +254,15 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;d root root 0755 ${localstatedir}/ru=
n/libvirt/<wbr>qemu none&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; ${D}${sysconfdir}/=
default/<wbr>volatiles/99_libvirt<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Manually set permissions and ownership to mat=
ch polkit recipe<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG=
&#39;, &#39;polkit&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d -m 0700 =
${D}/${datadir}/polkit-1/<wbr>rules.d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chown polkitd ${D}/=
${datadir}/polkit-1/<wbr>rules.d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chgrp root ${D}/${d=
atadir}/polkit-1/<wbr>rules.d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}/${datad=
ir}/polkit-1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add hook support for libvirt<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}/etc/libvirt/hooks<br>
<br>
-- 2.11.0<br>
<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div>

--001a1147b09e860d8d054df4ceaa--
