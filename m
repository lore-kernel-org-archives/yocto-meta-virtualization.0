Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81863C35274
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 02:59:44 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.4191.1702954779076487868
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Dec 2023 18:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UElZzAUF;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7b7418bea02so194476239f.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Dec 2023 18:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702954778; x=1703559578; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqRD78N6Ov3cja+ldJv4+u/EvhT9z6+ehS9Ix1XSXts=;
        b=UElZzAUFjtdBvMiD0FSMkleNnSsidQbh2agOnps52UqOsiHDpGcDT+8vKjA0fbE3+j
         Sre5bAmBybtoUJ2rZkUuYwv9AZSb1BbGHSD2J9Wklbfe8FNjtP2mqYhh2FwBorw8La2C
         gcIOK+JHkHQ2FHA/FDdttL9EjNBZWOmKNtFac3+Th07qc99jHcxtoZOmSFc+zHQqI0xF
         10CcXJSI6SlHayfC7IWGrfSsmsY+g5mU3n/EbJYS5Uy9bx1pduX4WIwElaHeq5NSLPPb
         lkxNqc1/lycDyNf67GfVVGrNRKexnmS2DaXDl09+ba0SuKHG00MBkbs7dm68Noq1GpsY
         mDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702954778; x=1703559578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqRD78N6Ov3cja+ldJv4+u/EvhT9z6+ehS9Ix1XSXts=;
        b=GUhFtQPzlb2Dpg68A48EY5mAh8ulyYdVY/xz+MsuGzVRuKrqAkL6amNVjXTAMObH1M
         Q6Vscba3ywUG+C814C8/T9d4iuBx0uMfqwwkch/Lv6IiFLrdQhkiANiIkc4AEpJWfhz7
         Z+mJGv0qA9oFUel6HrcnLmz9SVKy6g+lRdk+1NPnNz+WmY6AqS9ETBivNjznBwyjfcLw
         dXW7DTD7eNpUlDbTuS2C7djZOPsHlVEqxguUzX+HrCy2nq7h6JUFhi1Zv7dnvJi3VpJJ
         L/yn8gYD89MMTyUUuB4wkkPN/55l2MLC657UOk96wJCS9jjuwgJTT16Ms/LesONw84AW
         w2IA==
X-Gm-Message-State: AOJu0YzXGttdnn4nC7hapX1l3RCi9iiXKvbEmwD4MmaM9aGklr0z6IcW
	DPDrbUsPdgeUrnK8sWC6wzCNbxxAeKUGo44GFQA=
X-Google-Smtp-Source: AGHT+IFYgcDYCAxjqWvwRmZhaxR0LfW9toXgpV9zRHiwcwQQfcjCbnnCoB8EoA3Prf8UJgMAIfh3lvh6Qte5kd+1QbI=
X-Received: by 2002:a05:6602:b81:b0:7b7:ae3:442 with SMTP id
 fm1-20020a0566020b8100b007b70ae30442mr26044125iob.10.1702954777830; Mon, 18
 Dec 2023 18:59:37 -0800 (PST)
MIME-Version: 1.0
References: <20231218084919.2800062-1-vkumbhar@mvista.com>
In-Reply-To: <20231218084919.2800062-1-vkumbhar@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 18 Dec 2023 21:59:26 -0500
Message-ID: <CADkTA4OHqZT1LzS+ZiAnHDkhZjqw=BGgxoXGM4HHmfc7_i0HQw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] cloud-init: fix CVE-2023-1786
 sensitive data could be exposed in logs
To: vkumbhar@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Dec 2023 02:59:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8512

CVE patches should explicitly state which branch is the target, and
also list any other impacted branches.

For master, an uprev would be the best way to address this, which is
what I went ahead and completed and pushed to master-next.

But what are the other branches that would be impacted by this CVE ?
We need a v2 with that information.

Bruce

On Mon, Dec 18, 2023 at 3:49=E2=80=AFAM Vivek Kumbhar via
lists.yoctoproject.org <vkumbhar=3Dmvista.com@lists.yoctoproject.org>
wrote:
>
> Upstream-Status: Backport from https://github.com/canonical/cloud-init/co=
mmit/a378b7e4f47375458651c0972e7cd813f6fe0a6b
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  .../cloud-init/cloud-init/CVE-2023-1786.patch | 294 ++++++++++++++++++
>  .../cloud-init/cloud-init_21.4.bb             |   1 +
>  2 files changed, 295 insertions(+)
>  create mode 100644 recipes-extended/cloud-init/cloud-init/CVE-2023-1786.=
patch
>
> diff --git a/recipes-extended/cloud-init/cloud-init/CVE-2023-1786.patch b=
/recipes-extended/cloud-init/cloud-init/CVE-2023-1786.patch
> new file mode 100644
> index 00000000..425edd97
> --- /dev/null
> +++ b/recipes-extended/cloud-init/cloud-init/CVE-2023-1786.patch
> @@ -0,0 +1,294 @@
> +From a378b7e4f47375458651c0972e7cd813f6fe0a6b Mon Sep 17 00:00:00 2001
> +From: James Falcon <james.falcon@canonical.com>
> +Date: Wed, 26 Apr 2023 15:11:55 -0500
> +Subject: [PATCH] Make user/vendor data sensitive and remove log permissi=
ons
> +(#2144)
> +
> +Because user data and vendor data may contain sensitive information,
> +this commit ensures that any user data or vendor data written to
> +instance-data.json gets redacted and is only available to root user.
> +
> +Also, modify the permissions of cloud-init.log to be 640, so that
> +sensitive data leaked to the log isn't world readable.
> +Additionally, remove the logging of user data and vendor data to
> +cloud-init.log from the Vultr datasource.
> +
> +LP: #2013967
> +CVE: CVE-2023-1786
> +
> +Upstream-Status: Backport [https://github.com/canonical/cloud-init/commi=
t/a378b7e4f47375458651c0972e7cd813f6fe0a6b]
> +CVE: CVE-2023-1786
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + cloudinit/sources/DataSourceLXD.py   |  8 ++++++--
> + cloudinit/sources/DataSourceVultr.py | 14 ++++++--------
> + cloudinit/sources/__init__.py        | 28 +++++++++++++++++++++++++---
> + cloudinit/stages.py                  |  4 +++-
> + tests/unittests/sources/test_init.py | 27 ++++++++++++++++++++++++++-
> + tests/unittests/test_stages.py       | 16 +++++++++-------
> + 6 files changed, 75 insertions(+), 22 deletions(-)
> +
> +diff --git a/cloudinit/sources/DataSourceLXD.py b/cloudinit/sources/Data=
SourceLXD.py
> +index 071ea87cf..ea81ccb42 100644
> +--- a/cloudinit/sources/DataSourceLXD.py
> ++++ b/cloudinit/sources/DataSourceLXD.py
> +@@ -13,6 +13,7 @@ import os
> + import socket
> + import stat
> + from json.decoder import JSONDecodeError
> ++from typing import Any, Dict, List, Optional, Tuple, Union, cas
> +
> + import requests
> + from requests.adapters import HTTPAdapter
> +@@ -170,11 +171,14 @@ class DataSourceLXD(sources.DataSource):
> +     _network_config =3D sources.UNSET
> +     _crawled_metadata =3D sources.UNSET
> +
> +-    sensitive_metadata_keys =3D (
> +-        "merged_cfg",
> ++    sensitive_metadata_keys: Tuple[
> ++        str, ...
> ++    ] =3D sources.DataSource.sensitive_metadata_keys + (
> +         "user.meta-data",
> +         "user.vendor-data",
> +         "user.user-data",
> ++        "cloud-init.user-data",
> ++        "cloud-init.vendor-data",
> +     )
> +
> +     def _is_platform_viable(self) -> bool:
> +diff --git a/cloudinit/sources/DataSourceVultr.py b/cloudinit/sources/Da=
taSourceVultr.py
> +index 13f7c24d6..debebc0d7 100644
> +--- a/cloudinit/sources/DataSourceVultr.py
> ++++ b/cloudinit/sources/DataSourceVultr.py
> +@@ -5,6 +5,8 @@
> + # Vultr Metadata API:
> + # https://www.vultr.com/metadata/
> +
> ++from typing import Tuple
> ++
> + import cloudinit.sources.helpers.vultr as vultr
> + from cloudinit import log as log
> + from cloudinit import sources, util, version
> +@@ -28,6 +30,10 @@ class DataSourceVultr(sources.DataSource):
> +
> +     dsname =3D "Vultr"
> +
> ++    sensitive_metadata_keys: Tuple[
> ++        str, ...
> ++    ] =3D sources.DataSource.sensitive_metadata_keys + ("startup-script=
",)
> ++
> +     def __init__(self, sys_cfg, distro, paths):
> +         super(DataSourceVultr, self).__init__(sys_cfg, distro, paths)
> +         self.ds_cfg =3D util.mergemanydict(
> +@@ -56,13 +62,8 @@ class DataSourceVultr(sources.DataSource):
> +         self.get_datasource_data(self.metadata)
> +
> +         # Dump some data so diagnosing failures is manageable
> +-        LOG.debug("Vultr Vendor Config:")
> +-        LOG.debug(util.json_dumps(self.metadata["vendor-data"]))
> +         LOG.debug("SUBID: %s", self.metadata["instance-id"])
> +         LOG.debug("Hostname: %s", self.metadata["local-hostname"])
> +-        if self.userdata_raw is not None:
> +-            LOG.debug("User-Data:")
> +-            LOG.debug(self.userdata_raw)
> +
> +         return True
> +
> +@@ -147,7 +148,4 @@ if __name__ =3D=3D "__main__":
> +     config =3D md["vendor-data"]
> +     sysinfo =3D vultr.get_sysinfo()
> +
> +-    print(util.json_dumps(sysinfo))
> +-    print(util.json_dumps(config))
> +-
> + # vi: ts=3D4 expandtab
> +diff --git a/cloudinit/sources/__init__.py b/cloudinit/sources/__init__.=
py
> +index 9083f3995..8fb9d4cba 100644
> +--- a/cloudinit/sources/__init__.py
> ++++ b/cloudinit/sources/__init__.py
> +@@ -103,7 +103,10 @@ def process_instance_metadata(metadata, key_path=3D=
"", sensitive_keys=3D()):
> +             sub_key_path =3D key_path + "/" + key
> +         else:
> +             sub_key_path =3D key
> +-        if key in sensitive_keys or sub_key_path in sensitive_keys:
> ++        if (
> ++            key.lower() in sensitive_keys
> ++            or sub_key_path.lower() in sensitive_keys
> ++        ):
> +             sens_keys.append(sub_key_path)
> +         if isinstance(val, str) and val.startswith("ci-b64:"):
> +             base64_encoded_keys.append(sub_key_path)
> +@@ -125,6 +128,12 @@ def redact_sensitive_keys(metadata, redact_value=3D=
REDACT_SENSITIVE_VALUE):
> +
> +     Replace any keys values listed in 'sensitive_keys' with redact_valu=
e.
> +     """
> ++    # While 'sensitive_keys' should already sanitized to only include w=
hat
> ++    # is in metadata, it is possible keys will overlap. For example, if
> ++    # "merged_cfg" and "merged_cfg/ds/userdata" both match, it's possib=
le that
> ++    # "merged_cfg" will get replaced first, meaning "merged_cfg/ds/user=
data"
> ++    # no longer represents a valid key.
> ++    # Thus, we still need to do membership checks in this function.
> +     if not metadata.get("sensitive_keys", []):
> +         return metadata
> +     md_copy =3D copy.deepcopy(metadata)
> +@@ -132,9 +141,14 @@ def redact_sensitive_keys(metadata, redact_value=3D=
REDACT_SENSITIVE_VALUE):
> +         path_parts =3D key_path.split("/")
> +         obj =3D md_copy
> +         for path in path_parts:
> +-            if isinstance(obj[path], dict) and path !=3D path_parts[-1]=
:
> ++            if (
> ++                path in obj
> ++                and isinstance(obj[path], dict)
> ++                and path !=3D path_parts[-1]
> ++            ):
> +                 obj =3D obj[path]
> +-        obj[path] =3D redact_value
> ++        if path in obj:
> ++            obj[path] =3D redact_value
> +     return md_copy
> +
> +
> +@@ -237,6 +251,14 @@ class DataSource(CloudInitPickleMixin, metaclass=3D=
abc.ABCMeta):
> +     sensitive_metadata_keys =3D (
> +         "merged_cfg",
> +         "security-credentials",
> ++        "userdata",
> ++        "user-data",
> ++        "user_data",
> ++        "vendordata",
> ++        "vendor-data",
> ++        # Provide ds/vendor_data to avoid redacting top-level
> ++        #  "vendor_data": {enabled: True}
> ++        "ds/vendor_data",
> +     )
> +
> +     _ci_pkl_version =3D 1
> +diff --git a/cloudinit/stages.py b/cloudinit/stages.py
> +index b1a6bc495..85db6bec8 100644
> +--- a/cloudinit/stages.py
> ++++ b/cloudinit/stages.py
> +@@ -202,7 +202,9 @@ class Init(object):
> +         util.ensure_dirs(self._initial_subdirs())
> +         log_file =3D util.get_cfg_option_str(self.cfg, "def_log_file")
> +         if log_file:
> +-            util.ensure_file(log_file, mode=3D0o640, preserve_mode=3DTr=
ue)
> ++            # At this point the log file should have already been creat=
ed
> ++            # in the setupLogging function of log.py
> ++            util.ensure_file(log_file, mode=3D0o640, preserve_mode=3DFa=
lse)
> +             perms =3D self.cfg.get("syslog_fix_perms")
> +             if not perms:
> +                 perms =3D {}
> +diff --git a/tests/unittests/sources/test_init.py b/tests/unittests/sour=
ces/test_init.py
> +index 745a7fa6b..6eebb512d 100644
> +--- a/tests/unittests/sources/test_init.py
> ++++ b/tests/unittests/sources/test_init.py
> +@@ -442,12 +442,24 @@ class TestDataSource(CiTestCase):
> +                         "cred2": "othersekret",
> +                     }
> +                 },
> ++                "someother": {
> ++                    "nested": {
> ++                        "userData": "HIDE ME",
> ++                    }
> ++                },
> ++                "VENDOR-DAta": "HIDE ME TOO",
> +             },
> +         )
> +         self.assertCountEqual(
> +             (
> +                 "merged_cfg",
> +                 "security-credentials",
> ++                "userdata",
> ++                "user-data",
> ++                "user_data",
> ++                "vendordata",
> ++                "vendor-data",
> ++                "ds/vendor_data",
> +             ),
> +             datasource.sensitive_metadata_keys,
> +         )
> +@@ -474,7 +486,9 @@ class TestDataSource(CiTestCase):
> +             "base64_encoded_keys": [],
> +             "merged_cfg": REDACT_SENSITIVE_VALUE,
> +             "sensitive_keys": [
> ++                "ds/meta_data/VENDOR-DAta",
> +                 "ds/meta_data/some/security-credentials",
> ++                "ds/meta_data/someother/nested/userData",
> +                 "merged_cfg",
> +             ],
> +             "sys_info": sys_info,
> +@@ -484,6 +498,7 @@ class TestDataSource(CiTestCase):
> +                 "availability_zone": "myaz",
> +                 "cloud-name": "subclasscloudname",
> +                 "cloud_name": "subclasscloudname",
> ++                "cloud_id": "subclasscloudname",
> +                 "distro": "ubuntu",
> +                 "distro_release": "focal",
> +                 "distro_version": "20.04",
> +@@ -506,14 +521,18 @@ class TestDataSource(CiTestCase):
> +             "ds": {
> +                 "_doc": EXPERIMENTAL_TEXT,
> +                 "meta_data": {
> ++                    "VENDOR-DAta": REDACT_SENSITIVE_VALUE,
> +                     "availability_zone": "myaz",
> +                     "local-hostname": "test-subclass-hostname",
> +                     "region": "myregion",
> +                     "some": {"security-credentials": REDACT_SENSITIVE_V=
ALUE},
> ++                    "someother": {
> ++                        "nested": {"userData": REDACT_SENSITIVE_VALUE}
> ++                    },
> +                 },
> +             },
> +         }
> +-        self.assertCountEqual(expected, redacted)
> ++        self.assertEqual(expected, redacted)
> +         file_stat =3D os.stat(json_file)
> +         self.assertEqual(0o644, stat.S_IMODE(file_stat.st_mode))
> +
> +@@ -558,6 +577,12 @@ class TestDataSource(CiTestCase):
> +             (
> +                 "merged_cfg",
> +                 "security-credentials",
> ++                "userdata",
> ++                "user-data",
> ++                "user_data",
> ++                "vendordata",
> ++                "vendor-data",
> ++                "ds/vendor_data",
> +             ),
> +             datasource.sensitive_metadata_keys,
> +         )
> +diff --git a/tests/unittests/test_stages.py b/tests/unittests/test_stage=
s.py
> +index be1a07870..2a9593f61 100644
> +--- a/tests/unittests/test_stages.py
> ++++ b/tests/unittests/test_stages.py
> +@@ -547,17 +547,19 @@ class TestInit_InitializeFilesystem:
> +         # Assert we create it 0o640  by default if it doesn't already e=
xist
> +         assert 0o640 =3D=3D stat.S_IMODE(log_file.stat().mode)
> +
> +-    def test_existing_file_permissions_are_not_modified(self, init, tmp=
dir):
> +-        """If the log file already exists, we should not modify its per=
missions
> +-
> ++    def test_existing_file_permissions(self, init, tmpdir):
> ++        """Test file permissions are set as expected.
> ++        CIS Hardening requires 640 permissions. These permissions are
> ++        currently hardcoded on every boot, but if there's ever a reason
> ++        to change this, we need to then ensure that they
> ++        are *not* set every boot.
> +         See https://bugs.launchpad.net/cloud-init/+bug/1900837.
> +         """
> +-        # Use a mode that will never be made the default so this test w=
ill
> +-        # always be valid
> +-        mode =3D 0o606
> +         log_file =3D tmpdir.join("cloud-init.log")
> +         log_file.ensure()
> +-        log_file.chmod(mode)
> ++        # Use a mode that will never be made the default so this test w=
ill
> ++        # always be valid
> ++        log_file.chmod(0o606)
> +         init._cfg =3D {"def_log_file": str(log_file)}
> +
> +         init._initialize_filesystem()
> +--
> +2.35.7
> diff --git a/recipes-extended/cloud-init/cloud-init_21.4.bb b/recipes-ext=
ended/cloud-init/cloud-init_21.4.bb
> index 5cb62272..b9573420 100644
> --- a/recipes-extended/cloud-init/cloud-init_21.4.bb
> +++ b/recipes-extended/cloud-init/cloud-init_21.4.bb
> @@ -9,6 +9,7 @@ SRC_URI =3D "git://github.com/canonical/cloud-init;branch=
=3Dmain;protocol=3Dhttps \
>      file://cloud-init-source-local-lsb-functions.patch \
>      file://0001-setup.py-check-for-install-anywhere-in-args.patch \
>      file://0001-setup.py-respect-udevdir-variable.patch \
> +    file://CVE-2023-1786.patch \
>  "
>
>  S =3D "${WORKDIR}/git"
> --
> 2.39.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8511): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8511
> Mute This Topic: https://lists.yoctoproject.org/mt/103239386/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

