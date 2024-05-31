Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2542FC25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 15:03:57 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.14831.1717167830206738446
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 31 May 2024 08:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f8QSeG1v;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ae0c4d23ddso10701986d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 31 May 2024 08:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717167829; x=1717772629; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hz1QscDy2Du/A7TKa4lIAviL2FL/U+t7DE+82vxz1JQ=;
        b=f8QSeG1vVub69jajlCwbNSq8aYKw/FFtOGcuoJ7CndtFqStIBd1QngZztQB4SPK5dj
         ChTOe0mOHOicNMgNgTIH64hYTQa+Krs5YrbPfWO9vzA20MQVc5P6r1x/aDd+UjdeERPQ
         X36v3vKB3YKXNre0gleuRLU2DnV28hrkqTOCPnAEcA/0xo8GBxyYQdxlvsK5mZTWQemK
         UWUE0kJYjFrgPU6FWINKifdHOavwUqd4rSUnaow9VdbjChZ5penWfCMvJ83ouX+9pkXY
         LeV5uRFfVwStSCITUuh+sLLTg9Fu7o6TyD70vQxxaHlISND4KbS41OfjMtItMBX4J1iy
         xaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717167829; x=1717772629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hz1QscDy2Du/A7TKa4lIAviL2FL/U+t7DE+82vxz1JQ=;
        b=F4TOYJPznM2QQ+1R5M0XVvRCS14/b6vtJBOZkmtw/xga8YpsSlUjJ1FA34+niBfpy+
         3WOH2mmSUf31U9PovxXS9I2WLU4sVlO7QH6Kg8zMSFAY59MnykFR+FAT1Rv+CC3d4N4q
         KXwd2MHp7PjkUnJnKE+6xqCRRLffby2MsdSyU5fBgkaRHFsaeBb8ZClG7ziPPcq+yg71
         N/jfXcrjCBwlvA+CTkIaV1U8FbW6u5FaNTyOIcN7UTStPUb3XPLZb/1NF18EeO8v9sTU
         y+0mGjfCgXSj8LW9doI/wDZFTzvOlJ5l2W3Wo/FcfOTPtUktbRDwpsWIMKXo/Uued4c9
         1zrw==
X-Gm-Message-State: AOJu0Yw2K4xQtlvKjtGsL2EXM1uQjxC0xznekfXVyxizmSmn2asYKrdt
	jDApfvE/mUDc3381kmTVGAZB+FvaevghCeuVJRlCG1iLOLAy1rTj
X-Google-Smtp-Source: AGHT+IFL+K//MaI4htS+0K0oBoi9yGZKh8HjEf+7OCzbaiv4MGtPkdPrp1L5jbccPe9ssG1KCL2y1w==
X-Received: by 2002:a0c:c787:0:b0:6ae:d35c:5464 with SMTP id 6a1803df08f44-6aed35c54c4mr17087656d6.10.1717167829083;
        Fri, 31 May 2024 08:03:49 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ae4b4195f7sm7006516d6.126.2024.05.31.08.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 08:03:48 -0700 (PDT)
Date: Fri, 31 May 2024 15:03:46 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org,
	Hieu Van Nguyen <hieu2.nguyen@lge.com>
Subject: Re: [meta-virtualization] [master-next][PATCH v2] libvirt: convert
 more WORKDIR references to UNPACKDIR
Message-ID: <Zlnm0uHVibnTPKLZ@gmail.com>
References: <20240530142845.1822812-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530142845.1822812-1-martin.jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 31 May 2024 15:03:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8790

In message: [meta-virtualization] [master-next][PATCH v2] libvirt: convert more WORKDIR references to UNPACKDIR
on 30/05/2024 Martin Jansa via lists.yoctoproject.org wrote:

> From: Hieu Van Nguyen <hieu2.nguyen@lge.com>
> 
> unpacked source files are now in UNPACKDIR, so we adjust our
> operations to match.
> 
> Some references were missed in previous commit as they
> are behind conditional.
> 
> Use BP subdir for python, to build it inside ${S}.
> 
> Need cd - to go back to $${B} so that gnutls-helper.py
> is executed there instead of python subdirectory.
> 
> Use mix of tabs and spaces for indentation like other lines
> around :).

It depends on the weather and day of the week whether
spaces or tabs are used!

> 
> Signed-off-by: Hieu Van Nguyen <hieu2.nguyen@lge.com>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc |  8 +++++---
>  recipes-extended/libvirt/libvirt_10.0.0.bb  | 21 ++++++++++-----------
>  2 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index 6fb2b68c..40c362d6 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -18,7 +18,7 @@ FILES:${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
>  # Currently the libvirt-python debug libraries contain buildpaths
>  INSANE_SKIP:${PN}-dbg += "buildpaths"
>  
> -SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
> +SRC_URI += "http://libvirt.org/sources/python/${BPN}-python-${PV}.tar.gz;name=libvirt_python;subdir=${BP}"
>  
>  SRC_URI[libvirt_python.sha256sum] = "a82588f0e7db53eda7b7dbcbc448b0ec43e00a8c77cac69644495299b410c20d"
>  
> @@ -46,8 +46,9 @@ do_compile:append() {
>  		# the syroot staged pkgconfig entries. So we clear the sysroot
>  		# for just this portion.
>  		export PKG_CONFIG_SYSROOT_DIR=
> -		cd ${WORKDIR}/${BPN}-python-${PV} && \
> +		cd ${S}/${BPN}-python-${PV} && \
>  		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
> +		cd -

Alternatively we could wrap this in a subshell (), which is
what I normally do to avoid needing to change back.

But that's something I can tweak after this patch if any
issues pop up.

I've got this under test now, and expect to push it shortly.

Bruce

>  	fi
>  }
>  
> @@ -57,8 +58,9 @@ do_install:append() {
>  		# the syroot staged pkgconfig entries. So we clear the sysroot
>  		# for just this portion.
>  		export PKG_CONFIG_SYSROOT_DIR=
> -		cd ${WORKDIR}/${BPN}-python-${PV} && \
> +		cd ${S}/${BPN}-python-${PV} && \
>  		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py install \
>                         --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${LIBVIRT_INSTALL_ARGS}
> +		cd -
>  	fi
>  }
> diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-extended/libvirt/libvirt_10.0.0.bb
> index 9ad1f798..8e54406a 100644
> --- a/recipes-extended/libvirt/libvirt_10.0.0.bb
> +++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
> @@ -24,12 +24,12 @@ RDEPENDS:libvirt-libvirtd:append:aarch64 = " dmidecode"
>  #connman blocks the 53 port and libvirtd can't start its DNS service
>  RCONFLICTS:${PN}_libvirtd = "connman"
>  
> -SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
> +SRC_URI = "http://libvirt.org/sources/${BP}.tar.xz;name=libvirt \
>             file://libvirtd.sh \
>             file://libvirtd.conf \
>             file://dnsmasq.conf \
>             file://hook_support.py \
> -           file://gnutls-helper.py \
> +           file://gnutls-helper.py;subdir=${BP} \
>             file://0001-prevent-gendispatch.pl-generating-build-path-in-code.patch \
>             file://0001-messon.build-remove-build-path-information-to-avoid-.patch \
>            "
> @@ -286,21 +286,20 @@ do_install:append() {
>  
>  	if ${@bb.utils.contains('PACKAGECONFIG','gnutls','true','false',d)}; then
>  	    # Generate sample keys and certificates.
> -	    cd ${WORKDIR}
> -	    ${WORKDIR}/gnutls-helper.py -y
> +	    ${S}/gnutls-helper.py -y
>  
>  	    # Deploy all sample keys and certificates of CA, server and client
>  	    # to target so that libvirtd is able to boot successfully and local
>  	    # connection via 127.0.0.1 is available out of box.
>  	    install -d ${D}/etc/pki/CA
>  	    install -d ${D}/etc/pki/libvirt/private
> -            install -m 0755 ${WORKDIR}/gnutls-helper.py ${D}/${bindir}
> -	    install -m 0644 ${WORKDIR}/cakey.pem ${D}/${sysconfdir}/pki/libvirt/private/cakey.pem
> -	    install -m 0644 ${WORKDIR}/cacert.pem ${D}/${sysconfdir}/pki/CA/cacert.pem
> -	    install -m 0644 ${WORKDIR}/serverkey.pem ${D}/${sysconfdir}/pki/libvirt/private/serverkey.pem
> -	    install -m 0644 ${WORKDIR}/servercert.pem ${D}/${sysconfdir}/pki/libvirt/servercert.pem
> -	    install -m 0644 ${WORKDIR}/clientkey.pem ${D}/${sysconfdir}/pki/libvirt/private/clientkey.pem
> -	    install -m 0644 ${WORKDIR}/clientcert.pem ${D}/${sysconfdir}/pki/libvirt/clientcert.pem
> +	    install -m 0755 ${S}/gnutls-helper.py ${D}/${bindir}
> +	    install -m 0644 cakey.pem ${D}/${sysconfdir}/pki/libvirt/private/cakey.pem
> +	    install -m 0644 cacert.pem ${D}/${sysconfdir}/pki/CA/cacert.pem
> +	    install -m 0644 serverkey.pem ${D}/${sysconfdir}/pki/libvirt/private/serverkey.pem
> +	    install -m 0644 servercert.pem ${D}/${sysconfdir}/pki/libvirt/servercert.pem
> +	    install -m 0644 clientkey.pem ${D}/${sysconfdir}/pki/libvirt/private/clientkey.pem
> +	    install -m 0644 clientcert.pem ${D}/${sysconfdir}/pki/libvirt/clientcert.pem
>  
>  	    # Force the connection to be tls.
>  	    sed -i -e 's/^\(listen_tls\ =\ .*\)/#\1/' -e 's/^\(listen_tcp\ =\ .*\)/#\1/' ${D}/etc/libvirt/libvirtd.conf
> -- 
> 2.45.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8788): https://lists.yoctoproject.org/g/meta-virtualization/message/8788
> Mute This Topic: https://lists.yoctoproject.org/mt/106389420/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


