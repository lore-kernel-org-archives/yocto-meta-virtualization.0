Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC195FF8875
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 20:16:42 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5288.1777493792715561696
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 13:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=leqixdYe;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8a15ebb3abbso3061146d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Apr 2026 13:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777493792; x=1778098592; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hC4kIM0Js6ZPf+HIBr0GtVWIDLo/ycIOhbJ1shDSjwg=;
        b=leqixdYeOV4XXVl98caVhdCkZoumVLyULw9DqV0YnizgQ84Q/YKzlkOsZl5BGzfDQs
         +4h/hIF+st7fDIU0LuvEeXKXlYW/jFHcAMvA+MwEjczQRYdRoj2FofhOQKMClR9/TnQ/
         7UQcGa1upJLH50WZhm0ENHpS7FaIqFv5CbQ33pwFQ9su/yMCYlsx/OHgOTjzUIW99K/9
         Kr04YzruWerp9soUzSpaVxxpvJXF31JGI0T3QbvQ7XiNhblz0I41JV+H8OjIZSF3eMC9
         Upq4mgW7WyeUu2esnULq7seIF/BAa1jSUHbwVojdqsvJkBsYfSZtmf3kEpTH+sxuDdt9
         3Ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777493792; x=1778098592;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hC4kIM0Js6ZPf+HIBr0GtVWIDLo/ycIOhbJ1shDSjwg=;
        b=LJH9Rc8OVMbfitiMN1/fEIC7x77qXE1PH1bz+GeFE29lCAu4lQUj02RVqoArInbm2M
         t/7LUQZgQONeu8PQV4thWzsZMsoMMOfUdB6bUElYLRV5rUjy8d+y6WhqEqFXgLGUC44q
         oT/6YH3MCODZSxTxNr0uRqCoJpKT2pBpyVvgYCkaQSwIArCYItt+ipl6iVoYVUm7/oTs
         E0hMAYQH2vLwY+p4LFwqRY4llr5V8Q7Tf+vJxGamWx0ohXdhToOF6bCOjc3aIv8tfZoC
         5WU23wxEVRk9mSg6NidDJ4RqgLMHRndoQLDet3I9Rigj6ncaJMB/g5j4/csvwO1GrBtd
         ScRQ==
X-Gm-Message-State: AOJu0Yw8HaFdooLuvF9PLmAbhbYKVE3QhUaS0e4arDVBmyQHfoOub5Kb
	kMCmfMiF4NDlI3q+PjG/i+s6NeGrEaVSYNng9Uuya0Ga/fFeSojrG+9E
X-Gm-Gg: AeBDiev/j34qLBga7gJM6BSJqS3oUjgnEDqnt7UIMDa3D7nLT/nSs0LA6ahyfm1FqSq
	/0bM7ott50pUQ+SZxtRNjhLpft42+HzI+2L4+ZO8sQFW9ULmuCcOryuRx26/5K4x28g3MrM9HeV
	TsSz2XdQ/CfG6cqCeEUlaMYD4p3BbNOmIrGm89TdUr1EH3CxE8eYifQFUz/wmY90bcqIMUVsTv/
	t4S6R2slRTYASx+F5uw6VPTUYkQaj+resVJP79+4KoRB6/lccGQa8Nvcf5PN7E80G1qPZPhJLmq
	1+2A029hElenIBfZeAAgT4d/cZJ03yWrEiiqbe8LdmFrou9WKH51OEyDeDRO7qBgOIocN0AQZ8k
	rpr0AWhYYBblBVUkPVYCQQubTa8XmMG8LwJP7G3JbMvlrDLmn7339G4IZZwXbVNSJjjmqlNEERg
	6jhrIbhYAVCFvUgPUmHXhJyl8MwTrpnWli9L09i+j3d2WBRUR9e2xQEAP79o5qdcMce4+6OTkXa
	db9KI3gQucTNJlIT4mAOPELcCaMcHeY02nN3rNsEwrOBe4=
X-Received: by 2002:a05:6214:401c:b0:8ac:7d13:d18a with SMTP id 6a1803df08f44-8b3e31e3fddmr144888016d6.39.1777493791484;
        Wed, 29 Apr 2026 13:16:31 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef6fcebbsm27039636d6.8.2026.04.29.13.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 13:16:30 -0700 (PDT)
Date: Wed, 29 Apr 2026 20:16:28 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: bin.cao.cn@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] python3-dotenv: Fix CVE-2026-28684
Message-ID: <afJnHOQ79u37IDaL@gmail.com>
References: <20260429085726.1457379-1-bin.cao.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260429085726.1457379-1-bin.cao.cn@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Apr 2026 20:16:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9781

merged.

Bruce

In message: [meta-virtualization][PATCH] python3-dotenv: Fix CVE-2026-28684
on 29/04/2026 Bin Cao via lists.yoctoproject.org wrote:

> Backported from [1], verified with the test script from [2].
> 
> [1] https://github.com/theskumar/python-dotenv/commit/790c5c02991100aa1bf41ee5330aca75edc51311
> [2] https://github.com/theskumar/python-dotenv/security/advisories/GHSA-mf9w-mj56-hr94
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-28684
> 
> Signed-off-by: Bin Cao <bin.cao.cn@windriver.com>
> ---
>  .../python3-dotenv/CVE-2026-28684.patch       | 363 ++++++++++++++++++
>  .../python/python3-dotenv_1.1.0.bb            |   1 +
>  2 files changed, 364 insertions(+)
>  create mode 100644 recipes-devtools/python/python3-dotenv/CVE-2026-28684.patch
> 
> diff --git a/recipes-devtools/python/python3-dotenv/CVE-2026-28684.patch b/recipes-devtools/python/python3-dotenv/CVE-2026-28684.patch
> new file mode 100644
> index 00000000..3302c32e
> --- /dev/null
> +++ b/recipes-devtools/python/python3-dotenv/CVE-2026-28684.patch
> @@ -0,0 +1,363 @@
> +From 3fbba98d80cb3c6bfacf708923c79b9ee8a1489c Mon Sep 17 00:00:00 2001
> +From: Bin Cao <bin.cao.cn@windriver.com>
> +Date: Wed, 29 Apr 2026 11:13:56 +0800
> +Subject: [PATCH] Fix symlink following in set_key/unset_key
> +
> +python-dotenv reads key-value pairs from a .env file and can set them as
> +environment variables. set_key() and unset_key() follow symbolic links
> +when rewriting .env files via shutil.move(), allowing a local attacker
> +to overwrite arbitrary files via a crafted symlink when a cross-device
> +rename fallback is triggered.
> +
> +Fix by replacing shutil.move() with os.replace() and creating the temp
> +file in the same directory as the target to ensure atomic same-device
> +rename. Also preserve the original file mode and avoid blindly following
> +symlinks. Add follow_symlinks parameter to rewrite(), set_key(), and
> +unset_key() to allow opting in to the old behavior when needed.
> +
> +Backported from upstream commit 790c5c02991100aa1bf41ee5330aca75edc51311
> +to v1.1.0.
> +
> +CVE: CVE-2026-28684
> +Upstream-Status: Backport [https://github.com/theskumar/python-dotenv/commit/790c5c02991100aa1bf41ee5330aca75edc51311]
> +Signed-off-by: Bin Cao <bin.cao.cn@windriver.com>
> +---
> + src/dotenv/cli.py  |  15 +++++-
> + src/dotenv/main.py |  72 ++++++++++++++++++++-----
> + tests/test_main.py | 129 +++++++++++++++++++++++++++++++++++++++++++++
> + 3 files changed, 201 insertions(+), 15 deletions(-)
> +
> +diff --git a/src/dotenv/cli.py b/src/dotenv/cli.py
> +index 33ae148..259345b 100644
> +--- a/src/dotenv/cli.py
> ++++ b/src/dotenv/cli.py
> +@@ -93,7 +93,13 @@ def list(ctx: click.Context, format: bool) -> None:
> + @click.argument('key', required=True)
> + @click.argument('value', required=True)
> + def set(ctx: click.Context, key: Any, value: Any) -> None:
> +-    """Store the given key/value."""
> ++    """
> ++    Store the given key/value.
> ++
> ++    This doesn't follow symlinks, to avoid accidentally modifying a file at a
> ++    potentially untrusted path.
> ++    """
> ++
> +     file = ctx.obj['FILE']
> +     quote = ctx.obj['QUOTE']
> +     export = ctx.obj['EXPORT']
> +@@ -125,7 +131,12 @@ def get(ctx: click.Context, key: Any) -> None:
> + @click.pass_context
> + @click.argument('key', required=True)
> + def unset(ctx: click.Context, key: Any) -> None:
> +-    """Removes the given key."""
> ++    """
> ++    Removes the given key.
> ++
> ++    This doesn't follow symlinks, to avoid accidentally modifying a file at a
> ++    potentially untrusted path.
> ++    """
> +     file = ctx.obj['FILE']
> +     quote = ctx.obj['QUOTE']
> +     success, key = unset_key(file, key, quote)
> +diff --git a/src/dotenv/main.py b/src/dotenv/main.py
> +index 1848d60..821bb9b 100644
> +--- a/src/dotenv/main.py
> ++++ b/src/dotenv/main.py
> +@@ -2,7 +2,7 @@ import io
> + import logging
> + import os
> + import pathlib
> +-import shutil
> ++import stat
> + import sys
> + import tempfile
> + from collections import OrderedDict
> +@@ -13,9 +13,7 @@ from .parser import Binding, parse_stream
> + from .variables import parse_variables
> + 
> + # A type alias for a string path to be used for the paths in this file.
> +-# These paths may flow to `open()` and `shutil.move()`; `shutil.move()`
> +-# only accepts string paths, not byte paths or file descriptors. See
> +-# https://github.com/python/typeshed/pull/6832.
> ++# These paths may flow to `open()` and `os.replace()`.
> + StrPath = Union[str, "os.PathLike[str]"]
> + 
> + logger = logging.getLogger(__name__)
> +@@ -131,21 +129,54 @@ def get_key(
> + def rewrite(
> +     path: StrPath,
> +     encoding: Optional[str],
> ++    follow_symlinks: bool = False,
> + ) -> Iterator[Tuple[IO[str], IO[str]]]:
> +-    pathlib.Path(path).touch()
> ++    if follow_symlinks:
> ++        path = os.path.realpath(path)
> + 
> +-    with tempfile.NamedTemporaryFile(mode="w", encoding=encoding, delete=False) as dest:
> ++    try:
> ++        source: IO[str] = open(path, encoding=encoding)
> ++        try:
> ++            path_stat = os.lstat(path)
> ++            original_mode: Optional[int] = (
> ++                stat.S_IMODE(path_stat.st_mode)
> ++                if stat.S_ISREG(path_stat.st_mode)
> ++                else None
> ++            )
> ++        except BaseException:
> ++            source.close()
> ++            raise
> ++    except FileNotFoundError:
> ++        source = io.StringIO("")
> ++        original_mode = None
> ++
> ++    with tempfile.NamedTemporaryFile(
> ++        mode="w",
> ++        encoding=encoding,
> ++        delete=False,
> ++        prefix=".tmp_",
> ++        dir=os.path.dirname(os.path.abspath(path)),
> ++    ) as dest:
> ++        dest_path = pathlib.Path(dest.name)
> +         error = None
> ++
> +         try:
> +-            with open(path, encoding=encoding) as source:
> ++            with source:
> +                 yield (source, dest)
> +         except BaseException as err:
> +             error = err
> + 
> +     if error is None:
> +-        shutil.move(dest.name, path)
> ++        try:
> ++            if original_mode is not None:
> ++                os.chmod(dest_path, original_mode)
> ++
> ++            os.replace(dest_path, path)
> ++        except BaseException:
> ++            dest_path.unlink(missing_ok=True)
> ++            raise
> +     else:
> +-        os.unlink(dest.name)
> ++        dest_path.unlink(missing_ok=True)
> +         raise error from None
> + 
> + 
> +@@ -156,12 +187,16 @@ def set_key(
> +     quote_mode: str = "always",
> +     export: bool = False,
> +     encoding: Optional[str] = "utf-8",
> ++    follow_symlinks: bool = False,
> + ) -> Tuple[Optional[bool], str, str]:
> +     """
> +     Adds or Updates a key/value to the given .env
> + 
> +-    If the .env path given doesn't exist, fails instead of risking creating
> +-    an orphan .env somewhere in the filesystem
> ++    The target .env file is created if it doesn't exist.
> ++
> ++    This function doesn't follow symlinks by default, to avoid accidentally
> ++    modifying a file at a potentially untrusted path. If you don't need this
> ++    protection and need symlinks to be followed, use `follow_symlinks`.
> +     """
> +     if quote_mode not in ("always", "auto", "never"):
> +         raise ValueError(f"Unknown quote_mode: {quote_mode}")
> +@@ -179,7 +214,10 @@ def set_key(
> +     else:
> +         line_out = f"{key_to_set}={value_out}\n"
> + 
> +-    with rewrite(dotenv_path, encoding=encoding) as (source, dest):
> ++    with rewrite(dotenv_path, encoding=encoding, follow_symlinks=follow_symlinks) as (
> ++        source,
> ++        dest,
> ++    ):
> +         replaced = False
> +         missing_newline = False
> +         for mapping in with_warn_for_invalid_lines(parse_stream(source)):
> +@@ -202,19 +240,27 @@ def unset_key(
> +     key_to_unset: str,
> +     quote_mode: str = "always",
> +     encoding: Optional[str] = "utf-8",
> ++    follow_symlinks: bool = False,
> + ) -> Tuple[Optional[bool], str]:
> +     """
> +     Removes a given key from the given `.env` file.
> + 
> +     If the .env path given doesn't exist, fails.
> +     If the given key doesn't exist in the .env, fails.
> ++
> ++    This function doesn't follow symlinks by default, to avoid accidentally
> ++    modifying a file at a potentially untrusted path. If you don't need this
> ++    protection and need symlinks to be followed, use `follow_symlinks`.
> +     """
> +     if not os.path.exists(dotenv_path):
> +         logger.warning("Can't delete from %s - it doesn't exist.", dotenv_path)
> +         return None, key_to_unset
> + 
> +     removed = False
> +-    with rewrite(dotenv_path, encoding=encoding) as (source, dest):
> ++    with rewrite(dotenv_path, encoding=encoding, follow_symlinks=follow_symlinks) as (
> ++        source,
> ++        dest,
> ++    ):
> +         for mapping in with_warn_for_invalid_lines(parse_stream(source)):
> +             if mapping.key == key_to_unset:
> +                 removed = True
> +diff --git a/tests/test_main.py b/tests/test_main.py
> +index 2d63eec..fbae934 100644
> +--- a/tests/test_main.py
> ++++ b/tests/test_main.py
> +@@ -1,6 +1,7 @@
> + import io
> + import logging
> + import os
> ++import stat
> + import sys
> + import textwrap
> + from unittest import mock
> +@@ -61,6 +62,86 @@ def test_set_key_encoding(dotenv_path):
> +     assert dotenv_path.read_text(encoding=encoding) == "a='�'\n"
> + 
> + 
> ++@pytest.mark.skipif(
> ++    sys.platform == "win32", reason="file mode bits behave differently on Windows"
> ++)
> ++def test_set_key_preserves_file_mode(dotenv_path):
> ++    dotenv_path.write_text("a=x\n")
> ++    dotenv_path.chmod(0o640)
> ++    mode_before = stat.S_IMODE(dotenv_path.stat().st_mode)
> ++
> ++    dotenv.set_key(dotenv_path, "a", "y")
> ++
> ++    mode_after = stat.S_IMODE(dotenv_path.stat().st_mode)
> ++    assert mode_before == mode_after
> ++
> ++
> ++def test_rewrite_closes_file_handle_on_lstat_failure(tmp_path):
> ++    dotenv_path = tmp_path / ".env"
> ++    dotenv_path.write_text("a=x\n")
> ++    real_open = open
> ++    opened_handles = []
> ++
> ++    def tracking_open(*args, **kwargs):
> ++        handle = real_open(*args, **kwargs)
> ++        opened_handles.append(handle)
> ++        return handle
> ++
> ++    with mock.patch("dotenv.main.os.lstat", side_effect=FileNotFoundError):
> ++        with mock.patch("dotenv.main.open", side_effect=tracking_open):
> ++            dotenv.set_key(dotenv_path, "a", "x")
> ++
> ++    assert opened_handles, "expected at least one file to be opened"
> ++    assert all(handle.closed for handle in opened_handles)
> ++
> ++
> ++@pytest.mark.skipif(
> ++    sys.platform == "win32", reason="symlinks require elevated privileges on Windows"
> ++)
> ++def test_set_key_symlink_to_existing_file(tmp_path):
> ++    target = tmp_path / "target.env"
> ++    target.write_text("a=x\n")
> ++    symlink = tmp_path / ".env"
> ++    symlink.symlink_to(target)
> ++
> ++    dotenv.set_key(symlink, "a", "y")
> ++
> ++    assert target.read_text() == "a=x\n"
> ++    assert not symlink.is_symlink()
> ++    assert "a='y'" in symlink.read_text()
> ++    assert stat.S_IMODE(symlink.stat().st_mode) == 0o600
> ++
> ++
> ++@pytest.mark.skipif(
> ++    sys.platform == "win32", reason="symlinks require elevated privileges on Windows"
> ++)
> ++def test_set_key_symlink_to_missing_file(tmp_path):
> ++    target = tmp_path / "nx"
> ++    symlink = tmp_path / ".env"
> ++    symlink.symlink_to(target)
> ++
> ++    dotenv.set_key(symlink, "a", "x")
> ++
> ++    assert not target.exists()
> ++    assert not symlink.is_symlink()
> ++    assert symlink.read_text() == "a='x'\n"
> ++
> ++
> ++@pytest.mark.skipif(
> ++    sys.platform == "win32", reason="symlinks require elevated privileges on Windows"
> ++)
> ++def test_set_key_follow_symlinks(tmp_path):
> ++    target = tmp_path / "target.env"
> ++    target.write_text("a=x\n")
> ++    symlink = tmp_path / ".env"
> ++    symlink.symlink_to(target)
> ++
> ++    dotenv.set_key(symlink, "a", "y", follow_symlinks=True)
> ++
> ++    assert target.read_text() == "a='y'\n"
> ++    assert symlink.is_symlink()
> ++
> ++
> + def test_set_key_permission_error(dotenv_path):
> +     dotenv_path.chmod(0o000)
> + 
> +@@ -188,6 +269,54 @@ def test_unset_non_existent_file(tmp_path):
> +     )
> + 
> + 
> ++@pytest.mark.skipif(
> ++    sys.platform == "win32", reason="symlinks require elevated privileges on Windows"
> ++)
> ++def test_unset_key_symlink_to_existing_file(tmp_path):
> ++    target = tmp_path / "target.env"
> ++    target.write_text("a=x\n")
> ++    symlink = tmp_path / ".env"
> ++    symlink.symlink_to(target)
> ++
> ++    dotenv.unset_key(symlink, "a")
> ++
> ++    assert target.read_text() == "a=x\n"
> ++    assert not symlink.is_symlink()
> ++    assert symlink.read_text() == ""
> ++
> ++
> ++@pytest.mark.skipif(
> ++    sys.platform == "win32", reason="symlinks require elevated privileges on Windows"
> ++)
> ++def test_unset_key_symlink_to_missing_file(tmp_path):
> ++    target = tmp_path / "nx"
> ++    symlink = tmp_path / ".env"
> ++    symlink.symlink_to(target)
> ++    logger = logging.getLogger("dotenv.main")
> ++
> ++    with mock.patch.object(logger, "warning") as mock_warning:
> ++        result = dotenv.unset_key(symlink, "a")
> ++
> ++    assert result == (None, "a")
> ++    assert symlink.is_symlink()
> ++    mock_warning.assert_called_once()
> ++
> ++
> ++@pytest.mark.skipif(
> ++    sys.platform == "win32", reason="symlinks require elevated privileges on Windows"
> ++)
> ++def test_unset_key_follow_symlinks(tmp_path):
> ++    target = tmp_path / "target.env"
> ++    target.write_text("a=b\n")
> ++    symlink = tmp_path / ".env"
> ++    symlink.symlink_to(target)
> ++
> ++    dotenv.unset_key(symlink, "a", follow_symlinks=True)
> ++
> ++    assert target.read_text() == ""
> ++    assert symlink.is_symlink()
> ++
> ++
> + def prepare_file_hierarchy(path):
> +     """
> +     Create a temporary folder structure like the following:
> +-- 
> +2.43.0
> +
> diff --git a/recipes-devtools/python/python3-dotenv_1.1.0.bb b/recipes-devtools/python/python3-dotenv_1.1.0.bb
> index 7e20a444..04c2c0b8 100644
> --- a/recipes-devtools/python/python3-dotenv_1.1.0.bb
> +++ b/recipes-devtools/python/python3-dotenv_1.1.0.bb
> @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e914cdb773ae44a732b392532d88f072"
>  PYPI_PACKAGE = "python_dotenv"
>  UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
>  
> +SRC_URI += "file://CVE-2026-28684.patch"
>  SRC_URI[sha256sum] = "41f90bc6f5f177fb41f53e87666db362025010eb28f60a01c9143bfa33a2b2d5"
>  
>  inherit pypi setuptools3
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9778): https://lists.yoctoproject.org/g/meta-virtualization/message/9778
> Mute This Topic: https://lists.yoctoproject.org/mt/119061439/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


