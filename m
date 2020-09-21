Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.52485.1600723976708016528
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 14:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jhMjK2WS;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id q63so16866679qkf.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Sep 2020 14:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+6KEtjJY594+F6faojz/3culjR6hXYMgbUDgH2fZKF0=;
        b=jhMjK2WSCJttwDyC11QADT8DcD9ikjBjQZaltrFzoLtXxmlzEAOgjrOuYM0keE4SnQ
         T8DUNtAUuqB8Ptxt+NWDaM3KmCmUKvoTfGM5ZEeuP87v2bkKUGTe/9MhGGZ4PPKJs8Js
         2Duwd0odj+qv7gy3/rPVsPo7Apev0Tjg1WR3o4QEVjoc2pLK7a1k8Mvr5jIfhkFUtBE0
         j8pmtL92wMnUX17lJZF/nQBnyPb6nyIi3UivACny7g+V1r0q/cCDgdKBfEEwy8eQ91Vx
         OF3ogvcH9jz2i0/AnxuK1jnr2gyX8jZFRJWUg581wx/OpHP85GE8di6G+BNFEbyo1HxU
         sqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+6KEtjJY594+F6faojz/3culjR6hXYMgbUDgH2fZKF0=;
        b=txEOIz4Eicpww26OcWubnhgSSDzOC4iHYJguJm+Gyk449HxF6HX5Is8OE0wpyZHblG
         HZVjVqRS7SKnFT+Gkih5grS+IvPJMW6GN/Xsk7lm6mmudArtpXHKtFdQS2mwuMRyAJNQ
         ul3KGGDOb4RxFekNO2Q1VCcNqpc9JfbGKDFGQIqRO0l0DyNTgzzHcDcMRh8Hex9yHhez
         V1AnrX7ETL1XuG4emMmYqj0iAxmVJ4VJ/pFUj/BQIjnMqhiwrYN5TGdVZaoyOkjhsO74
         pLAeubFB4tCJn79OBRjhqaBbNrxAbH4qJWkuHC7PexN1wDlJ8hzJ7hcJEAFoPcR8RZFX
         tYQQ==
X-Gm-Message-State: AOAM531BywyOltJkufmUdi8SGZ7+oblpq1oXCbY3jc6jJcFpSIkE2o91
	874owI5pXPLPD22B3rMhov4=
X-Google-Smtp-Source: ABdhPJxaf2a8QF8A3nIojos1wFkVJrf4AE9xF+uDxxDVYuc38wGSm467UxTO2h8bzDUZ5CdaJ0dgzg==
X-Received: by 2002:a37:5684:: with SMTP id k126mr1745963qkb.43.1600723975845;
        Mon, 21 Sep 2020 14:32:55 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id n144sm10178330qkn.69.2020.09.21.14.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 14:32:55 -0700 (PDT)
Date: Mon, 21 Sep 2020 17:32:53 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: Use /run in replace of /var/run in libvirt
Message-ID: <20200921213253.GB47079@gmail.com>
References: <20200917113853.29095-1-yanfei.xu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200917113853.29095-1-yanfei.xu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

merged.

Bruce

In message: [meta-virtualization][PATCH] libvirt: Use /run in replace of /var/run in libvirt
on 17/09/2020 Xu, Yanfei wrote:

> From: Yanfei Xu <yanfei.xu@windriver.com>
> 
> To avoid systemd complains that the libvirt unit files use legacy
> directory, we configure the libvirt with '--with-runstatedir=/run'
> and do some minor changes.
> 
> ------------------cut here----------------------
> 014: systemd[1]: /lib/systemd/system/virtlogd.socket:6: ListenStream=
> references a path below legacy directory /var/run/, updating
> /var/run/libvirt/virtlogd-sock → /run/libvirt/virtlogd-sock; please
> update the unit file accordingly.
> 014: systemd[1]: /lib/systemd/system/virtlogd-admin.socket:8:
> ListenStream= references a path below legacy directory /var/run/,
> updating /var/run/libvirt/virtlogd-admin-sock →
> /run/libvirt/virtlogd-admin-sock; please update the unit file
> accordingly.
> 014: systemd[1]: /lib/systemd/system/virtlockd.socket:6: ListenStream=
> references a path below legacy directory /var/run/, updating
> /var/run/libvirt/virtlockd-sock → /run/libvirt/virtlockd-sock; please
> update the unit file accordingly.
> 014: systemd[1]: /lib/systemd/system/virtlockd-admin.socket:8:
> ListenStream= references a path below legacy directory /var/run/,
> updating /var/run/libvirt/virtlockd-admin-sock →
> /run/libvirt/virtlockd-admin-sock; please update the unit file
> accordingly.
> 014: systemd[1]: /lib/systemd/system/libvirtd.socket:9: ListenStream=
> references a path below legacy directory /var/run/, updating
> /var/run/libvirt/libvirt-sock → /run/libvirt/libvirt-sock; please update
> the unit file accordingly.
> 014: systemd[1]: /lib/systemd/system/libvirtd-ro.socket:11:
> ListenStream= references a path below legacy directory /var/run/,
> updating /var/run/libvirt/libvirt-sock-ro →
> /run/libvirt/libvirt-sock-ro; please update the unit file accordingly.
> ......
> 
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_6.3.0.bb | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt_6.3.0.bb b/recipes-extended/libvirt/libvirt_6.3.0.bb
> index 70c6d71..41abb06 100644
> --- a/recipes-extended/libvirt/libvirt_6.3.0.bb
> +++ b/recipes-extended/libvirt/libvirt_6.3.0.bb
> @@ -283,23 +283,23 @@ do_install_append() {
>  
>  	    # We can't use 'notify' when we don't support 'sd_notify' dbus capabilities.
>  	    sed -i -e 's/Type=notify/Type=forking/' \
> -	           -e '/Type=forking/a PIDFile=${localstatedir}/run/libvirtd.pid' \
> +	           -e '/Type=forking/a PIDFile=/run/libvirtd.pid' \
>  		   ${D}/${systemd_unitdir}/system/libvirtd.service
>  	fi
>  
> -	# The /var/run/libvirt directories created by the Makefile
> -	# are wiped out in volatile, we need to create these at boot.
> -	rm -rf ${D}${localstatedir}/run
> +	# The /run/libvirt directories created by the Makefile are 
> +	# wiped out in volatile, we need to create these at boot.
> +	rm -rf ${D}/run
>  	install -d ${D}${sysconfdir}/default/volatiles
> -	echo "d root root 0755 ${localstatedir}/run/libvirt none" \
> +	echo "d root root 0755 /run/libvirt none" \
>  	     > ${D}${sysconfdir}/default/volatiles/99_libvirt
> -	echo "d root root 0755 ${localstatedir}/run/libvirt/lockd none" \
> +	echo "d root root 0755 /run/libvirt/lockd none" \
>  	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
> -	echo "d root root 0755 ${localstatedir}/run/libvirt/lxc none" \
> +	echo "d root root 0755 /run/libvirt/lxc none" \
>  	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
> -	echo "d root root 0755 ${localstatedir}/run/libvirt/network none" \
> +	echo "d root root 0755 /run/libvirt/network none" \
>  	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
> -	echo "d root root 0755 ${localstatedir}/run/libvirt/qemu none" \
> +	echo "d root root 0755 /run/libvirt/qemu none" \
>  	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
>  
>  	# Manually set permissions and ownership to match polkit recipe
> @@ -379,6 +379,7 @@ do_install_append() {
>  EXTRA_OECONF += " \
>      --with-init-script=systemd \
>      --with-test-suite \
> +    --with-runstatedir=/run \
>      "
>  
>  # gcc9 end up mis-compiling qemuxml2argvtest.o with Og which then
> -- 
> 2.18.2
> 

> 
> 
> 

