Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8483AE009D4; Sat, 14 Sep 2019 20:52:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  1.7 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.42 listed in list.dnswl.org]
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 499DBE007C2
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 20:52:35 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id a1so13131888ioc.6
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 20:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/x1tEPZ4tO5BmYf4/wi5RqPqEq1stbRC/M4jqHTDADA=;
	b=PwOpG1dLN+LWQyTCm/MwbHGsfjFlqkfqXxs+J9BF1s1nsEvrqbmvQrKIF4HFlPr5/W
	utOM8wWYDbQ4adwt4DydfLNGl1NT56TANUpMVGXpIqqH7OgCazQm+SUW5XC+tCkYWcgw
	FJ/IcQXyiazgyE8JXdTndESkjOkZ/XtINtjxhWBVeOK4OnyTav/SNajYB1N3A9kWkMG4
	ZVcsX8ZX0QMk2Wd29JOHr3pux6Eaeg2zMEcYSvsSxgR3d76hpcsm8PRBc02EU5frQeXK
	TrXU1krfaLosMm2yyhGPSz9OnDVps0CY02TvicUJRc/HJf9X8S7ShoVl7h7CoFvWZJWT
	Mc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/x1tEPZ4tO5BmYf4/wi5RqPqEq1stbRC/M4jqHTDADA=;
	b=coeQccI8NalZ3R2+tweOdEW0pVIxjLbAUCrSDgRo96XFNiveN7gChsv+j3K3XpuT90
	neGalxXjsPcfgqkYqDTAqaEkXvzn/LFZJRgYVKQLG9yDolswBS3MHWYGsL9aSVoURxex
	wmYFPV/NoTWVaMdXDy/M0mJLie+RU8I72E5RKwqBW8QSPGdJdUxLq3uatxYG6x3RIZWb
	B4aD71euP6EzNZKDz7l48OYR91EgG+ETo/ghlXogM44fqtElqqNbgGAtCFSh8sW3M3mB
	Bzc/fQwgstt/o3pRZRNPCOp90N4avaW7QBVBx9NLycny1xFmJAnfJgBPK3YhQYRKkLX4
	j2Uw==
X-Gm-Message-State: APjAAAXp1sqlhThK4bFi6D7DhkgUuUvC1Ns5hh1E81mjucVtOa3jt4IB
	/tcVn8ge0jYdzZahYoqEyec=
X-Google-Smtp-Source: APXvYqzhQQnK/AO/oLSZzv0Fp140/SPxkfarP0deAPu7HOJJZCdmBcMIY5ma5dt5E1TRKNU/Uzfw4w==
X-Received: by 2002:a02:6616:: with SMTP id k22mr11296709jac.129.1568519554223;
	Sat, 14 Sep 2019 20:52:34 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	u24sm19378107iob.12.2019.09.14.20.52.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Sep 2019 20:52:33 -0700 (PDT)
Date: Sat, 14 Sep 2019 23:52:31 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Message-ID: <20190915035228.GA3928@gmail.com>
References: <20190911032611.77049-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190911032611.77049-1-hongzhi.song@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] ceph: fix ceph-crash failed with /var/lib/ceph/crash/posted not found
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
X-List-Received-Date: Sun, 15 Sep 2019 03:52:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] ceph: fix ceph-crash failed with /var/lib/ceph/crash/posted not found
on 10/09/2019 Hongzhi.Song wrote:

> root@intelx86-64: journalctl -xe
> ceph-crash[854]: ERROR:_main_:directory /var/lib/ceph/crash/posted does
> not exist; please create
> 
> Create the directory for both of systemd and sysvinit
> 
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  recipes-extended/ceph/ceph_14.2.3.bb | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/recipes-extended/ceph/ceph_14.2.3.bb b/recipes-extended/ceph/ceph_14.2.3.bb
> index 722efe3..25a8ea2 100644
> --- a/recipes-extended/ceph/ceph_14.2.3.bb
> +++ b/recipes-extended/ceph/ceph_14.2.3.bb
> @@ -81,12 +81,36 @@ do_install_append () {
>  	rm ${D}${systemd_unitdir}/system/ceph-fuse.target ${D}${systemd_unitdir}/system/ceph-fuse@.service
>  }
>  
> +do_install_append_class-target () {
> +	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +		install -d ${D}${sysconfdir}/tmpfiles.d
> +		echo "d /var/lib/ceph/crash/posted 0755 root root - -" > ${D}${sysconfdir}/tmpfiles.d/ceph-placeholder.conf
> +	fi
> +
> +	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> +		install -d ${D}${sysconfdir}/default/volatiles
> +		echo "d root root 0755 /var/lib/ceph/crash/posted none" > ${D}${sysconfdir}/default/volatiles/99_ceph-placeholder
> +	fi
> +}
> +
> +pkg_postinst_${PN}() {
> +	if [ -z "$D" ] && [ -e ${sysconfdir}/init.d/populate-volatile.sh ] ; then
> +		${sysconfdir}/init.d/populate-volatile.sh update
> +	fi
> +}
> +
>  FILES_${PN} += "\
>  		${libdir}/rados-classes/*.so.* \
>  		${libdir}/ceph/compressor/*.so \
>  		${libdir}/rados-classes/*.so \
>  		${libdir}/ceph/*.so \
>  "
> +
> +FILES_${PN} += " \
> +    /etc/tmpfiles.d/ceph-placeholder.conf \
> +    /etc/default/volatiles/99_ceph-placeholder \
> +"
> +
>  FILES_${PN}-python = "\
>                  ${PYTHON_SITEPACKAGES_DIR}/* \
>  "
> -- 
> 2.23.0
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

