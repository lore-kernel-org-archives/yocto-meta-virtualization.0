Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.9856.1621422415624247617
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 May 2021 04:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iq39hxfy;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id t3so14860197edc.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 May 2021 04:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lMYvV2N/yh3I+C9jkYpzdSMQ7wNPaEXpQgLJ1EcTCTI=;
        b=iq39hxfykv1bSbA81oNmHbEdcqh9L6WPpjHJVKrs2WePjen4+OaNCR1Sl+SeYv3uwF
         ZLPdB4vZrS+OWFRvSsohGFxwceWiJdC6iEDtb+BlCNvbuxJ0MYnyS4GzOgO3Zs7mVd4p
         wiep0+qpYtAoY5HqMpHAGvj3t5YyzaTis9EMIINkLYtj0qtxCDnQUs8ET4GIiYkIQ9ID
         S4UYYqehUh/I1ImeHucgpTMkiYA1HFpCnXkaO2nJEUYbvyGXmdNTXirx9hS21azmXBlM
         dpdGHWcMRncLQwTTFgxAJFqO+TzPs0TehjjSBADTJZgApnZcH453dIGi8snDDONOum5n
         nPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lMYvV2N/yh3I+C9jkYpzdSMQ7wNPaEXpQgLJ1EcTCTI=;
        b=caS98j8YQQfFy5vTL/z4m7bSWAs/m2mEdPv592iEYGW6fo6Yfye0RBDW9PwOetKOoQ
         2xTSfJ3JoiNtj5tWD/J9bdw6GCffacytLvFa+h+Jp3v17kFUfzzeID3IOG0rY9kjwc7z
         gSWp/ESVsIdMNJtJ/rT712SAWYIXV4z6ThHjKq5vC06HmjWE4pcowDMaxv43OSu42vuw
         VljFwAd9660uB7nDhKjeGlTCfExq1R3JQ9CF1y44IGcvLi5/IElpo/OtJgCDCC5D24t5
         +jCVKMtOedRJNE8hRneSmguSJzBsJAvZIhTSKH3F7OtteKGrAcXoH3i412ntNtOJ8oEo
         qYYQ==
X-Gm-Message-State: AOAM532D+opIqI0OzpzVI5BrxYsGLdamab9zMPGjZRd+95w5Y2ljeIkj
	4pJfsU1Y5akJ49kMV+DG+DvRWpT0pFm4pbdTv00=
X-Google-Smtp-Source: ABdhPJxTbOpnQAvpx8WNyBkXFDbXoR3MoOgwpQECendTSSoF3jq9RvsIbSG/3wUQCC+yIyvDEKqFBm+yhjLdv61vnl0=
X-Received: by 2002:a50:9558:: with SMTP id v24mr13691317eda.264.1621422414067;
 Wed, 19 May 2021 04:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210422134926.1678662-1-yanfei.xu@windriver.com>
In-Reply-To: <20210422134926.1678662-1-yanfei.xu@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 19 May 2021 13:06:43 +0200
Message-ID: <CA+chaQeu-E8x89FDynpU6AyL_C68L2+=KkRs18scp+aETyJFmw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v4] libvirt: uprev v6.3 -> v7.2
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000057aac05c2acd3a9"

--000000000000057aac05c2acd3a9
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 22, 2021 at 3:49 PM Xu, Yanfei <yanfei.xu@windriver.com> wrote:

> From: Yanfei Xu <yanfei.xu@windriver.com>
>
> This upgrade spans 9 small release. The detailed realese logs could
> refer to: https://gitlab.com/libvirt/libvirt/-/blob/master/NEWS.rst
>
> Libvirt's buildsystem has changed to meson, So this upgrade drop some
> obsolete patches applied to makefile.


...

diff --git a/recipes-extended/libvirt/libvirt_6.3.0.bb
> b/recipes-extended/libvirt/libvirt_7.2.0.bb
> similarity index 61%
> rename from recipes-extended/libvirt/libvirt_6.3.0.bb
> rename to recipes-extended/libvirt/libvirt_7.2.0.bb
> index eeb1bf8..24748ef 100644
> --- a/recipes-extended/libvirt/libvirt_6.3.0.bb
> +++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
>
> ...

>
> -inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd
> perlnative
> +inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative
>  USERADD_PACKAGES = "${PN}"
>  GROUPADD_PARAM_${PN} = "-r qemu; -r kvm"
>  USERADD_PARAM_${PN} = "-r -g qemu -G kvm qemu"
>
> ...

>
>  do_install_prepend() {
> @@ -278,6 +198,8 @@ do_install_append() {
>         fi
>
>         if
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +            mkdir -p ${D}/lib
> +            mv ${D}/usr/lib/systemd ${D}/lib
>             # This variable is used by libvirtd.service to start libvirtd
> in the right mode
>             sed -i '/#LIBVIRTD_ARGS="--listen"/a LIBVIRTD_ARGS="--listen
> --daemon"' ${D}/${sysconfdir}/sysconfig/libvirtd
>
> @@ -285,6 +207,8 @@ do_install_append() {
>             sed -i -e 's/Type=notify/Type=forking/' \
>                    -e '/Type=forking/a PIDFile=/run/libvirtd.pid' \
>                    ${D}/${systemd_unitdir}/system/libvirtd.service
> +       else
> +           rm -rf ${D}/usr/lib/systemd
>         fi
>
>         # The /run/libvirt directories created by the Makefile are
> @@ -360,7 +284,7 @@ do_install_append() {
>             # connection via 127.0.0.1 is available out of box.
>             install -d ${D}/etc/pki/CA
>             install -d ${D}/etc/pki/libvirt/private
> -           install -m 0755 ${WORKDIR}/gnutls-helper.py ${D}/${bindir}
> +            install -m 0755 ${WORKDIR}/gnutls-helper.py ${D}/${bindir}
>             install -m 0644 ${WORKDIR}/cakey.pem
> ${D}/${sysconfdir}/pki/libvirt/private/cakey.pem
>             install -m 0644 ${WORKDIR}/cacert.pem
> ${D}/${sysconfdir}/pki/CA/cacert.pem
>             install -m 0644 ${WORKDIR}/serverkey.pem
> ${D}/${sysconfdir}/pki/libvirt/private/serverkey.pem
> @@ -376,10 +300,10 @@ do_install_append() {
>         chmod 4755 ${D}${bindir}/virt-login-shell
>  }
>
> -EXTRA_OECONF += " \
> -    --with-init-script=systemd \
> -    --with-test-suite \
> -    --with-runstatedir=/run \
> +EXTRA_OEMESON += " \
> +    -Dinit_script=systemd \
> +    -Drunstatedir=/run \
> +    -Dtests=enabled \
>      "
>
>  # gcc9 end up mis-compiling qemuxml2argvtest.o with Og which then
> @@ -387,25 +311,6 @@ EXTRA_OECONF += " \
>  SELECTED_OPTIMIZATION_remove_virtclass-multilib-lib32_mipsarch = "-Og"
>  SELECTED_OPTIMIZATION_append_virtclass-multilib-lib32_mipsarch = " -O2"
>
> -EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH}
> PTEST_DIR=${PTEST_PATH} SYSTEMD_UNIT_DIR=${systemd_system_unitdir}"
>

Can we set something like SYSTEMD_UNIT_DIR for meson to install service
file into correct directory directly (while respecting usrmerge in
DISTRO_FEATURES), instead of moving the files in do_install_append?

The sed in do_install_append is failing as shown in:
http://errors.yoctoproject.org/Errors/Build/122419/
because ${D}/${systemd_unitdir}/system isn't the same
as ${D}/lib/systemd/system with usrmerge:
env.libvirt-without-usrmerge:export systemd_unitdir="/lib/systemd"
env.libvirt-with-usrmerge:export systemd_unitdir="/usr/lib/systemd"

env.libvirt-without-usrmerge:export
systemd_system_unitdir="/lib/systemd/system"
env.libvirt-with-usrmerge:export
systemd_system_unitdir="/usr/lib/systemd/system"

--000000000000057aac05c2acd3a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Apr 22, 2021 at 3:49 PM Xu, Yanfe=
i &lt;<a href=3D"mailto:yanfei.xu@windriver.com">yanfei.xu@windriver.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">From: Yanfei Xu &lt;<a href=3D"mailto:yanfei.xu@win=
driver.com" target=3D"_blank">yanfei.xu@windriver.com</a>&gt;<br>
<br>
This upgrade spans 9 small release. The detailed realese logs could<br>
refer to: <a href=3D"https://gitlab.com/libvirt/libvirt/-/blob/master/NEWS.=
rst" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/libvirt/libvir=
t/-/blob/master/NEWS.rst</a><br>
<br>
Libvirt&#39;s buildsystem has changed to meson, So this upgrade drop some<b=
r>
obsolete patches applied to makefile.</blockquote><div>=C2=A0</div><div>...=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">diff=
 --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_6.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libvirt_6.3.0.bb</a> b/recipes-extended/l=
ibvirt/<a href=3D"http://libvirt_7.2.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">libvirt_7.2.0.bb</a><br>
similarity index 61%<br>
rename from recipes-extended/libvirt/<a href=3D"http://libvirt_6.3.0.bb" re=
l=3D"noreferrer" target=3D"_blank">libvirt_6.3.0.bb</a><br>
rename to recipes-extended/libvirt/<a href=3D"http://libvirt_7.2.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libvirt_7.2.0.bb</a><br>
index eeb1bf8..24748ef 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_6.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_6.3.0.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_7.2.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_7.2.0.bb</a><br>
<br></blockquote><div>...=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
-inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd perl=
native<br>
+inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative<br>
=C2=A0USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
=C2=A0GROUPADD_PARAM_${PN} =3D &quot;-r qemu; -r kvm&quot;<br>
=C2=A0USERADD_PARAM_${PN} =3D &quot;-r -g qemu -G kvm qemu&quot;<br><br></b=
lockquote><div>...=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
=C2=A0do_install_prepend() {<br>
@@ -278,6 +198,8 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;,&#39;systemd&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}/lib<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}/usr/lib/systemd ${D}/lib=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # This variable is used by libvir=
td.service to start libvirtd in the right mode<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;/#LIBVIRTD_ARGS=3D&qu=
ot;--listen&quot;/a LIBVIRTD_ARGS=3D&quot;--listen --daemon&quot;&#39; ${D}=
/${sysconfdir}/sysconfig/libvirtd<br>
<br>
@@ -285,6 +207,8 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/Type=3Dnotify/Ty=
pe=3Dforking/&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#3=
9;/Type=3Dforking/a PIDFile=3D/run/libvirtd.pid&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/$=
{systemd_unitdir}/system/libvirtd.service<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${D}/usr/lib/systemd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The /run/libvirt directories created by the M=
akefile are <br>
@@ -360,7 +284,7 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # connection via 127.0.0.1 is ava=
ilable out of box.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/etc/pki/CA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/etc/pki/libvirt/p=
rivate<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${WORKDIR}/gnutls=
-helper.py ${D}/${bindir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/gnutl=
s-helper.py ${D}/${bindir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/cakey.=
pem ${D}/${sysconfdir}/pki/libvirt/private/cakey.pem<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/cacert=
.pem ${D}/${sysconfdir}/pki/CA/cacert.pem<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/server=
key.pem ${D}/${sysconfdir}/pki/libvirt/private/serverkey.pem<br>
@@ -376,10 +300,10 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod 4755 ${D}${bindir}/virt-login-shell<br>
=C2=A0}<br>
<br>
-EXTRA_OECONF +=3D &quot; \<br>
-=C2=A0 =C2=A0 --with-init-script=3Dsystemd \<br>
-=C2=A0 =C2=A0 --with-test-suite \<br>
-=C2=A0 =C2=A0 --with-runstatedir=3D/run \<br>
+EXTRA_OEMESON +=3D &quot; \<br>
+=C2=A0 =C2=A0 -Dinit_script=3Dsystemd \<br>
+=C2=A0 =C2=A0 -Drunstatedir=3D/run \<br>
+=C2=A0 =C2=A0 -Dtests=3Denabled \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0# gcc9 end up mis-compiling qemuxml2argvtest.o with Og which then<br>
@@ -387,25 +311,6 @@ EXTRA_OECONF +=3D &quot; \<br>
=C2=A0SELECTED_OPTIMIZATION_remove_virtclass-multilib-lib32_mipsarch =3D &q=
uot;-Og&quot;<br>
=C2=A0SELECTED_OPTIMIZATION_append_virtclass-multilib-lib32_mipsarch =3D &q=
uot; -O2&quot;<br>
<br>
-EXTRA_OEMAKE =3D &quot;BUILD_DIR=3D${B} DEST_DIR=3D${D}${PTEST_PATH} PTEST=
_DIR=3D${PTEST_PATH} SYSTEMD_UNIT_DIR=3D${systemd_system_unitdir}&quot;<br>=
</blockquote><div><br></div><div>Can we set something like SYSTEMD_UNIT_DIR=
 for meson to install service file into correct directory directly (while r=
especting usrmerge in DISTRO_FEATURES), instead of moving the files in do_i=
nstall_append?</div><div><br></div><div>The sed in do_install_append is fai=
ling as shown in:</div><div><a href=3D"http://errors.yoctoproject.org/Error=
s/Build/122419/">http://errors.yoctoproject.org/Errors/Build/122419/</a><br=
></div><div>because ${D}/${systemd_unitdir}/system isn&#39;t the same as=C2=
=A0${D}/lib/systemd/system with usrmerge:</div><div>env.libvirt-without-usr=
merge:export systemd_unitdir=3D&quot;/lib/systemd&quot;<br>env.libvirt-with=
-usrmerge:export systemd_unitdir=3D&quot;/usr/lib/systemd&quot;<br></div><d=
iv><br></div><div>env.libvirt-without-usrmerge:export systemd_system_unitdi=
r=3D&quot;/lib/systemd/system&quot;<br>env.libvirt-with-usrmerge:export sys=
temd_system_unitdir=3D&quot;/usr/lib/systemd/system&quot;<br></div></div></=
div>

--000000000000057aac05c2acd3a9--
