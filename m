Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4CA9C00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 18:34:45 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web09.1989.1660156483491646801
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Aug 2022 11:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dFRsbrC9;
 spf=pass (domain: gmail.com, ip: 209.85.160.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-10ea9ef5838so18797556fac.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Aug 2022 11:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=KlR4qU9hBCuQ74KphzVRoGfO3oGJiqCpm/51BEXB5eY=;
        b=dFRsbrC9/nrFNGICF8pL+k4gjTytJ7bYRzci6ZDhUG3jLfkPp0Jr3FsJe/79SsP7nF
         adBbgjVd9xhjqTbLUUgiVCIW/h0O2D6h3QmbqFSMRnI4+Y7WKEQnlApdjcZvHFcKa2Mx
         zS/izEOucaVOvYnn6Bz5QgBgDOtM2JOnbsBnGON19BG3smFSuHea9Pv6R6VsRoKC/e9g
         0soDzPFJNwG+/eDXDq3soATJ3M/ZYmG+spw2wu00RNNZY0M8TAZcs+5NH/vSbFqNFMGz
         /o6q9X7QWFTUXVjC8YmxRTh9IgLy6i4i2KW92jipflokCWqz2kdsLLQFcID3Lxi1BUbB
         cOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=KlR4qU9hBCuQ74KphzVRoGfO3oGJiqCpm/51BEXB5eY=;
        b=rnicdHOwfpAcQSOxdUDDQq4OtwgF4ylPxNxAkh6o8+/IAx2cxOTqB+zpL00sUQc/Dg
         +hxIBOMP5MDyMetsRLJiUep0yNnfwbEv93LuHX7szk2y7Mhp+iKuZcRN/Ce4TCKbgjub
         +w77ckYG0qM2TAnXxM/Fq9cVRVzzI8ksNXsIDoERgq1tij61ykcfT/CPfR2ZL1OfNUtD
         6rpCPEK8fd13DaEdAft5uuO0ByCXcExwNxE6U1/gy5kvOITXBmMnLnZVBdr9HsJRNAOy
         5uCGzQ31f5wFwfoogIAiOLbjLDt5tS0r+yr3xGKRn3MS7yYsOrqhLYz/FM6rAp/8Zswh
         Pdcw==
X-Gm-Message-State: ACgBeo1FTr8tnfyP/q/2YpI4jwnoKDjEIMhn/VEMC0VYm39p8wPdjr+w
	o4m/7MXC+jvPurHtX5V3XbG2sCG0VUa83WVLsMY=
X-Google-Smtp-Source: 
 AA6agR4QpSFlCkxkCvqPNwIpdi2Hrm79RkDuGFFBSJRxpjI4jpbVIbKFDP8FLegODBaQ6ch5nBaoRH0lB1LwXns3hlY=
X-Received: by 2002:a05:6870:d29d:b0:10e:747b:f87b with SMTP id
 d29-20020a056870d29d00b0010e747bf87bmr2038812oae.6.1660156482621; Wed, 10 Aug
 2022 11:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220810173927.36905-1-joe.slater@windriver.com>
 <CADkTA4OXy5e59OChKrwZLF8u-Nv0YCKLPWUxq18qOFTf7i=hyA@mail.gmail.com>
 <BY5PR11MB3992A9E105CC35A418B7D03E88659@BY5PR11MB3992.namprd11.prod.outlook.com>
In-Reply-To: 
 <BY5PR11MB3992A9E105CC35A418B7D03E88659@BY5PR11MB3992.namprd11.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 10 Aug 2022 14:34:30 -0400
Message-ID: 
 <CADkTA4O=OhAdKkoO0Mg+U00yxKGBQLbJN30G-tR5REtLVDPcWA@mail.gmail.com>
Subject: Re: [meta-virtualization] [meta-virt][kirkstone][PATCH 1/1] ceph: Fix
 CVE-1021-3979
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Aug 2022 18:34:45 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7517

On Wed, Aug 10, 2022 at 2:26 PM Slater, Joseph <joe.slater@windriver.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Sent: Wednesday, August 10, 2022 11:03 AM
> > To: Slater, Joseph <joe.slater@windriver.com>
> > Cc: meta-virtualization@lists.yoctoproject.org; MacLeod, Randy
> > <Randy.MacLeod@windriver.com>
> > Subject: Re: [meta-virtualization] [meta-virt][kirkstone][PATCH 1/1] ceph: Fix
> > CVE-1021-3979
> >
> > What about master ? Does it have the same issue ?
>
> Yes, and I have the patch for that.  You cannot cherry-pick between the branches because
> recipe context is different.  The source patch is the same.  I used kirkstone first for internal reasons.
>

In order to merge this to kirkstone, it needs to be on master first.

So there should be two sends of the patch, one for master and then
another for kirkstone (if it can't be cherry picked).

If you sent the one to master and I missed it, my apologies ... gmail
threads strangely at times.

Bruce

> Joe
>
> >
> > Bruce
> >
> > On Wed, Aug 10, 2022 at 1:39 PM Joe Slater <joe.slater@windriver.com> wrote:
> > >
> > > Ceph-volume does not properly control key sizes.
> > >
> > > Cherry-pick from github.com/ceph/ceph.git.
> > >
> > > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > > ---
> > >  .../ceph/ceph/CVE-2021-3979.patch             | 158 ++++++++++++++++++
> > >  recipes-extended/ceph/ceph_15.2.15.bb         |   1 +
> > >  2 files changed, 159 insertions(+)
> > >  create mode 100644 recipes-extended/ceph/ceph/CVE-2021-3979.patch
> > >
> > > diff --git a/recipes-extended/ceph/ceph/CVE-2021-3979.patch
> > > b/recipes-extended/ceph/ceph/CVE-2021-3979.patch
> > > new file mode 100644
> > > index 00000000..081b32ba
> > > --- /dev/null
> > > +++ b/recipes-extended/ceph/ceph/CVE-2021-3979.patch
> > > @@ -0,0 +1,158 @@
> > > +From 47c33179f9a15ae95cc1579a421be89378602656 Mon Sep 17 00:00:00
> > > +2001
> > > +From: Guillaume Abrioux <gabrioux@redhat.com>
> > > +Date: Tue, 25 Jan 2022 10:25:53 +0100
> > > +Subject: [PATCH] ceph-volume: honour osd_dmcrypt_key_size option
> > > +
> > > +ceph-volume doesn't honour osd_dmcrypt_key_size.
> > > +It means the default size is always applied.
> > > +
> > > +It also changes the default value in `get_key_size_from_conf()`
> > > +
> > > +From cryptsetup manpage:
> > > +
> > > +> For XTS mode you can optionally set a key size of 512 bits with the -s
> > option.
> > > +
> > > +Using more than 512bits will end up with the following error message:
> > > +
> > > +```
> > > +Key size in XTS mode must be 256 or 512 bits.
> > > +```
> > > +
> > > +Fixes: https://tracker.ceph.com/issues/54006
> > > +
> > > +Signed-off-by: Guillaume Abrioux <gabrioux@redhat.com>
> > > +
> > > +Upstream-Status: Backport
> > > + github.com/ceph/ceph.git
> > > + equivalent to cherry-pick of commit
> > > +47c33179f9a15ae95cc1579a421be89378602656
> > > +
> > > +CVE: CVE-2021-3979
> > > +
> > > +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > > +---
> > > + .../ceph_volume/tests/util/test_encryption.py | 41 +++++++++++++------
> > > + .../ceph_volume/util/encryption.py            | 34 ++++++++++-----
> > > + 2 files changed, 51 insertions(+), 24 deletions(-)
> > > +
> > > +diff --git
> > > +a/src/ceph-volume/ceph_volume/tests/util/test_encryption.py
> > > +b/src/ceph-volume/ceph_volume/tests/util/test_encryption.py
> > > +index e1420b440d3..c86dc50b7c7 100644
> > > +--- a/src/ceph-volume/ceph_volume/tests/util/test_encryption.py
> > > ++++ b/src/ceph-volume/ceph_volume/tests/util/test_encryption.py
> > > +@@ -1,5 +1,31 @@
> > > + from ceph_volume.util import encryption
> > > ++import base64
> > > +
> > > ++class TestGetKeySize(object):
> > > ++    def test_get_size_from_conf_default(self, conf_ceph_stub):
> > > ++        conf_ceph_stub('''
> > > ++        [global]
> > > ++        fsid=asdf
> > > ++        ''')
> > > ++        assert encryption.get_key_size_from_conf() == '512'
> > > ++
> > > ++    def test_get_size_from_conf_custom(self, conf_ceph_stub):
> > > ++        conf_ceph_stub('''
> > > ++        [global]
> > > ++        fsid=asdf
> > > ++        [osd]
> > > ++        osd_dmcrypt_key_size=256
> > > ++        ''')
> > > ++        assert encryption.get_key_size_from_conf() == '256'
> > > ++
> > > ++    def test_get_size_from_conf_custom_invalid(self, conf_ceph_stub):
> > > ++        conf_ceph_stub('''
> > > ++        [global]
> > > ++        fsid=asdf
> > > ++        [osd]
> > > ++        osd_dmcrypt_key_size=1024
> > > ++        ''')
> > > ++        assert encryption.get_key_size_from_conf() == '512'
> > > +
> > > + class TestStatus(object):
> > > +
> > > +@@ -37,17 +63,6 @@ class TestDmcryptClose(object):
> > > +
> > > + class TestDmcryptKey(object):
> > > +
> > > +-    def test_dmcrypt_with_default_size(self, conf_ceph_stub):
> > > +-        conf_ceph_stub('[global]\nfsid=asdf-lkjh')
> > > +-        result = encryption.create_dmcrypt_key()
> > > +-        assert len(result) == 172
> > > +-
> > > +-    def test_dmcrypt_with_custom_size(self, conf_ceph_stub):
> > > +-        conf_ceph_stub('''
> > > +-        [global]
> > > +-        fsid=asdf
> > > +-        [osd]
> > > +-        osd_dmcrypt_size=8
> > > +-        ''')
> > > ++    def test_dmcrypt(self):
> > > +         result = encryption.create_dmcrypt_key()
> > > +-        assert len(result) == 172
> > > ++        assert len(base64.b64decode(result)) == 128
> > > +diff --git a/src/ceph-volume/ceph_volume/util/encryption.py
> > > +b/src/ceph-volume/ceph_volume/util/encryption.py
> > > +index 72a0ccf121e..2a2c03337b6 100644
> > > +--- a/src/ceph-volume/ceph_volume/util/encryption.py
> > > ++++ b/src/ceph-volume/ceph_volume/util/encryption.py
> > > +@@ -9,21 +9,29 @@ from .disk import lsblk, device_family,
> > > +get_part_entry_type
> > > +
> > > + logger = logging.getLogger(__name__)
> > > +
> > > +-
> > > +-def create_dmcrypt_key():
> > > ++def get_key_size_from_conf():
> > > +     """
> > > +-    Create the secret dm-crypt key used to decrypt a device.
> > > ++    Return the osd dmcrypt key size from config file.
> > > ++    Default is 512.
> > > +     """
> > > +-    # get the customizable dmcrypt key size (in bits) from ceph.conf fallback
> > > +-    # to the default of 1024
> > > +-    dmcrypt_key_size = conf.ceph.get_safe(
> > > ++    default_key_size = '512'
> > > ++    key_size = conf.ceph.get_safe(
> > > +         'osd',
> > > +         'osd_dmcrypt_key_size',
> > > +-        default=1024,
> > > +-    )
> > > +-    # The size of the key is defined in bits, so we must transform that
> > > +-    # value to bytes (dividing by 8) because we read in bytes, not bits
> > > +-    random_string = os.urandom(int(dmcrypt_key_size / 8))
> > > ++        default='512')
> > > ++
> > > ++    if key_size not in ['256', '512']:
> > > ++        logger.warning(("Invalid value set for osd_dmcrypt_key_size ({}). "
> > > ++                        "Falling back to {}bits".format(key_size, default_key_size)))
> > > ++        return default_key_size
> > > ++
> > > ++    return key_size
> > > ++
> > > ++def create_dmcrypt_key():
> > > ++    """
> > > ++    Create the secret dm-crypt key (KEK) used to encrypt/decrypt the Volume
> > Key.
> > > ++    """
> > > ++    random_string = os.urandom(128)
> > > +     key = base64.b64encode(random_string).decode('utf-8')
> > > +     return key
> > > +
> > > +@@ -38,6 +46,8 @@ def luks_format(key, device):
> > > +     command = [
> > > +         'cryptsetup',
> > > +         '--batch-mode', # do not prompt
> > > ++        '--key-size',
> > > ++        get_key_size_from_conf(),
> > > +         '--key-file', # misnomer, should be key
> > > +         '-',          # because we indicate stdin for the key here
> > > +         'luksFormat',
> > > +@@ -83,6 +93,8 @@ def luks_open(key, device, mapping):
> > > +     """
> > > +     command = [
> > > +         'cryptsetup',
> > > ++        '--key-size',
> > > ++        get_key_size_from_conf(),
> > > +         '--key-file',
> > > +         '-',
> > > +         '--allow-discards',  # allow discards (aka TRIM) requests
> > > +for device
> > > +--
> > > +2.35.1
> > > +
> > > diff --git a/recipes-extended/ceph/ceph_15.2.15.bb
> > > b/recipes-extended/ceph/ceph_15.2.15.bb
> > > index 17dbcf35..b13ebb70 100644
> > > --- a/recipes-extended/ceph/ceph_15.2.15.bb
> > > +++ b/recipes-extended/ceph/ceph_15.2.15.bb
> > > @@ -14,6 +14,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-
> > ${PV}.tar.gz \
> > >             file://ceph.conf \
> > >             file://0001-cmake-add-support-for-python3.10.patch \
> > >
> > > file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \
> > > +           file://CVE-2021-3979.patch \
> > >  "
> > >
> > >  SRC_URI[sha256sum] =
> > "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
> > > --
> > > 2.35.1
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#7514):
> > > https://lists.yoctoproject.org/g/meta-virtualization/message/7514
> > > Mute This Topic: https://lists.yoctoproject.org/mt/92941876/1050810
> > > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > > Unsubscribe:
> > > https://lists.yoctoproject.org/g/meta-virtualization/unsub
> > > [bruce.ashfield@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> > its end
> > - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

