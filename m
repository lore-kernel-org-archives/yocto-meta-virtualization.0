Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1DAECAAA1
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 02:37:31 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.3303.1662518251003856538
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 19:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T/9ggFAe;
 spf=pass (domain: gmail.com, ip: 209.85.216.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 o2-20020a17090a9f8200b0020025a22208so9608008pjp.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 19:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=wnaa6a7TlB4T6nfaS+ZCDm3GGak5D2FeNIkYq2oPCRY=;
        b=T/9ggFAebry+K+AXBSaPapZXUD12MA0Y2zukEA3wPIS/jf4N86YNr0ChQN20vBevsa
         bYiFM4GtdEOjQTV9x+l7ViNzrbLWGB0roaAopKVh9lrcyqj7s/QGohSaUc7KQjWwLQFQ
         WptMWyV8BVZTDaHSCNcxqycYhtXTiMLif6ybFNvEAIKkkWLq13AejVAWmf3n6LQfVJ7/
         GflemIAxRrRYrp5Vh2JN5zN/WFjTTv+llf7vs7Z+4Gz2Qy6TkeAHTii55xE78NBIMzwh
         uqrYbczfmcUbsaAlR7vNwZqwct8ngIt04IE2pRL4tevq7QiTBIndmEOL8Py7Lbgsr/35
         vfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=wnaa6a7TlB4T6nfaS+ZCDm3GGak5D2FeNIkYq2oPCRY=;
        b=p61Xsu1xwd2pWLeMLvuOo4EGVAy9P2lAIpHuOgwofAJ9LrQ4wWuYa5/crvaZwvWZCR
         dOES5hEhDwiJND45iUNYNr3nFu42vRHHe1a3ZBd+1WgPm6AQKdiZ3uPkdfcjz1D9QbWf
         VWE42JzIw9okzjVY27WgUfui0QVAV1pA+dHaIQA61YBXBHCQEy9itueVr5kXt9LkXWWh
         USxaXiImI88yXIIQ1sMzPYn7MrdOceX0PBI45wLJer1zTu8HThDCR8WILuobu/fy9yjI
         Llv0FCzPCPpmyh38XbqftyQcfNzSoEtXBghAC095ScOVJ8jpdWUI6CG6ueLLwUiZUF4x
         PhTw==
X-Gm-Message-State: ACgBeo2VmaDOzz7eFULWbLYtQKOa7p6KQB15ngmmGijl+FFOgHVIc2Wm
	udPylXb/jXJkuDcYK7bGjFiWw1bX+t/HmHTrBOM=
X-Google-Smtp-Source: 
 AA6agR4PC8x4hC6l9YE6nVZkSDQYgrjZl6MdL7ZwfdyqPRmEPWVQs2IP3YNfXwY2sotC3lMLRdRuDP16hhk+OsRFTEk=
X-Received: by 2002:a17:903:32c2:b0:176:acdf:e86b with SMTP id
 i2-20020a17090332c200b00176acdfe86bmr1427348plr.54.1662518250190; Tue, 06 Sep
 2022 19:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220906220710.38267-1-sakib.sajal@windriver.com>
In-Reply-To: <20220906220710.38267-1-sakib.sajal@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 6 Sep 2022 22:37:19 -0400
Message-ID: 
 <CADkTA4PVgTCL0GrjFmy15kzMAqEwNkjdHF_Spq1Ho9q_ZdFcAA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] ceph: fix CVE-2022-0670
To: sakib.sajal@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Sep 2022 02:37:31 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7602

Since you just sent an update to master for ceph, I'll assume this
isn't for master ? Is it for kirkstone ?

Bruce

On Tue, Sep 6, 2022 at 6:07 PM <sakib.sajal@windriver.com> wrote:
>
> Backport required patches to fix CVE-2022-0670.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  .../ceph/ceph/CVE-2022-0670_1.patch           | 114 ++++++++++++++++++
>  .../ceph/ceph/CVE-2022-0670_2.patch           |  67 ++++++++++
>  recipes-extended/ceph/ceph_15.2.15.bb         |   2 +
>  3 files changed, 183 insertions(+)
>  create mode 100644 recipes-extended/ceph/ceph/CVE-2022-0670_1.patch
>  create mode 100644 recipes-extended/ceph/ceph/CVE-2022-0670_2.patch
>
> diff --git a/recipes-extended/ceph/ceph/CVE-2022-0670_1.patch b/recipes-extended/ceph/ceph/CVE-2022-0670_1.patch
> new file mode 100644
> index 0000000..ea790d3
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/CVE-2022-0670_1.patch
> @@ -0,0 +1,114 @@
> +From 0cd1d8aa5ac935f738365ba38b397cae0fc9179c Mon Sep 17 00:00:00 2001
> +From: Kotresh HR <khiremat@redhat.com>
> +Date: Fri, 4 Feb 2022 14:55:03 +0530
> +Subject: [PATCH] mgr/volumes: Fix subvolume discover during upgrade
> +
> +Fixes the subvolume discover to use the correct
> +metadata file after an upgrade from legacy subvolume
> +to v1. The fix makes sure, it doesn't use the
> +handcrafted metadata file placed in the subvolume
> +root of legacy subvolume.
> +
> +Co-authored-by: Arthur Outhenin-Chalandre <arthur.outhenin-chalandre@cern.ch>
> +Co-authored-by: Dan van der Ster <daniel.vanderster@cern.ch>
> +Co-authored-by: Ramana Raja <rraja@redhat.com>
> +Signed-off-by: Kotresh HR <khiremat@redhat.com>
> +(cherry picked from commit 7eba9cab6cfb9a13a84062177d7a0fa228311e13)
> +
> +Upstream-Status: Backport [0cd1d8aa5ac935f738365ba38b397cae0fc9179c]
> +CVE: CVE-2022-0670
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + .../fs/operations/versions/metadata_manager.py  | 17 ++++++++++++++---
> + .../fs/operations/versions/subvolume_base.py    | 17 ++++++++++++++++-
> + 2 files changed, 30 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/pybind/mgr/volumes/fs/operations/versions/metadata_manager.py b/src/pybind/mgr/volumes/fs/operations/versions/metadata_manager.py
> +index 1b6c4327837..cb3059e5653 100644
> +--- a/src/pybind/mgr/volumes/fs/operations/versions/metadata_manager.py
> ++++ b/src/pybind/mgr/volumes/fs/operations/versions/metadata_manager.py
> +@@ -40,16 +40,17 @@ class MetadataManager(object):
> +     def refresh(self):
> +         fd = None
> +         conf_data = StringIO()
> ++        log.debug("opening config {0}".format(self.config_path))
> +         try:
> +-            log.debug("opening config {0}".format(self.config_path))
> +             fd = self.fs.open(self.config_path, os.O_RDONLY)
> +             while True:
> +                 data = self.fs.read(fd, -1, MetadataManager.MAX_IO_BYTES)
> +                 if not len(data):
> +                     break
> +                 conf_data.write(data.decode('utf-8'))
> +-            conf_data.seek(0)
> +-            self.config.readfp(conf_data)
> ++        except UnicodeDecodeError:
> ++            raise MetadataMgrException(-errno.EINVAL,
> ++                    "failed to decode, erroneous metadata config '{0}'".format(self.config_path))
> +         except cephfs.ObjectNotFound:
> +             raise MetadataMgrException(-errno.ENOENT, "metadata config '{0}' not found".format(self.config_path))
> +         except cephfs.Error as e:
> +@@ -58,6 +59,16 @@ class MetadataManager(object):
> +             if fd is not None:
> +                 self.fs.close(fd)
> +
> ++        conf_data.seek(0)
> ++        try:
> ++            if sys.version_info >= (3, 2):
> ++                self.config.read_file(conf_data)
> ++            else:
> ++                self.config.readfp(conf_data)
> ++        except configparser.Error:
> ++            raise MetadataMgrException(-errno.EINVAL, "failed to parse, erroneous metadata config "
> ++                    "'{0}'".format(self.config_path))
> ++
> +     def flush(self):
> +         # cull empty sections
> +         for section in list(self.config.sections()):
> +diff --git a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
> +index 2840a9f2ea3..b499d242e3b 100644
> +--- a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
> ++++ b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
> +@@ -5,6 +5,7 @@ import errno
> + import logging
> + from hashlib import md5
> + from typing import Dict, Union
> ++from pathlib import Path
> +
> + import cephfs
> +
> +@@ -123,6 +124,15 @@ class SubvolumeBase(object):
> +         raise NotImplementedError
> +
> +     def load_config(self):
> ++        try:
> ++            self.fs.stat(self.legacy_config_path)
> ++            self.legacy_mode = True
> ++        except cephfs.Error as e:
> ++            pass
> ++
> ++        log.debug("loading config "
> ++                  "'{0}' [mode: {1}]".format(self.subvolname, "legacy"
> ++                                             if self.legacy_mode else "new"))
> +         if self.legacy_mode:
> +             self.metadata_mgr = MetadataManager(self.fs, self.legacy_config_path, 0o640)
> +         else:
> +@@ -271,8 +281,13 @@ class SubvolumeBase(object):
> +             self.fs.stat(self.base_path)
> +             self.metadata_mgr.refresh()
> +             log.debug("loaded subvolume '{0}'".format(self.subvolname))
> ++            subvolpath = self.metadata_mgr.get_global_option(MetadataManager.GLOBAL_META_KEY_PATH)
> ++            if not self.legacy_mode and self.base_path.decode('utf-8') != str(Path(subvolpath).parent):
> ++                raise MetadataMgrException(-errno.ENOENT, 'fabricated .meta')
> +         except MetadataMgrException as me:
> +-            if me.errno == -errno.ENOENT and not self.legacy_mode:
> ++            if me.errno in (-errno.ENOENT, -errno.EINVAL) and not self.legacy_mode:
> ++                log.warn("subvolume '{0}', {1}, "
> ++                          "assuming legacy_mode".format(self.subvolname, me.error_str))
> +                 self.legacy_mode = True
> +                 self.load_config()
> +                 self.discover()
> +--
> +2.25.1
> +
> diff --git a/recipes-extended/ceph/ceph/CVE-2022-0670_2.patch b/recipes-extended/ceph/ceph/CVE-2022-0670_2.patch
> new file mode 100644
> index 0000000..dad466b
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/CVE-2022-0670_2.patch
> @@ -0,0 +1,67 @@
> +From c774e03c29955f0fb668af6190a9750d03bb09b8 Mon Sep 17 00:00:00 2001
> +From: Kotresh HR <khiremat@redhat.com>
> +Date: Thu, 9 Jun 2022 13:30:59 +0530
> +Subject: [PATCH] mgr/volumes: V2 Fix for
> + test_subvolume_retain_snapshot_invalid_recreate
> +
> +Signed-off-by: Kotresh HR <khiremat@redhat.com>
> +
> +Upstream-Status: Backport [c774e03c29955f0fb668af6190a9750d03bb09b8]
> +CVE: CVE-2022-0670
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +
> +---
> + .../mgr/volumes/fs/operations/versions/subvolume_base.py  | 8 ++++++--
> + .../mgr/volumes/fs/operations/versions/subvolume_v1.py    | 2 +-
> + 2 files changed, 7 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
> +index b499d242e3b..aba8c90cf67 100644
> +--- a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
> ++++ b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_base.py
> +@@ -17,6 +17,7 @@ from ...fs_util import get_ancestor_xattr
> + from ...exception import MetadataMgrException, VolumeException
> + from .op_sm import SubvolumeOpSm
> + from .auth_metadata import AuthMetadataManager
> ++from .subvolume_attrs import SubvolumeStates
> +
> + log = logging.getLogger(__name__)
> +
> +@@ -112,7 +113,7 @@ class SubvolumeBase(object):
> +     @property
> +     def state(self):
> +         """ Subvolume state, one of SubvolumeStates """
> +-        raise NotImplementedError
> ++        return SubvolumeStates.from_value(self.metadata_mgr.get_global_option(MetadataManager.GLOBAL_META_KEY_STATE))
> +
> +     @property
> +     def subvol_type(self):
> +@@ -282,7 +283,10 @@ class SubvolumeBase(object):
> +             self.metadata_mgr.refresh()
> +             log.debug("loaded subvolume '{0}'".format(self.subvolname))
> +             subvolpath = self.metadata_mgr.get_global_option(MetadataManager.GLOBAL_META_KEY_PATH)
> +-            if not self.legacy_mode and self.base_path.decode('utf-8') != str(Path(subvolpath).parent):
> ++            # subvolume with retained snapshots has empty path, don't mistake it for
> ++            # fabricated metadata.
> ++            if (not self.legacy_mode and self.state != SubvolumeStates.STATE_RETAINED and
> ++                self.base_path.decode('utf-8') != str(Path(subvolpath).parent)):
> +                 raise MetadataMgrException(-errno.ENOENT, 'fabricated .meta')
> +         except MetadataMgrException as me:
> +             if me.errno in (-errno.ENOENT, -errno.EINVAL) and not self.legacy_mode:
> +diff --git a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_v1.py b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_v1.py
> +index f7b13f17c77..9e772653ba5 100644
> +--- a/src/pybind/mgr/volumes/fs/operations/versions/subvolume_v1.py
> ++++ b/src/pybind/mgr/volumes/fs/operations/versions/subvolume_v1.py
> +@@ -673,7 +673,7 @@ class SubvolumeV1(SubvolumeBase, SubvolumeTemplate):
> +
> +     @property
> +     def state(self):
> +-        return SubvolumeStates.from_value(self.metadata_mgr.get_global_option(MetadataManager.GLOBAL_META_KEY_STATE))
> ++        return super(SubvolumeV1, self).state
> +
> +     @state.setter
> +     def state(self, val):
> +--
> +2.25.1
> +
> diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_15.2.15.bb
> index f2ece8c..d63051c 100644
> --- a/recipes-extended/ceph/ceph_15.2.15.bb
> +++ b/recipes-extended/ceph/ceph_15.2.15.bb
> @@ -17,6 +17,8 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch \
>             file://0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch \
>             file://CVE-2021-3979.patch \
> +           file://CVE-2022-0670_1.patch \
> +           file://CVE-2022-0670_2.patch \
>  "
>
>  SRC_URI[sha256sum] = "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7601): https://lists.yoctoproject.org/g/meta-virtualization/message/7601
> Mute This Topic: https://lists.yoctoproject.org/mt/93512577/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

