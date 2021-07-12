Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.30.1626120122118607591
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Jul 2021 13:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lbrdCkmg;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 6C29638C082A
	for <meta-virtualization@yoctoproject.org>; Mon, 12 Jul 2021 20:02:01 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id ec55so4949173edb.1
        for <meta-virtualization@yoctoproject.org>; Mon, 12 Jul 2021 13:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8TzuActeDqyFScSg57BDvA+mXQT8kuSiMWKgtZxYUBI=;
        b=lbrdCkmg+JKAW/DkdPP9WFOusWLICReJx/cg8RuS6FiWemVJfnDUh59Yr8/1D77NDd
         i1YzqKn9cPd+i/f1ODiikOu1ZF7ScScviJgGeNBUaYPTVYv3o3yPMs3TACtsOpuW0K8H
         gFwMgtLTeRCFvyaemoKYWbB2z7UOyo9KA19o9nkKZpVNSxojjjYomYrmkmxSfSLRn1xh
         E7BYGcL9pUsbfc1NufYAmwDo/PTr2AdaO4xwniFmKhIW7N3QMVx0MSQ1Ui8vLH0j+1wH
         ZHMLmLiIXL6+AbURPQjqPb0XUV4vHh5/qclhVVYU025R9UlL2Uu1CR8DrWFLhTVk+E8E
         WfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8TzuActeDqyFScSg57BDvA+mXQT8kuSiMWKgtZxYUBI=;
        b=JAm4obBPgRTb7eKcOD7ULbQcaIe0GOFfmLzIyGRfxazx7I91py5MJTXM0cfvCS3mJp
         Ik87/KqYzu9NNgyKQo3yDNcKwTL+EplJ/7nsml5L7jMhU0D2V41ELIbsEQB8ftmnenEH
         veFg2QqTtj1Em+yoPcjRSZwvnBksusUqOqD4TQmmmv1mbc+afGs+XOT7ekwhG2Ruirws
         Nl2oLkj67EWfozHecdizwAs79S14Y9OwHh6oRP9P0k5fUxnWAb3grDFKtp3clEb2K1tb
         rSN/LW6KyNbTUaQXIq+GbuEFoRzL/VrIRFAWXbhkD8W3ka7CdzT0ItJ40KlhzAk4d0Gc
         guEg==
X-Gm-Message-State: AOAM53085wVmdI17f0psAAqU1d12golRuLb1Rf3TXZ/qetw6tA17n222
	NcGICyYoq86YRL7AYBNQMgSn3ZkRL0HchXdLCOs=
X-Google-Smtp-Source: ABdhPJwCYVwpqqn/o/Lua4tkpQDfAE6UAElgYFwOfml/e+2xLrXTnIvEp8u9AIsMwj/VCrNK8Qfb3TddpkpDeslNasY=
X-Received: by 2002:a05:6402:d63:: with SMTP id ec35mr659744edb.347.1626120119942;
 Mon, 12 Jul 2021 13:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <1625794584-29456-1-git-send-email-zangrc.fnst@fujitsu.com>
In-Reply-To: <1625794584-29456-1-git-send-email-zangrc.fnst@fujitsu.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 12 Jul 2021 16:01:49 -0400
Message-ID: <CADkTA4OWiGs67QgqUv3dXV+f9BRbeBCvZHy05otAGKrYAuzedg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] open-iscsi-user: upgrade 2.0-873 -> 2.1.4
To: zangrc <zangrc.fnst@fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged.

Bruce

On Thu, Jul 8, 2021 at 10:07 PM zangrc <zangrc.fnst@fujitsu.com> wrote:
>
> open-iscsi-2.1.3 - open-iscsi-2.1.4
>
> Abhinav Rajagopalan (1):
>       Fix typo in util.py
>
> Chris Leech (3):
>       libopeniscsiusr: fix error messages
>       libopeniscsiusr: skip over removed sessions
>       libopeniscsiusr: dont error loudly if a session isn't found when w=
orking through iscsi_sessions_get()
>
> Fabian M=C3=B6ller (1):
>       iscsid: Add NO_SYSTEMD to CFLAGS
>
> Helmut Grohne (1):
>       Avoid hardcoding pkg-config to fix cross build
>
> John Schaeffer (1):
>       Add etc/systemd/iscsi-init.service to SYSTEMDFILES Makefile variab=
le
>
> Lee Duncan (4):
>       iscsid: Do not allow conflicting pid-file options
>       Fix iscsiadm segfault when exiting
>       Fix iscsistart login issue when target is delayed.
>       Enable iscsi.service asynchronous logins, cleanup services
>
> Matwey V. Kornilov (1):
>       Wants=3Dnetwork-online.target in iscsi.service
>
> Patrick Lawrence (1):
>       Change mkdir permissions to 0770, adjust usmask
>
> Wenchao Hao (4):
>       idbm: Fix memory leak and NULL pointer dereference in idbm_rec_upd=
ate_param()
>       libopeniscsiusr: Fix memory leak in iscsi_nodes_get()
>       libopeniscsiusr: Fix memory leak in iscsi_sessions_get()
>       iscsiadm: Fix memory leak in iscsiadm
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>  .../0001-fix-build-error-of-cross-build.patch | 24 ++++----
>  .../open-iscsi/open-iscsi-user_2.0-873.bb     | 55 -----------------
>  .../open-iscsi/open-iscsi-user_2.1.4.bb       | 61 +++++++++++++++++++
>  3 files changed, 73 insertions(+), 67 deletions(-)
>  delete mode 100644 meta-openstack/recipes-connectivity/open-iscsi/open-=
iscsi-user_2.0-873.bb
>  create mode 100644 meta-openstack/recipes-connectivity/open-iscsi/open-=
iscsi-user_2.1.4.bb
>
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-f=
ix-build-error-of-cross-build.patch b/meta-openstack/recipes-connectivity/o=
pen-iscsi/files/0001-fix-build-error-of-cross-build.patch
> index 206da48..8eec2dc 100644
> --- a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-buil=
d-error-of-cross-build.patch
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-fix-buil=
d-error-of-cross-build.patch
> @@ -1,30 +1,30 @@
> -From 943a321104a5b2c4ac25bdb2ae81b5b208e3973c Mon Sep 17 00:00:00 2001
> -From: Lei Maohui <leimaohui@cn.fujitsu.com>
> -Date: Tue, 18 Aug 2015 10:29:35 +0900
> +From 2ba83ff539c18d02f8e4b4ce7903a5b46f364609 Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@fujitsu.com>
> +Date: Thu, 8 Jul 2021 15:06:27 +0900
>  Subject: [PATCH] fix build error of cross build
>
>  The error likes as following
>  | configure: error: cannot run C compiled programs.
>  | If you meant to cross compile, use `--host'.
>
> -Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
>  ---
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Makefile b/Makefile
> -index c5d9700..1f31e43 100644
> +index 7f52cc8..cadbc47 100644
>  --- a/Makefile
>  +++ b/Makefile
> -@@ -42,7 +42,7 @@ user: utils/open-isns/Makefile
> +@@ -78,7 +78,7 @@ user: iscsiuio/Makefile
>         @echo "Read README file for detailed information."
>
> - utils/open-isns/Makefile: utils/open-isns/configure utils/open-isns/Ma=
kefile.in
> --      cd utils/open-isns; ./configure CFLAGS=3D"$(OPTFLAGS)" --with-se=
curity=3Dno
> -+      cd utils/open-isns; ./configure CFLAGS=3D"$(OPTFLAGS)" --with-se=
curity=3Dno ${CONFIGURE_ARGS}
> + iscsiuio/Makefile: iscsiuio/configure iscsiuio/Makefile.in
> +-      cd iscsiuio; ./configure $(WITHOUT_ARG)
> ++      cd iscsiuio; ./configure $(WITHOUT_ARG) $(CONFIGURE_ARGS)
>
> - kernel: force
> -       $(MAKE) -C kernel
> + iscsiuio/configure iscsiuio/Makefile.in: iscsiuio/configure.ac iscsiui=
o/Makefile.am
> +       cd iscsiuio; autoreconf --install
>  --
> -1.8.4.2
> +2.25.1
>
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-u=
ser_2.0-873.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-=
user_2.0-873.bb
> deleted file mode 100644
> index 4c9326e..0000000
> --- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0=
-873.bb
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -DESCRIPTION =3D "Open-iSCSI project is a high performance, transport in=
dependent, multi-platform implementation of RFC3720."
> -HOMEPAGE =3D "http://www.open-iscsi.org/"
> -LICENSE =3D "GPLv2"
> -PR =3D "r1"
> -
> -inherit systemd
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445f6965873eca0259a17=
f833"
> -
> -SRC_URI =3D "http://www.open-iscsi.org/bits/open-iscsi-${PV}.tar.gz   \
> -           file://0001-fix-build-error-of-cross-build.patch         \
> -           file://open-iscsi                                        \
> -           file://initiatorname.iscsi                               \
> -           "
> -
> -
> -S =3D "${WORKDIR}/open-iscsi-${PV}"
> -TARGET_CC_ARCH +=3D "${LDFLAGS}"
> -EXTRA_OEMAKE +=3D "CONFIGURE_ARGS=3D'--host=3D${HOST_SYS}'"
> -
> -do_compile () {
> -        oe_runmake user
> -}
> -
> -do_install () {
> -        oe_runmake DESTDIR=3D"${D}" install_user
> -        cp -f "${WORKDIR}/open-iscsi" "${D}/etc/init.d/"
> -        install -m 0644 ${WORKDIR}/initiatorname.iscsi ${D}/etc/iscsi/i=
nitiatorname.iscsi
> -}
> -
> -
> -SRC_URI[md5sum] =3D "8b8316d7c9469149a6cc6234478347f7"
> -SRC_URI[sha256sum] =3D "7dd9f2f97da417560349a8da44ea4fcfe98bfd5ef284240=
a2cc4ff8e88ac7cd9"
> -
> -# systemd support
> -PACKAGES =3D+ "${PN}-systemd"
> -SRC_URI_append =3D "  file://iscsi-initiator                           =
        \
> -                    file://iscsi-initiator.service                     =
      \
> -                    file://iscsi-initiator-targets.service             =
      \
> -                 "
> -RDEPENDS_${PN} +=3D "bash"
> -RDEPENDS_${PN}-systemd +=3D "${PN}"
> -FILES_${PN}-systemd +=3D  "   ${base_libdir}/systemd                  \
> -                            ${sysconfdir}/default/iscsi-initiator   \
> -                        "
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN}-systemd =3D "iscsi-initiator.service iscsi-initia=
tor-targets.service"
> -
> -do_install_append () {
> -        install -d ${D}${sysconfdir}/default/
> -        install -m 0644 ${WORKDIR}/iscsi-initiator ${D}${sysconfdir}/de=
fault/
> -        install -d ${D}${systemd_unitdir}/system
> -        install -m 0644 ${WORKDIR}/iscsi-initiator.service ${D}${system=
d_unitdir}/system/
> -        install -m 0644 ${WORKDIR}/iscsi-initiator-targets.service ${D}=
${systemd_unitdir}/system/
> -}
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-u=
ser_2.1.4.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-us=
er_2.1.4.bb
> new file mode 100644
> index 0000000..139ce1d
> --- /dev/null
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1=
.4.bb
> @@ -0,0 +1,61 @@
> +DESCRIPTION =3D "Open-iSCSI project is a high performance, transport in=
dependent, multi-platform implementation of RFC3720."
> +HOMEPAGE =3D "http://www.open-iscsi.org/"
> +LICENSE =3D "GPLv2"
> +PR =3D "r1"
> +
> +inherit systemd autotools pkgconfig
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a=
4263"
> +DEPENDS =3D "kmod openssl util-linux open-isns"
> +DEPENDS_append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',=
 'systemd', '', d)}"
> +
> +SRC_URI =3D "git://github.com/open-iscsi/open-iscsi.git;protocol=3Dhttp=
s   \
> +           file://0001-fix-build-error-of-cross-build.patch \
> +           "
> +
> +SRCREV =3D "095f59ca464220eae285de6b5f2ee31185a6a84c"
> +
> +S =3D "${WORKDIR}/git"
> +B =3D "${S}"
> +
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> +EXTRA_OEMAKE +=3D "CONFIGURE_ARGS=3D'--host=3D${HOST_SYS}'"
> +
> +do_configure () {
> +    :
> +}
> +
> +do_compile () {
> +        oe_runmake user
> +}
> +
> +
> +do_install () {
> +        oe_runmake DESTDIR=3D"${D}" install_user
> +        install ${S}/etc/initd/initd.debian ${D}/etc/init.d/open-iscsi
> +        install -m 0644 ${S}/etc/iscsid.conf ${D}/etc/iscsi/
> +
> +        install -d ${D}${libdir}
> +        install -Dm 0644 ${S}/libopeniscsiusr/libopeniscsiusr.so.0.2.0 =
${D}${libdir}/
> +        ln -sf ${libdir}/libopeniscsiusr.so.0.2.0 ${D}${libdir}/libcap-=
ng.so
> +}
> +
> +# systemd support
> +PACKAGES =3D+ "${PN}-systemd"
> +RDEPENDS_${PN} +=3D "bash"
> +RDEPENDS_${PN}-systemd +=3D "${PN}"
> +FILES_${PN}-systemd +=3D  "${base_libdir}/systemd                  \
> +                         ${sysconfdir}/default/iscsi-initiator   \
> +                        "
> +SYSTEMD_PACKAGES =3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN}-systemd =3D "iscsi.service \
> +                                 iscsiuio.service \
> +                                 iscsid.service \
> +                                 iscsi-init.service \
> +                                 iscsid.socket \
> +                                 iscsiuio.socket "
> +
> +do_install_append () {
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${S}/etc/systemd/* ${D}${systemd_unitdir}/syste=
m/
> +}
> --
> 2.25.1
>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
