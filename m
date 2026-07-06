Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70804C43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:13:51 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155194.1783358026034729248
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2026 10:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IBleFzmc;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84347ad88edso4521544b3a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 10:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358025; x=1783962825; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjIYJqsrWIQgwudAalArFd6vOEykWSlE+WuhgXE8E7g=;
        b=IBleFzmcMTgBSSyhFvqS2jnALmQU61lAdfyV0CqxkxgyVKm0Hq0JsF7QYsJShlyocR
         06zr//H2Fr/li0CJlBaa9ckjutQkh/kbrvBsYY9SehvzocRA6wKjSwH9szZvNMcEpyMn
         Q0b22TRmDcO3Z+YxWZ8juYKD/9c2osrMw9cvjXDxsR4/hbOe0luQwp/QrXd0OkKRxHXb
         4tfEO+lYVQFYXMthCIJBv05vverynIKM7tktUrKTC3fEWRRTTRL59SplU1nK6ezk3ngA
         TJVu/YvGtXLENwMOfNJLiY/8f1SxPCmbrOXS8wDdDmiPATcswVfCFepPQG3p43a+z3wN
         ce7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358025; x=1783962825;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mjIYJqsrWIQgwudAalArFd6vOEykWSlE+WuhgXE8E7g=;
        b=j2p+orCbJMm0XuwSojFJMOBX+Bo92aAYDHiQzZdjoSvfiTU9pHzYkfhomSLgVFMd7L
         Gz9lHdHQkGfBcNsxTSgNOaPzJjN3Yl6h6diha1PVIH/83/+Ismr673Wi9Pkbn7lzU2ga
         pL273rE2AVcnLejsTBT49LMfnYbrRtkYs3z01lQ+koyK/AZC7B+Q57hZJ/9QWH9MHiiK
         5cAmDZbEtrFpTJf+4nFCJpEQTPkY6jE6RbUyCysLGuLxLFpxmgJAKuLGO2hzjFKpKqAL
         qcZj9wOZe8gNaHkid5owbB1+9638fPNxuiL1Hb/iZRqodVa5o0qwjdEcONUtzSSwJMdK
         JhKQ==
X-Gm-Message-State: AOJu0Yzew7MjZzVNzXLvqGBqi1b7mqU2dJwc8jN6su61sEIOztY0bjVk
	2S3BWQHxZWMIxok9Y6VEXRzbDTKmdQwblFv3ZgksmrPBVt58XVMmhVitsmrHhQ==
X-Gm-Gg: AfdE7ck/mk6AdrGdJj7E8/u7XlyiLBcTK0LjYykNlC5vNVvEi3mdPZOeM8zrshxuK5u
	7SxqwK2+eon0h8Pgxhc81gDDyQ1FKut8mljngzrIQqDgfn66TJ571eRCv2mzG6OcjetE8n1X2NR
	GbxBFopvK0ObLGDo9LJFdaoDyD7rFxdSFT0tUfgMYCIBahLrq5UqoDotPwHQ//vdEtMTR0AcTkv
	b29wUM6XScYebRt0ZELQYDp6Suqtc5URthwPZyF3pktVmu6q263/1Lqn99miaVlZhwqYS0gZKbl
	ieYeUvd2ZQnmNfv+xxZZaloQnXkXrM5DYdU3jMgR44RnaXHbvl0G4NXQstrCOSBQvEee9S9CZnX
	4hR4ubdVNgb51v6Fb0myNEj7DJb5bLPtmJWdA9ydhC/XzvEKOijd7jmp8jmt3HHoWYi5jkP9d7n
	W4srkEDpn/LZDDO6gtWCGl40EtinPqYfXDxMmB9LS2gGeibuQSVwmtyrd9WDuffjKPT5s+Isv7z
	9wavjxMFIQK
X-Received: by 2002:a05:6a00:b46:b0:847:8dec:141c with SMTP id d2e1a72fcca58-84826e17612mr1552429b3a.51.1783358025176;
        Mon, 06 Jul 2026 10:13:45 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bd1078sm4121873b3a.24.2026.07.06.10.13.43
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 10:13:44 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH v2 02/13] classes: add container-nonroot-user.bbclass
Date: Mon,  6 Jul 2026 10:12:37 -0700
Message-ID: <9ed44af1a2d173d353d1ce81710f1cd6e66203d1.1783356922.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783356922.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com> <cover.1783356922.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 17:13:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9926

For secure and production environments, we want to run containers as a
non-root user. Some applications, such as Python, require a $HOME
directory with proper permissions. Because OCI_LAYERS :directories:
copies with 'cp -a --no-preserve=ownership', we need a fixup function
to create the proper permissions and ownership in a new raw layer.

Process a list of NONROOT_OWNED_DIRS which will also be added as owned
by the NONROOT_USER.

Add oci_nonroot_inject_user() to  do_image_oci[prefuncs] to inject
'nonroot' user into '/etc/passwd' when a layer is present which provides
'/etc/passwd', since 'extrausers' acts on IMAGE_ROOTFS and not the
'base-passwd' package.

The behavior here is inspired by dhi.io/python:3 and by dhi.io/valkey:9
(Docker Hardened Images).

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 classes/container-nonroot-user.bbclass | 155 +++++++++++++++++++++++++
 1 file changed, 155 insertions(+)
 create mode 100644 classes/container-nonroot-user.bbclass

diff --git a/classes/container-nonroot-user.bbclass b/classes/container-nonroot-user.bbclass
new file mode 100644
index 00000000..09826536
--- /dev/null
+++ b/classes/container-nonroot-user.bbclass
@@ -0,0 +1,155 @@
+# For secure and production environments, we want to run containers as a
+# non-root user. Some applications, such as Python, require a $HOME
+# directory with proper permissions. Because OCI_LAYERS :directories:
+# copies with 'cp -a --no-preserve=ownership', we need a fixup function
+# to create the proper permissions and ownership in a new raw layer.
+
+# The behavior here is inspired by dhi.io/python:3 (Docker Hardened Image)
+
+inherit extrausers
+
+# NONROOT_USER must be a bare identifier (no quotes or backslash, etc.)
+NONROOT_USER ?= "nonroot"
+NONROOT_UID ?= "65532"
+NONROOT_GID ?= "65532"
+# Space-separated absolute paths to create in the image, owned by nonroot.
+NONROOT_OWNED_DIRS ?= ""
+
+# ---------------------------------------------------------------------------
+# Create the unprivileged "nonroot" user (uid 65532, group 65532)
+# ---------------------------------------------------------------------------
+EXTRA_USERS_PARAMS += "\
+    groupadd -g ${NONROOT_GID} ${NONROOT_USER}; \
+    useradd -m -u ${NONROOT_UID} -g ${NONROOT_GID} \
+            -d /home/${NONROOT_USER}  ${NONROOT_USER}; \
+"
+
+# Allow a container to choose to run as 'root'
+OCI_IMAGE_RUNTIME_UID ?= "${NONROOT_UID}"
+OCI_IMAGE_ENV_VARS = "HOME=/home/${NONROOT_USER}"
+
+# In multi-layer OCI mode the image is assembled from per-layer package
+# installs (oci_multilayer_install_packages in image-oci-umoci.inc), not from
+# IMAGE_ROOTFS. extrausers/EXTRA_USERS_PARAMS only edits IMAGE_ROOTFS, so the
+# nonroot account never reaches the image. Inject it into the layer rootfs that
+# ships /etc/passwd, before IMAGE_CMD:oci assembles the layers.
+python oci_nonroot_inject_user() {
+    import os
+
+    if (d.getVar('OCI_LAYER_MODE') or 'single') != 'multi':
+        return  # single-layer mode builds from IMAGE_ROOTFS; extrausers handles it
+
+    user = d.getVar('NONROOT_USER')
+    uid  = d.getVar('NONROOT_UID')
+    gid  = d.getVar('NONROOT_GID')
+    home = '/home/%s' % user
+
+    # shell field is cosmetic (runtime user is pinned numerically via
+    # OCI config.user); /bin/sh matches dhi.io passwd entries.
+    passwd_line = '%s:x:%s:%s:%s:%s:/bin/sh\n' % (user, uid, gid, user, home)
+    group_line  = '%s:x:%s:\n' % (user, gid)
+    shadow_line = '%s:!:::::::\n' % user
+
+    def append_once(path, line, key):
+        if not os.path.exists(path):
+            return False
+        with open(path) as f:
+            if any(l.startswith(key) for l in f):
+                return True            # already present (idempotent rebuild)
+        with open(path, 'a') as f:
+            f.write(line)
+        return True
+
+    key = user + ':'
+    count = int(d.getVar('OCI_LAYER_COUNT') or 0)
+    found = False
+    for i in range(1, count + 1):
+        rootfs = d.getVar('OCI_LAYER_%d_ROOTFS' % i)
+        if not rootfs:
+            continue
+        # add to every layer that carries /etc/passwd so the topmost wins too
+        if append_once(os.path.join(rootfs, 'etc/passwd'), passwd_line, key):
+            append_once(os.path.join(rootfs, 'etc/group'),  group_line,  key)
+            append_once(os.path.join(rootfs, 'etc/shadow'), shadow_line, key)  # optional
+            found = True
+
+    if not found:
+        bb.warn("container-nonroot-user: no layer ships /etc/passwd; '%s' not "
+                "added — is base-passwd in a packages: layer?" % user)
+}
+
+# Must run AFTER oci_multilayer_install_packages populates OCI_LAYER_*_ROOTFS.
+do_image_oci[prefuncs] += "oci_nonroot_inject_user"
+
+# Make sure we can write to e.g. /home/nonroot/.python_history
+# using :directories: in OCI_LAYERS does not preserve permissions.
+fakeroot fix_oci_home_perms() {
+    cd ${IMGDEPLOYDIR}
+    image_name="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}-oci"
+    layer_tar="${WORKDIR}/oci-home-fix-layer.tar"
+
+    rm -f "$layer_tar"
+
+    # BitBake expands ${NONROOT_USER} etc. at parse time *before*
+    # shell sees the body, so single quoted 'PYEOF' is okay.
+    python3 - "$layer_tar" <<'PYEOF'
+import sys, tarfile, time
+
+layer_tar = sys.argv[1]
+mtime = int(time.time())
+
+uid = ${NONROOT_UID}
+gid = ${NONROOT_GID}
+
+# (path, mode, uid, gid)  -- paths are tar-relative, no leading slash
+entries = [
+    ("home",         0o755, 0,     0),
+    ("home/${NONROOT_USER}", 0o700, uid, gid),
+]
+
+seen = {entry[0] for entry in entries}
+for nonrootdir in "${NONROOT_OWNED_DIRS}".split():
+    parts = nonrootdir.strip("/").split("/")
+    for i, _ in enumerate(parts):
+        path = "/".join(parts[:i+1])
+        if path in seen:
+            continue
+        seen.add(path)
+        leaf = (i == len(parts) - 1)
+        # leaf -> nonroot-owned; parents -> root:root, just to scaffold the path
+        entries.append((path, 0o755, uid if leaf else 0, gid if leaf else 0))
+
+with tarfile.open(layer_tar, "w") as tar:
+    for name, mode, uid, gid in entries:
+        info = tarfile.TarInfo(name=name)
+        info.type  = tarfile.DIRTYPE
+        info.mode  = mode
+        info.uid   = uid
+        info.gid   = gid
+        info.uname = ""   # numeric-only; let umoci canonicalize
+        info.gname = ""
+        info.mtime = mtime
+        tar.addfile(info)
+PYEOF
+
+    umoci raw add-layer --image "$image_name:${OCI_IMAGE_TAG}" "$layer_tar"
+    rm -f "$layer_tar"
+
+    # Adding the raw layer mutates the OCI image directory, so the tar outputs
+    # produced by do_image_oci are now stale and must be rebuilt. The image
+    # *directory* ($image_name) is the source of truth; the .tar files are
+    # derived from it and only exist when OCI_IMAGE_TAR_OUTPUT is set, so mirror
+    # that gating (see image-oci-umoci.inc) instead of rebuilding unconditionally.
+    # Guard the assumption: an OCI layout always has an index.json, so its
+    # absence means the packaging layout in image-oci.bbclass has changed (or
+    # the dir is empty). Fail loudly rather than emit a silently-broken tarball.
+    if [ -n "${OCI_IMAGE_TAR_OUTPUT}" ]; then
+        if [ ! -f "$image_name/index.json" ]; then
+            bbfatal "fix_oci_home_perms: '$image_name' is not an OCI image layout (no index.json) in ${IMGDEPLOYDIR}; image-oci packaging layout may have changed"
+        fi
+        rm -f "$image_name.tar" "$image_name-dir.tar"
+        ( cd "$image_name" && tar -cf "../$image_name.tar" "." )
+        tar -cf "$image_name-dir.tar" "$image_name"
+    fi
+}
+do_image_oci[postfuncs] += "fix_oci_home_perms"
-- 
2.54.0


