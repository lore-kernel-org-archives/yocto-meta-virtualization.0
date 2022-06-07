Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87092C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 14:05:21 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.12671.1654610712104083867
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 07:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EDHobHU0;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id a184so9697608qkg.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 07:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=udonxLxKVrRbyuMTAgHIacZaKIyRaT4SOA3a3cHyr14=;
        b=EDHobHU0Qx+TcfTSoyASLe7xSctDMsGSk+5ODiZYoc76v5C6Ytg/x4OJjCfcLbPSRI
         4ZaaVr00C2NtaJxafoR9AEB6wfAfrs29Pdl3HxURaCq50jm49jRDsgMTWIG/91BVAwSt
         5NkGvotIn/0xxOGq8dHGQK79Vhht7TLTY21Featb07wTby0vI9N9P7dAgUGvqBqMMFEF
         IUjGYa3Fj+9uvXtFs8e1npdeyOT65l3KbGT0NHyj11KjarZATTEuyb1fOwZOIUDdSZ9I
         eR/gn7bNpmbcBedS3dHtH1XzH8e8DQzILwOHbpIeOs1y7x2D0Zl9EqTd5FFtVbicAqu5
         pZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=udonxLxKVrRbyuMTAgHIacZaKIyRaT4SOA3a3cHyr14=;
        b=s6kz1RRyqxzdH+8m/fj/kt6RIjOjoL0qqlZCq8EaajliWQ6Z4SnON73+0wg7aU6DKU
         wFXEvvyzRfgmCDSqkYr4OB0q7xKLSTmz9XhGKR7IOpVXzuj3Jj9bD9gaHvYOSligBaxv
         gfAR3b4zl8pU54D+t2/wLyoh9k1SuhSGAetzPufqt2xBiOZAd12eFKRHWgqUkhd8u3qy
         bAWh6E5nshN9RAcXVtf4Pho8mOrkh25BxgyQSLMArp5BI5AFVbrDU0j87bDk3+E2a5Cz
         cnPVG3EsR8yDByjQeTJ3FKWCzLyk8YTT8GbHE+2apVAu4LkDC0e6/+71NsqFsTJP3D6y
         bmQA==
X-Gm-Message-State: AOAM532F5nGttlLsHndtXQrsqEkqE0Tlkjhh/ND2c2fMQqVrxYdItHxH
	AcDqIoiyXZGtNtnsj8dEYzBI3bHpu4BC4A==
X-Google-Smtp-Source: 
 ABdhPJwq33Is5TscT565/UL5RfYiJk6ZGpI0umrABKALY86pRHjG2/3uPl0/lL75bHAzxDYy6alYLw==
X-Received: by 2002:a05:620a:17a1:b0:6a6:ed81:ec with SMTP id
 ay33-20020a05620a17a100b006a6ed8100ecmr1204852qkb.523.1654610710994;
        Tue, 07 Jun 2022 07:05:10 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 w184-20020a3794c1000000b006a098381abcsm13886557qkd.114.2022.06.07.07.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 07:05:10 -0700 (PDT)
Date: Tue, 7 Jun 2022 10:05:08 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: leimaohui <leimaohui@fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] open-iscsi-user: Fix conflict
 error with systemd and net-snmp-server-snmptrapd.
Message-ID: <20220607140508.GD54262@gmail.com>
References: <1654571706-3858-1-git-send-email-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1654571706-3858-1-git-send-email-leimaohui@fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jun 2022 14:05:21 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7341

merged to master and kirkstone.

Bruce

In message: [meta-virtualization] [PATCH] open-iscsi-user: Fix conflict error with systemd and net-snmp-server-snmptrapd.
on 07/06/2022 leimaohui wrote:

> - reinstall service files
> - deleted older version
> 
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  .../open-iscsi/open-iscsi-user_2.1.4.bb            | 60 ----------------------
>  .../open-iscsi/open-iscsi-user_2.1.7.bb            | 10 ++++
>  2 files changed, 10 insertions(+), 60 deletions(-)
>  delete mode 100644 meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
> 
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
> deleted file mode 100644
> index 928290f..0000000
> --- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -DESCRIPTION = "Open-iSCSI project is a high performance, transport independent, multi-platform implementation of RFC3720."
> -HOMEPAGE = "http://www.open-iscsi.org/"
> -LICENSE = "GPL-2.0-only"
> -PR = "r1"
> -
> -inherit systemd autotools pkgconfig
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -DEPENDS = "kmod openssl util-linux open-isns"
> -DEPENDS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
> -
> -SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https;branch=master \
> -           file://0001-fix-build-error-of-cross-build.patch \
> -           "
> -
> -SRCREV = "095f59ca464220eae285de6b5f2ee31185a6a84c"
> -
> -S = "${WORKDIR}/git"
> -B = "${S}"
> -
> -TARGET_CC_ARCH += "${LDFLAGS}"
> -EXTRA_OEMAKE += "CONFIGURE_ARGS='--host=${HOST_SYS}'"
> -
> -do_configure () {
> -    :
> -}
> -
> -do_compile () {
> -        oe_runmake user
> -}
> -
> -do_install () {
> -        oe_runmake DESTDIR="${D}" install_user
> -        install ${S}/etc/initd/initd.debian ${D}/etc/init.d/open-iscsi
> -        install -m 0644 ${S}/etc/iscsid.conf ${D}/etc/iscsi/
> -
> -        install -d ${D}${libdir}
> -        install -Dm 0644 ${S}/libopeniscsiusr/libopeniscsiusr.so.0.2.0 ${D}${libdir}/
> -        ln -sf ${libdir}/libopeniscsiusr.so.0.2.0 ${D}${libdir}/libopeniscsiusr.so
> -}
> -
> -# systemd support
> -PACKAGES =+ "${PN}-systemd"
> -RDEPENDS:${PN} += "bash"
> -RDEPENDS:${PN}-systemd += "${PN}"
> -FILES:${PN}-systemd +=  "${base_libdir}/systemd                  \
> -                         ${sysconfdir}/default/iscsi-initiator   \
> -                        "
> -SYSTEMD_PACKAGES = "${PN}-systemd"
> -SYSTEMD_SERVICE:${PN}-systemd = "iscsi.service \
> -                                 iscsiuio.service \
> -                                 iscsid.service \
> -                                 iscsi-init.service \
> -                                 iscsid.socket \
> -                                 iscsiuio.socket "
> -
> -do_install:append () {
> -        install -d ${D}${systemd_unitdir}/system
> -        install -m 0644 ${S}/etc/systemd/* ${D}${systemd_unitdir}/system/
> -}
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
> index b4b9ebc..8cedff4 100644
> --- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
> @@ -43,3 +43,13 @@ FILES:${PN} += " \
>      ${systemd_system_unitdir}/iscsiuio.service \
>      ${systemd_unitdir}/system-generators/ibft-rule-generator \
>  "
> +
> +do_install:append() {
> +    rm -rf ${D}${systemd_unitdir}/
> +
> +    install -d ${D}${systemd_unitdir}/system
> +    install -d ${D}${systemd_unitdir}/system-generators
> +    install -m 0644 ${S}/etc/systemd/*.service ${D}${systemd_unitdir}/system/
> +    install -m 0644 ${S}/etc/systemd/*.socket ${D}${systemd_unitdir}/system/
> +    install -m 0644 ${S}/etc/systemd/ibft-rule-generator ${D}${systemd_unitdir}/system-generators/
> +}
> -- 
> 1.8.3.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7335): https://lists.yoctoproject.org/g/meta-virtualization/message/7335
> Mute This Topic: https://lists.yoctoproject.org/mt/91593585/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


