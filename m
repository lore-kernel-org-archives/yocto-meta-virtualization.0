Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71EBC00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 17:39:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1281.1660153170337492332
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Aug 2022 10:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TVli2fY7;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=52213e9b55=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27ACXh3t026913
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Aug 2022 17:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=b7Lw7NVBBgbPHsPY9fUUpTMgFMNWDs+NO0GXBCGPqNc=;
 b=TVli2fY7rnTNlldJvV7IidUAkDeVTdmF1IJXhAQxO3p1jCX0YU0UO8kfwtMOu8EmlveZ
 yH8ScjcCP5cyizuihNvCtR/fs70byo54OPdmsKLnqaGAhCk1P2QlYfKiUDI6oCR6NMx9
 /V7v+kRs4ZjhYmqkoC6GsZ3xlIY87EHU18wCI9t8El4pGTBerX4UsUi2XuysjYsO4hW1
 CBhlfW0UEoVwd9v4BIrAi9yNBV2qUw6PNaPlcSesza/FJV0f1ZYTO0AHH3nC1L5w+sBB
 vmXIdLX5hdC47pVKl82UcHV/yFSPAffRV0T9RbwbU24hbRW34zUe0SoDfO2RPzE3AxeX 4w==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3huwrd0sbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Aug 2022 17:39:28 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 10 Aug 2022 10:39:27 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 10 Aug 2022 10:39:27 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-virt][kirkstone][PATCH 1/1] ceph: Fix CVE-1021-3979
Date: Wed, 10 Aug 2022 10:39:27 -0700
Message-ID: <20220810173927.36905-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bgfXBA3BNbdsAqGxp1Xphmm8oK91-0-T
X-Proofpoint-ORIG-GUID: bgfXBA3BNbdsAqGxp1Xphmm8oK91-0-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_12,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100053
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Aug 2022 17:39:35 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7514

Ceph-volume does not properly control key sizes.

Cherry-pick from github.com/ceph/ceph.git.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../ceph/ceph/CVE-2021-3979.patch             | 158 ++++++++++++++++++
 recipes-extended/ceph/ceph_15.2.15.bb         |   1 +
 2 files changed, 159 insertions(+)
 create mode 100644 recipes-extended/ceph/ceph/CVE-2021-3979.patch

diff --git a/recipes-extended/ceph/ceph/CVE-2021-3979.patch b/recipes-extended/ceph/ceph/CVE-2021-3979.patch
new file mode 100644
index 00000000..081b32ba
--- /dev/null
+++ b/recipes-extended/ceph/ceph/CVE-2021-3979.patch
@@ -0,0 +1,158 @@
+From 47c33179f9a15ae95cc1579a421be89378602656 Mon Sep 17 00:00:00 2001
+From: Guillaume Abrioux <gabrioux@redhat.com>
+Date: Tue, 25 Jan 2022 10:25:53 +0100
+Subject: [PATCH] ceph-volume: honour osd_dmcrypt_key_size option
+
+ceph-volume doesn't honour osd_dmcrypt_key_size.
+It means the default size is always applied.
+
+It also changes the default value in `get_key_size_from_conf()`
+
+From cryptsetup manpage:
+
+> For XTS mode you can optionally set a key size of 512 bits with the -s option.
+
+Using more than 512bits will end up with the following error message:
+
+```
+Key size in XTS mode must be 256 or 512 bits.
+```
+
+Fixes: https://tracker.ceph.com/issues/54006
+
+Signed-off-by: Guillaume Abrioux <gabrioux@redhat.com>
+
+Upstream-Status: Backport
+ github.com/ceph/ceph.git
+ equivalent to cherry-pick of commit 47c33179f9a15ae95cc1579a421be89378602656
+
+CVE: CVE-2021-3979
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ .../ceph_volume/tests/util/test_encryption.py | 41 +++++++++++++------
+ .../ceph_volume/util/encryption.py            | 34 ++++++++++-----
+ 2 files changed, 51 insertions(+), 24 deletions(-)
+
+diff --git a/src/ceph-volume/ceph_volume/tests/util/test_encryption.py b/src/ceph-volume/ceph_volume/tests/util/test_encryption.py
+index e1420b440d3..c86dc50b7c7 100644
+--- a/src/ceph-volume/ceph_volume/tests/util/test_encryption.py
++++ b/src/ceph-volume/ceph_volume/tests/util/test_encryption.py
+@@ -1,5 +1,31 @@
+ from ceph_volume.util import encryption
++import base64
+ 
++class TestGetKeySize(object):
++    def test_get_size_from_conf_default(self, conf_ceph_stub):
++        conf_ceph_stub('''
++        [global]
++        fsid=asdf
++        ''')
++        assert encryption.get_key_size_from_conf() == '512'
++
++    def test_get_size_from_conf_custom(self, conf_ceph_stub):
++        conf_ceph_stub('''
++        [global]
++        fsid=asdf
++        [osd]
++        osd_dmcrypt_key_size=256
++        ''')
++        assert encryption.get_key_size_from_conf() == '256'
++
++    def test_get_size_from_conf_custom_invalid(self, conf_ceph_stub):
++        conf_ceph_stub('''
++        [global]
++        fsid=asdf
++        [osd]
++        osd_dmcrypt_key_size=1024
++        ''')
++        assert encryption.get_key_size_from_conf() == '512'
+ 
+ class TestStatus(object):
+ 
+@@ -37,17 +63,6 @@ class TestDmcryptClose(object):
+ 
+ class TestDmcryptKey(object):
+ 
+-    def test_dmcrypt_with_default_size(self, conf_ceph_stub):
+-        conf_ceph_stub('[global]\nfsid=asdf-lkjh')
+-        result = encryption.create_dmcrypt_key()
+-        assert len(result) == 172
+-
+-    def test_dmcrypt_with_custom_size(self, conf_ceph_stub):
+-        conf_ceph_stub('''
+-        [global]
+-        fsid=asdf
+-        [osd]
+-        osd_dmcrypt_size=8
+-        ''')
++    def test_dmcrypt(self):
+         result = encryption.create_dmcrypt_key()
+-        assert len(result) == 172
++        assert len(base64.b64decode(result)) == 128
+diff --git a/src/ceph-volume/ceph_volume/util/encryption.py b/src/ceph-volume/ceph_volume/util/encryption.py
+index 72a0ccf121e..2a2c03337b6 100644
+--- a/src/ceph-volume/ceph_volume/util/encryption.py
++++ b/src/ceph-volume/ceph_volume/util/encryption.py
+@@ -9,21 +9,29 @@ from .disk import lsblk, device_family, get_part_entry_type
+ 
+ logger = logging.getLogger(__name__)
+ 
+-
+-def create_dmcrypt_key():
++def get_key_size_from_conf():
+     """
+-    Create the secret dm-crypt key used to decrypt a device.
++    Return the osd dmcrypt key size from config file.
++    Default is 512.
+     """
+-    # get the customizable dmcrypt key size (in bits) from ceph.conf fallback
+-    # to the default of 1024
+-    dmcrypt_key_size = conf.ceph.get_safe(
++    default_key_size = '512'
++    key_size = conf.ceph.get_safe(
+         'osd',
+         'osd_dmcrypt_key_size',
+-        default=1024,
+-    )
+-    # The size of the key is defined in bits, so we must transform that
+-    # value to bytes (dividing by 8) because we read in bytes, not bits
+-    random_string = os.urandom(int(dmcrypt_key_size / 8))
++        default='512')
++
++    if key_size not in ['256', '512']:
++        logger.warning(("Invalid value set for osd_dmcrypt_key_size ({}). "
++                        "Falling back to {}bits".format(key_size, default_key_size)))
++        return default_key_size
++
++    return key_size
++
++def create_dmcrypt_key():
++    """
++    Create the secret dm-crypt key (KEK) used to encrypt/decrypt the Volume Key.
++    """
++    random_string = os.urandom(128)
+     key = base64.b64encode(random_string).decode('utf-8')
+     return key
+ 
+@@ -38,6 +46,8 @@ def luks_format(key, device):
+     command = [
+         'cryptsetup',
+         '--batch-mode', # do not prompt
++        '--key-size',
++        get_key_size_from_conf(),
+         '--key-file', # misnomer, should be key
+         '-',          # because we indicate stdin for the key here
+         'luksFormat',
+@@ -83,6 +93,8 @@ def luks_open(key, device, mapping):
+     """
+     command = [
+         'cryptsetup',
++        '--key-size',
++        get_key_size_from_conf(),
+         '--key-file',
+         '-',
+         '--allow-discards',  # allow discards (aka TRIM) requests for device
+-- 
+2.35.1
+
diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_15.2.15.bb
index 17dbcf35..b13ebb70 100644
--- a/recipes-extended/ceph/ceph_15.2.15.bb
+++ b/recipes-extended/ceph/ceph_15.2.15.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://ceph.conf \
            file://0001-cmake-add-support-for-python3.10.patch \
            file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \
+           file://CVE-2021-3979.patch \
 "
 
 SRC_URI[sha256sum] = "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
-- 
2.35.1


