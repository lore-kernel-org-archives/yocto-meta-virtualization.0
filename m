Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80ECACA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 01:10:36 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.29161.1756948235421029396
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Sep 2025 18:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FN+J6SNP;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b338d7a540so7619271cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Sep 2025 18:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756948234; x=1757553034; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=puVr6i+Z3KmkWKW0JkKa1qD3OoFcMO+D1DVsoqIQ8vU=;
        b=FN+J6SNPmwgcE8qMdFb0xaFjA8XSWCyrJArIh1Z1uuj9LpMuoRA8smMFXV0tltsP3M
         kTfmlP87pXMYyYwoU8VJ6OUzSFjOLhtD17P3hLOZ/g4DABL+/M7nvTdwxNkhtfTWhMx2
         d/sOgXHTnnhg95qM+lBgDmUqbE6Sgqz8V4LFnMn6aARlFnVv6r1xkOsQBUALFAe980XQ
         AZcWyQNqiCYRtDk0B69Dft8bqpz5UE2nykXg7pQw8AkZl0j5zf+dkFJdWpXnrcr4/6dy
         eilAoIP9IhlvTSSNxZzXBol9KN0t7dCqHlgkHxggTzd/uui6alhrTf8jlqrrtyAxVg1G
         Sciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756948234; x=1757553034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puVr6i+Z3KmkWKW0JkKa1qD3OoFcMO+D1DVsoqIQ8vU=;
        b=Ff21SCnlH1LCaBdd6/24z78oOKRQRBYae5Rx9IE73tiZcNTIqgvLdgcxvUAvxBk/Rb
         yP9vQg9ZR7Br3KDYH6d+tZuIafELMOoTggaSvbInls8OeofiNd6jrWpTkNL3BUPLgJ7j
         uOsM1/US1FWjt8R9GtEpP0VLM6WfNKHBriHLSL+rAX9zsVa1ub+qtlPVnoCrl6Xn/38j
         OI2augslF54MM1wwxd0P/qPoCE4sK3VvWNMdYeoEK222Bo0Vlr5fKHtSLXQEUaDXaN0Z
         i9WM9IIiFdykp+jSys6GjfRyOdHnp6i4hkvhw00S4dSWY4I9V2LOcsO1jToSfu1Tai2B
         tTpg==
X-Gm-Message-State: AOJu0YxxUgkqAienLl9J7VRk0+oKEun7v/6AndX1tHBp6Nli15CoN5Mk
	KRWAcoz7vt6uBFl1PcSkfXKk+3cz7DOlkCyzJBbNaE8ibJkNLRyd9GAxJzuGhhWu
X-Gm-Gg: ASbGncviglBmO4HKu0OsYxp5/dzeKmSTYnw4y4Re2ajhS1O6xulLvgbF+anphnXBeYq
	t9rJPx+43P4D9m389LhD9VdDc3ccmvO5gLWlF4zKnLq8lHYFYK1hm+3skYaFvcQ+DTVuue8BiHP
	o2bEyr96e+TCw5YSKtKd85Wjhg4Cr7r6NX370gS9EAXc7b2tD1AG6SqfRzETb8Tvlv9IuWpxiS2
	kX32YVzepiokV3MdWFVLHb2/lqtUexmhBGuPxo7t1y26bD/sn5x7Es2bc404XIG91UX6X1pU0md
	tt2PJjA0epaMUhAP6K9tTHmM6y6Sd2SL6rWS4XUXaWZzgOZmoKQMdEJY6y59mw8ZsxQaigs1dPV
	JT94kt8Krhfbqa3ECgFCUO1jX5RienBEzEUwCo/awiuSGaZMf9KWvHYHXXgDWCZbUzH6+HqPm+j
	RBexmsdjkgVig7FxAHfrlnrA6xvzd3JdJO+A8nzeCbqYA=
X-Google-Smtp-Source: AGHT+IGHI5EItIjHatn3ZAlwIahQzmnqwqfEadVkhn8W/25aKzpGR/gX5mdHnltLU1xr21BqkmaadA==
X-Received: by 2002:ac8:5745:0:b0:4b2:9510:79be with SMTP id d75a77b69052e-4b31d875d46mr180413771cf.20.1756948234050;
        Wed, 03 Sep 2025 18:10:34 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f799b83sm20584811cf.45.2025.09.03.18.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:10:33 -0700 (PDT)
Date: Wed, 3 Sep 2025 21:10:31 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: hprajapati@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH] cloud-init: fix for
 CVE-2024-6174
Message-ID: <aLjnB8gNuELg4L/Y@gmail.com>
References: <20250820061348.40908-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820061348.40908-1-hprajapati@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Sep 2025 01:10:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9367

merged.

Bruce

In message: [meta-virtualization][scarthgap][PATCH] cloud-init: fix for CVE-2024-6174
on 20/08/2025 Hitendra Prajapati via lists.yoctoproject.org wrote:

> Upstream-Status: Backport from https://github.com/canonical/cloud-init/commit/f43937f0b462734eb9c76700491c18fe4133c8e1
> 
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../cloud-init/cloud-init/CVE-2024-6174.patch | 103 ++++++++++++++++++
>  recipes-extended/cloud-init/cloud-init_git.bb |   1 +
>  2 files changed, 104 insertions(+)
>  create mode 100644 recipes-extended/cloud-init/cloud-init/CVE-2024-6174.patch
> 
> diff --git a/recipes-extended/cloud-init/cloud-init/CVE-2024-6174.patch b/recipes-extended/cloud-init/cloud-init/CVE-2024-6174.patch
> new file mode 100644
> index 00000000..66347fee
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
> +index 1be00e464..23d06138b 100644
> +--- a/tests/unittests/test_ds_identify.py
> ++++ b/tests/unittests/test_ds_identify.py
> +@@ -63,9 +63,9 @@ BLKID_UEFI_UBUNTU = [
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
> +@@ -674,7 +674,7 @@ class TestDsIdentify(DsIdentifyBase):
> +         self._test_ds_found("OpenStack-AssetTag-Compute")
> + 
> +     def test_openstack_on_non_intel_is_maybe(self):
> +-        """On non-Intel, openstack without dmi info is maybe.
> ++        """On non-Intel, openstack without dmi info is none.
> + 
> +         nova does not identify itself on platforms other than intel.
> +            https://bugs.launchpad.net/cloud-init/+bugs?field.tag=dsid-nova"""
> +@@ -694,10 +694,9 @@ class TestDsIdentify(DsIdentifyBase):
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
> +index 741742c7f..e3459d601 100755
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
> +@@ -99,8 +99,8 @@ DI_MAIN=${DI_MAIN:-main}
> + 
> + DI_BLKID_EXPORT_OUT=""
> + DI_GEOM_LABEL_STATUS_OUT=""
> +-DI_DEFAULT_POLICY="search,found=all,maybe=all,notfound=${DI_DISABLED}"
> +-DI_DEFAULT_POLICY_NO_DMI="search,found=all,maybe=all,notfound=${DI_ENABLED}"
> ++DI_DEFAULT_POLICY="search,found=all,maybe=none,notfound=${DI_DISABLED}"
> ++DI_DEFAULT_POLICY_NO_DMI="search,found=all,maybe=none,notfound=${DI_ENABLED}"
> + DI_DMI_BOARD_NAME=""
> + DI_DMI_CHASSIS_ASSET_TAG=""
> + DI_DMI_PRODUCT_NAME=""
> +-- 
> +2.50.1
> +
> diff --git a/recipes-extended/cloud-init/cloud-init_git.bb b/recipes-extended/cloud-init/cloud-init_git.bb
> index 6cb3d3b5..4cf74efd 100644
> --- a/recipes-extended/cloud-init/cloud-init_git.bb
> +++ b/recipes-extended/cloud-init/cloud-init_git.bb
> @@ -11,6 +11,7 @@ SRCREV = "e982c20875db3750c8dfc1915e7a4cee37376924"
>  SRC_URI = "git://github.com/canonical/cloud-init;branch=24.1.x;protocol=https \
>      file://cloud-init-source-local-lsb-functions.patch \
>      file://0001-setup.py-check-for-install-anywhere-in-args.patch \
> +    file://CVE-2024-6174.patch \
>  "
>  
>  PV = "v23.4.1+git"
> -- 
> 2.50.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9351): https://lists.yoctoproject.org/g/meta-virtualization/message/9351
> Mute This Topic: https://lists.yoctoproject.org/mt/114795114/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


