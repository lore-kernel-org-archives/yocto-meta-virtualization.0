Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB84C00140
	for <webhook@archiver.kernel.org>; Sun, 21 Aug 2022 03:24:25 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.3543.1661052255792209746
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 20 Aug 2022 20:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CjAHPd/a;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id h4so5835844qtj.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 20 Aug 2022 20:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=9oXsHEIJruNcW6kg1O4nyyGiDYr3KAgeugmOg76abE4=;
        b=CjAHPd/aKiS0RIelwfQTBrm+xUuAyOxBpsN4c/oR+p4m4jBrjHi3BhGhyrG7VMq8lu
         okfj0zMDKMBDbK5eDQYs0bLxxTJ1w0bTun/67hkT9aqHwfVq2ON2tIWcTV70bU4vNYeo
         l6WvGTeahTYy809cKSkNgvbc4aEmDdDWIp2hzyQXPsDqiAwLzIORI9PKEkvP72Dlt4nz
         ho0qJyhAha/KeK1VqgIjhhdQFp4/gA3f8Ji/f9yu1eL50W9PGeYSkSJZKYliUVfgIK13
         majltyOsnvzI5VNjgde1SaoXQ6C9ESDftYdx3O43qisH06GP2qlv0b5YxEvLrbIESGsb
         NbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=9oXsHEIJruNcW6kg1O4nyyGiDYr3KAgeugmOg76abE4=;
        b=NGOXxiLvfamNBKLZSbeHahmiJZxbyqJXjoA4fvvfrGOwGATPX1T2Q4T9F8Tg6h11Ho
         WDJq5zwufU7OU4Y2IxrAmCnIAVFvH/Le/gBK5usO2UIh3ErV2NCtHSz39hKFiX5BLv8D
         /k+3Dy64iQygF2UjAd2EyQ0UVCpLvBp3wz4w/RqmRbwpAptPTaOWFWAScvLYY1VEN7DM
         Pgmj9g4Imkdbx3cKldQ18jk7bc4pLLm3dzjgYqH/iqPUR3KRsM9QUB/Q7reiCREpMqAw
         50GtnKwPn7vqk2ZG4M5SM0/WXrLInxK+XitzawfuvBn5FvE0IJ9agTC+DQH5pdbteq46
         3y/Q==
X-Gm-Message-State: ACgBeo1zeaNpfqJ4wsJfNpC56L1+0Fbd7dT9r/M/bBy/jh1q7FuErD+I
	yQroKijhbVIyD7yVVyN63jxdS+oS/w0=
X-Google-Smtp-Source: 
 AA6agR6gw6GRZiNuVJKVS2I58Rk1zhBmHzh9np2ZsWuNWCIPcXNXDbCgLhkrL+uO3A9jmLc7IguN4A==
X-Received: by 2002:ac8:5888:0:b0:343:6cf2:e185 with SMTP id
 t8-20020ac85888000000b003436cf2e185mr11003262qta.285.1661052254780;
        Sat, 20 Aug 2022 20:24:14 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q66-20020ae9dc45000000b006bba6c614casm7276831qkf.13.2022.08.20.20.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 20:24:13 -0700 (PDT)
Date: Sat, 20 Aug 2022 23:24:12 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org, randy.macleod@windriver.com
Subject: Re: [meta-virtualization] [meta-virt][PATCH 1/1] ceph: Fix
 CVE-2021-3979
Message-ID: <20220821032411.GD57389@gmail.com>
References: <20220810201844.30041-1-joe.slater@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810201844.30041-1-joe.slater@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 21 Aug 2022 03:24:25 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7551

Even though Sakib is working on an uprev for master, I've gone
ahead and merged this .. we might as well have the CVE fixed while
we wait.

Bruce

In message: [meta-virtualization] [meta-virt][PATCH 1/1] ceph: Fix CVE-2021-3979
on 10/08/2022 Joe Slater wrote:

> Ceph-volume does not properly control key sizes.
> 
> Cherry-pick from github.com/ceph/ceph.git.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../ceph/ceph/CVE-2021-3979.patch             | 158 ++++++++++++++++++
>  recipes-extended/ceph/ceph_15.2.15.bb         |   1 +
>  2 files changed, 159 insertions(+)
>  create mode 100644 recipes-extended/ceph/ceph/CVE-2021-3979.patch
> 
> diff --git a/recipes-extended/ceph/ceph/CVE-2021-3979.patch b/recipes-extended/ceph/ceph/CVE-2021-3979.patch
> new file mode 100644
> index 00000000..081b32ba
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/CVE-2021-3979.patch
> @@ -0,0 +1,158 @@
> +From 47c33179f9a15ae95cc1579a421be89378602656 Mon Sep 17 00:00:00 2001
> +From: Guillaume Abrioux <gabrioux@redhat.com>
> +Date: Tue, 25 Jan 2022 10:25:53 +0100
> +Subject: [PATCH] ceph-volume: honour osd_dmcrypt_key_size option
> +
> +ceph-volume doesn't honour osd_dmcrypt_key_size.
> +It means the default size is always applied.
> +
> +It also changes the default value in `get_key_size_from_conf()`
> +
> +From cryptsetup manpage:
> +
> +> For XTS mode you can optionally set a key size of 512 bits with the -s option.
> +
> +Using more than 512bits will end up with the following error message:
> +
> +```
> +Key size in XTS mode must be 256 or 512 bits.
> +```
> +
> +Fixes: https://tracker.ceph.com/issues/54006
> +
> +Signed-off-by: Guillaume Abrioux <gabrioux@redhat.com>
> +
> +Upstream-Status: Backport
> + github.com/ceph/ceph.git
> + equivalent to cherry-pick of commit 47c33179f9a15ae95cc1579a421be89378602656
> +
> +CVE: CVE-2021-3979
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +---
> + .../ceph_volume/tests/util/test_encryption.py | 41 +++++++++++++------
> + .../ceph_volume/util/encryption.py            | 34 ++++++++++-----
> + 2 files changed, 51 insertions(+), 24 deletions(-)
> +
> +diff --git a/src/ceph-volume/ceph_volume/tests/util/test_encryption.py b/src/ceph-volume/ceph_volume/tests/util/test_encryption.py
> +index e1420b440d3..c86dc50b7c7 100644
> +--- a/src/ceph-volume/ceph_volume/tests/util/test_encryption.py
> ++++ b/src/ceph-volume/ceph_volume/tests/util/test_encryption.py
> +@@ -1,5 +1,31 @@
> + from ceph_volume.util import encryption
> ++import base64
> + 
> ++class TestGetKeySize(object):
> ++    def test_get_size_from_conf_default(self, conf_ceph_stub):
> ++        conf_ceph_stub('''
> ++        [global]
> ++        fsid=asdf
> ++        ''')
> ++        assert encryption.get_key_size_from_conf() == '512'
> ++
> ++    def test_get_size_from_conf_custom(self, conf_ceph_stub):
> ++        conf_ceph_stub('''
> ++        [global]
> ++        fsid=asdf
> ++        [osd]
> ++        osd_dmcrypt_key_size=256
> ++        ''')
> ++        assert encryption.get_key_size_from_conf() == '256'
> ++
> ++    def test_get_size_from_conf_custom_invalid(self, conf_ceph_stub):
> ++        conf_ceph_stub('''
> ++        [global]
> ++        fsid=asdf
> ++        [osd]
> ++        osd_dmcrypt_key_size=1024
> ++        ''')
> ++        assert encryption.get_key_size_from_conf() == '512'
> + 
> + class TestStatus(object):
> + 
> +@@ -37,17 +63,6 @@ class TestDmcryptClose(object):
> + 
> + class TestDmcryptKey(object):
> + 
> +-    def test_dmcrypt_with_default_size(self, conf_ceph_stub):
> +-        conf_ceph_stub('[global]\nfsid=asdf-lkjh')
> +-        result = encryption.create_dmcrypt_key()
> +-        assert len(result) == 172
> +-
> +-    def test_dmcrypt_with_custom_size(self, conf_ceph_stub):
> +-        conf_ceph_stub('''
> +-        [global]
> +-        fsid=asdf
> +-        [osd]
> +-        osd_dmcrypt_size=8
> +-        ''')
> ++    def test_dmcrypt(self):
> +         result = encryption.create_dmcrypt_key()
> +-        assert len(result) == 172
> ++        assert len(base64.b64decode(result)) == 128
> +diff --git a/src/ceph-volume/ceph_volume/util/encryption.py b/src/ceph-volume/ceph_volume/util/encryption.py
> +index 72a0ccf121e..2a2c03337b6 100644
> +--- a/src/ceph-volume/ceph_volume/util/encryption.py
> ++++ b/src/ceph-volume/ceph_volume/util/encryption.py
> +@@ -9,21 +9,29 @@ from .disk import lsblk, device_family, get_part_entry_type
> + 
> + logger = logging.getLogger(__name__)
> + 
> +-
> +-def create_dmcrypt_key():
> ++def get_key_size_from_conf():
> +     """
> +-    Create the secret dm-crypt key used to decrypt a device.
> ++    Return the osd dmcrypt key size from config file.
> ++    Default is 512.
> +     """
> +-    # get the customizable dmcrypt key size (in bits) from ceph.conf fallback
> +-    # to the default of 1024
> +-    dmcrypt_key_size = conf.ceph.get_safe(
> ++    default_key_size = '512'
> ++    key_size = conf.ceph.get_safe(
> +         'osd',
> +         'osd_dmcrypt_key_size',
> +-        default=1024,
> +-    )
> +-    # The size of the key is defined in bits, so we must transform that
> +-    # value to bytes (dividing by 8) because we read in bytes, not bits
> +-    random_string = os.urandom(int(dmcrypt_key_size / 8))
> ++        default='512')
> ++
> ++    if key_size not in ['256', '512']:
> ++        logger.warning(("Invalid value set for osd_dmcrypt_key_size ({}). "
> ++                        "Falling back to {}bits".format(key_size, default_key_size)))
> ++        return default_key_size
> ++
> ++    return key_size
> ++
> ++def create_dmcrypt_key():
> ++    """
> ++    Create the secret dm-crypt key (KEK) used to encrypt/decrypt the Volume Key.
> ++    """
> ++    random_string = os.urandom(128)
> +     key = base64.b64encode(random_string).decode('utf-8')
> +     return key
> + 
> +@@ -38,6 +46,8 @@ def luks_format(key, device):
> +     command = [
> +         'cryptsetup',
> +         '--batch-mode', # do not prompt
> ++        '--key-size',
> ++        get_key_size_from_conf(),
> +         '--key-file', # misnomer, should be key
> +         '-',          # because we indicate stdin for the key here
> +         'luksFormat',
> +@@ -83,6 +93,8 @@ def luks_open(key, device, mapping):
> +     """
> +     command = [
> +         'cryptsetup',
> ++        '--key-size',
> ++        get_key_size_from_conf(),
> +         '--key-file',
> +         '-',
> +         '--allow-discards',  # allow discards (aka TRIM) requests for device
> +-- 
> +2.35.1
> +
> diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_15.2.15.bb
> index 0fb32b26..f2ece8c7 100644
> --- a/recipes-extended/ceph/ceph_15.2.15.bb
> +++ b/recipes-extended/ceph/ceph_15.2.15.bb
> @@ -16,6 +16,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \
>             file://0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch \
>             file://0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch \
> +           file://CVE-2021-3979.patch \
>  "
>  
>  SRC_URI[sha256sum] = "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
> -- 
> 2.35.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7519): https://lists.yoctoproject.org/g/meta-virtualization/message/7519
> Mute This Topic: https://lists.yoctoproject.org/mt/92945022/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


