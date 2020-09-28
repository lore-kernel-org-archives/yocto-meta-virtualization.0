Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.28015.1601261143631982091
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Sep 2020 19:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uvlT5cTe;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id y11so7082126qtn.9
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Sep 2020 19:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=011ZaMRkbcybB5NC0YkldSZO2lp0KsHBf13MYjRWJhM=;
        b=uvlT5cTenLupayMF2yZ5va4MdXBnLNLoWb5798dYjB54jd8OEPkSddrEBV7wJa2ulS
         QmIvEWjNWGsiifKpuMQux6HidU0ruvfB8850+oHhrJw1GWQnwtip41caLjB0vTe5Zgi3
         h16FCBCRe4qLRr6NfTcj6e1ZrKvpH4JjanbpZRFXOLuBHRfkMA7aTANxZcsBhiu9foCL
         g4lpWKvQmBJC1fdjhXquN6E8dvAe1ukBDKH2uRhqtntYRK1UfM0dExAulM33WXwK6Guq
         9bUGcgDT2yApKTn25ZSNg8zJ+kB7LCWxfs7qc2KV/5pA2XPGYuL5ThLJbtdKTZm+gJcy
         jvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=011ZaMRkbcybB5NC0YkldSZO2lp0KsHBf13MYjRWJhM=;
        b=tF/oqkx6wxZW/E79h2C4qvMJ3MxJqXBpcxTY+7KZaCrbHKjxuO4BKvE0jZvLq63Lay
         fPnKzK+xZM5V46uPpuriAdJxNges9FRbV4MNIcs0lW0Oyjsdpx4DqzBj/mACzdCsj3Ok
         PLY+NQpdnEdSiaUY7+CDa7a5uq0geRfiHCNlQs2EDUG7PMZch+Pjeigmflcb8F62NDgU
         xCkERF6boMYj7f3o4Y3NcGwVffUiP7pl2KUdjwoTuGUU2Yef1E4v+IEsIBdgL3MQ0emP
         nphVD6SiiUXd90bFxyX+uWxuttc1hYj92+HSM5ZydBA1zTs9VZuzYqav7AHtkNJSrt1G
         dUMg==
X-Gm-Message-State: AOAM533b++CyRVRK6/2kA7rel2KRxFNKueyblm8oeXq9PmMfgxeDSXYC
	+N9mP5n7TfDHGDr10Hm4kMjn2J4SdVSSZJ5z
X-Google-Smtp-Source: ABdhPJwxHEHh7vq7Ny8m28H81rvJIisCl+CJqhsmmIin7943gZacczAe26DpVz8BNtW1Ko6rretKxA==
X-Received: by 2002:ac8:5d41:: with SMTP id g1mr10826216qtx.101.1601261142732;
        Sun, 27 Sep 2020 19:45:42 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id a24sm7719504qko.82.2020.09.27.19.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 19:45:42 -0700 (PDT)
Date: Sun, 27 Sep 2020 22:45:40 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: David Burns <dburns@digi.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] salt: Move to version 3001.1 and fix RDEPENDS
Message-ID: <20200928024539.GB60026@gmail.com>
References: <20200923003624.188111-1-dburns@digi.com>
MIME-Version: 1.0
In-Reply-To: <20200923003624.188111-1-dburns@digi.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][m-c-s][PATCH] salt: Move to version 3001.1 and fix RDEPENDS
on 23/09/2020 David Burns wrote:

> Move to a new minor version of salt, 3001.1 that includes a number of
> bug fixes.
> 
> Salt also needs the python3-distro runtime dependency for all of the
> packages in the recipe, not just the salt-master package so it has been
> included in the common package.
> 
> A runtime dependency on python-pycryptodomex has been added to the
> salt-master and salt-minion packages as both have required it since the
> 3001 salt version.

Thanks for the update, this is now merged.

Bruce

> 
> Signed-off-by: David Burns <dburns@digi.com>
> ---
>  .../salt/{salt_3001.bb => salt_3001.1.bb}              | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename meta-openstack/recipes-support/salt/{salt_3001.bb => salt_3001.1.bb} (96%)
> 
> diff --git a/meta-openstack/recipes-support/salt/salt_3001.bb b/meta-openstack/recipes-support/salt/salt_3001.1.bb
> similarity index 96%
> rename from meta-openstack/recipes-support/salt/salt_3001.bb
> rename to meta-openstack/recipes-support/salt/salt_3001.1.bb
> index 04ef1c7c..9b485d69 100644
> --- a/meta-openstack/recipes-support/salt/salt_3001.bb
> +++ b/meta-openstack/recipes-support/salt/salt_3001.1.bb
> @@ -21,8 +21,8 @@ PACKAGECONFIG[tcp] = ",,python3-pycrypto"
>  SRC_URI = "https://files.pythonhosted.org/packages/source/s/${PN}/${PN}-${PV}.tar.gz \
>  "
>  
> -SRC_URI[md5sum] = "ae06cef7557e237a954491a069e79a25"
> -SRC_URI[sha256sum] = "5ca60d1b2cc8e63db50995bd8b117914eeaf57c48ce2b3a3731ee57163adf154"
> +SRC_URI[md5sum] = "4174a6dd2c7eee808086ca06bdd928c9"
> +SRC_URI[sha256sum] = "e9ebb4d92fae8dabf21b8749dc126e4a4048bf8f613f5b1b851fe4b8226b5abc"
>  
>  
>  SYSTEMD_AUTO_ENABLE_${PN}-master = "disable"
> @@ -87,7 +87,7 @@ Between the remote execution system, and state management Salt addresses the bac
>  
>  SUMMARY_${PN}-minion = "client package for salt, the distributed remote execution system"
>  DESCRIPTION_${PN}-minion = "${DESCRIPTION_COMMON} This particular package provides the worker agent for salt."
> -RDEPENDS_${PN}-minion = "${PN}-common (= ${EXTENDPKGV}) python3-msgpack"
> +RDEPENDS_${PN}-minion = "${PN}-common (= ${EXTENDPKGV}) python3-msgpack python3-pycryptodomex (>= 3.9.7)"
>  RDEPENDS_${PN}-minion += "${@bb.utils.contains('PACKAGECONFIG', 'zeromq', 'python3-pycrypto python3-pyzmq (>= 13.1.0)', '',d)}"
>  RDEPENDS_${PN}-minion += "${@bb.utils.contains('PACKAGECONFIG', 'tcp', 'python3-pycrypto', '',d)}"
>  RRECOMMENDS_${PN}-minion_append_x64 = "dmidecode"
> @@ -98,7 +98,7 @@ FILES_${PN}-minion = "${bindir}/${PN}-minion ${sysconfdir}/${PN}/minion.d/ ${CON
>  SUMMARY_${PN}-common = "shared libraries that salt requires for all packages"
>  DESCRIPTION_${PN}-common ="${DESCRIPTION_COMMON} This particular package provides shared libraries that \
>  salt-master, salt-minion, and salt-syndic require to function."
> -RDEPENDS_${PN}-common = "python3-dateutil python3-jinja2 python3-pyyaml python3-requests (>= 1.0.0)"
> +RDEPENDS_${PN}-common = "python3-dateutil python3-jinja2 python3-pyyaml python3-requests (>= 1.0.0) python3-distro"
>  RRECOMMENDS_${PN}-common = "lsb-release"
>  RSUGGESTS_${PN}-common = "python3-mako python3-git"
>  RCONFLICTS_${PN}-common = "python3-mako (< 0.7.0)"
> @@ -127,7 +127,7 @@ FILES_${PN}-api = "${bindir}/${PN}-api ${CONFFILES_${PN}-api} ${systemd_system_u
>  
>  SUMMARY_${PN}-master = "remote manager to administer servers via salt"
>  DESCRIPTION_${PN}-master ="${DESCRIPTION_COMMON} This particular package provides the salt controller."
> -RDEPENDS_${PN}-master = "${PN}-common (= ${EXTENDPKGV}) python3-msgpack python3-distro"
> +RDEPENDS_${PN}-master = "${PN}-common (= ${EXTENDPKGV}) python3-msgpack python3-pycryptodomex (>= 3.9.7)"
>  RDEPENDS_${PN}-master += "${@bb.utils.contains('PACKAGECONFIG', 'zeromq', 'python3-pycrypto python3-pyzmq (>= 13.1.0)', '',d)}"
>  RDEPENDS_${PN}-master += "${@bb.utils.contains('PACKAGECONFIG', 'tcp', 'python3-pycrypto', '',d)}"
>  CONFFILES_${PN}-master="${sysconfdir}/init.d/${PN}-master  ${sysconfdir}/${PN}/master"
> -- 
> 2.28.0
> 

> 
> 
> 

