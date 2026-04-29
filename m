Return-Path: <bin.cao.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F672FF8864
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 08:57:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6900.1777453050652422849
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 01:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=W8EkzWQ3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95799b928f=bin.cao.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T79SEU1777393
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Apr 2026 08:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=jhM0Foe2h/NevFa/O3FP
	e4xn6WvK6CrNiKk5svIpK50=; b=W8EkzWQ39hGVn4gd7fDQL2Vw/92H3XT6PPey
	HYb41StJOEzdw8k44KkzE42Q61GiAnh5WdYLsZUtPiulhLUSNP7OxwUsUuKIq/eN
	+MWmDAtkzUMTQneUgJkudTXjvTMUGtoCBhI3O2LrRUuVQLDi90Ro2vVo7Vpyg4Yt
	Sro5SzxUv48oGp727NozhnV568i5GhfR6+IQhJupESl4s2h47Ap+/I4dWt5BgaVE
	I5j5KeX4Td3yDidH4wiT0b32JM7ulOJqID/ljxLykl8mSbP7+RcFE2Kcz1Tp6XbG
	P1Kd5CcTDRSW1hV8Y64O6Izy86L2rYNGBr72RGOTLxCILr0ACw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drmk6vns7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Apr 2026 08:57:29 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 29 Apr 2026 01:57:27 -0700
Received: from pek-lpggp2.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 29 Apr 2026 01:57:27 -0700
From: Bin Cao <bin.cao.cn@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] python3-dotenv: Fix CVE-2026-28684
Date: Wed, 29 Apr 2026 16:57:18 +0800
Message-ID: <20260429085726.1457379-1-bin.cao.cn@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: wk5aHVGEgKcWbc6x_ScTMIZE6fWmBSdd
X-Proofpoint-GUID: wk5aHVGEgKcWbc6x_ScTMIZE6fWmBSdd
X-Authority-Analysis: v=2.4 cv=RN6D2Yi+ c=1 sm=1 tr=0 ts=69f1c7f9 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=PYnjg3YJAAAA:8 a=t7CeM3EgAAAA:8 a=jCZUtfYWzCyMrIidMpUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4OSBTYWx0ZWRfX8ocGfPgScuIu
 u1UnVYebQ2qd3d7nYbTnyxNO6JgO+Rmw3Y3LSAEtLrEBTTPNmXs1JpoLDx5IWsA8t03TfdiScZl
 ThfuMx7RUlEj3gEhC7aWhgKXH5me+rZeY8u2OxHuqycf3HLpPGY/drLvlN1oT8CP8ks2nYpU4cz
 XUofqTtOnZIJZbyy450XgUSf5X37LP3mSzs3Kh9m5v9OyjoFZbNN9KduJzvQWSJ4Ylgil6mAqsD
 dZWqKu+94iHgD8J/RqN/a4L3wRUnM/sIn6IxZCG+J8BLNzSqhp62XnOktZZSrNQKl902z5azVLe
 qlbwbwFkPhegIznw8M5DmY0midlqSRAmNzGB7iwgDwltHJX/4X3Yc3EsL1N2YAwx8dFO5PGECUR
 CitntUYYpaV8jMr7cls5wWayFiXFDuqA5+Jf3k7ydWtY/y+MQ+UiZVEHw88xSCE92dUQhcgEqVX
 0rnYpEe+p86UeIEdvRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290089
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63T79SEU1777393
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Apr 2026 08:57:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9778

Backported from [1], verified with the test script from [2].

[1] https://github.com/theskumar/python-dotenv/commit/790c5c02991100aa1bf=
41ee5330aca75edc51311
[2] https://github.com/theskumar/python-dotenv/security/advisories/GHSA-m=
f9w-mj56-hr94
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-28684

Signed-off-by: Bin Cao <bin.cao.cn@windriver.com>
---
 .../python3-dotenv/CVE-2026-28684.patch       | 363 ++++++++++++++++++
 .../python/python3-dotenv_1.1.0.bb            |   1 +
 2 files changed, 364 insertions(+)
 create mode 100644 recipes-devtools/python/python3-dotenv/CVE-2026-28684=
.patch

diff --git a/recipes-devtools/python/python3-dotenv/CVE-2026-28684.patch =
b/recipes-devtools/python/python3-dotenv/CVE-2026-28684.patch
new file mode 100644
index 00000000..3302c32e
--- /dev/null
+++ b/recipes-devtools/python/python3-dotenv/CVE-2026-28684.patch
@@ -0,0 +1,363 @@
+From 3fbba98d80cb3c6bfacf708923c79b9ee8a1489c Mon Sep 17 00:00:00 2001
+From: Bin Cao <bin.cao.cn@windriver.com>
+Date: Wed, 29 Apr 2026 11:13:56 +0800
+Subject: [PATCH] Fix symlink following in set_key/unset_key
+
+python-dotenv reads key-value pairs from a .env file and can set them as
+environment variables. set_key() and unset_key() follow symbolic links
+when rewriting .env files via shutil.move(), allowing a local attacker
+to overwrite arbitrary files via a crafted symlink when a cross-device
+rename fallback is triggered.
+
+Fix by replacing shutil.move() with os.replace() and creating the temp
+file in the same directory as the target to ensure atomic same-device
+rename. Also preserve the original file mode and avoid blindly following
+symlinks. Add follow_symlinks parameter to rewrite(), set_key(), and
+unset_key() to allow opting in to the old behavior when needed.
+
+Backported from upstream commit 790c5c02991100aa1bf41ee5330aca75edc51311
+to v1.1.0.
+
+CVE: CVE-2026-28684
+Upstream-Status: Backport [https://github.com/theskumar/python-dotenv/co=
mmit/790c5c02991100aa1bf41ee5330aca75edc51311]
+Signed-off-by: Bin Cao <bin.cao.cn@windriver.com>
+---
+ src/dotenv/cli.py  |  15 +++++-
+ src/dotenv/main.py |  72 ++++++++++++++++++++-----
+ tests/test_main.py | 129 +++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 201 insertions(+), 15 deletions(-)
+
+diff --git a/src/dotenv/cli.py b/src/dotenv/cli.py
+index 33ae148..259345b 100644
+--- a/src/dotenv/cli.py
++++ b/src/dotenv/cli.py
+@@ -93,7 +93,13 @@ def list(ctx: click.Context, format: bool) -> None:
+ @click.argument('key', required=3DTrue)
+ @click.argument('value', required=3DTrue)
+ def set(ctx: click.Context, key: Any, value: Any) -> None:
+-    """Store the given key/value."""
++    """
++    Store the given key/value.
++
++    This doesn't follow symlinks, to avoid accidentally modifying a fil=
e at a
++    potentially untrusted path.
++    """
++
+     file =3D ctx.obj['FILE']
+     quote =3D ctx.obj['QUOTE']
+     export =3D ctx.obj['EXPORT']
+@@ -125,7 +131,12 @@ def get(ctx: click.Context, key: Any) -> None:
+ @click.pass_context
+ @click.argument('key', required=3DTrue)
+ def unset(ctx: click.Context, key: Any) -> None:
+-    """Removes the given key."""
++    """
++    Removes the given key.
++
++    This doesn't follow symlinks, to avoid accidentally modifying a fil=
e at a
++    potentially untrusted path.
++    """
+     file =3D ctx.obj['FILE']
+     quote =3D ctx.obj['QUOTE']
+     success, key =3D unset_key(file, key, quote)
+diff --git a/src/dotenv/main.py b/src/dotenv/main.py
+index 1848d60..821bb9b 100644
+--- a/src/dotenv/main.py
++++ b/src/dotenv/main.py
+@@ -2,7 +2,7 @@ import io
+ import logging
+ import os
+ import pathlib
+-import shutil
++import stat
+ import sys
+ import tempfile
+ from collections import OrderedDict
+@@ -13,9 +13,7 @@ from .parser import Binding, parse_stream
+ from .variables import parse_variables
+=20
+ # A type alias for a string path to be used for the paths in this file.
+-# These paths may flow to `open()` and `shutil.move()`; `shutil.move()`
+-# only accepts string paths, not byte paths or file descriptors. See
+-# https://github.com/python/typeshed/pull/6832.
++# These paths may flow to `open()` and `os.replace()`.
+ StrPath =3D Union[str, "os.PathLike[str]"]
+=20
+ logger =3D logging.getLogger(__name__)
+@@ -131,21 +129,54 @@ def get_key(
+ def rewrite(
+     path: StrPath,
+     encoding: Optional[str],
++    follow_symlinks: bool =3D False,
+ ) -> Iterator[Tuple[IO[str], IO[str]]]:
+-    pathlib.Path(path).touch()
++    if follow_symlinks:
++        path =3D os.path.realpath(path)
+=20
+-    with tempfile.NamedTemporaryFile(mode=3D"w", encoding=3Dencoding, d=
elete=3DFalse) as dest:
++    try:
++        source: IO[str] =3D open(path, encoding=3Dencoding)
++        try:
++            path_stat =3D os.lstat(path)
++            original_mode: Optional[int] =3D (
++                stat.S_IMODE(path_stat.st_mode)
++                if stat.S_ISREG(path_stat.st_mode)
++                else None
++            )
++        except BaseException:
++            source.close()
++            raise
++    except FileNotFoundError:
++        source =3D io.StringIO("")
++        original_mode =3D None
++
++    with tempfile.NamedTemporaryFile(
++        mode=3D"w",
++        encoding=3Dencoding,
++        delete=3DFalse,
++        prefix=3D".tmp_",
++        dir=3Dos.path.dirname(os.path.abspath(path)),
++    ) as dest:
++        dest_path =3D pathlib.Path(dest.name)
+         error =3D None
++
+         try:
+-            with open(path, encoding=3Dencoding) as source:
++            with source:
+                 yield (source, dest)
+         except BaseException as err:
+             error =3D err
+=20
+     if error is None:
+-        shutil.move(dest.name, path)
++        try:
++            if original_mode is not None:
++                os.chmod(dest_path, original_mode)
++
++            os.replace(dest_path, path)
++        except BaseException:
++            dest_path.unlink(missing_ok=3DTrue)
++            raise
+     else:
+-        os.unlink(dest.name)
++        dest_path.unlink(missing_ok=3DTrue)
+         raise error from None
+=20
+=20
+@@ -156,12 +187,16 @@ def set_key(
+     quote_mode: str =3D "always",
+     export: bool =3D False,
+     encoding: Optional[str] =3D "utf-8",
++    follow_symlinks: bool =3D False,
+ ) -> Tuple[Optional[bool], str, str]:
+     """
+     Adds or Updates a key/value to the given .env
+=20
+-    If the .env path given doesn't exist, fails instead of risking crea=
ting
+-    an orphan .env somewhere in the filesystem
++    The target .env file is created if it doesn't exist.
++
++    This function doesn't follow symlinks by default, to avoid accident=
ally
++    modifying a file at a potentially untrusted path. If you don't need=
 this
++    protection and need symlinks to be followed, use `follow_symlinks`.
+     """
+     if quote_mode not in ("always", "auto", "never"):
+         raise ValueError(f"Unknown quote_mode: {quote_mode}")
+@@ -179,7 +214,10 @@ def set_key(
+     else:
+         line_out =3D f"{key_to_set}=3D{value_out}\n"
+=20
+-    with rewrite(dotenv_path, encoding=3Dencoding) as (source, dest):
++    with rewrite(dotenv_path, encoding=3Dencoding, follow_symlinks=3Dfo=
llow_symlinks) as (
++        source,
++        dest,
++    ):
+         replaced =3D False
+         missing_newline =3D False
+         for mapping in with_warn_for_invalid_lines(parse_stream(source)=
):
+@@ -202,19 +240,27 @@ def unset_key(
+     key_to_unset: str,
+     quote_mode: str =3D "always",
+     encoding: Optional[str] =3D "utf-8",
++    follow_symlinks: bool =3D False,
+ ) -> Tuple[Optional[bool], str]:
+     """
+     Removes a given key from the given `.env` file.
+=20
+     If the .env path given doesn't exist, fails.
+     If the given key doesn't exist in the .env, fails.
++
++    This function doesn't follow symlinks by default, to avoid accident=
ally
++    modifying a file at a potentially untrusted path. If you don't need=
 this
++    protection and need symlinks to be followed, use `follow_symlinks`.
+     """
+     if not os.path.exists(dotenv_path):
+         logger.warning("Can't delete from %s - it doesn't exist.", dote=
nv_path)
+         return None, key_to_unset
+=20
+     removed =3D False
+-    with rewrite(dotenv_path, encoding=3Dencoding) as (source, dest):
++    with rewrite(dotenv_path, encoding=3Dencoding, follow_symlinks=3Dfo=
llow_symlinks) as (
++        source,
++        dest,
++    ):
+         for mapping in with_warn_for_invalid_lines(parse_stream(source)=
):
+             if mapping.key =3D=3D key_to_unset:
+                 removed =3D True
+diff --git a/tests/test_main.py b/tests/test_main.py
+index 2d63eec..fbae934 100644
+--- a/tests/test_main.py
++++ b/tests/test_main.py
+@@ -1,6 +1,7 @@
+ import io
+ import logging
+ import os
++import stat
+ import sys
+ import textwrap
+ from unittest import mock
+@@ -61,6 +62,86 @@ def test_set_key_encoding(dotenv_path):
+     assert dotenv_path.read_text(encoding=3Dencoding) =3D=3D "a=3D'=C3=A9=
'\n"
+=20
+=20
++@pytest.mark.skipif(
++    sys.platform =3D=3D "win32", reason=3D"file mode bits behave differ=
ently on Windows"
++)
++def test_set_key_preserves_file_mode(dotenv_path):
++    dotenv_path.write_text("a=3Dx\n")
++    dotenv_path.chmod(0o640)
++    mode_before =3D stat.S_IMODE(dotenv_path.stat().st_mode)
++
++    dotenv.set_key(dotenv_path, "a", "y")
++
++    mode_after =3D stat.S_IMODE(dotenv_path.stat().st_mode)
++    assert mode_before =3D=3D mode_after
++
++
++def test_rewrite_closes_file_handle_on_lstat_failure(tmp_path):
++    dotenv_path =3D tmp_path / ".env"
++    dotenv_path.write_text("a=3Dx\n")
++    real_open =3D open
++    opened_handles =3D []
++
++    def tracking_open(*args, **kwargs):
++        handle =3D real_open(*args, **kwargs)
++        opened_handles.append(handle)
++        return handle
++
++    with mock.patch("dotenv.main.os.lstat", side_effect=3DFileNotFoundE=
rror):
++        with mock.patch("dotenv.main.open", side_effect=3Dtracking_open=
):
++            dotenv.set_key(dotenv_path, "a", "x")
++
++    assert opened_handles, "expected at least one file to be opened"
++    assert all(handle.closed for handle in opened_handles)
++
++
++@pytest.mark.skipif(
++    sys.platform =3D=3D "win32", reason=3D"symlinks require elevated pr=
ivileges on Windows"
++)
++def test_set_key_symlink_to_existing_file(tmp_path):
++    target =3D tmp_path / "target.env"
++    target.write_text("a=3Dx\n")
++    symlink =3D tmp_path / ".env"
++    symlink.symlink_to(target)
++
++    dotenv.set_key(symlink, "a", "y")
++
++    assert target.read_text() =3D=3D "a=3Dx\n"
++    assert not symlink.is_symlink()
++    assert "a=3D'y'" in symlink.read_text()
++    assert stat.S_IMODE(symlink.stat().st_mode) =3D=3D 0o600
++
++
++@pytest.mark.skipif(
++    sys.platform =3D=3D "win32", reason=3D"symlinks require elevated pr=
ivileges on Windows"
++)
++def test_set_key_symlink_to_missing_file(tmp_path):
++    target =3D tmp_path / "nx"
++    symlink =3D tmp_path / ".env"
++    symlink.symlink_to(target)
++
++    dotenv.set_key(symlink, "a", "x")
++
++    assert not target.exists()
++    assert not symlink.is_symlink()
++    assert symlink.read_text() =3D=3D "a=3D'x'\n"
++
++
++@pytest.mark.skipif(
++    sys.platform =3D=3D "win32", reason=3D"symlinks require elevated pr=
ivileges on Windows"
++)
++def test_set_key_follow_symlinks(tmp_path):
++    target =3D tmp_path / "target.env"
++    target.write_text("a=3Dx\n")
++    symlink =3D tmp_path / ".env"
++    symlink.symlink_to(target)
++
++    dotenv.set_key(symlink, "a", "y", follow_symlinks=3DTrue)
++
++    assert target.read_text() =3D=3D "a=3D'y'\n"
++    assert symlink.is_symlink()
++
++
+ def test_set_key_permission_error(dotenv_path):
+     dotenv_path.chmod(0o000)
+=20
+@@ -188,6 +269,54 @@ def test_unset_non_existent_file(tmp_path):
+     )
+=20
+=20
++@pytest.mark.skipif(
++    sys.platform =3D=3D "win32", reason=3D"symlinks require elevated pr=
ivileges on Windows"
++)
++def test_unset_key_symlink_to_existing_file(tmp_path):
++    target =3D tmp_path / "target.env"
++    target.write_text("a=3Dx\n")
++    symlink =3D tmp_path / ".env"
++    symlink.symlink_to(target)
++
++    dotenv.unset_key(symlink, "a")
++
++    assert target.read_text() =3D=3D "a=3Dx\n"
++    assert not symlink.is_symlink()
++    assert symlink.read_text() =3D=3D ""
++
++
++@pytest.mark.skipif(
++    sys.platform =3D=3D "win32", reason=3D"symlinks require elevated pr=
ivileges on Windows"
++)
++def test_unset_key_symlink_to_missing_file(tmp_path):
++    target =3D tmp_path / "nx"
++    symlink =3D tmp_path / ".env"
++    symlink.symlink_to(target)
++    logger =3D logging.getLogger("dotenv.main")
++
++    with mock.patch.object(logger, "warning") as mock_warning:
++        result =3D dotenv.unset_key(symlink, "a")
++
++    assert result =3D=3D (None, "a")
++    assert symlink.is_symlink()
++    mock_warning.assert_called_once()
++
++
++@pytest.mark.skipif(
++    sys.platform =3D=3D "win32", reason=3D"symlinks require elevated pr=
ivileges on Windows"
++)
++def test_unset_key_follow_symlinks(tmp_path):
++    target =3D tmp_path / "target.env"
++    target.write_text("a=3Db\n")
++    symlink =3D tmp_path / ".env"
++    symlink.symlink_to(target)
++
++    dotenv.unset_key(symlink, "a", follow_symlinks=3DTrue)
++
++    assert target.read_text() =3D=3D ""
++    assert symlink.is_symlink()
++
++
+ def prepare_file_hierarchy(path):
+     """
+     Create a temporary folder structure like the following:
+--=20
+2.43.0
+
diff --git a/recipes-devtools/python/python3-dotenv_1.1.0.bb b/recipes-de=
vtools/python/python3-dotenv_1.1.0.bb
index 7e20a444..04c2c0b8 100644
--- a/recipes-devtools/python/python3-dotenv_1.1.0.bb
+++ b/recipes-devtools/python/python3-dotenv_1.1.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De914cdb773ae44=
a732b392532d88f072"
 PYPI_PACKAGE =3D "python_dotenv"
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
+SRC_URI +=3D "file://CVE-2026-28684.patch"
 SRC_URI[sha256sum] =3D "41f90bc6f5f177fb41f53e87666db362025010eb28f60a01=
c9143bfa33a2b2d5"
=20
 inherit pypi setuptools3
--=20
2.43.0


