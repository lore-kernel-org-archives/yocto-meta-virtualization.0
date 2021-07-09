Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.8069.1625816704717174838
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Jul 2021 00:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VDMBqJoE;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: jainsaloni0918@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id j3so2657620plx.7
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 09 Jul 2021 00:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=e4ZrjIVmFqvjKH5MdEMqAP5Z4KAnc9dr+/Sl+hwk+ww=;
        b=VDMBqJoEji6eefbealrm+P2YGtELnOOh+5XKgm996ulpD1MKvpRQjhQ52jv1Gdi0FJ
         deGyaRInJxarJJ1g5+cUHI4EDnEfzbp42UU4VA0F4Vd/LhlBuRqZ9DWtbjFOvUwltTBi
         1tkcp02XfAPgYABf6OBlnE5fzRZns7cw0Yo4z5h56eIm/Q7dXTrDxKCpbm5Ty/UIDfHk
         m4piWiLPEIpWHUnzNL8Y93Ov0h2VQt9QjLjBI00iTdUoBFqaOcKZLhRYuz2trXXwRPxe
         ndSImR5m43Nccyw7ag8BE6DwNi/AjdGM8huu2zY/VLQEVikuRG01scNIPeedH0g0Tq/Q
         nlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=e4ZrjIVmFqvjKH5MdEMqAP5Z4KAnc9dr+/Sl+hwk+ww=;
        b=RKG8oAf11j9MuwhJ6RC6VOaiftxCaJGsnVRsAkS0meNULKYFJNsOQQzJX/woSX77Ql
         wSOZYdPtIVtSzFzHFykBdwKibIYzGNVB5kc07cOf5okfdXbNdpm3O6zrpUQ2ME6a0u5/
         G1HNuExf+PH59dm+8R65BKva8YYqejamAJVSOhp4rtEv72rsBrA6GWPYD/WexQWk7cQc
         /8aLjuEoqx+cmH/rbNG7VyfHj4loqPsptL7aYMLksfATTrGrogEfAmVJ5CSDqRj2PFAu
         vJBQgO4K7Juun6oJw2VVnGxzCTtBwvz7xNWYveuyPGYg8vmgPx2ywZ+VUerum0rn221U
         OFDQ==
X-Gm-Message-State: AOAM533H6a4bEzpWtxiWQ3n0cWj904xVFN/lofJZcAUCczBdkA6V5jr4
	/lJeW5lZG9wIwxG68DeiAVcrT4u5QbAqSCiXSmY=
X-Google-Smtp-Source: ABdhPJy+6PlZ3jAxOXZ4yr3VqPQJgqhnAu4MHGiES+/A3jtdfVV+nZdWc2qwAZssL3jVcMDCbu0HRQ==
X-Received: by 2002:a17:90a:4491:: with SMTP id t17mr9592094pjg.30.1625816703809;
        Fri, 09 Jul 2021 00:45:03 -0700 (PDT)
Return-Path: <jainsaloni0918@gmail.com>
Received: from localhost.localdomain ([2402:8100:22a2:3a1c:b0cb:d211:54b7:8414])
        by smtp.gmail.com with ESMTPSA id 1sm5081888pfm.123.2021.07.09.00.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 00:45:03 -0700 (PDT)
From: jainsaloni0918@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: "Saloni.Jain" <saloni.jain@kpit.com>,
	Christian Brauner <christian.brauner@ubuntu.com>
Subject: [meta-vitualization][master][dunfell][PATCH] start: handle CLONE_PIDFD on arm64
Date: Fri,  9 Jul 2021 03:44:51 -0400
Message-Id: <20210709074451.14442-1-jainsaloni0918@gmail.com>
X-Mailer: git-send-email 2.17.1

From: "Saloni.Jain" <saloni.jain@kpit.com>

It doesn't work with kernels older than 5.2.

https://man7.org/linux/man-pages/man2/clone.2.html

"       CLONE_PIDFD (since Linux 5.2)"

Fix lxc container startup error:

clone3({flags=CLONE_PIDFD|CLONE_NEWNS|CLONE_NEWUTS|CLONE_NEWIPC|CLONE_NEWPID|0x200000000, pidfd=0x55904a09a0, exit_signal=SIGCHLD, stack=NULL, stack_size=0, /* bytes 80..87 */ "\x17\x00\x00\x00\x00\x00\x00\x00"}, 88) = -1 ENOSYS (Function not implemented)
clone3({flags=CLONE_PIDFD|CLONE_NEWNS|CLONE_NEWUTS|CLONE_NEWIPC|CLONE_NEWPID, pidfd=0x55904a09a0, exit_signal=SIGCHLD, stack=NULL, stack_size=0}, 64) = -1 ENOSYS (Function not implemented)
clone(child_stack=NULL, flags=CLONE_PIDFD|CLONE_NEWNS|CLONE_NEWUTS|CLONE_NEWIPC|CLONE_NEWPID|SIGCHLD, parent_tid=0x55904a09a0) = -1 EINVAL (Invalid argument)

Reported-by: Ondrej Kubik <ondrej.kubik@canonical.com>
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
Signed-off-by: Saloni Jain <jainsaloni0918@gmail.com>
---
 .../lxc_remove_CLONE_PIDFD_support.patch      | 56 +++++++++++++++++++
 recipes-containers/lxc/lxc_4.0.6.bb           |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 recipes-containers/lxc/files/lxc_remove_CLONE_PIDFD_support.patch

diff --git a/recipes-containers/lxc/files/lxc_remove_CLONE_PIDFD_support.patch b/recipes-containers/lxc/files/lxc_remove_CLONE_PIDFD_support.patch
new file mode 100644
index 0000000..9da1757
--- /dev/null
+++ b/recipes-containers/lxc/files/lxc_remove_CLONE_PIDFD_support.patch
@@ -0,0 +1,56 @@
+commit c07b6837e30b8d969060ce7d3f95a30abec637de
+Author: Christian Brauner <christian.brauner@ubuntu.com>
+Date:   Fri Mar 5 19:50:28 2021 +0100
+
+
+start: handle CLONE_PIDFD on arm64
+
+It doesn't work with kernels older than 5.2.
+ 
+https://man7.org/linux/man-pages/man2/clone.2.html
+ 
+"       CLONE_PIDFD (since Linux 5.2)"
+ 
+Fix lxc container startup error:
+ 
+clone3({flags=CLONE_PIDFD|CLONE_NEWNS|CLONE_NEWUTS|CLONE_NEWIPC|CLONE_NEWPID|0x200000000, pidfd=0x55904a09a0, exit_signal=SIGCHLD, stack=NULL, stack_size=0, /* bytes 80..87 */ "\x17\x00\x00\x00\x00\x00\x00\x00"}, 88) = -1 ENOSYS (Function not implemented)
+clone3({flags=CLONE_PIDFD|CLONE_NEWNS|CLONE_NEWUTS|CLONE_NEWIPC|CLONE_NEWPID, pidfd=0x55904a09a0, exit_signal=SIGCHLD, stack=NULL, stack_size=0}, 64) = -1 ENOSYS (Function not implemented)
+clone(child_stack=NULL, flags=CLONE_PIDFD|CLONE_NEWNS|CLONE_NEWUTS|CLONE_NEWIPC|CLONE_NEWPID|SIGCHLD, parent_tid=0x55904a09a0) = -1 EINVAL (Invalid argument)
+    
+Reported-by: Ondrej Kubik <ondrej.kubik@canonical.com>
+Cc: stable-4.0
+Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
+Signed-off-by: Saloni Jain <jainsaloni0918@gmail.com>
+Upstream-Status: Pending
+
+diff --git a/src/lxc/start.c b/src/lxc/start.c
+index 301b81a..f2737a2 100644
+--- a/src/lxc/start.c
++++ b/src/lxc/start.c
+@@ -1714,7 +1714,26 @@ static int lxc_spawn(struct lxc_handler *handler)
+                /* Kernel might be too old for clone3(). */
+                if (handler->pid < 0) {
+                        SYSTRACE("Failed to spawn container via clone3()");
++
++               /*
++                * In contrast to all other architectures arm64 verifies that
++                * the argument we use to retrieve the pidfd with is
++                * initialized to 0. But we need to be able to initialize it to
++                * a negative value such as our customary -EBADF so we can
++                * detect whether this kernel supports pidfds. If the syscall
++                * returns and the pidfd variable is set to something >= 0 then
++                * we know this is a kernel supporting pidfds. But if we can't
++                * set it to -EBADF then this won't work since 0 is a valid
++                * file descriptor too. And since legacy clone silently ignores
++                * unknown flags we are left without any way to detect support
++                * for pidfds. So let's special-case arm64 to not fail starting
++                * containers.
++                */
++               #if defined(__aarch64__)
++                       handler->pid = lxc_raw_legacy_clone(handler->clone_flags & ~CLONE_PIDFD, NULL);
++               #else
+                        handler->pid = lxc_raw_legacy_clone(handler->clone_flags, &handler->pidfd);
++               #endif
+                }
+ 
+                if (handler->pid < 0) {
diff --git a/recipes-containers/lxc/lxc_4.0.6.bb b/recipes-containers/lxc/lxc_4.0.6.bb
index c9bf3d0..105caa0 100644
--- a/recipes-containers/lxc/lxc_4.0.6.bb
+++ b/recipes-containers/lxc/lxc_4.0.6.bb
@@ -51,6 +51,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
 	file://lxc-net \
 	file://configure-skip-libseccomp-tests-if-it-is-disabled.patch \
 	file://commands-fix-check-for-seccomp-notify-support.patch \
+        file://lxc_remove_CLONE_PIDFD_support.patch \
 	"
 
 SRC_URI[md5sum] = "732571c7cb4ab845068afb227bf35256"
-- 
2.17.1

