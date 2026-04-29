Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEDECCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 20:16:52 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5365.1777493811369081972
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 13:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O90seZ12;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8a48deebe95so1972066d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Apr 2026 13:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777493810; x=1778098610; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qvBcH5NpPzP/Je1jsKCYk/knjs0dqBCsmPis+iPyjbs=;
        b=O90seZ12kud+NCUPFEPJmt+mwyDuL1U1v3msaPlo5aFXqXlABmKbuNL1zuq/gdWSXv
         BmN5CzxExPlIDBsRkdxkoCwy/Wbm6mFTVjGK7vWFDtUjE7o8TlB2sNzTd9QWh0NOFziY
         FksddNL9KJ/V1U/qpSKV5Dsgv3uyT+K/7kbCjFFLkj8f0KZGR79iePAgeJpv5nIgllIk
         JEEPAbduC39xjzBSam3f7Fl0VTUCcpNsArqfmMyGlGGHc4dLTcbJAEPRlLfI/wYqPoRR
         huMZf4H2ltCqNSurjjkwNzq3naiFMiqmvM2qW5c0uShLpk3oetOwn2bGl5XxMkcFsUGY
         ZdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777493810; x=1778098610;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qvBcH5NpPzP/Je1jsKCYk/knjs0dqBCsmPis+iPyjbs=;
        b=brCeg82hSlqAMMZTtLA5e6coNMzQlNTUdEZp5O3FOiuJL0V1FyBLZq+txz7b64OiaK
         qn20QR+JLhibaufG5rcHN5ApovB4G70a4jU1rBigHutX1elVIrp/X+n3FCR086lYrTvZ
         fnlKBtqCu04AlKgGmQO/3UEesWc5ci81r3DH6zOd02fATyAO3p3aNnRcAKTadLOU4GeA
         ODO3bUQImFEL5QHV8JYuo3JIDtGM9SOqERNzEEtlZCxJmvSY4dPp/6GUYLPaBR15AjJz
         Kd39PmZAhbI3S0Aqzt0SPMZl6Awroqbna1eOE4FlRdGRm4s4wc+Ga6t4Z/Nyv8WBGWUD
         0Vyw==
X-Gm-Message-State: AOJu0YwNA2E8NELh/QokUvZMduM2Gd/IKi1Y3buKheNF50jrQLHwbhoG
	cFYeCaYhPKP2YuE4Cj968Zv9mQ0Pawf1XjwsQSiRKNyTTGpE9MmIjd4G0R4toRtE0Dkzgg==
X-Gm-Gg: AeBDiet4Zargb670KGR6JfT13RU6JxuAmx/8BDqZ3TuanlQE4aijzBhyZoLj1sWFXrN
	Z5zwkXR0baNfGxNKuzo5nwPT9wYXoSw9irLj0lNpHiDKYqm4tdQvzcjMpPOTnGxdQwT1nihOZQl
	5eiBtdBrJWkP2VtQnJLsuFSDGlBRWeXzTjDxKLxrUCCUoQys6UbXBxysMm6ASMwjxK5P1lZcc6j
	19POUwOOa8GRZAE2F8MXCYRhqoPm8KgJRMdatS24iHp6NP7Z2DvVzdVyS0SYCfT5ZDUCTjeXKgH
	gCYSSgtG8KQhUgs3TNg9/rv7F6wrNdOhcaM+HI4AYiSuMcA+g3B/5tOFJ0oeLBPsquYTbN6O/O9
	uvOTcuShkB/jGglByVKBhIFu+kgD4ne3GesN5EPB6WrKg2l6dJ/wabHxFTO8X+yqyqKyVev7BG1
	TjxfBhJ9TW46rz2s2y6QmlntdyOS+WiqUF4XlPaFwDYgntmgWrlljWwOJRV6Xf9wRZ7+9R00TVP
	m7A5kPdLYnREGX+QNOiV4eEylbz4e4I+xA6iUX8zWB5v0g=
X-Received: by 2002:a05:6214:3307:b0:8ae:6587:3d60 with SMTP id 6a1803df08f44-8b3e30867a2mr135052956d6.33.1777493809660;
        Wed, 29 Apr 2026 13:16:49 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef80f7c5sm26859346d6.33.2026.04.29.13.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 13:16:48 -0700 (PDT)
Date: Wed, 29 Apr 2026 20:16:47 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: tim.orling@konsulko.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [RESEND][RFC][PATCH 1/2] vcontainer: add
 --config / VDKR_CONFIG for docker/podman auth credentials
Message-ID: <afJnL6e3aFJ5Nq2x@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260429195807.1371305-2-tim.orling@konsulko.com>
 <20260429195807.1371305-1-tim.orling@konsulko.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Apr 2026 20:16:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9782

merged.

Bruce

In message: [meta-virtualization] [RESEND][RFC][PATCH 1/2] vcontainer: add --config / VDKR_CONFIG for docker/podman auth credentials
on 29/04/2026 Tim Orling via lists.yoctoproject.org wrote:

> From: Tim Orling <tim.orling@konsulko.com>
> 
> Add a VDKR_CONFIG / VPDMN_CONFIG env var and a matching --config <path>
> CLI flag that passes an existing docker config.json / podman auth.json
> into the QEMU-hosted container runtime so pulls from private registries
> work without having to retype --registry-user / --registry-pass on every
> command.
> 
> Security posture (defence in depth):
> - Host-side pre-flight validation in vrunner.sh (validate_auth_config):
>   reject symlinks, non-regular files, missing / unreadable files, files
>   smaller than 2 bytes (minimum "{}") or larger than 1 MiB, and any
>   permissions other than 0400 / 0600 / 0200. WARN if not owned by the
>   invoking user.
> - Stage the file into a dedicated per-invocation directory under
>   $TEMP_DIR at mode 0400 inside a 0700 parent; auto-cleanup rides the
>   existing EXIT/INT/TERM trap.
> - Expose the staged file over a *separate* read-only virtio-9p tag
>   ("${TOOL_NAME}_auth") so credentials cannot leak into the general
>   /mnt/share input/output directory or into storage.tar outputs.
> - Only a boolean flag ("${CMDLINE_PREFIX}_auth=1") is appended to the
>   kernel cmdline - never the path, the env var name, or the contents.
> - Guest mounts /mnt/auth ro,nosuid,nodev,noexec, copies to the runtime's
>   canonical path, then unmounts immediately so neither the runtime nor
>   user workloads keep a reference to the host staging directory.
> 
> vrunner.sh:
> - Initialise AUTH_CONFIG from $VDKR_CONFIG / $VPDMN_CONFIG
> - Parse --config <path> (overrides the env vars)
> - Add validate_auth_config() and setup_auth_share() with the rules above
> - Call setup_auth_share in both the daemon start path and the
>   non-daemon / batch-import path
> 
> vcontainer-init-common.sh:
> - Default RUNTIME_AUTH="0" and parse ${VCONTAINER_RUNTIME_PREFIX}_auth=*
>   from the kernel cmdline
> - Define mount_auth_share() / unmount_auth_share() using the per-runtime
>   "${VCONTAINER_RUNTIME_NAME}_auth" 9p tag, mounted at /mnt/auth with
>   ro,nosuid,nodev,noexec
> 
> vdkr-init.sh:
> - install_auth_config() copies /mnt/auth/config.json to
>   /root/.docker/config.json (mode 0600; parent dir 0700)
> - Called after install_registry_ca in main flow so --config takes
>   precedence over --registry-user / --registry-pass; logs a NOTE when
>   both mechanisms are supplied
> - Unmounts /mnt/auth after copy
> 
> vpdmn-init.sh:
> - install_auth_config() copies to /run/containers/0/auth.json (the
>   rootful podman canonical path) and exports REGISTRY_AUTH_FILE so the
>   creds are picked up regardless of podman's search order
> - Mode 0600 on the file, 0700 on the containing directory
> - Unmounts /mnt/auth after copy
> 
> vcontainer-common.sh:
> - Honour $VDKR_CONFIG / $VPDMN_CONFIG, parse --config, and forward
>   AUTH_CONFIG to vrunner.sh via --config in build_runner_args
> - Document the flag and env vars in show_usage
> 
> README.md:
> - New "Passing an existing docker/podman auth file (--config)" section
>   with examples for both runtimes, a table of target paths, and the
>   full security model
> 
> AI-Generated: Claude Cowork Opus 4.7
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  recipes-containers/vcontainer/README.md       |  54 +++++++
>  .../vcontainer/files/vcontainer-common.sh     |  18 +++
>  .../files/vcontainer-init-common.sh           |  54 +++++++
>  .../vcontainer/files/vdkr-init.sh             |  58 +++++++
>  .../vcontainer/files/vpdmn-init.sh            |  61 ++++++++
>  .../vcontainer/files/vrunner.sh               | 147 ++++++++++++++++++
>  6 files changed, 392 insertions(+)
> 
> diff --git a/recipes-containers/vcontainer/README.md b/recipes-containers/vcontainer/README.md
> index 657dd02e..e44616f4 100644
> --- a/recipes-containers/vcontainer/README.md
> +++ b/recipes-containers/vcontainer/README.md
> @@ -317,6 +317,60 @@ use `--secure-registry --ca-cert`:
>  vdkr --secure-registry --ca-cert /path/to/ca.crt pull myimage
>  ```
>  
> +### Passing an existing docker/podman auth file (`--config`)
> +
> +If you already have credentials set up on the host (for example, from
> +running `docker login` locally), you can pass the resulting auth file
> +straight through into the emulated environment instead of re-entering
> +credentials with `--registry-user`/`--registry-pass`:
> +
> +```bash
> +# Docker (vdkr): uses ~/.docker/config.json by default
> +vdkr --config ~/.docker/config.json pull registry.example.com/myimage
> +
> +# Podman (vpdmn): uses $XDG_RUNTIME_DIR/containers/auth.json
> +vpdmn --config $XDG_RUNTIME_DIR/containers/auth.json pull registry.example.com/myimage
> +```
> +
> +The path can also be supplied via environment:
> +
> +```bash
> +export VDKR_CONFIG=$HOME/.docker/config.json
> +vdkr pull registry.example.com/myimage
> +```
> +
> +(`VPDMN_CONFIG` is honoured identically by `vpdmn`.)
> +
> +**What the file ends up as inside the VM:**
> +
> +| Tool  | Target path                       | Notes                                             |
> +| ----- | --------------------------------- | ------------------------------------------------- |
> +| vdkr  | `/root/.docker/config.json`       | Mode 0600; containing dir 0700                    |
> +| vpdmn | `/run/containers/0/auth.json`     | Mode 0600; `$REGISTRY_AUTH_FILE` exported         |
> +
> +**Security model.** The credential file is treated as secret material:
> +
> +- The host-side file **must** be a regular file with mode `0600` or `0400`.
> +  World/group-readable files are rejected outright. Symlinks are rejected.
> +  Files larger than 1 MiB are rejected.
> +- On the host it is copied into a per-invocation private directory under
> +  `$TMPDIR/vdkr-$$/auth_share` (mode 0700; file mode 0400) and removed
> +  automatically by the `EXIT`/`INT`/`TERM` trap when `vrunner.sh` exits.
> +- It is exposed to the guest on a **dedicated** virtio-9p share whose
> +  mount tag (`vdkr_auth` / `vpdmn_auth`) is distinct from the general
> +  `*_share` share used for input/output. The guest mounts it **read-only**
> +  at `/mnt/auth`, copies it into the runtime's credential location, then
> +  **unmounts** `/mnt/auth` so nothing in the VM retains an open reference
> +  to the host staging directory.
> +- Nothing about the file appears on the kernel command line. Only a
> +  boolean flag (`docker_auth=1` / `podman_auth=1`) is passed so the guest
> +  init script knows to look on the auth share.
> +- When both `--config` and `--registry-user`/`--registry-pass` are
> +  supplied, `--config` wins and a NOTE is logged.
> +- `--config` is NOT forwarded into container workloads (it only reaches
> +  the container engine's credential store); containers themselves never
> +  see `/mnt/auth`.
> +
>  ## Volume Mounts
>  
>  Mount host directories into containers using `-v` (requires memory resident mode):
> diff --git a/recipes-containers/vcontainer/files/vcontainer-common.sh b/recipes-containers/vcontainer/files/vcontainer-common.sh
> index 126ca727..8adec77d 100755
> --- a/recipes-containers/vcontainer/files/vcontainer-common.sh
> +++ b/recipes-containers/vcontainer/files/vcontainer-common.sh
> @@ -718,6 +718,11 @@ ${BOLD}GLOBAL OPTIONS:${NC}
>      --registry <url>      Default registry for unqualified images (e.g., 10.0.2.2:5000/yocto)
>      --no-registry         Disable baked-in default registry (use images as-is)
>      --insecure-registry <host:port>  Mark registry as insecure (HTTP). Can repeat.
> +    --config <path>       Registry auth file (docker config.json / podman auth.json)
> +                          Defaults to \$VDKR_CONFIG / \$VPDMN_CONFIG. The file must be
> +                          mode 0600 or stricter; it is passed to the guest over a
> +                          dedicated read-only virtio-9p share and never appears on
> +                          the kernel cmdline.
>      --verbose, -v         Enable verbose output
>      --help, -h            Show this help
>  
> @@ -857,6 +862,7 @@ build_runner_args() {
>      [ -n "$CA_CERT" ] && args+=("--ca-cert" "$CA_CERT")
>      [ -n "$REGISTRY_USER" ] && args+=("--registry-user" "$REGISTRY_USER")
>      [ -n "$REGISTRY_PASS" ] && args+=("--registry-pass" "$REGISTRY_PASS")
> +    [ -n "$AUTH_CONFIG" ] && args+=("--config" "$AUTH_CONFIG")
>  
>      # Xen: pass exit grace period
>      [ -n "${VXN_EXIT_GRACE_PERIOD:-}" ] && args+=("--exit-grace-period" "$VXN_EXIT_GRACE_PERIOD")
> @@ -880,6 +886,11 @@ SECURE_REGISTRY="false"
>  CA_CERT=""
>  REGISTRY_USER=""
>  REGISTRY_PASS=""
> +# Registry auth config file. Env-var default depends on which CLI wrapper is
> +# in use (vdkr → $VDKR_CONFIG, vpdmn → $VPDMN_CONFIG), then falls back to the
> +# other for convenience when sharing a single host-side file. Overridden by
> +# the --config CLI flag below.
> +AUTH_CONFIG="${VDKR_CONFIG:-${VPDMN_CONFIG:-}}"
>  COMMAND=""
>  COMMAND_ARGS=()
>  
> @@ -977,6 +988,13 @@ while [ $# -gt 0 ]; do
>              REGISTRY_PASS="$2"
>              shift 2
>              ;;
> +        --config)
> +            # Path to a docker/podman registry auth file (config.json / auth.json).
> +            # Overrides $VDKR_CONFIG / $VPDMN_CONFIG. Forwarded to vrunner.sh --config,
> +            # which validates the file and stages it on a dedicated read-only 9p share.
> +            AUTH_CONFIG="$2"
> +            shift 2
> +            ;;
>          -it|--interactive)
>              INTERACTIVE="true"
>              shift
> diff --git a/recipes-containers/vcontainer/files/vcontainer-init-common.sh b/recipes-containers/vcontainer/files/vcontainer-init-common.sh
> index ab8762b2..3bd70e75 100755
> --- a/recipes-containers/vcontainer/files/vcontainer-init-common.sh
> +++ b/recipes-containers/vcontainer/files/vcontainer-init-common.sh
> @@ -156,6 +156,7 @@ parse_cmdline() {
>      RUNTIME_INTERACTIVE="0"
>      RUNTIME_DAEMON="0"
>      RUNTIME_9P="0"  # virtio-9p available for fast I/O
> +    RUNTIME_AUTH="0"  # registry auth config (config.json / auth.json) available on dedicated 9p share
>      RUNTIME_IDLE_TIMEOUT="1800"  # Default: 30 minutes
>  
>      for param in $(cat /proc/cmdline); do
> @@ -187,6 +188,9 @@ parse_cmdline() {
>              ${VCONTAINER_RUNTIME_PREFIX}_9p=*)
>                  RUNTIME_9P="${param#${VCONTAINER_RUNTIME_PREFIX}_9p=}"
>                  ;;
> +            ${VCONTAINER_RUNTIME_PREFIX}_auth=*)
> +                RUNTIME_AUTH="${param#${VCONTAINER_RUNTIME_PREFIX}_auth=}"
> +                ;;
>          esac
>      done
>  
> @@ -262,6 +266,56 @@ mount_input_disk() {
>      fi
>  }
>  
> +# ============================================================================
> +# Registry auth share (docker config.json / podman auth.json)
> +# ============================================================================
> +# The host stages a validated credential file on a *dedicated* read-only 9p
> +# share tagged "${VCONTAINER_RUNTIME_NAME}_auth" (e.g. "vdkr_auth" or
> +# "vpdmn_auth"). That tag is separate from the general ${VCONTAINER_SHARE_NAME}
> +# used for input/output so credentials can't leak into storage.tar outputs or
> +# be overwritten by daemon_send_with_input.
> +#
> +# We mount read-only, nosuid, nodev, noexec at /mnt/auth. Callers are expected
> +# to copy the credential file into the runtime's canonical location with
> +# restrictive permissions and then call unmount_auth_share() so the guest
> +# filesystem no longer has an open reference to the host-side file.
> +
> +AUTH_SHARE_TAG=""
> +AUTH_SHARE_MOUNT="/mnt/auth"
> +
> +mount_auth_share() {
> +    if [ "$RUNTIME_AUTH" != "1" ]; then
> +        return 1
> +    fi
> +
> +    AUTH_SHARE_TAG="${VCONTAINER_RUNTIME_NAME}_auth"
> +    mkdir -p "$AUTH_SHARE_MOUNT"
> +
> +    # trans/version/cache match the existing 9p share mount. Add:
> +    #   ro      - guest can't mutate the host-side staging directory
> +    #   nosuid  - no setuid binaries can be executed from the share
> +    #   nodev   - no device nodes honoured even if crafted
> +    #   noexec  - no code can execute from the share (auth.json is pure data)
> +    if mount -t 9p \
> +        -o trans=${NINE_P_TRANSPORT},version=9p2000.L,cache=none,ro,nosuid,nodev,noexec \
> +        "$AUTH_SHARE_TAG" "$AUTH_SHARE_MOUNT" 2>/dev/null; then
> +        log "Mounted auth 9p share at $AUTH_SHARE_MOUNT (tag: $AUTH_SHARE_TAG, ro)"
> +        return 0
> +    fi
> +
> +    log "WARNING: Could not mount auth 9p share ($AUTH_SHARE_TAG)"
> +    RUNTIME_AUTH="0"
> +    return 1
> +}
> +
> +unmount_auth_share() {
> +    if mountpoint -q "$AUTH_SHARE_MOUNT" 2>/dev/null; then
> +        umount "$AUTH_SHARE_MOUNT" 2>/dev/null || \
> +            umount -l "$AUTH_SHARE_MOUNT" 2>/dev/null || true
> +    fi
> +    rmdir "$AUTH_SHARE_MOUNT" 2>/dev/null || true
> +}
> +
>  # ============================================================================
>  # Network Configuration
>  # ============================================================================
> diff --git a/recipes-containers/vcontainer/files/vdkr-init.sh b/recipes-containers/vcontainer/files/vdkr-init.sh
> index e1e869b2..4ad50668 100755
> --- a/recipes-containers/vcontainer/files/vdkr-init.sh
> +++ b/recipes-containers/vcontainer/files/vdkr-init.sh
> @@ -26,6 +26,10 @@
>  #   docker_registry_ca=1                  CA certificate available in /mnt/share/ca.crt
>  #   docker_registry_user=<user>           Registry username for authentication
>  #   docker_registry_pass=<base64>         Base64-encoded registry password
> +#   docker_auth=1                         A pre-built docker config.json is available
> +#                                         on a dedicated read-only 9p share tagged
> +#                                         "vdkr_auth" (mounted at /mnt/auth). Takes
> +#                                         precedence over docker_registry_user/pass.
>  #
>  # Version: 2.5.0
>  
> @@ -159,6 +163,55 @@ EOF
>      fi
>  }
>  
> +# Install a user-supplied docker config.json from the dedicated read-only
> +# auth 9p share (mounted at /mnt/auth by mount_auth_share). This takes
> +# precedence over credentials supplied via docker_registry_user/pass.
> +#
> +# Security posture:
> +#   * File is read from a read-only 9p share with a separate tag ("vdkr_auth")
> +#     so it cannot leak into /mnt/share outputs.
> +#   * Target is written with mode 0600 and the parent dir with mode 0700.
> +#   * We unmount /mnt/auth immediately after copying so neither the dockerd
> +#     runtime nor user workloads in the VM have an open reference to the
> +#     host-side staging directory.
> +install_auth_config() {
> +    if [ "$RUNTIME_AUTH" != "1" ]; then
> +        return 0
> +    fi
> +
> +    if ! mount_auth_share; then
> +        log "WARNING: docker_auth=1 was set but the auth 9p share did not mount"
> +        return 1
> +    fi
> +
> +    local src="$AUTH_SHARE_MOUNT/config.json"
> +    if [ ! -f "$src" ]; then
> +        log "WARNING: expected $src on auth share but file is missing"
> +        unmount_auth_share
> +        return 1
> +    fi
> +
> +    mkdir -p /root/.docker
> +    chmod 700 /root/.docker
> +
> +    if cp "$src" /root/.docker/config.json 2>/dev/null; then
> +        chmod 600 /root/.docker/config.json
> +        log "Installed registry auth config at /root/.docker/config.json"
> +        if [ -n "$DOCKER_REGISTRY_USER" ] || [ -n "$DOCKER_REGISTRY_PASS" ]; then
> +            log "NOTE: --config takes precedence over --registry-user/--registry-pass"
> +        fi
> +    else
> +        log "ERROR: failed to copy auth config to /root/.docker/config.json"
> +        unmount_auth_share
> +        return 1
> +    fi
> +
> +    # Release the host-side share so credentials aren't still addressable
> +    # through /mnt/auth for the lifetime of the VM.
> +    unmount_auth_share
> +    return 0
> +}
> +
>  # ============================================================================
>  # Docker-Specific Functions
>  # ============================================================================
> @@ -684,6 +737,11 @@ parse_secure_registry_config
>  # Install CA certificate for secure registry
>  install_registry_ca
>  
> +# Install user-supplied docker config.json from the dedicated auth 9p share.
> +# Must run AFTER install_registry_ca so that --config takes precedence when
> +# both mechanisms are used.
> +install_auth_config
> +
>  # Start containerd and dockerd (Docker-specific)
>  start_containerd
>  start_dockerd
> diff --git a/recipes-containers/vcontainer/files/vpdmn-init.sh b/recipes-containers/vcontainer/files/vpdmn-init.sh
> index 7f661102..2036ed39 100755
> --- a/recipes-containers/vcontainer/files/vpdmn-init.sh
> +++ b/recipes-containers/vcontainer/files/vpdmn-init.sh
> @@ -20,6 +20,12 @@
>  #   podman_output=<type>   Output type: text, tar, storage (default: text)
>  #   podman_state=<type>    State type: none, disk (default: none)
>  #   podman_network=1       Enable networking (configure eth0, DNS)
> +#   podman_auth=1          A pre-built registry auth file (docker config.json
> +#                          schema, "auths" block) is available on a dedicated
> +#                          read-only 9p share tagged "vpdmn_auth" (mounted at
> +#                          /mnt/auth). Installed as /run/containers/0/auth.json
> +#                          (the rootful podman default), and exported via
> +#                          $REGISTRY_AUTH_FILE.
>  #
>  # Version: 1.1.0
>  #
> @@ -97,6 +103,57 @@ verify_podman() {
>      fi
>  }
>  
> +# Install a user-supplied registry auth file from the dedicated read-only
> +# auth 9p share (mounted at /mnt/auth by mount_auth_share). Podman accepts
> +# the same "auths" JSON schema as docker config.json, so we can copy directly.
> +#
> +# Canonical rootful path is /run/containers/0/auth.json; we also export
> +# $REGISTRY_AUTH_FILE so it works regardless of podman's search order.
> +#
> +# Security posture matches vdkr-init.sh install_auth_config:
> +#   * Source is a separate read-only 9p tag ("vpdmn_auth") so it cannot leak
> +#     into /mnt/share outputs.
> +#   * Target has mode 0600; containing dir has mode 0700.
> +#   * /mnt/auth is unmounted immediately after copy so user workloads in the
> +#     VM have no open reference to the host-side staging directory.
> +install_auth_config() {
> +    if [ "$RUNTIME_AUTH" != "1" ]; then
> +        return 0
> +    fi
> +
> +    if ! mount_auth_share; then
> +        log "WARNING: podman_auth=1 was set but the auth 9p share did not mount"
> +        return 1
> +    fi
> +
> +    local src="$AUTH_SHARE_MOUNT/config.json"
> +    if [ ! -f "$src" ]; then
> +        log "WARNING: expected $src on auth share but file is missing"
> +        unmount_auth_share
> +        return 1
> +    fi
> +
> +    # Rootful podman's default auth path
> +    local auth_dir="/run/containers/0"
> +    local auth_file="$auth_dir/auth.json"
> +
> +    mkdir -p "$auth_dir"
> +    chmod 700 "$auth_dir"
> +
> +    if cp "$src" "$auth_file" 2>/dev/null; then
> +        chmod 600 "$auth_file"
> +        export REGISTRY_AUTH_FILE="$auth_file"
> +        log "Installed registry auth config at $auth_file"
> +    else
> +        log "ERROR: failed to copy auth config to $auth_file"
> +        unmount_auth_share
> +        return 1
> +    fi
> +
> +    unmount_auth_share
> +    return 0
> +}
> +
>  # Podman is daemonless - nothing to stop
>  stop_runtime_daemons() {
>      :
> @@ -190,6 +247,10 @@ configure_networking
>  # Verify podman is available (no daemon to start)
>  verify_podman
>  
> +# Install user-supplied auth config from the dedicated auth 9p share, if any.
> +# Done before command execution so pulls/logins have credentials available.
> +install_auth_config
> +
>  # Handle daemon mode or single command execution
>  if [ "$RUNTIME_DAEMON" = "1" ]; then
>      run_daemon_mode
> diff --git a/recipes-containers/vcontainer/files/vrunner.sh b/recipes-containers/vcontainer/files/vrunner.sh
> index 1744245a..2fd61655 100755
> --- a/recipes-containers/vcontainer/files/vrunner.sh
> +++ b/recipes-containers/vcontainer/files/vrunner.sh
> @@ -38,6 +38,13 @@ TARGET_ARCH="${VDKR_ARCH:-${VPDMN_ARCH:-aarch64}}"
>  TIMEOUT="${VDKR_TIMEOUT:-${VPDMN_TIMEOUT:-300}}"
>  VERBOSE="${VDKR_VERBOSE:-${VPDMN_VERBOSE:-false}}"
>  
> +# Registry authentication config file (docker config.json / podman auth.json).
> +# Can be set via $VDKR_CONFIG or $VPDMN_CONFIG in the environment, and is
> +# overridden by the --config CLI flag below. The file is passed into the guest
> +# over a dedicated read-only virtio-9p share and installed into the guest
> +# container runtime's credential location by the init script.
> +AUTH_CONFIG="${VDKR_CONFIG:-${VPDMN_CONFIG:-}}"
> +
>  # Runtime-specific settings (set after parsing --runtime)
>  set_runtime_config() {
>      case "$RUNTIME" in
> @@ -232,6 +239,12 @@ OPTIONS:
>      --network, -n        Enable networking (slirp user-mode, outbound only)
>      --registry <url>     Default registry for unqualified images (e.g., 10.0.2.2:5000/yocto)
>      --insecure-registry <host:port>  Mark registry as insecure (HTTP). Can repeat.
> +    --config <path>      Path to docker/podman auth config (config.json / auth.json).
> +                         Defaults to $VDKR_CONFIG or $VPDMN_CONFIG from environment.
> +                         The file is passed to the guest over a dedicated read-only
> +                         virtio-9p share and installed at /root/.docker/config.json
> +                         (vdkr) or /run/containers/0/auth.json (vpdmn). The host file
> +                         must be a regular file with mode 0600 or stricter.
>      --interactive, -it   Run in interactive mode (connects terminal to container)
>      --timeout <secs>     QEMU timeout [default: 300]
>      --idle-timeout <s>   Daemon idle timeout in seconds [default: 1800]
> @@ -406,6 +419,13 @@ while [ $# -gt 0 ]; do
>              REGISTRY_PASS="$2"
>              shift 2
>              ;;
> +        --config)
> +            # Path to a docker/podman config file (config.json / auth.json)
> +            # Overrides $VDKR_CONFIG / $VPDMN_CONFIG. The file is mounted into
> +            # the guest via a dedicated read-only virtio-9p share.
> +            AUTH_CONFIG="$2"
> +            shift 2
> +            ;;
>          --interactive|-it)
>              INTERACTIVE="true"
>              shift
> @@ -847,6 +867,124 @@ fi
>  TEMP_DIR="${TMPDIR:-/tmp}/vdkr-$$"
>  mkdir -p "$TEMP_DIR"
>  
> +# ============================================================================
> +# Registry auth config (docker config.json / podman auth.json)
> +# ============================================================================
> +# The AUTH_CONFIG path (from $VDKR_CONFIG, $VPDMN_CONFIG, or --config) points
> +# to a file containing container-registry credentials. For defence-in-depth we:
> +#   * reject non-regular files (symlinks, devices, directories)
> +#   * reject files readable by group/other (mode must be <= 0600)
> +#   * warn if the file is not owned by the invoking user
> +#   * copy it into a private per-invocation directory under $TEMP_DIR at 0400
> +#   * expose it to the guest via a *separate* read-only virtio-9p tag
> +#     ("${TOOL_NAME}_auth") mounted at /mnt/auth (not the generic /mnt/share
> +#     which holds input/output and is wiped between daemon commands)
> +#   * never pass the file contents or path on the kernel cmdline; only a flag
> +#     "${CMDLINE_PREFIX}_auth=1" to tell the init script to look at /mnt/auth
> +#   * rely on the existing $TEMP_DIR EXIT/INT/TERM trap to delete the copy
> +#
> +# The auth file is never logged (path is visible, but contents are not).
> +AUTH_SHARE_DIR=""
> +
> +validate_auth_config() {
> +    local path="$1"
> +
> +    # Resolve symlinks to the canonical path so the perm check applies to the
> +    # actual file, but still require the *named* path to be a regular file
> +    # (not a symlink pointing into sensitive areas like /proc/self/environ).
> +    if [ -L "$path" ]; then
> +        log "ERROR" "--config must not be a symlink: $path"
> +        return 1
> +    fi
> +    if [ ! -e "$path" ]; then
> +        log "ERROR" "--config file not found: $path"
> +        return 1
> +    fi
> +    if [ ! -f "$path" ]; then
> +        log "ERROR" "--config must be a regular file: $path"
> +        return 1
> +    fi
> +    if [ ! -r "$path" ]; then
> +        log "ERROR" "--config file is not readable: $path"
> +        return 1
> +    fi
> +
> +    # Size sanity: docker config.json / podman auth.json should be small.
> +    # 1 MiB is already generous. Reject unusually large files to avoid
> +    # accidentally shipping a large credential blob.
> +    local size
> +    size=$(stat -c %s "$path" 2>/dev/null || echo 0)
> +    if [ "$size" -gt 1048576 ]; then
> +        log "ERROR" "--config file is too large ($size bytes, max 1 MiB): $path"
> +        return 1
> +    fi
> +    # Minimum valid JSON object "{}" is 2 bytes. Anything smaller (including a
> +    # 0-byte truncation or a lone newline from "echo '' > file") can't be a
> +    # real auth config; reject rather than silently shipping garbage.
> +    if [ "$size" -lt 2 ]; then
> +        log "ERROR" "--config file is empty or too small to be valid JSON: $path"
> +        return 1
> +    fi
> +
> +    # Permission check: must not be readable by group or world.
> +    local mode
> +    mode=$(stat -c %a "$path" 2>/dev/null || echo 0)
> +    # stat %a emits octal without leading zero. Forbid any group/other bits.
> +    case "$mode" in
> +        400|600|200) ;;
> +        *)
> +            log "ERROR" "--config file has unsafe permissions ($mode); expected 0600 or 0400."
> +            log "ERROR" "Fix with: chmod 600 \"$path\""
> +            return 1
> +            ;;
> +    esac
> +
> +    # Ownership check: warn if file is not owned by the current user.
> +    local uid owner
> +    uid=$(id -u)
> +    owner=$(stat -c %u "$path" 2>/dev/null || echo "")
> +    if [ -n "$owner" ] && [ "$owner" != "$uid" ]; then
> +        log "WARN" "--config file is not owned by current user (uid=$uid, owner=$owner)"
> +    fi
> +
> +    return 0
> +}
> +
> +# Stage the auth config into a dedicated read-only 9p share. Must be called
> +# AFTER $TEMP_DIR exists and AFTER hypervisor backend functions are sourced.
> +# Sets $AUTH_SHARE_DIR and appends to $HV_OPTS / $KERNEL_APPEND.
> +setup_auth_share() {
> +    [ -z "$AUTH_CONFIG" ] && return 0
> +
> +    if ! validate_auth_config "$AUTH_CONFIG"; then
> +        log "ERROR" "Refusing to stage $AUTH_CONFIG — see above."
> +        exit 1
> +    fi
> +
> +    AUTH_SHARE_DIR="$TEMP_DIR/auth_share"
> +    # 0700 so nothing outside our process can peek at the staged file.
> +    mkdir -p "$AUTH_SHARE_DIR"
> +    chmod 700 "$AUTH_SHARE_DIR"
> +
> +    # Always stage as config.json regardless of source filename — the guest
> +    # init script knows to look for this fixed name.
> +    if ! cp "$AUTH_CONFIG" "$AUTH_SHARE_DIR/config.json"; then
> +        log "ERROR" "Failed to stage auth config"
> +        exit 1
> +    fi
> +    chmod 400 "$AUTH_SHARE_DIR/config.json"
> +
> +    local auth_tag="${TOOL_NAME}_auth"
> +    hv_build_9p_opts "$AUTH_SHARE_DIR" "$auth_tag" "readonly=on"
> +    KERNEL_APPEND="$KERNEL_APPEND ${CMDLINE_PREFIX}_auth=1"
> +
> +    # Deliberately log the *fact* of staging, not the path contents or
> +    # credentials. The path itself is useful for debugging and appears in
> +    # --verbose mode only.
> +    log "INFO" "Registry auth config staged on read-only 9p share (tag=$auth_tag)"
> +    log "DEBUG" "Auth source: $AUTH_CONFIG"
> +}
> +
>  cleanup() {
>      if [ "$KEEP_TEMP" = "true" ]; then
>          log "DEBUG" "Keeping temp directory: $TEMP_DIR"
> @@ -1310,6 +1448,10 @@ if [ "$DAEMON_MODE" = "start" ]; then
>          log "DEBUG" "CA certificate copied to shared folder"
>      fi
>  
> +    # Stage registry auth config (config.json / auth.json) on a dedicated
> +    # read-only 9p share. See setup_auth_share() for the security model.
> +    setup_auth_share
> +
>      log "INFO" "Starting daemon..."
>      log "DEBUG" "PID file: $DAEMON_PID_FILE"
>      log "DEBUG" "Socket: $DAEMON_SOCKET"
> @@ -1439,6 +1581,11 @@ if [ -n "$CA_CERT" ] && [ -f "$CA_CERT" ]; then
>      log "DEBUG" "CA certificate available via 9p"
>  fi
>  
> +# Stage registry auth config (config.json / auth.json) on a dedicated read-only
> +# 9p share for non-daemon and batch-import modes. Safe to call when AUTH_CONFIG
> +# is empty — it no-ops. See setup_auth_share() for the security model.
> +setup_auth_share
> +
>  log "INFO" "Starting VM ($VCONTAINER_HYPERVISOR)..."
>  
>  # Interactive mode runs VM in foreground with stdio connected
> -- 
> 2.47.3
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9779): https://lists.yoctoproject.org/g/meta-virtualization/message/9779
> Mute This Topic: https://lists.yoctoproject.org/mt/119070959/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization] [RESEND][RFC][PATCH 2/2] tests: add vcontainer --config / VDKR_CONFIG auth plumbing tests
on 29/04/2026 Tim Orling via lists.yoctoproject.org wrote:

> From: Tim Orling <tim.orling@konsulko.com>
> 
> Add a new pytest module (tests/test_vcontainer_auth_config.py) covering
> the registry-auth-config feature introduced in the previous commit.
> Split into two tiers:
> 
> TestAuthConfigStaticPlumbing (40 static/shell-level assertions):
> - vrunner.sh: AUTH_CONFIG picks up VDKR_CONFIG/VPDMN_CONFIG; --config
>   parsing; validate_auth_config and setup_auth_share definitions; every
>   validator reject rule (symlink / non-regular / unreadable / missing /
>   <2B / >1MiB / mode whitelist 400|600|200 / non-owner WARN); 0700
>   staging dir and 0400 staged file; readonly=on on the 9p share;
>   dedicated ${TOOL_NAME}_auth tag. Critically also asserts that
>   AUTH_CONFIG, VDKR_CONFIG and VPDMN_CONFIG never appear in
>   KERNEL_APPEND - only the ${CMDLINE_PREFIX}_auth=1 flag does.
> - vcontainer-common.sh: env-var init, --config parsing, AUTH_CONFIG
>   forwarding via --config to vrunner, and show_usage documentation.
> - vcontainer-init-common.sh: RUNTIME_AUTH default, cmdline parsing,
>   mount_auth_share/unmount_auth_share presence, dedicated per-runtime
>   ${VCONTAINER_RUNTIME_NAME}_auth tag, and the ro,nosuid,nodev,noexec
>   mount options.
> - vdkr-init.sh: install_auth_config present, writes to
>   /root/.docker/config.json with 0600 and 0700 parent, mount + unmount
>   pairing, precedence NOTE logged, and ordering after
>   install_registry_ca so --config wins over --registry-user/-pass.
> - vpdmn-init.sh: writes to /run/containers/0/auth.json with matching
>   modes, exports REGISTRY_AUTH_FILE, mount/unmount pairing, and
>   ordering after verify_podman.
> - README.md: --config section exists and documents both env vars and
>   both runtime target paths.
> 
> TestAuthConfigValidator (13 functional cases):
> - Extracts validate_auth_config() from vrunner.sh with a brace-matching
>   parser, sources it in a bash subshell with a stubbed log() helper,
>   and drives it with real files: accepts modes 0600 / 0400, accepts
>   the 2-byte minimum "{}", rejects missing / symlink / directory /
>   empty / 1-byte / >1 MiB / 0644 (world-readable) / 0640 / 0700
>   (owner-exec) / 0000 (unreadable, skipped when running as root).
> 
> Path resolution is resilient: VCONTAINER_FILES_DIR env override first,
> otherwise repo-relative to the test file, falling back to the
> /opt/bruce/poky path used elsewhere in the suite. No tests need QEMU,
> a registry, or network. All 53 tests complete in ~0.1s.
> 
> Add tests/__pycache__ to .gitignore.
> 
> AI-Generated: Claude Cowork Opus 4.7
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  .gitignore                           |   1 +
>  tests/test_vcontainer_auth_config.py | 642 +++++++++++++++++++++++++++
>  2 files changed, 643 insertions(+)
>  create mode 100644 tests/test_vcontainer_auth_config.py
> 
> diff --git a/.gitignore b/.gitignore
> index daeb43d5..49b373f8 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -7,3 +7,4 @@ pyshtables.py
>  *~
>  scripts/lib/wic/plugins/source/__pycache__
>  lib/oeqa/runtime/cases/__pycache__
> +tests/__pycache__
> diff --git a/tests/test_vcontainer_auth_config.py b/tests/test_vcontainer_auth_config.py
> new file mode 100644
> index 00000000..2e7093aa
> --- /dev/null
> +++ b/tests/test_vcontainer_auth_config.py
> @@ -0,0 +1,642 @@
> +# SPDX-FileCopyrightText: Copyright (C) 2026 Konsulko Group
> +#
> +# SPDX-License-Identifier: MIT
> +"""
> +Tests for the vcontainer registry-auth-config plumbing ("--config" /
> +$VDKR_CONFIG / $VPDMN_CONFIG).
> +
> +These tests are split into two tiers:
> +
> +Tier 1 - static/shell-level (TestAuthConfigStaticPlumbing):
> +    Reads the shell scripts under recipes-containers/vcontainer/files/ and the
> +    README and asserts that the expected function definitions, call sites,
> +    kernel cmdline flags, permission modes, mount options, and documentation
> +    blocks are present. These tests need no infrastructure and run in <1s.
> +
> +Tier 2 - functional validator (TestAuthConfigValidator):
> +    Extracts validate_auth_config() from vrunner.sh, sources it in a bash
> +    subshell with a stubbed log() function, and drives it with a table of
> +    inputs covering the perm / size / symlink / ownership / regular-file
> +    rules. Also runs in <1s per case.
> +
> +Tier 3 (live registry pull with --config) is intentionally NOT in this file.
> +It belongs alongside test_vdkr_registry.py once the registry fixture grows a
> +credentials-required mode.
> +
> +Run with:
> +    pytest tests/test_vcontainer_auth_config.py -v
> +"""
> +
> +import os
> +import re
> +import stat
> +import subprocess
> +import textwrap
> +from pathlib import Path
> +
> +import pytest
> +
> +
> +# ---------------------------------------------------------------------------
> +# Locate the vcontainer files/ directory.
> +# ---------------------------------------------------------------------------
> +#
> +# Resolution order:
> +#   1. VCONTAINER_FILES_DIR environment variable (explicit override)
> +#   2. <repo-root>/recipes-containers/vcontainer/files/ relative to this test
> +#      (i.e. tests/../recipes-containers/vcontainer/files/)
> +#   3. /opt/bruce/poky/meta-virtualization/recipes-containers/vcontainer/files/
> +#      (matches the pattern used by test_container_registry_script.py)
> +#
> +# If none of these are present, every test in this module is skipped.
> +_TESTS_DIR = Path(__file__).resolve().parent
> +_DEFAULT_CANDIDATES = [
> +    _TESTS_DIR.parent / "recipes-containers" / "vcontainer" / "files",
> +    Path("/opt/bruce/poky/meta-virtualization/recipes-containers/vcontainer/files"),
> +]
> +
> +
> +def _find_files_dir() -> Path:
> +    override = os.environ.get("VCONTAINER_FILES_DIR")
> +    if override:
> +        return Path(override)
> +    for c in _DEFAULT_CANDIDATES:
> +        if c.is_dir():
> +            return c
> +    return _DEFAULT_CANDIDATES[0]  # return first, skip in fixture if missing
> +
> +
> +@pytest.fixture(scope="module")
> +def files_dir() -> Path:
> +    d = _find_files_dir()
> +    if not d.is_dir():
> +        pytest.skip(f"vcontainer files/ dir not found: {d}")
> +    return d
> +
> +
> +@pytest.fixture(scope="module")
> +def repo_root() -> Path:
> +    # The vcontainer files live at <root>/recipes-containers/vcontainer/files,
> +    # so the repo root is two levels up.
> +    d = _find_files_dir()
> +    return d.parent.parent.parent
> +
> +
> +@pytest.fixture(scope="module")
> +def vrunner_sh(files_dir: Path) -> str:
> +    p = files_dir / "vrunner.sh"
> +    if not p.is_file():
> +        pytest.skip(f"vrunner.sh not found: {p}")
> +    return p.read_text()
> +
> +
> +@pytest.fixture(scope="module")
> +def vcontainer_common_sh(files_dir: Path) -> str:
> +    p = files_dir / "vcontainer-common.sh"
> +    if not p.is_file():
> +        pytest.skip(f"vcontainer-common.sh not found: {p}")
> +    return p.read_text()
> +
> +
> +@pytest.fixture(scope="module")
> +def init_common_sh(files_dir: Path) -> str:
> +    p = files_dir / "vcontainer-init-common.sh"
> +    if not p.is_file():
> +        pytest.skip(f"vcontainer-init-common.sh not found: {p}")
> +    return p.read_text()
> +
> +
> +@pytest.fixture(scope="module")
> +def vdkr_init_sh(files_dir: Path) -> str:
> +    p = files_dir / "vdkr-init.sh"
> +    if not p.is_file():
> +        pytest.skip(f"vdkr-init.sh not found: {p}")
> +    return p.read_text()
> +
> +
> +@pytest.fixture(scope="module")
> +def vpdmn_init_sh(files_dir: Path) -> str:
> +    p = files_dir / "vpdmn-init.sh"
> +    if not p.is_file():
> +        pytest.skip(f"vpdmn-init.sh not found: {p}")
> +    return p.read_text()
> +
> +
> +@pytest.fixture(scope="module")
> +def readme_md(repo_root: Path) -> str:
> +    p = repo_root / "recipes-containers" / "vcontainer" / "README.md"
> +    if not p.is_file():
> +        pytest.skip(f"vcontainer README.md not found: {p}")
> +    return p.read_text()
> +
> +
> +# ---------------------------------------------------------------------------
> +# Tier 1: Static / shell-level plumbing assertions
> +# ---------------------------------------------------------------------------
> +
> +
> +class TestAuthConfigStaticPlumbing:
> +    """Shell-script-level assertions for the --config / VDKR_CONFIG feature."""
> +
> +    # --- vrunner.sh --------------------------------------------------------
> +
> +    def test_vrunner_defines_auth_config_from_env(self, vrunner_sh):
> +        """AUTH_CONFIG picks up $VDKR_CONFIG or $VPDMN_CONFIG by default."""
> +        assert re.search(
> +            r'AUTH_CONFIG="\$\{VDKR_CONFIG:-\$\{VPDMN_CONFIG:-\}\}"', vrunner_sh
> +        ), "vrunner.sh should initialise AUTH_CONFIG from VDKR_CONFIG/VPDMN_CONFIG"
> +
> +    def test_vrunner_accepts_config_flag(self, vrunner_sh):
> +        """`--config <path>` is parsed and assigned to AUTH_CONFIG."""
> +        # The case label ("--config") plus the assignment should both exist.
> +        # Allow interleaved comment lines between the label and the assignment.
> +        assert re.search(
> +            r'--config\)\s*\n(?:\s*#[^\n]*\n)*\s*AUTH_CONFIG="\$2"',
> +            vrunner_sh,
> +        ), "vrunner.sh should parse --config and set AUTH_CONFIG=\"$2\""
> +
> +    def test_vrunner_defines_validate_auth_config(self, vrunner_sh):
> +        assert "validate_auth_config()" in vrunner_sh, \
> +            "vrunner.sh should define validate_auth_config()"
> +
> +    def test_vrunner_defines_setup_auth_share(self, vrunner_sh):
> +        assert "setup_auth_share()" in vrunner_sh, \
> +            "vrunner.sh should define setup_auth_share()"
> +
> +    def test_vrunner_validator_rejects_symlinks(self, vrunner_sh):
> +        """Symlinks are rejected outright to block /proc/self/environ tricks."""
> +        assert re.search(r'if \[ -L "\$path" \]', vrunner_sh), \
> +            "validate_auth_config must reject symlinks with `[ -L $path ]`"
> +
> +    def test_vrunner_validator_requires_regular_file(self, vrunner_sh):
> +        assert re.search(r'if \[ ! -f "\$path" \]', vrunner_sh), \
> +            "validate_auth_config must require a regular file (-f)"
> +
> +    def test_vrunner_validator_requires_readable(self, vrunner_sh):
> +        assert re.search(r'if \[ ! -r "\$path" \]', vrunner_sh), \
> +            "validate_auth_config must require the file be readable (-r)"
> +
> +    def test_vrunner_validator_checks_missing(self, vrunner_sh):
> +        assert re.search(r'if \[ ! -e "\$path" \]', vrunner_sh), \
> +            "validate_auth_config must detect missing files (-e)"
> +
> +    def test_vrunner_validator_min_size(self, vrunner_sh):
> +        """Files smaller than 2 bytes (minimum "{}" JSON) are rejected."""
> +        assert re.search(r'size"?\s*-lt\s*2', vrunner_sh), \
> +            "validate_auth_config must reject files smaller than 2 bytes"
> +
> +    def test_vrunner_validator_max_size(self, vrunner_sh):
> +        """Files larger than 1 MiB are rejected."""
> +        assert "1048576" in vrunner_sh, \
> +            "validate_auth_config must reject files larger than 1 MiB (1048576)"
> +
> +    def test_vrunner_validator_mode_whitelist(self, vrunner_sh):
> +        """Permission modes are restricted to 400 / 600 / 200."""
> +        # We accept either a case statement or equivalent chain; the canonical
> +        # form in the source is a case statement that matches these literals.
> +        assert re.search(r'400\s*\|\s*600\s*\|\s*200', vrunner_sh), (
> +            "validate_auth_config must whitelist modes 400|600|200 only"
> +        )
> +
> +    def test_vrunner_validator_warns_on_wrong_owner(self, vrunner_sh):
> +        """Non-owner files trigger a WARN but don't reject (documented)."""
> +        assert re.search(r'WARN.*not owned by current user', vrunner_sh), \
> +            "validate_auth_config must WARN when file is not owned by current user"
> +
> +    def test_vrunner_setup_auth_share_permissions(self, vrunner_sh):
> +        """Staging dir is 700 and staged file is 400."""
> +        assert "chmod 700" in vrunner_sh, \
> +            "setup_auth_share must chmod 700 the staging directory"
> +        assert re.search(r'chmod 400[^\n]*config\.json', vrunner_sh), \
> +            "setup_auth_share must chmod 400 the staged config.json"
> +
> +    def test_vrunner_setup_auth_share_readonly_9p(self, vrunner_sh):
> +        """The 9p share is created with readonly=on."""
> +        assert 'hv_build_9p_opts' in vrunner_sh and 'readonly=on' in vrunner_sh, (
> +            "setup_auth_share must pass readonly=on to hv_build_9p_opts"
> +        )
> +
> +    def test_vrunner_setup_auth_share_uses_dedicated_tag(self, vrunner_sh):
> +        """Auth 9p tag is TOOL_NAME_auth (separate from the shared /mnt/share)."""
> +        assert re.search(r'auth_tag="\$\{TOOL_NAME\}_auth"', vrunner_sh), (
> +            'setup_auth_share must use a dedicated "${TOOL_NAME}_auth" 9p tag'
> +        )
> +
> +    def test_vrunner_auth_cmdline_is_flag_only(self, vrunner_sh):
> +        """Only a boolean flag (_auth=1) is appended - never the path or contents."""
> +        # Flag is appended:
> +        assert re.search(
> +            r'KERNEL_APPEND="\$KERNEL_APPEND \$\{CMDLINE_PREFIX\}_auth=1"',
> +            vrunner_sh,
> +        ), "vrunner.sh must append `${CMDLINE_PREFIX}_auth=1` to KERNEL_APPEND"
> +
> +        # And the path / env var names must NEVER land in KERNEL_APPEND.
> +        # Scan every line that mutates KERNEL_APPEND and prove none mention
> +        # AUTH_CONFIG, VDKR_CONFIG, or VPDMN_CONFIG.
> +        for ln in vrunner_sh.splitlines():
> +            if "KERNEL_APPEND=" in ln or "KERNEL_APPEND+=" in ln:
> +                assert "AUTH_CONFIG" not in ln, (
> +                    f"KERNEL_APPEND must not carry AUTH_CONFIG: {ln!r}"
> +                )
> +                assert "VDKR_CONFIG" not in ln, (
> +                    f"KERNEL_APPEND must not carry VDKR_CONFIG: {ln!r}"
> +                )
> +                assert "VPDMN_CONFIG" not in ln, (
> +                    f"KERNEL_APPEND must not carry VPDMN_CONFIG: {ln!r}"
> +                )
> +
> +    def test_vrunner_setup_auth_share_called_in_both_paths(self, vrunner_sh):
> +        """setup_auth_share is called at least twice (daemon + non-daemon paths)."""
> +        # Count *call sites*, not the definition. The definition line has a '(' right after.
> +        call_sites = [
> +            ln for ln in vrunner_sh.splitlines()
> +            if re.search(r'\bsetup_auth_share\b', ln)
> +            and "()" not in ln
> +            and not ln.lstrip().startswith("#")
> +        ]
> +        assert len(call_sites) >= 2, (
> +            f"setup_auth_share should be invoked in both daemon and non-daemon "
> +            f"paths; found {len(call_sites)} call site(s): {call_sites}"
> +        )
> +
> +    # --- vcontainer-common.sh ---------------------------------------------
> +
> +    def test_common_inits_auth_config_from_env(self, vcontainer_common_sh):
> +        assert re.search(
> +            r'AUTH_CONFIG="\$\{VDKR_CONFIG:-\$\{VPDMN_CONFIG:-\}\}"',
> +            vcontainer_common_sh,
> +        ), "vcontainer-common.sh should init AUTH_CONFIG from VDKR_CONFIG/VPDMN_CONFIG"
> +
> +    def test_common_parses_config_flag(self, vcontainer_common_sh):
> +        assert re.search(
> +            r'--config\)\s*\n(?:\s*#[^\n]*\n)*\s*(?:#[^\n]*\n\s*)*AUTH_CONFIG="\$2"',
> +            vcontainer_common_sh,
> +        ), "vcontainer-common.sh should parse --config into AUTH_CONFIG"
> +
> +    def test_common_forwards_auth_config_to_runner(self, vcontainer_common_sh):
> +        """AUTH_CONFIG is forwarded as --config to vrunner.sh."""
> +        assert re.search(
> +            r'\[ -n "\$AUTH_CONFIG" \].*args\+=\("--config" "\$AUTH_CONFIG"\)',
> +            vcontainer_common_sh,
> +        ), "vcontainer-common.sh must forward AUTH_CONFIG via --config to vrunner"
> +
> +    def test_common_show_usage_documents_config(self, vcontainer_common_sh):
> +        """--config appears in show_usage help output."""
> +        assert re.search(r'--config\s+<path>', vcontainer_common_sh), (
> +            "show_usage must document --config <path>"
> +        )
> +        assert "VDKR_CONFIG" in vcontainer_common_sh, \
> +            "show_usage must mention VDKR_CONFIG env var"
> +        assert "VPDMN_CONFIG" in vcontainer_common_sh, \
> +            "show_usage must mention VPDMN_CONFIG env var"
> +
> +    # --- vcontainer-init-common.sh ----------------------------------------
> +
> +    def test_init_common_defaults_runtime_auth(self, init_common_sh):
> +        assert re.search(r'RUNTIME_AUTH="0"', init_common_sh), \
> +            "init-common must default RUNTIME_AUTH to 0"
> +
> +    def test_init_common_parses_auth_flag(self, init_common_sh):
> +        """Kernel cmdline <prefix>_auth=* is parsed into RUNTIME_AUTH."""
> +        assert re.search(
> +            r'\$\{VCONTAINER_RUNTIME_PREFIX\}_auth=\*', init_common_sh
> +        ), "init-common must parse ${VCONTAINER_RUNTIME_PREFIX}_auth=* cmdline arg"
> +        assert re.search(
> +            r'RUNTIME_AUTH="\$\{param#\$\{VCONTAINER_RUNTIME_PREFIX\}_auth=\}"',
> +            init_common_sh,
> +        ), "init-common must strip _auth= prefix into RUNTIME_AUTH"
> +
> +    def test_init_common_defines_mount_helpers(self, init_common_sh):
> +        assert "mount_auth_share()" in init_common_sh, \
> +            "init-common must define mount_auth_share()"
> +        assert "unmount_auth_share()" in init_common_sh, \
> +            "init-common must define unmount_auth_share()"
> +
> +    def test_init_common_mount_uses_dedicated_tag(self, init_common_sh):
> +        """mount_auth_share uses ${VCONTAINER_RUNTIME_NAME}_auth tag."""
> +        assert re.search(
> +            r'AUTH_SHARE_TAG="\$\{VCONTAINER_RUNTIME_NAME\}_auth"',
> +            init_common_sh,
> +        ), "mount_auth_share must use a per-runtime _auth 9p tag"
> +
> +    def test_init_common_mount_options_hardened(self, init_common_sh):
> +        """Auth share is mounted ro,nosuid,nodev,noexec."""
> +        # All four options must be present on the mount command.
> +        # Find the mount call to be sure we're looking at the right line.
> +        m = re.search(
> +            r'mount -t 9p[^\n]*\\\n[^\n]*trans=\$\{NINE_P_TRANSPORT\}[^\n]*',
> +            init_common_sh,
> +        )
> +        assert m, "mount_auth_share must issue a mount -t 9p call"
> +        # The options are on the continuation line; grab the paragraph.
> +        start = m.start()
> +        end = init_common_sh.find('"$AUTH_SHARE_TAG"', start)
> +        block = init_common_sh[start:end if end != -1 else start + 400]
> +        for opt in ("ro", "nosuid", "nodev", "noexec"):
> +            assert opt in block, f"mount_auth_share must include {opt} mount option"
> +
> +    def test_init_common_mount_guarded_by_runtime_auth(self, init_common_sh):
> +        """mount_auth_share returns early when RUNTIME_AUTH != 1."""
> +        # Find "mount_auth_share()" and assert the first ~15 lines contain the guard.
> +        idx = init_common_sh.find("mount_auth_share()")
> +        assert idx != -1
> +        snippet = init_common_sh[idx:idx + 400]
> +        assert re.search(r'if \[ "\$RUNTIME_AUTH" != "1" \]', snippet), (
> +            "mount_auth_share must early-return when RUNTIME_AUTH != 1"
> +        )
> +
> +    # --- vdkr-init.sh ------------------------------------------------------
> +
> +    def test_vdkr_defines_install_auth_config(self, vdkr_init_sh):
> +        assert "install_auth_config()" in vdkr_init_sh, \
> +            "vdkr-init.sh must define install_auth_config()"
> +
> +    def test_vdkr_target_path_and_modes(self, vdkr_init_sh):
> +        """Target is /root/.docker/config.json; mode 0600; parent 0700."""
> +        assert "/root/.docker/config.json" in vdkr_init_sh, (
> +            "vdkr-init must write credentials to /root/.docker/config.json"
> +        )
> +        assert "chmod 700 /root/.docker" in vdkr_init_sh, \
> +            "vdkr-init must chmod 700 /root/.docker"
> +        assert "chmod 600 /root/.docker/config.json" in vdkr_init_sh, \
> +            "vdkr-init must chmod 600 /root/.docker/config.json"
> +
> +    def test_vdkr_calls_mount_and_unmount(self, vdkr_init_sh):
> +        assert "mount_auth_share" in vdkr_init_sh
> +        assert "unmount_auth_share" in vdkr_init_sh, (
> +            "vdkr-init must unmount /mnt/auth after copying"
> +        )
> +
> +    def test_vdkr_logs_precedence_note(self, vdkr_init_sh):
> +        """When --config and --registry-user/--registry-pass are both set, log a NOTE."""
> +        assert re.search(
> +            r'NOTE:\s*--config\s*takes precedence over\s*--registry-user/--registry-pass',
> +            vdkr_init_sh,
> +        ), "vdkr-init must log a precedence NOTE when both mechanisms are supplied"
> +
> +    def test_vdkr_install_auth_config_after_ca(self, vdkr_init_sh):
> +        """install_auth_config runs after install_registry_ca in main flow."""
> +        # Find the call sites (not the definitions). Each name should appear
> +        # at least once at column 0 (bare call) after the function bodies.
> +        # A simpler, resilient check: the LAST occurrence of install_registry_ca
> +        # should appear before the LAST occurrence of install_auth_config.
> +        last_ca = vdkr_init_sh.rfind("install_registry_ca")
> +        last_auth = vdkr_init_sh.rfind("install_auth_config")
> +        assert last_ca != -1 and last_auth != -1
> +        assert last_ca < last_auth, (
> +            "install_auth_config must be called AFTER install_registry_ca "
> +            "so --config wins on precedence"
> +        )
> +
> +    # --- vpdmn-init.sh -----------------------------------------------------
> +
> +    def test_vpdmn_defines_install_auth_config(self, vpdmn_init_sh):
> +        assert "install_auth_config()" in vpdmn_init_sh, \
> +            "vpdmn-init.sh must define install_auth_config()"
> +
> +    def test_vpdmn_target_path_and_modes(self, vpdmn_init_sh):
> +        """Target is /run/containers/0/auth.json with 0600; dir 0700."""
> +        assert "/run/containers/0" in vpdmn_init_sh, \
> +            "vpdmn-init must write to /run/containers/0 (rootful podman default)"
> +        assert re.search(r'auth_file="\$auth_dir/auth\.json"', vpdmn_init_sh), \
> +            "vpdmn-init must write to .../auth.json"
> +        assert re.search(r'chmod 700 "\$auth_dir"', vpdmn_init_sh), \
> +            "vpdmn-init must chmod 700 the auth dir"
> +        assert re.search(r'chmod 600 "\$auth_file"', vpdmn_init_sh), \
> +            "vpdmn-init must chmod 600 the auth.json"
> +
> +    def test_vpdmn_exports_registry_auth_file(self, vpdmn_init_sh):
> +        """REGISTRY_AUTH_FILE is exported so podman finds the creds."""
> +        assert re.search(r'export REGISTRY_AUTH_FILE="\$auth_file"', vpdmn_init_sh), (
> +            "vpdmn-init must export REGISTRY_AUTH_FILE"
> +        )
> +
> +    def test_vpdmn_calls_mount_and_unmount(self, vpdmn_init_sh):
> +        assert "mount_auth_share" in vpdmn_init_sh
> +        assert "unmount_auth_share" in vpdmn_init_sh, (
> +            "vpdmn-init must unmount /mnt/auth after copying"
> +        )
> +
> +    def test_vpdmn_install_auth_config_after_verify_podman(self, vpdmn_init_sh):
> +        """install_auth_config runs after verify_podman in the main flow."""
> +        last_verify = vpdmn_init_sh.rfind("verify_podman")
> +        last_auth = vpdmn_init_sh.rfind("install_auth_config")
> +        assert last_verify != -1 and last_auth != -1
> +        assert last_verify < last_auth, (
> +            "install_auth_config should be called AFTER verify_podman"
> +        )
> +
> +    # --- README.md ---------------------------------------------------------
> +
> +    def test_readme_documents_config_section(self, readme_md):
> +        assert "Passing an existing docker/podman auth file" in readme_md, (
> +            "README must document the --config feature"
> +        )
> +
> +    def test_readme_lists_env_vars(self, readme_md):
> +        assert "VDKR_CONFIG" in readme_md, "README must document VDKR_CONFIG"
> +        assert "VPDMN_CONFIG" in readme_md, "README must document VPDMN_CONFIG"
> +
> +    def test_readme_lists_target_paths(self, readme_md):
> +        """Both runtime target paths appear in the doc."""
> +        assert "/root/.docker/config.json" in readme_md, \
> +            "README must document the vdkr target path"
> +        assert "/run/containers/0/auth.json" in readme_md, \
> +            "README must document the vpdmn target path"
> +
> +
> +# ---------------------------------------------------------------------------
> +# Tier 2: Functional validator tests (bash subshell, no QEMU).
> +# ---------------------------------------------------------------------------
> +
> +
> +def _extract_validate_auth_config(vrunner_text: str) -> str:
> +    """Extract the validate_auth_config function body from vrunner.sh.
> +
> +    Parses from "validate_auth_config() {" to its matching top-level closing
> +    brace. Simple brace-counting suffices because the function body only
> +    contains shell constructs (no here-docs that start with '{').
> +    """
> +    start = vrunner_text.find("validate_auth_config()")
> +    assert start != -1, "validate_auth_config not found in vrunner.sh"
> +    # Jump to the opening brace of the function.
> +    brace = vrunner_text.find("{", start)
> +    assert brace != -1
> +    depth = 0
> +    i = brace
> +    n = len(vrunner_text)
> +    while i < n:
> +        ch = vrunner_text[i]
> +        if ch == "{":
> +            depth += 1
> +        elif ch == "}":
> +            depth -= 1
> +            if depth == 0:
> +                return vrunner_text[start : i + 1]
> +        i += 1
> +    raise AssertionError("Unterminated validate_auth_config definition")
> +
> +
> +@pytest.fixture(scope="module")
> +def validator_harness(vrunner_sh, tmp_path_factory) -> Path:
> +    """Create a tiny bash script that sources validate_auth_config + runs it.
> +
> +    The harness is parameterised by $1 = path argument. It prints validator
> +    output to stderr (as vrunner does) and exits with the validator's code.
> +    """
> +    body = _extract_validate_auth_config(vrunner_sh)
> +    harness = textwrap.dedent(
> +        """\
> +        #!/usr/bin/env bash
> +        # Test harness for validate_auth_config (extracted from vrunner.sh).
> +
> +        # Stub the log() helper used by validate_auth_config. Route everything
> +        # to stderr so the test can grep on captured stderr.
> +        log() {
> +            local level="$1"
> +            shift
> +            echo "[$level] $*" 1>&2
> +        }
> +
> +        %s
> +
> +        validate_auth_config "$1"
> +        exit $?
> +        """
> +    ) % body
> +
> +    out = tmp_path_factory.mktemp("auth_validator") / "harness.sh"
> +    out.write_text(harness)
> +    out.chmod(0o700)
> +    return out
> +
> +
> +def _run_validator(harness: Path, path_arg: str) -> subprocess.CompletedProcess:
> +    return subprocess.run(
> +        ["bash", str(harness), path_arg],
> +        capture_output=True,
> +        text=True,
> +        timeout=10,
> +    )
> +
> +
> +class TestAuthConfigValidator:
> +    """Functional tests for validate_auth_config() in vrunner.sh."""
> +
> +    def test_accepts_valid_mode_600(self, validator_harness, tmp_path):
> +        f = tmp_path / "config.json"
> +        f.write_text('{"auths":{}}')
> +        os.chmod(f, 0o600)
> +        r = _run_validator(validator_harness, str(f))
> +        assert r.returncode == 0, f"expected accept, got {r.returncode}\nstderr={r.stderr}"
> +
> +    def test_accepts_valid_mode_400(self, validator_harness, tmp_path):
> +        f = tmp_path / "config.json"
> +        f.write_text('{"auths":{}}')
> +        os.chmod(f, 0o400)
> +        r = _run_validator(validator_harness, str(f))
> +        assert r.returncode == 0, f"expected accept, got {r.returncode}\nstderr={r.stderr}"
> +
> +    def test_accepts_minimum_two_byte_json(self, validator_harness, tmp_path):
> +        """A 2-byte file ('{}' with no trailing newline) is the minimum valid size."""
> +        f = tmp_path / "config.json"
> +        f.write_bytes(b"{}")
> +        os.chmod(f, 0o600)
> +        r = _run_validator(validator_harness, str(f))
> +        assert r.returncode == 0, (
> +            f"expected accept for 2-byte file, got {r.returncode}\nstderr={r.stderr}"
> +        )
> +
> +    def test_rejects_missing_file(self, validator_harness, tmp_path):
> +        r = _run_validator(validator_harness, str(tmp_path / "no-such-file"))
> +        assert r.returncode != 0
> +        assert "not found" in r.stderr
> +
> +    def test_rejects_symlink(self, validator_harness, tmp_path):
> +        target = tmp_path / "real.json"
> +        target.write_text('{"auths":{}}')
> +        os.chmod(target, 0o600)
> +        link = tmp_path / "link.json"
> +        link.symlink_to(target)
> +        r = _run_validator(validator_harness, str(link))
> +        assert r.returncode != 0
> +        assert "symlink" in r.stderr
> +
> +    def test_rejects_directory(self, validator_harness, tmp_path):
> +        d = tmp_path / "adir"
> +        d.mkdir()
> +        r = _run_validator(validator_harness, str(d))
> +        assert r.returncode != 0
> +        # Directories trip the -L check first on some shells; either error is fine.
> +        assert "regular file" in r.stderr or "not readable" in r.stderr or "symlink" not in r.stderr
> +
> +    def test_rejects_empty_file(self, validator_harness, tmp_path):
> +        f = tmp_path / "empty.json"
> +        f.write_bytes(b"")
> +        os.chmod(f, 0o600)
> +        r = _run_validator(validator_harness, str(f))
> +        assert r.returncode != 0
> +        assert "empty or too small" in r.stderr
> +
> +    def test_rejects_one_byte_file(self, validator_harness, tmp_path):
> +        """A single-byte file (e.g. lone newline from 'echo > file') is rejected."""
> +        f = tmp_path / "tiny.json"
> +        f.write_bytes(b"\n")
> +        os.chmod(f, 0o600)
> +        r = _run_validator(validator_harness, str(f))
> +        assert r.returncode != 0
> +        assert "empty or too small" in r.stderr
> +
> +    def test_rejects_oversize_file(self, validator_harness, tmp_path):
> +        """Files > 1 MiB are rejected."""
> +        f = tmp_path / "big.json"
> +        # 1 MiB + 1 byte.
> +        f.write_bytes(b"{" + b"a" * (1024 * 1024) + b"}")
> +        os.chmod(f, 0o600)
> +        r = _run_validator(validator_harness, str(f))
> +        assert r.returncode != 0
> +        assert "too large" in r.stderr
> +
> +    def test_rejects_world_readable(self, validator_harness, tmp_path):
> +        """Mode 0644 (group/other readable) is rejected."""
> +        f = tmp_path / "config.json"
> +        f.write_text('{"auths":{}}')
> +        os.chmod(f, 0o644)
> +        r = _run_validator(validator_harness, str(f))
> +        assert r.returncode != 0
> +        assert "unsafe permissions" in r.stderr
> +
> +    def test_rejects_group_readable(self, validator_harness, tmp_path):
> +        """Mode 0640 (group readable) is rejected."""
> +        f = tmp_path / "config.json"
> +        f.write_text('{"auths":{}}')
> +        os.chmod(f, 0o640)
> +        r = _run_validator(validator_harness, str(f))
> +        assert r.returncode != 0
> +        assert "unsafe permissions" in r.stderr
> +
> +    def test_rejects_executable(self, validator_harness, tmp_path):
> +        """Mode 0700 (owner-exec) is rejected - we only permit r/w combos."""
> +        f = tmp_path / "config.json"
> +        f.write_text('{"auths":{}}')
> +        os.chmod(f, 0o700)
> +        r = _run_validator(validator_harness, str(f))
> +        assert r.returncode != 0
> +        assert "unsafe permissions" in r.stderr
> +
> +    def test_rejects_unreadable(self, validator_harness, tmp_path):
> +        """A mode 0000 file cannot be read by the invoking user."""
> +        if os.geteuid() == 0:
> +            pytest.skip("running as root; DAC permission checks are bypassed")
> +        f = tmp_path / "config.json"
> +        f.write_text('{"auths":{}}')
> +        # 0000: no bits at all.
> +        os.chmod(f, 0o000)
> +        try:
> +            r = _run_validator(validator_harness, str(f))
> +            assert r.returncode != 0
> +            # Either "not readable" wins, or the mode-check fires; accept either.
> +            assert "not readable" in r.stderr or "unsafe permissions" in r.stderr
> +        finally:
> +            # Restore perms so pytest can clean up the tmp tree.
> +            os.chmod(f, 0o600)
> -- 
> 2.47.3
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9780): https://lists.yoctoproject.org/g/meta-virtualization/message/9780
> Mute This Topic: https://lists.yoctoproject.org/mt/119070960/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



