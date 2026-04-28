Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C79DFF8864
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 01:13:43 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2363.1777338818808106993
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 18:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IcUQoP3Y;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35e563b0ee7so5165864a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Apr 2026 18:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777338818; x=1777943618; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3wSlRvhjqAQrDA01y3QKiD0HFNFO+fMOt1X4ydHPLHA=;
        b=IcUQoP3YeNvWPzR6Frqj4ZL4/XeOcO1+byhO0W7Hir3jh91aIzTYuMfkeEDoHx+3oi
         gkRcmXv1AM2LuwnduJ7F0R7Mp7mwsS55ijlo0nvjKUzLUKNT7TWmw8z8t4LWzi8nMoi3
         RMQLmMqI03Avj77yb4twC4mUmv2v6Fb1/J6uTu53cR6rYk6rNmsXt1YOUnSQFUMZwP54
         rnJy+qRBqPeV5/icPrHBicdne9QGTU4i7Udt/eBrKpHWBRVAP/n072mBw/nJHby+I7dG
         Tlq7iWDMj9bWq1b0/45jpDLrtKLD8BqzJ/tg1rAEDEkVfrHu65dkVKpC/1DWPupU9zoh
         dDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777338818; x=1777943618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3wSlRvhjqAQrDA01y3QKiD0HFNFO+fMOt1X4ydHPLHA=;
        b=ohLwPCXoc0gZyNt0X8efMoX2oPBlDZJ7ZIh26KeoEHXki5Hyt8RhvPvlSchkayu8m6
         A4ivRtcy/fwaXQOJId3tnhtvdDUUGBApt8TapoJs5Oa9fFwBM1UejHGdcv+IFgsCjlnk
         lUzxDReH6O9yz+P8s8nawzbLw7Om+1jg+VQ2Tb6Pmny6DidqVEXFRzQRbHDvdtX6AWjR
         0OBO5omQM3ra7+tOVjdSKg7mIsy6qFva4PvrkMFGWHTM7PViI8mnguqOg/284UTr8Y+9
         +/2jRCl42AI63jRM4AWpwJ1jwOVCBLFc+r2basGpZcwFIdVSlmcfUEiUELwBjQHHehoE
         m+pg==
X-Gm-Message-State: AOJu0YyIITFcqEqPCT2AxjGAsFlimIXme/6DyWonwlarXnHpA1LEwPXH
	s96jYOrvRd7DhxqHxCctY5nu4vgn6ltWOfMDjsTozrxM8yJrfU9byluwjQmRrD9x
X-Gm-Gg: AeBDieuTKO1wfX49gPXCaWTkbMKyzlmg1oMGEJqzCEoImIa4BMpCHGRWSy9Ws6USUuu
	pKvCt+nVcEceBfiK994GuhE41jgJLslzcXgqyKoTVBI5Qqk2SqSdUl/uuin+VsEd3InpaNdp/SY
	m83WR6U+Jadk5PuxWUYqUge9d2spfUoRcy/TI9oJhsaHm93HSE5gPVcnHwMPOvBgNG9EnrgvEzf
	70qcgP3kfpPFGMyTQVf/0sTaggwVZO6djTu5yAkA6I9QyO8L7XFsYtP+iVRf0Esm9n9SxJ78B0h
	VJPXG1XwQ0cYcn4WmbnsscHZv5EXnT2ZqHUjBgskxjgI0KKGGcPNNyQJOm2Egp/JsfiavUTd8Ui
	WvEp1LP15yC9vKnn3C8+gY+ZcJToorxDVGyEAO3BGzwqAuKTcX35B5PSl4MBShHoMA0rNvQsE3b
	cCc/Fawt1hI74gDOZhiHBIHvonoyCjvI2dNc63/mL0OcF3vA68NJafiXzAAeiTD34t+sgliNx6Y
	dcysYGteDVPaUP6wSwjvDRWl1vlR+wLGg==
X-Received: by 2002:a17:90b:35cf:b0:35d:a1ce:c1 with SMTP id 98e67ed59e1d1-36491a23668mr804732a91.8.1777338817544;
        Mon, 27 Apr 2026 18:13:37 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490035847sm854772a91.7.2026.04.27.18.13.36
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Apr 2026 18:13:36 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [RFC PATCH 4/4] vcontainer-tarball: fix SDK environment script for CI
Date: Mon, 27 Apr 2026 18:13:14 -0700
Message-ID: <26a08ff9d76bb10e58a61d5ab0d136fa2023a3fb.1777337030.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1777337030.git.tim.orling@konsulko.com>
References: <cover.1777337030.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 01:13:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9753

When running in an AutoBuilder context, the variables are stripped
since the script is not actually "sourced", but rather parsed.

This resulted in VCONTAINER_DIR being empty and therefore no
'vdkr', 'vpdmn' and friends available to run in CI builder steps.

AI-Generated: Claude Cowork Opus 4.7
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../vcontainer/vcontainer-tarball.bb          | 69 +++++++++++++++----
 1 file changed, 57 insertions(+), 12 deletions(-)

diff --git a/recipes-containers/vcontainer/vcontainer-tarball.bb b/recipes-containers/vcontainer/vcontainer-tarball.bb
index ed9b8e13..9564164c 100644
--- a/recipes-containers/vcontainer/vcontainer-tarball.bb
+++ b/recipes-containers/vcontainer/vcontainer-tarball.bb
@@ -353,20 +353,57 @@ EOF
     script=${SDK_OUTPUT}/${SDKPATH}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
 
     # Create environment script
-    # Set OECORE_NATIVE_SYSROOT temporarily for SDK relocation, then unset it
-    # (like buildtools-tarball does to avoid confusing other Yocto tools)
+    #
+    # The script is written so that it works both when sourced by bash (the
+    # normal interactive / devshell case) AND when "installed" by
+    # yocto-autobuilder-helper's enable_tools_tarball() in CI, which does NOT
+    # source the file with bash -- it parses line by line in Python and only
+    # honours lines that start with "export " or "unset " at column 0, and
+    # only substitutes $PATH (see yocto-autobuilder-helper/scripts/utils.py).
+    #
+    # Consequences:
+    #  - The primary VCONTAINER_DIR / OECORE_NATIVE_SYSROOT / PATH values must
+    #    be emitted as plain `export FOO="<absolute-path>"` lines with the
+    #    absolute paths baked in at build time via Yocto variables
+    #    (${SDKPATH}, ${SDKPATHNATIVE}). Yocto SDK relocation rewrites these
+    #    paths at install time (via the installer's -d <dir> argument).
+    #  - PATH must not reference $VCONTAINER_DIR / $OECORE_NATIVE_SYSROOT via
+    #    shell indirection (the Python parser won't expand them); inline the
+    #    absolute paths there too.
+    #  - Any bash-only refinement (BASH_SOURCE-based relocation, final
+    #    unset of OECORE_NATIVE_SYSROOT) lives inside an `if` block so the
+    #    Python parser ignores it, while real bash still executes it.
     cat > $script <<'HEADER'
 #!/bin/bash
 # vcontainer environment setup script
 # Source this file: source environment-setup-none
 # Or use the symlink: source init-env.sh
-
-VCONTAINER_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
 HEADER
-    # Yocto variables (${SDK_SYS}, ${SDKPATHNATIVE}) expand at parse time
-    # Shell variables use $VAR to avoid Yocto expansion
+    # Primary env vars: emit as plain `export FOO="<abs-path>"` so the
+    # yocto-autobuilder-helper Python parser picks them up. Yocto variables
+    # expand at bitbake time; the SDK installer's relocation pass rewrites
+    # the baked-in paths at install time.
+    echo '' >> $script
+    echo '# Primary values -- literal absolute paths that survive parsing by' >> $script
+    echo '# yocto-autobuilder-helper enable_tools_tarball() (not sourced by bash).' >> $script
+    echo '# SDK relocation at install time rewrites the absolute paths below.' >> $script
+    echo 'export VCONTAINER_DIR="'"${SDKPATH}"'"' >> $script
     echo 'export OECORE_NATIVE_SYSROOT="'"${SDKPATHNATIVE}"'"' >> $script
-    echo 'export PATH="$VCONTAINER_DIR:$OECORE_NATIVE_SYSROOT/usr/bin:/usr/bin:/bin:$PATH"' >> $script
+    echo 'export PATH="'"${SDKPATH}"':'"${SDKPATHNATIVE}"'/usr/bin:/usr/bin:/bin:$PATH"' >> $script
+
+    # Bash-only refinement: if the file is actually being sourced by bash,
+    # re-derive VCONTAINER_DIR from the real on-disk location so a manually
+    # moved/copied tarball still works. Invisible to the autobuilder Python
+    # parser (doesn't start with export/unset at column 0).
+    cat >> $script <<'BASHREFINE'
+
+# When sourced by bash (interactive / devshell), prefer the real on-disk
+# location so a manually-moved tarball still works.
+if [ -n "${BASH_SOURCE[0]:-}" ]; then
+    VCONTAINER_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
+    export VCONTAINER_DIR
+fi
+BASHREFINE
     cat >> $script <<'FOOTER'
 
 echo "vcontainer environment configured."
@@ -395,11 +432,19 @@ echo ""
 echo "Architectures: ${VCONTAINER_ARCHITECTURES}"
 ENVEOF
 
-    # Unset OECORE_NATIVE_SYSROOT to avoid confusing other Yocto tools
-    # (same pattern as buildtools-tarball)
-    echo '' >> $script
-    echo '# Clean up - unset to avoid confusing other Yocto tools' >> $script
-    echo 'unset OECORE_NATIVE_SYSROOT' >> $script
+    # Gated unset: same pattern as buildtools-tarball (unset
+    # OECORE_NATIVE_SYSROOT after interactive sourcing so it doesn't confuse
+    # other Yocto tools), but guarded behind an `if` so the autobuilder's
+    # line-based parser (which matches "unset " only at column 0) leaves
+    # OECORE_NATIVE_SYSROOT set in the CI environment.
+    cat >> $script <<'UNSET_BLOCK'
+
+# Avoid confusing other Yocto tools post-source (matches buildtools-tarball).
+# Gated so yocto-autobuilder-helper's parser leaves OECORE_NATIVE_SYSROOT set.
+if [ -n "${BASH_SOURCE[0]:-}" ]; then
+    unset OECORE_NATIVE_SYSROOT
+fi
+UNSET_BLOCK
 
     # Replace placeholder with actual SDK_SYS
     sed -i -e "s:@SDK_SYS@:${SDK_SYS}:g" $script
-- 
2.50.1 (Apple Git-155)


