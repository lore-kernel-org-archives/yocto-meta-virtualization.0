Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BB1CD6E53
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 01:31:43 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2243.1780104695023593272
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 May 2026 18:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iGw4y7qs;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf125989f2so14042995ad.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 29 May 2026 18:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780104694; x=1780709494; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N85x2WEYfKAbJtm3pEQ6XRpQ6njWzQYYbwi3BtNv5Pg=;
        b=iGw4y7qsbTDWdxRVpUWVknQPeAY97kNacR3p+i1J8YYIk0A9gQJnhLmLQPMYflxeyt
         2MYI6xgRGZsFyHjF0kTlnq4tykCKde4+vpCDvBd8wiuzzYjkd8Ja1RxqsYnqf6pgr/4k
         hn4KKOCnfzUDfCWciouT/oACyoOE769yrhoOq2tR9y9IhPtDYtOmNkTKfKX/7C7ddecj
         qCeCs/HDwdKLQr99SFjg2k49oReTGjw810j5rU1K2vKapBaAIm7SBVVmEicobVJp/6Vl
         rCIIBvCVQNPQvtrTw2fdr9LJdMOIk/IrfjJtRIK/eUQ4TSay1ePyFXf61LZOiie0mRQ7
         mIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780104694; x=1780709494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N85x2WEYfKAbJtm3pEQ6XRpQ6njWzQYYbwi3BtNv5Pg=;
        b=pq7Lvrv0MrcekPAlxNIg3tEGps42mckUxP97JEixfQQF2c/VYdBsIOIo4fZiigZYfL
         l6NTLFtH8YKt3inK61OY67+hO/H7Z3Yq+9U3Gy2Vw3DoR3Z+qpoLknB8OlS19VgtJVgL
         MXy+BQH+xPsRbfGDQXwyIN9jH8EMNbjRW0Px56wV2IiJ2J1ZoBao3B2E0GdmUds8DnxZ
         jOfEE33bzQ+sj16fVIn52g1wXTzGqXmawlavg0JQukIfRJMDXZYe33eyrrWLdp/koVPy
         SHTIjmmECN+zAAX0oSZEvpzaKOGntyR92ZbAma11lrIvMIWeC9+jA0SIp9vkAupAH2YB
         MNhg==
X-Gm-Message-State: AOJu0Yy/5i+0Ppy4nKuI3RfL+q2Eg8vkdY6rYlNba4KbMvJYU84WWf4b
	/yaxQLjH8aYng1Mb40jsToEy+c3FSR3cWZw+K3tpd4QdeLwMllW56WKmJw8STg==
X-Gm-Gg: Acq92OERBqzPpXZa1Ki8CUmU4b1Y+0sL8tjsoOPgjBb6tArDDqklFV1o0/StXjS7kQM
	BdDsTi+C2sI/aNWHNjURL3lHAQ/OC8cxQy921TneHekktpZ+/TdSkYRKPfLS7vMvPqBk1LU/PWY
	hBPC517s/Tm9VJASxB2jMpEm0hYv+mQcuTEgaNzu/FVdA+1+8ltbS1dIPpNeTrz8/dLJR2mN95u
	VsLlGtNUqrxklOyKqF9enxvXHBbsiy2ssF6bvnXyJHE759nGIZwpjP8rQvr4VQkV8vgX5lOYruz
	uKMT1yIIoL/6JT4ltPspqkkAxpW8zvk+p653qenKvXihi7bLR+3L3HSx7EWoQoEKJVz5BmUyF7n
	lEwOkOgp3y5hom5XtkJjGd0XoIoOqchiRBhVZcPTnP1GgISjsRP/5YdFI5uODOV3ZFeY3m87zfd
	I4SmQz6TEEtArsHS3xQIwFIwIiZG9UKqzZmFRl/sWeUnU2v9F1y0uNXe9MtRVQx81jNZHP2WpxM
	vbSsS9TZ6oCElmoObzaHmEAOVv8gcHsjA==
X-Received: by 2002:a17:902:d4c8:b0:2bf:1e5d:2b17 with SMTP id d9443c01a7336-2bf3683bec2mr24360675ad.21.1780104694083;
        Fri, 29 May 2026 18:31:34 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a2dbfbsm33798765ad.37.2026.05.29.18.31.32
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 29 May 2026 18:31:32 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 1/7] classes: add container-nonroot-user.bbclass
Date: Fri, 29 May 2026 18:31:02 -0700
Message-ID: <3067d13e8e08136d3e8af275a4e501589f8a38a1.1780104071.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780104071.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 30 May 2026 01:31:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9827

For secure and production environments, we want to run containers as a
non-root user. Some applications, such as Python, require a $HOME
directory with proper permissions. Because OCI_LAYERS :directories:
copies with 'cp -a --no-preserve=ownership', we need a fixup function
to create the proper permissions and ownership in a new raw layer.

The behavior here is inspired by dhi.io/python:3 (Docker Hardened Image)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 classes/container-nonroot-user.bbclass | 68 ++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 classes/container-nonroot-user.bbclass

diff --git a/classes/container-nonroot-user.bbclass b/classes/container-nonroot-user.bbclass
new file mode 100644
index 00000000..5139ce8b
--- /dev/null
+++ b/classes/container-nonroot-user.bbclass
@@ -0,0 +1,68 @@
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
+NONROOT_USER ?= "nonroot"
+NONROOT_UID ?= "65532"
+NONROOT_GID ?= "65532"
+
+# ---------------------------------------------------------------------------
+# Create the unprivileged "nonroot" user (uid 65532, group 65532)
+# ---------------------------------------------------------------------------
+EXTRA_USERS_PARAMS = "\
+    groupadd -g ${NONROOT_GID} ${NONROOT_USER}; \
+    useradd -m -u ${NONROOT_UID} -g ${NONROOT_GID} -d /home/${NONROOT_USER}  ${NONROOT_USER}; \
+"
+
+# Allow a container to choose to run as 'root'
+OCI_IMAGE_RUNTIME_UID ?= "${NONROOT_UID}"
+OCI_IMAGE_ENV_VARS = "HOME=/home/${NONROOT_USER}"
+
+# Make sure we can write to e.g. /home/nonroot/.python_history
+# using :directories: in OCI_LAYERS does not preserve permissions
+fakeroot fix_oci_home_perms() {
+    cd ${IMGDEPLOYDIR}
+    image_name="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}-oci"
+    layer_tar="${WORKDIR}/oci-home-fix-layer.tar"
+
+    rm -f "$layer_tar"
+
+    python3 - "$layer_tar" <<'PYEOF'
+import sys, tarfile, time
+
+layer_tar = sys.argv[1]
+mtime = int(time.time())
+
+# (path, mode, uid, gid)
+entries = [
+    ("home",         0o755, 0,     0),
+    ("home/${NONROOT_USER}", 0o700, ${NONROOT_UID}, ${NONROOT_GID}),
+]
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
+    rm -f "$image_name.tar" "$image_name-dir.tar"
+    ( cd "$image_name" && tar -cf "../$image_name.tar" "." )
+    tar -cf "$image_name-dir.tar" "$image_name"
+}
+do_image_oci[postfuncs] += "fix_oci_home_perms"
-- 
2.54.0


