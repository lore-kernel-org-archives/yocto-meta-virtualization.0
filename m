Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C72CCA1010
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 01:11:16 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.29171.1756948263569249227
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Sep 2025 18:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OF8Mgtag;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7f8ea864d81so68315085a.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Sep 2025 18:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756948262; x=1757553062; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw/1nxI+JW3frmjKM3FSdOjpskOW6yGFsLm+gStYH/s=;
        b=OF8Mgtag2LM6O2BYonTesZtADdTcVKyTIPvDHTrX51F/L9z7mG90CI8ApEJdy/gYKH
         5JHElgeW8cPZcGnpfcMRNgCYm/Hpo6XPElq8IgTs6uQ4h9QBRTVbCGART8HlKYK99QCB
         a0ksdcC6NLcj9nGLzhsIM+dxt4tRXUHCKAkX0KFaVopv5Huqiq+BM01Hr/PH6srmflBq
         yPJYF0pK7YttU39Vrp/LmpbFM5teCM4aepozQDKOWcGbS9mS54VzmgZQaDKr11c5fOJs
         q1Y1ben/Ou7BVh+DYQRi1Etugy5cy1knXuaNqPE3IjnXAwMYE7JXrKG3hlPglw7y7ZrK
         INBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756948262; x=1757553062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jw/1nxI+JW3frmjKM3FSdOjpskOW6yGFsLm+gStYH/s=;
        b=I8IHaQ2WIXXDtl6njJlCcFMPceSEQdmmOQ0Hb8bVN2PcCzckmDIKapdITz8Tfln+rH
         n/bF/USZ4285spZuH+CGXWKZGsiKmTofWM15ic3UwaTO/KRNfMZounoaxD4uFsXxjdAY
         iT1kiMOZfmyOSMH3E1J6pbPZ+hDKA+D6gZTdBOrYt77oxCYxqztu+e6GsCHinCMDOjbp
         KosVhpD5b7jXzPkhy50QOxgbwUks9QxPSUHLCM99BkqSQZyeUusSbPvvEZIUjvk0xaA1
         f50O/ZvfXxyKHN6ygRjilQA4cAD164AME6Eh6oxqpPM92wuKxrFvAGs1zq++nqleu4eT
         A4eg==
X-Gm-Message-State: AOJu0Yw5ZY2bO23yQjxGrrslkNPhn8pf4SFqrPvEhvJ/c3rXvuP8OXZ7
	uYrTFpW9Ydhw7xGuvjlFnrdnDLdv1amGBHOa9mRoqkoNKmE7ot6bycS9
X-Gm-Gg: ASbGncvXRY58Yj7544aeWySKdG8g5/mWSa/FjeHbwSuQvX20PEzK2MBPsm/sAGaMPMj
	FuxdZGJ9/g6GZUYYUuHbr0lTITjYJ9dOyfRGTT1it43tfai10MK1N+XM9BvESCqbbc3yPWqfrWx
	nc16DOkCpY91+ZL3YW2tqCGFK29vVd/dIf34XBH/+J/+yunVJi1Nvb/W5oCjRb2wIFVtIBnG/MC
	S/AnpuJStJDGzitfR3Xj83zX6BgRhQHfJBDePHCHj/nEBfbIyy2N3rfkb4JmGWpm9ku9FyJAkHV
	w3IjX1Lqm6LoSpiiCR2GIdt2vQPJP7XDpBtxpjfx3g+VU0eRXrMRG03xt6cD5ByneBdzb5iWrDQ
	bNjV95sCShPhYg0PJNpFiks8R8Wbm/LwTdHpQXuViP/g2QxvyEPB/Citi8+Dq4FRacmad4esmkT
	1B0rCKTTJFNDJfGn8u1YoPcAsQjfIUwNoHdLI2lFFn8sPvLWOAhXyqPQ==
X-Google-Smtp-Source: AGHT+IEfB0ib6vyKlrK1gWPjUEAUAIei1gZCLcA6u7We0tryS2rv0/VWzsqMypz/sztL38Lgx29bBQ==
X-Received: by 2002:a05:620a:468d:b0:7f6:b593:d20d with SMTP id af79cd13be357-7ff2b2c74ffmr1984989585a.52.1756948262373;
        Wed, 03 Sep 2025 18:11:02 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f660361sm20395561cf.17.2025.09.03.18.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:11:01 -0700 (PDT)
Date: Wed, 3 Sep 2025 21:11:00 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hprajapati@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH] cloud-init: fix for
 CVE-2024-6174
Message-ID: <aLjnJLySfkEp8NSf@gmail.com>
References: <20250820082109.100727-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820082109.100727-1-hprajapati@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Sep 2025 01:11:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9368

merged.

Bruce

In message: [meta-virtualization][kirkstone][PATCH] cloud-init: fix for CVE-2024-6174
on 20/08/2025 Hitendra Prajapati via lists.yoctoproject.org wrote:

> Upstream-Status: Backport from https://github.com/canonical/cloud-init/commit/f43937f0b462734eb9c76700491c18fe4133c8e1
> 
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../cloud-init/cloud-init/CVE-2024-6174.patch | 103 ++++++++++++++++++
>  .../cloud-init/cloud-init_21.4.bb             |   1 +
>  2 files changed, 104 insertions(+)
>  create mode 100644 recipes-extended/cloud-init/cloud-init/CVE-2024-6174.patch
> 
> diff --git a/recipes-extended/cloud-init/cloud-init/CVE-2024-6174.patch b/recipes-extended/cloud-init/cloud-init/CVE-2024-6174.patch
> new file mode 100644
> index 00000000..797155ce
> --- /dev/null
> +++ b/recipes-extended/cloud-init/cloud-init/CVE-2024-6174.patch
> @@ -0,0 +1,103 @@
> +From f43937f0b462734eb9c76700491c18fe4133c8e1 Mon Sep 17 00:00:00 2001
> +From: Brett Holman <brett.holman@canonical.com>
> +Date: Thu, 22 Aug 2024 16:54:53 -0600
> +Subject: [PATCH] fix: Don't attempt to identify non-x86 OpenStack instances
> +
> +This causes cloud-init to attempt to reach out to the OpenStack Nova
> +datasource in non-Nova deployments on non-x86 architectures.
> +
> +Change default policy of ds-identify to disallow discovery of datasources
> +without strict identifiable artifacts in either kernel cmdline, DMI
> +platform information or system configuration files. This prevents
> +cloud-init from attempting to reach out to well-known hard-codded link-local
> +IP addresses for configuration information unless the platform strictly
> +identifies as a specific datasource.
> +
> +CVE-2024-6174
> +LP: #2069607
> +BREAKING_CHANGE: This may break non-x86 OpenStack Nova users. Affected users
> +    may wish to use ConfigDrive as a workaround.
> +
> +CVE: CVE-2024-6174
> +Upstream-Status: Backport [https://github.com/canonical/cloud-init/commit/f43937f0b462734eb9c76700491c18fe4133c8e1]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + tests/unittests/test_ds_identify.py | 13 ++++++-------
> + tools/ds-identify                   |  8 ++++----
> + 2 files changed, 10 insertions(+), 11 deletions(-)
> +
> +diff --git a/tests/unittests/test_ds_identify.py b/tests/unittests/test_ds_identify.py
> +index f2d2b4949..aaa6999e1 100644
> +--- a/tests/unittests/test_ds_identify.py
> ++++ b/tests/unittests/test_ds_identify.py
> +@@ -57,9 +57,9 @@ BLKID_UEFI_UBUNTU = [
> + 
> + 
> + POLICY_FOUND_ONLY = "search,found=all,maybe=none,notfound=disabled"
> +-POLICY_FOUND_OR_MAYBE = "search,found=all,maybe=all,notfound=disabled"
> +-DI_DEFAULT_POLICY = "search,found=all,maybe=all,notfound=disabled"
> +-DI_DEFAULT_POLICY_NO_DMI = "search,found=all,maybe=all,notfound=enabled"
> ++POLICY_FOUND_OR_MAYBE = "search,found=all,maybe=none,notfound=disabled"
> ++DI_DEFAULT_POLICY = "search,found=all,maybe=none,notfound=disabled"
> ++DI_DEFAULT_POLICY_NO_DMI = "search,found=all,maybe=none,notfound=enabled"
> + DI_EC2_STRICT_ID_DEFAULT = "true"
> + OVF_MATCH_STRING = "http://schemas.dmtf.org/ovf/environment/1"
> + 
> +@@ -533,7 +533,7 @@ class TestDsIdentify(DsIdentifyBase):
> +         self._test_ds_found("OpenStack-AssetTag-Compute")
> + 
> +     def test_openstack_on_non_intel_is_maybe(self):
> +-        """On non-Intel, openstack without dmi info is maybe.
> ++        """On non-Intel, openstack without dmi info is none.
> + 
> +         nova does not identify itself on platforms other than intel.
> +            https://bugs.launchpad.net/cloud-init/+bugs?field.tag=dsid-nova"""
> +@@ -553,10 +553,9 @@ class TestDsIdentify(DsIdentifyBase):
> + 
> +         # updating the uname to ppc64 though should get a maybe.
> +         data.update({"mocks": [MOCK_VIRT_IS_KVM, MOCK_UNAME_IS_PPC64]})
> +-        (_, _, err, _, _) = self._check_via_dict(
> +-            data, RC_FOUND, dslist=["OpenStack", "None"]
> +-        )
> ++        (_, _, err, _, _) = self._check_via_dict(data, RC_NOT_FOUND)
> +         self.assertIn("check for 'OpenStack' returned maybe", err)
> ++        self.assertIn("No ds found", err)
> + 
> +     def test_default_ovf_is_found(self):
> +         """OVF is identified found when ovf/ovf-env.xml seed file exists."""
> +diff --git a/tools/ds-identify b/tools/ds-identify
> +index 30d4b0f65..4dd0b5fcf 100755
> +--- a/tools/ds-identify
> ++++ b/tools/ds-identify
> +@@ -14,7 +14,7 @@
> + #   The format is:
> + #        <mode>,found=value,maybe=value,notfound=value
> + #   default setting is:
> +-#     search,found=all,maybe=all,notfound=disabled
> ++#     search,found=all,maybe=none,notfound=disabled
> + #
> + #   kernel command line option: ci.di.policy=<policy>
> + #   example line in /etc/cloud/ds-identify.cfg:
> +@@ -40,7 +40,7 @@
> + #         first: use the first found do no further checking
> + #         all: enable all DS_FOUND
> + #
> +-#      maybe: (default=all)
> ++#      maybe: (default=none)
> + #       if nothing returned 'found', then how to handle maybe.
> + #       no network sources are allowed to return 'maybe'.
> + #         all: enable all DS_MAYBE
> +@@ -94,8 +94,8 @@ DI_MAIN=${DI_MAIN:-main}
> + 
> + DI_BLKID_EXPORT_OUT=""
> + DI_GEOM_LABEL_STATUS_OUT=""
> +-DI_DEFAULT_POLICY="search,found=all,maybe=all,notfound=${DI_DISABLED}"
> +-DI_DEFAULT_POLICY_NO_DMI="search,found=all,maybe=all,notfound=${DI_ENABLED}"
> ++DI_DEFAULT_POLICY="search,found=all,maybe=none,notfound=${DI_DISABLED}"
> ++DI_DEFAULT_POLICY_NO_DMI="search,found=all,maybe=none,notfound=${DI_ENABLED}"
> + DI_DMI_CHASSIS_ASSET_TAG=""
> + DI_DMI_PRODUCT_NAME=""
> + DI_DMI_SYS_VENDOR=""
> +-- 
> +2.50.1
> +
> diff --git a/recipes-extended/cloud-init/cloud-init_21.4.bb b/recipes-extended/cloud-init/cloud-init_21.4.bb
> index 5cb62272..02a89a58 100644
> --- a/recipes-extended/cloud-init/cloud-init_21.4.bb
> +++ b/recipes-extended/cloud-init/cloud-init_21.4.bb
> @@ -9,6 +9,7 @@ SRC_URI = "git://github.com/canonical/cloud-init;branch=main;protocol=https \
>      file://cloud-init-source-local-lsb-functions.patch \
>      file://0001-setup.py-check-for-install-anywhere-in-args.patch \
>      file://0001-setup.py-respect-udevdir-variable.patch \
> +    file://CVE-2024-6174.patch \
>  "
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.50.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9352): https://lists.yoctoproject.org/g/meta-virtualization/message/9352
> Mute This Topic: https://lists.yoctoproject.org/mt/114795944/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


