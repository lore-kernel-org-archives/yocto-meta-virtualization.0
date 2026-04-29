Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14E9CCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 19:58:12 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4900.1777492691311933024
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 12:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fuQypggR;
 spf=pass (domain: konsulko.com, ip: 209.85.214.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b7d3ecc10dso1361535ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Apr 2026 12:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1777492690; x=1778097490; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2TIdFHcpgxkLcPIbUFA1r423KAKrvxFIX6MrcIr//Fo=;
        b=fuQypggRJXdDZPglll2OGJUZsqpk5WkXxl2xZRtJuomKQWwc+OcX5dmC1cgKXe/HRP
         JcEY9ZB6eKOIPig8in9Dv/hxP0AdtIue4I0epvtcxFw4zJd/lf+9cVkPxWG57KMeRngv
         8rcZMJI+w8qVyadX3sq/yG4Hal+33c4Yya+aQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777492690; x=1778097490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TIdFHcpgxkLcPIbUFA1r423KAKrvxFIX6MrcIr//Fo=;
        b=qZ5+UggZ4cy8wKNKaC/9t25WZCAaYgeEsCe1oVpEzVr8Dwzfl+eIL0zpYrvRFjxLj6
         JjVO1v0TrXuDGTKe+VpEhr6frv49Te2CVi5ejDTf0rpvPT1ZlrTCfB5ixx1dXhg/a8d7
         joTuxf8St40BTyWXpweCjxIBQVXDb+IRn+BmXNMbguSo4h/kraeOWJ8Ao+YWSz5t9d9F
         EYMFjF/3yg7ApJmnCR9cfO8n5psMBKB2KiGvpyweMqU8S1Jp9Y4Nj6A3Rv8noiknJZ6W
         U0pb9PD+NwPLDZSjeIejlLYDh9ovuo938YhJifMluI+EkzwvcU/L++Dw+mLawBhRpTW6
         E96Q==
X-Gm-Message-State: AOJu0Yyr9B5wf0yUJ7Bwf91VpGL2P4AiV49SaCfTLoSPH8Rnu2rn31nR
	VUHHyhFPQBZ4cSFU61cM68ZG/FMLUAf5Elgd/xyFQdO4arDuTzzuLtlM/CC9CnoSbDtbbtE91s3
	+cdwm
X-Gm-Gg: AeBDiev0suavgl+oYYnBjq4P+Q5KkU2S/mJjuIDXEdlQs9e250KQKMOWdSwjxp9TTQA
	9jRLbfd3Tg652oxQ3jCVixOQSlRThE+P38wa1H/JjZyxgRSJN4tjTfnBHp2m8l4YR8MsTyRG/uO
	748NqfAsMMC6ueFgevp5+GHviGmbaYBgmRKot0lurosiMaxs268kTyWj3cJCO4NGPnVUTnrAO+4
	j2gk78PL44EOBed7KJQgXD3YB3ab9IbT+ATp7ALBlbwGO7rUiuY5HrMFb5EprvTRhQ5mx0wFkNx
	oT/41WDuRPRw6qcAuBnR2Ob5mSwtqWHKRAzNvvrwvXL9hc6usCHo4sLeTrJJIyNpn+QcvEq4+HO
	e69cYA6Kct7sWVdcVa/6WvnDVkWyhg+R3Ry8eZY52f4Db9ddXD416wgMMYYZ/Jw3CCEDTpRKCwg
	XHHkm1Rssl42UiJRaB/ARiEERrBTIxNoOgkwaPVjByH04QbMQInQ==
X-Received: by 2002:a17:902:d482:b0:2b2:9d60:5eaf with SMTP id d9443c01a7336-2b97c406c53mr95726625ad.6.1777492689952;
        Wed, 29 Apr 2026 12:58:09 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6021:700:2f39:e2e2:d871:1e44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98879f22esm30068345ad.31.2026.04.29.12.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:58:09 -0700 (PDT)
From: tim.orling@konsulko.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [RESEND][RFC][PATCH 1/2] vcontainer: add --config / VDKR_CONFIG for docker/podman auth credentials
Date: Wed, 29 Apr 2026 12:57:53 -0700
Message-ID: <20260429195807.1371305-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Apr 2026 19:58:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9779

From: Tim Orling <tim.orling@konsulko.com>

Add a VDKR_CONFIG / VPDMN_CONFIG env var and a matching --config <path>
CLI flag that passes an existing docker config.json / podman auth.json
into the QEMU-hosted container runtime so pulls from private registries
work without having to retype --registry-user / --registry-pass on every
command.

Security posture (defence in depth):
- Host-side pre-flight validation in vrunner.sh (validate_auth_config):
  reject symlinks, non-regular files, missing / unreadable files, files
  smaller than 2 bytes (minimum "{}") or larger than 1 MiB, and any
  permissions other than 0400 / 0600 / 0200. WARN if not owned by the
  invoking user.
- Stage the file into a dedicated per-invocation directory under
  $TEMP_DIR at mode 0400 inside a 0700 parent; auto-cleanup rides the
  existing EXIT/INT/TERM trap.
- Expose the staged file over a *separate* read-only virtio-9p tag
  ("${TOOL_NAME}_auth") so credentials cannot leak into the general
  /mnt/share input/output directory or into storage.tar outputs.
- Only a boolean flag ("${CMDLINE_PREFIX}_auth=1") is appended to the
  kernel cmdline - never the path, the env var name, or the contents.
- Guest mounts /mnt/auth ro,nosuid,nodev,noexec, copies to the runtime's
  canonical path, then unmounts immediately so neither the runtime nor
  user workloads keep a reference to the host staging directory.

vrunner.sh:
- Initialise AUTH_CONFIG from $VDKR_CONFIG / $VPDMN_CONFIG
- Parse --config <path> (overrides the env vars)
- Add validate_auth_config() and setup_auth_share() with the rules above
- Call setup_auth_share in both the daemon start path and the
  non-daemon / batch-import path

vcontainer-init-common.sh:
- Default RUNTIME_AUTH="0" and parse ${VCONTAINER_RUNTIME_PREFIX}_auth=*
  from the kernel cmdline
- Define mount_auth_share() / unmount_auth_share() using the per-runtime
  "${VCONTAINER_RUNTIME_NAME}_auth" 9p tag, mounted at /mnt/auth with
  ro,nosuid,nodev,noexec

vdkr-init.sh:
- install_auth_config() copies /mnt/auth/config.json to
  /root/.docker/config.json (mode 0600; parent dir 0700)
- Called after install_registry_ca in main flow so --config takes
  precedence over --registry-user / --registry-pass; logs a NOTE when
  both mechanisms are supplied
- Unmounts /mnt/auth after copy

vpdmn-init.sh:
- install_auth_config() copies to /run/containers/0/auth.json (the
  rootful podman canonical path) and exports REGISTRY_AUTH_FILE so the
  creds are picked up regardless of podman's search order
- Mode 0600 on the file, 0700 on the containing directory
- Unmounts /mnt/auth after copy

vcontainer-common.sh:
- Honour $VDKR_CONFIG / $VPDMN_CONFIG, parse --config, and forward
  AUTH_CONFIG to vrunner.sh via --config in build_runner_args
- Document the flag and env vars in show_usage

README.md:
- New "Passing an existing docker/podman auth file (--config)" section
  with examples for both runtimes, a table of target paths, and the
  full security model

AI-Generated: Claude Cowork Opus 4.7
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 recipes-containers/vcontainer/README.md       |  54 +++++++
 .../vcontainer/files/vcontainer-common.sh     |  18 +++
 .../files/vcontainer-init-common.sh           |  54 +++++++
 .../vcontainer/files/vdkr-init.sh             |  58 +++++++
 .../vcontainer/files/vpdmn-init.sh            |  61 ++++++++
 .../vcontainer/files/vrunner.sh               | 147 ++++++++++++++++++
 6 files changed, 392 insertions(+)

diff --git a/recipes-containers/vcontainer/README.md b/recipes-containers/vcontainer/README.md
index 657dd02e..e44616f4 100644
--- a/recipes-containers/vcontainer/README.md
+++ b/recipes-containers/vcontainer/README.md
@@ -317,6 +317,60 @@ use `--secure-registry --ca-cert`:
 vdkr --secure-registry --ca-cert /path/to/ca.crt pull myimage
 ```
 
+### Passing an existing docker/podman auth file (`--config`)
+
+If you already have credentials set up on the host (for example, from
+running `docker login` locally), you can pass the resulting auth file
+straight through into the emulated environment instead of re-entering
+credentials with `--registry-user`/`--registry-pass`:
+
+```bash
+# Docker (vdkr): uses ~/.docker/config.json by default
+vdkr --config ~/.docker/config.json pull registry.example.com/myimage
+
+# Podman (vpdmn): uses $XDG_RUNTIME_DIR/containers/auth.json
+vpdmn --config $XDG_RUNTIME_DIR/containers/auth.json pull registry.example.com/myimage
+```
+
+The path can also be supplied via environment:
+
+```bash
+export VDKR_CONFIG=$HOME/.docker/config.json
+vdkr pull registry.example.com/myimage
+```
+
+(`VPDMN_CONFIG` is honoured identically by `vpdmn`.)
+
+**What the file ends up as inside the VM:**
+
+| Tool  | Target path                       | Notes                                             |
+| ----- | --------------------------------- | ------------------------------------------------- |
+| vdkr  | `/root/.docker/config.json`       | Mode 0600; containing dir 0700                    |
+| vpdmn | `/run/containers/0/auth.json`     | Mode 0600; `$REGISTRY_AUTH_FILE` exported         |
+
+**Security model.** The credential file is treated as secret material:
+
+- The host-side file **must** be a regular file with mode `0600` or `0400`.
+  World/group-readable files are rejected outright. Symlinks are rejected.
+  Files larger than 1 MiB are rejected.
+- On the host it is copied into a per-invocation private directory under
+  `$TMPDIR/vdkr-$$/auth_share` (mode 0700; file mode 0400) and removed
+  automatically by the `EXIT`/`INT`/`TERM` trap when `vrunner.sh` exits.
+- It is exposed to the guest on a **dedicated** virtio-9p share whose
+  mount tag (`vdkr_auth` / `vpdmn_auth`) is distinct from the general
+  `*_share` share used for input/output. The guest mounts it **read-only**
+  at `/mnt/auth`, copies it into the runtime's credential location, then
+  **unmounts** `/mnt/auth` so nothing in the VM retains an open reference
+  to the host staging directory.
+- Nothing about the file appears on the kernel command line. Only a
+  boolean flag (`docker_auth=1` / `podman_auth=1`) is passed so the guest
+  init script knows to look on the auth share.
+- When both `--config` and `--registry-user`/`--registry-pass` are
+  supplied, `--config` wins and a NOTE is logged.
+- `--config` is NOT forwarded into container workloads (it only reaches
+  the container engine's credential store); containers themselves never
+  see `/mnt/auth`.
+
 ## Volume Mounts
 
 Mount host directories into containers using `-v` (requires memory resident mode):
diff --git a/recipes-containers/vcontainer/files/vcontainer-common.sh b/recipes-containers/vcontainer/files/vcontainer-common.sh
index 126ca727..8adec77d 100755
--- a/recipes-containers/vcontainer/files/vcontainer-common.sh
+++ b/recipes-containers/vcontainer/files/vcontainer-common.sh
@@ -718,6 +718,11 @@ ${BOLD}GLOBAL OPTIONS:${NC}
     --registry <url>      Default registry for unqualified images (e.g., 10.0.2.2:5000/yocto)
     --no-registry         Disable baked-in default registry (use images as-is)
     --insecure-registry <host:port>  Mark registry as insecure (HTTP). Can repeat.
+    --config <path>       Registry auth file (docker config.json / podman auth.json)
+                          Defaults to \$VDKR_CONFIG / \$VPDMN_CONFIG. The file must be
+                          mode 0600 or stricter; it is passed to the guest over a
+                          dedicated read-only virtio-9p share and never appears on
+                          the kernel cmdline.
     --verbose, -v         Enable verbose output
     --help, -h            Show this help
 
@@ -857,6 +862,7 @@ build_runner_args() {
     [ -n "$CA_CERT" ] && args+=("--ca-cert" "$CA_CERT")
     [ -n "$REGISTRY_USER" ] && args+=("--registry-user" "$REGISTRY_USER")
     [ -n "$REGISTRY_PASS" ] && args+=("--registry-pass" "$REGISTRY_PASS")
+    [ -n "$AUTH_CONFIG" ] && args+=("--config" "$AUTH_CONFIG")
 
     # Xen: pass exit grace period
     [ -n "${VXN_EXIT_GRACE_PERIOD:-}" ] && args+=("--exit-grace-period" "$VXN_EXIT_GRACE_PERIOD")
@@ -880,6 +886,11 @@ SECURE_REGISTRY="false"
 CA_CERT=""
 REGISTRY_USER=""
 REGISTRY_PASS=""
+# Registry auth config file. Env-var default depends on which CLI wrapper is
+# in use (vdkr → $VDKR_CONFIG, vpdmn → $VPDMN_CONFIG), then falls back to the
+# other for convenience when sharing a single host-side file. Overridden by
+# the --config CLI flag below.
+AUTH_CONFIG="${VDKR_CONFIG:-${VPDMN_CONFIG:-}}"
 COMMAND=""
 COMMAND_ARGS=()
 
@@ -977,6 +988,13 @@ while [ $# -gt 0 ]; do
             REGISTRY_PASS="$2"
             shift 2
             ;;
+        --config)
+            # Path to a docker/podman registry auth file (config.json / auth.json).
+            # Overrides $VDKR_CONFIG / $VPDMN_CONFIG. Forwarded to vrunner.sh --config,
+            # which validates the file and stages it on a dedicated read-only 9p share.
+            AUTH_CONFIG="$2"
+            shift 2
+            ;;
         -it|--interactive)
             INTERACTIVE="true"
             shift
diff --git a/recipes-containers/vcontainer/files/vcontainer-init-common.sh b/recipes-containers/vcontainer/files/vcontainer-init-common.sh
index ab8762b2..3bd70e75 100755
--- a/recipes-containers/vcontainer/files/vcontainer-init-common.sh
+++ b/recipes-containers/vcontainer/files/vcontainer-init-common.sh
@@ -156,6 +156,7 @@ parse_cmdline() {
     RUNTIME_INTERACTIVE="0"
     RUNTIME_DAEMON="0"
     RUNTIME_9P="0"  # virtio-9p available for fast I/O
+    RUNTIME_AUTH="0"  # registry auth config (config.json / auth.json) available on dedicated 9p share
     RUNTIME_IDLE_TIMEOUT="1800"  # Default: 30 minutes
 
     for param in $(cat /proc/cmdline); do
@@ -187,6 +188,9 @@ parse_cmdline() {
             ${VCONTAINER_RUNTIME_PREFIX}_9p=*)
                 RUNTIME_9P="${param#${VCONTAINER_RUNTIME_PREFIX}_9p=}"
                 ;;
+            ${VCONTAINER_RUNTIME_PREFIX}_auth=*)
+                RUNTIME_AUTH="${param#${VCONTAINER_RUNTIME_PREFIX}_auth=}"
+                ;;
         esac
     done
 
@@ -262,6 +266,56 @@ mount_input_disk() {
     fi
 }
 
+# ============================================================================
+# Registry auth share (docker config.json / podman auth.json)
+# ============================================================================
+# The host stages a validated credential file on a *dedicated* read-only 9p
+# share tagged "${VCONTAINER_RUNTIME_NAME}_auth" (e.g. "vdkr_auth" or
+# "vpdmn_auth"). That tag is separate from the general ${VCONTAINER_SHARE_NAME}
+# used for input/output so credentials can't leak into storage.tar outputs or
+# be overwritten by daemon_send_with_input.
+#
+# We mount read-only, nosuid, nodev, noexec at /mnt/auth. Callers are expected
+# to copy the credential file into the runtime's canonical location with
+# restrictive permissions and then call unmount_auth_share() so the guest
+# filesystem no longer has an open reference to the host-side file.
+
+AUTH_SHARE_TAG=""
+AUTH_SHARE_MOUNT="/mnt/auth"
+
+mount_auth_share() {
+    if [ "$RUNTIME_AUTH" != "1" ]; then
+        return 1
+    fi
+
+    AUTH_SHARE_TAG="${VCONTAINER_RUNTIME_NAME}_auth"
+    mkdir -p "$AUTH_SHARE_MOUNT"
+
+    # trans/version/cache match the existing 9p share mount. Add:
+    #   ro      - guest can't mutate the host-side staging directory
+    #   nosuid  - no setuid binaries can be executed from the share
+    #   nodev   - no device nodes honoured even if crafted
+    #   noexec  - no code can execute from the share (auth.json is pure data)
+    if mount -t 9p \
+        -o trans=${NINE_P_TRANSPORT},version=9p2000.L,cache=none,ro,nosuid,nodev,noexec \
+        "$AUTH_SHARE_TAG" "$AUTH_SHARE_MOUNT" 2>/dev/null; then
+        log "Mounted auth 9p share at $AUTH_SHARE_MOUNT (tag: $AUTH_SHARE_TAG, ro)"
+        return 0
+    fi
+
+    log "WARNING: Could not mount auth 9p share ($AUTH_SHARE_TAG)"
+    RUNTIME_AUTH="0"
+    return 1
+}
+
+unmount_auth_share() {
+    if mountpoint -q "$AUTH_SHARE_MOUNT" 2>/dev/null; then
+        umount "$AUTH_SHARE_MOUNT" 2>/dev/null || \
+            umount -l "$AUTH_SHARE_MOUNT" 2>/dev/null || true
+    fi
+    rmdir "$AUTH_SHARE_MOUNT" 2>/dev/null || true
+}
+
 # ============================================================================
 # Network Configuration
 # ============================================================================
diff --git a/recipes-containers/vcontainer/files/vdkr-init.sh b/recipes-containers/vcontainer/files/vdkr-init.sh
index e1e869b2..4ad50668 100755
--- a/recipes-containers/vcontainer/files/vdkr-init.sh
+++ b/recipes-containers/vcontainer/files/vdkr-init.sh
@@ -26,6 +26,10 @@
 #   docker_registry_ca=1                  CA certificate available in /mnt/share/ca.crt
 #   docker_registry_user=<user>           Registry username for authentication
 #   docker_registry_pass=<base64>         Base64-encoded registry password
+#   docker_auth=1                         A pre-built docker config.json is available
+#                                         on a dedicated read-only 9p share tagged
+#                                         "vdkr_auth" (mounted at /mnt/auth). Takes
+#                                         precedence over docker_registry_user/pass.
 #
 # Version: 2.5.0
 
@@ -159,6 +163,55 @@ EOF
     fi
 }
 
+# Install a user-supplied docker config.json from the dedicated read-only
+# auth 9p share (mounted at /mnt/auth by mount_auth_share). This takes
+# precedence over credentials supplied via docker_registry_user/pass.
+#
+# Security posture:
+#   * File is read from a read-only 9p share with a separate tag ("vdkr_auth")
+#     so it cannot leak into /mnt/share outputs.
+#   * Target is written with mode 0600 and the parent dir with mode 0700.
+#   * We unmount /mnt/auth immediately after copying so neither the dockerd
+#     runtime nor user workloads in the VM have an open reference to the
+#     host-side staging directory.
+install_auth_config() {
+    if [ "$RUNTIME_AUTH" != "1" ]; then
+        return 0
+    fi
+
+    if ! mount_auth_share; then
+        log "WARNING: docker_auth=1 was set but the auth 9p share did not mount"
+        return 1
+    fi
+
+    local src="$AUTH_SHARE_MOUNT/config.json"
+    if [ ! -f "$src" ]; then
+        log "WARNING: expected $src on auth share but file is missing"
+        unmount_auth_share
+        return 1
+    fi
+
+    mkdir -p /root/.docker
+    chmod 700 /root/.docker
+
+    if cp "$src" /root/.docker/config.json 2>/dev/null; then
+        chmod 600 /root/.docker/config.json
+        log "Installed registry auth config at /root/.docker/config.json"
+        if [ -n "$DOCKER_REGISTRY_USER" ] || [ -n "$DOCKER_REGISTRY_PASS" ]; then
+            log "NOTE: --config takes precedence over --registry-user/--registry-pass"
+        fi
+    else
+        log "ERROR: failed to copy auth config to /root/.docker/config.json"
+        unmount_auth_share
+        return 1
+    fi
+
+    # Release the host-side share so credentials aren't still addressable
+    # through /mnt/auth for the lifetime of the VM.
+    unmount_auth_share
+    return 0
+}
+
 # ============================================================================
 # Docker-Specific Functions
 # ============================================================================
@@ -684,6 +737,11 @@ parse_secure_registry_config
 # Install CA certificate for secure registry
 install_registry_ca
 
+# Install user-supplied docker config.json from the dedicated auth 9p share.
+# Must run AFTER install_registry_ca so that --config takes precedence when
+# both mechanisms are used.
+install_auth_config
+
 # Start containerd and dockerd (Docker-specific)
 start_containerd
 start_dockerd
diff --git a/recipes-containers/vcontainer/files/vpdmn-init.sh b/recipes-containers/vcontainer/files/vpdmn-init.sh
index 7f661102..2036ed39 100755
--- a/recipes-containers/vcontainer/files/vpdmn-init.sh
+++ b/recipes-containers/vcontainer/files/vpdmn-init.sh
@@ -20,6 +20,12 @@
 #   podman_output=<type>   Output type: text, tar, storage (default: text)
 #   podman_state=<type>    State type: none, disk (default: none)
 #   podman_network=1       Enable networking (configure eth0, DNS)
+#   podman_auth=1          A pre-built registry auth file (docker config.json
+#                          schema, "auths" block) is available on a dedicated
+#                          read-only 9p share tagged "vpdmn_auth" (mounted at
+#                          /mnt/auth). Installed as /run/containers/0/auth.json
+#                          (the rootful podman default), and exported via
+#                          $REGISTRY_AUTH_FILE.
 #
 # Version: 1.1.0
 #
@@ -97,6 +103,57 @@ verify_podman() {
     fi
 }
 
+# Install a user-supplied registry auth file from the dedicated read-only
+# auth 9p share (mounted at /mnt/auth by mount_auth_share). Podman accepts
+# the same "auths" JSON schema as docker config.json, so we can copy directly.
+#
+# Canonical rootful path is /run/containers/0/auth.json; we also export
+# $REGISTRY_AUTH_FILE so it works regardless of podman's search order.
+#
+# Security posture matches vdkr-init.sh install_auth_config:
+#   * Source is a separate read-only 9p tag ("vpdmn_auth") so it cannot leak
+#     into /mnt/share outputs.
+#   * Target has mode 0600; containing dir has mode 0700.
+#   * /mnt/auth is unmounted immediately after copy so user workloads in the
+#     VM have no open reference to the host-side staging directory.
+install_auth_config() {
+    if [ "$RUNTIME_AUTH" != "1" ]; then
+        return 0
+    fi
+
+    if ! mount_auth_share; then
+        log "WARNING: podman_auth=1 was set but the auth 9p share did not mount"
+        return 1
+    fi
+
+    local src="$AUTH_SHARE_MOUNT/config.json"
+    if [ ! -f "$src" ]; then
+        log "WARNING: expected $src on auth share but file is missing"
+        unmount_auth_share
+        return 1
+    fi
+
+    # Rootful podman's default auth path
+    local auth_dir="/run/containers/0"
+    local auth_file="$auth_dir/auth.json"
+
+    mkdir -p "$auth_dir"
+    chmod 700 "$auth_dir"
+
+    if cp "$src" "$auth_file" 2>/dev/null; then
+        chmod 600 "$auth_file"
+        export REGISTRY_AUTH_FILE="$auth_file"
+        log "Installed registry auth config at $auth_file"
+    else
+        log "ERROR: failed to copy auth config to $auth_file"
+        unmount_auth_share
+        return 1
+    fi
+
+    unmount_auth_share
+    return 0
+}
+
 # Podman is daemonless - nothing to stop
 stop_runtime_daemons() {
     :
@@ -190,6 +247,10 @@ configure_networking
 # Verify podman is available (no daemon to start)
 verify_podman
 
+# Install user-supplied auth config from the dedicated auth 9p share, if any.
+# Done before command execution so pulls/logins have credentials available.
+install_auth_config
+
 # Handle daemon mode or single command execution
 if [ "$RUNTIME_DAEMON" = "1" ]; then
     run_daemon_mode
diff --git a/recipes-containers/vcontainer/files/vrunner.sh b/recipes-containers/vcontainer/files/vrunner.sh
index 1744245a..2fd61655 100755
--- a/recipes-containers/vcontainer/files/vrunner.sh
+++ b/recipes-containers/vcontainer/files/vrunner.sh
@@ -38,6 +38,13 @@ TARGET_ARCH="${VDKR_ARCH:-${VPDMN_ARCH:-aarch64}}"
 TIMEOUT="${VDKR_TIMEOUT:-${VPDMN_TIMEOUT:-300}}"
 VERBOSE="${VDKR_VERBOSE:-${VPDMN_VERBOSE:-false}}"
 
+# Registry authentication config file (docker config.json / podman auth.json).
+# Can be set via $VDKR_CONFIG or $VPDMN_CONFIG in the environment, and is
+# overridden by the --config CLI flag below. The file is passed into the guest
+# over a dedicated read-only virtio-9p share and installed into the guest
+# container runtime's credential location by the init script.
+AUTH_CONFIG="${VDKR_CONFIG:-${VPDMN_CONFIG:-}}"
+
 # Runtime-specific settings (set after parsing --runtime)
 set_runtime_config() {
     case "$RUNTIME" in
@@ -232,6 +239,12 @@ OPTIONS:
     --network, -n        Enable networking (slirp user-mode, outbound only)
     --registry <url>     Default registry for unqualified images (e.g., 10.0.2.2:5000/yocto)
     --insecure-registry <host:port>  Mark registry as insecure (HTTP). Can repeat.
+    --config <path>      Path to docker/podman auth config (config.json / auth.json).
+                         Defaults to $VDKR_CONFIG or $VPDMN_CONFIG from environment.
+                         The file is passed to the guest over a dedicated read-only
+                         virtio-9p share and installed at /root/.docker/config.json
+                         (vdkr) or /run/containers/0/auth.json (vpdmn). The host file
+                         must be a regular file with mode 0600 or stricter.
     --interactive, -it   Run in interactive mode (connects terminal to container)
     --timeout <secs>     QEMU timeout [default: 300]
     --idle-timeout <s>   Daemon idle timeout in seconds [default: 1800]
@@ -406,6 +419,13 @@ while [ $# -gt 0 ]; do
             REGISTRY_PASS="$2"
             shift 2
             ;;
+        --config)
+            # Path to a docker/podman config file (config.json / auth.json)
+            # Overrides $VDKR_CONFIG / $VPDMN_CONFIG. The file is mounted into
+            # the guest via a dedicated read-only virtio-9p share.
+            AUTH_CONFIG="$2"
+            shift 2
+            ;;
         --interactive|-it)
             INTERACTIVE="true"
             shift
@@ -847,6 +867,124 @@ fi
 TEMP_DIR="${TMPDIR:-/tmp}/vdkr-$$"
 mkdir -p "$TEMP_DIR"
 
+# ============================================================================
+# Registry auth config (docker config.json / podman auth.json)
+# ============================================================================
+# The AUTH_CONFIG path (from $VDKR_CONFIG, $VPDMN_CONFIG, or --config) points
+# to a file containing container-registry credentials. For defence-in-depth we:
+#   * reject non-regular files (symlinks, devices, directories)
+#   * reject files readable by group/other (mode must be <= 0600)
+#   * warn if the file is not owned by the invoking user
+#   * copy it into a private per-invocation directory under $TEMP_DIR at 0400
+#   * expose it to the guest via a *separate* read-only virtio-9p tag
+#     ("${TOOL_NAME}_auth") mounted at /mnt/auth (not the generic /mnt/share
+#     which holds input/output and is wiped between daemon commands)
+#   * never pass the file contents or path on the kernel cmdline; only a flag
+#     "${CMDLINE_PREFIX}_auth=1" to tell the init script to look at /mnt/auth
+#   * rely on the existing $TEMP_DIR EXIT/INT/TERM trap to delete the copy
+#
+# The auth file is never logged (path is visible, but contents are not).
+AUTH_SHARE_DIR=""
+
+validate_auth_config() {
+    local path="$1"
+
+    # Resolve symlinks to the canonical path so the perm check applies to the
+    # actual file, but still require the *named* path to be a regular file
+    # (not a symlink pointing into sensitive areas like /proc/self/environ).
+    if [ -L "$path" ]; then
+        log "ERROR" "--config must not be a symlink: $path"
+        return 1
+    fi
+    if [ ! -e "$path" ]; then
+        log "ERROR" "--config file not found: $path"
+        return 1
+    fi
+    if [ ! -f "$path" ]; then
+        log "ERROR" "--config must be a regular file: $path"
+        return 1
+    fi
+    if [ ! -r "$path" ]; then
+        log "ERROR" "--config file is not readable: $path"
+        return 1
+    fi
+
+    # Size sanity: docker config.json / podman auth.json should be small.
+    # 1 MiB is already generous. Reject unusually large files to avoid
+    # accidentally shipping a large credential blob.
+    local size
+    size=$(stat -c %s "$path" 2>/dev/null || echo 0)
+    if [ "$size" -gt 1048576 ]; then
+        log "ERROR" "--config file is too large ($size bytes, max 1 MiB): $path"
+        return 1
+    fi
+    # Minimum valid JSON object "{}" is 2 bytes. Anything smaller (including a
+    # 0-byte truncation or a lone newline from "echo '' > file") can't be a
+    # real auth config; reject rather than silently shipping garbage.
+    if [ "$size" -lt 2 ]; then
+        log "ERROR" "--config file is empty or too small to be valid JSON: $path"
+        return 1
+    fi
+
+    # Permission check: must not be readable by group or world.
+    local mode
+    mode=$(stat -c %a "$path" 2>/dev/null || echo 0)
+    # stat %a emits octal without leading zero. Forbid any group/other bits.
+    case "$mode" in
+        400|600|200) ;;
+        *)
+            log "ERROR" "--config file has unsafe permissions ($mode); expected 0600 or 0400."
+            log "ERROR" "Fix with: chmod 600 \"$path\""
+            return 1
+            ;;
+    esac
+
+    # Ownership check: warn if file is not owned by the current user.
+    local uid owner
+    uid=$(id -u)
+    owner=$(stat -c %u "$path" 2>/dev/null || echo "")
+    if [ -n "$owner" ] && [ "$owner" != "$uid" ]; then
+        log "WARN" "--config file is not owned by current user (uid=$uid, owner=$owner)"
+    fi
+
+    return 0
+}
+
+# Stage the auth config into a dedicated read-only 9p share. Must be called
+# AFTER $TEMP_DIR exists and AFTER hypervisor backend functions are sourced.
+# Sets $AUTH_SHARE_DIR and appends to $HV_OPTS / $KERNEL_APPEND.
+setup_auth_share() {
+    [ -z "$AUTH_CONFIG" ] && return 0
+
+    if ! validate_auth_config "$AUTH_CONFIG"; then
+        log "ERROR" "Refusing to stage $AUTH_CONFIG — see above."
+        exit 1
+    fi
+
+    AUTH_SHARE_DIR="$TEMP_DIR/auth_share"
+    # 0700 so nothing outside our process can peek at the staged file.
+    mkdir -p "$AUTH_SHARE_DIR"
+    chmod 700 "$AUTH_SHARE_DIR"
+
+    # Always stage as config.json regardless of source filename — the guest
+    # init script knows to look for this fixed name.
+    if ! cp "$AUTH_CONFIG" "$AUTH_SHARE_DIR/config.json"; then
+        log "ERROR" "Failed to stage auth config"
+        exit 1
+    fi
+    chmod 400 "$AUTH_SHARE_DIR/config.json"
+
+    local auth_tag="${TOOL_NAME}_auth"
+    hv_build_9p_opts "$AUTH_SHARE_DIR" "$auth_tag" "readonly=on"
+    KERNEL_APPEND="$KERNEL_APPEND ${CMDLINE_PREFIX}_auth=1"
+
+    # Deliberately log the *fact* of staging, not the path contents or
+    # credentials. The path itself is useful for debugging and appears in
+    # --verbose mode only.
+    log "INFO" "Registry auth config staged on read-only 9p share (tag=$auth_tag)"
+    log "DEBUG" "Auth source: $AUTH_CONFIG"
+}
+
 cleanup() {
     if [ "$KEEP_TEMP" = "true" ]; then
         log "DEBUG" "Keeping temp directory: $TEMP_DIR"
@@ -1310,6 +1448,10 @@ if [ "$DAEMON_MODE" = "start" ]; then
         log "DEBUG" "CA certificate copied to shared folder"
     fi
 
+    # Stage registry auth config (config.json / auth.json) on a dedicated
+    # read-only 9p share. See setup_auth_share() for the security model.
+    setup_auth_share
+
     log "INFO" "Starting daemon..."
     log "DEBUG" "PID file: $DAEMON_PID_FILE"
     log "DEBUG" "Socket: $DAEMON_SOCKET"
@@ -1439,6 +1581,11 @@ if [ -n "$CA_CERT" ] && [ -f "$CA_CERT" ]; then
     log "DEBUG" "CA certificate available via 9p"
 fi
 
+# Stage registry auth config (config.json / auth.json) on a dedicated read-only
+# 9p share for non-daemon and batch-import modes. Safe to call when AUTH_CONFIG
+# is empty — it no-ops. See setup_auth_share() for the security model.
+setup_auth_share
+
 log "INFO" "Starting VM ($VCONTAINER_HYPERVISOR)..."
 
 # Interactive mode runs VM in foreground with stdio connected
-- 
2.47.3


