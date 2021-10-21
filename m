Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.929.1634858540173775536
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 16:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dbtxJDyI;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id g10so55185edj.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Oct 2021 16:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xI526D+5wxi4PHUvtoW4rZAZKJ92WYHv+YvlR7Z03fE=;
        b=dbtxJDyI0FTr84XJ9RXZwXgdqOC7oXuqKs9gl55RZKlY91RlWl54rIXLYI5vn4tN6z
         iDIWTmlyKHia9dy/1W5YopAd4j4o4M1pvsF+jl3OThMfAXv4S+4lYDXT7YuwgHJhcBae
         Recw9tCdE0KhtRODZRS9VwgfTN6wkUPcEb+oHN/6fn1/bURxUkHKzrWaKXiM3QBh8C6g
         C3AKB8Vai/KEuJFRYVCjip1Jxi2PP5jwI2xyaUUhOJ1aDTPdvEAOGZ+jaI2AZj8VhjwK
         LQerc3bmgpUSAfkMMUfxpmMJtYlCWGQ1/tEI7I0Lsc8S6rYWMezVSnpAIYYVV8myCLHF
         Jaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xI526D+5wxi4PHUvtoW4rZAZKJ92WYHv+YvlR7Z03fE=;
        b=1WSYjzqNoIdOvdw11LqRIfeex0pc12Qp6bQ6k1Dmbq0eSHswDMyUSdZ/hGS84uWQGg
         e53oTYlm5eIK0idMQ/pDQu6ZhF4qZz+E9BKsanhnXEGCWlkkdVCDrE0kTCQtZNgU9RE9
         cvjQSVGvwOA/kumh/U8lbQVnhqPIKKbpBa6jVdvCh91QXF5Wq94lreyICtARWYczjOZ3
         8VMgsogfv1mG1sdKoRYccNAOK1KsHCKRPCzRhriC6Sy8IIs/+fzecz6n5Zwqo3xxzGlg
         E2Asz85MaiAeFr4emWErWH04B1W+C0gMgaZl82koMgQAQYCx5C5hRHGVdjpYmTHRTHzc
         rebg==
X-Gm-Message-State: AOAM532wjw76ChbP9qz/H3f2LfaUaBtHUHzeFdm6fTVaRh4LGOH6Ikg3
	4t+zH7mjrgbyHnhqVHDMtcg9RSJvP6kyBKxEemM=
X-Google-Smtp-Source: ABdhPJxLTZjFXQ7idQud3juA1YEnQ9i5ba/aSp94oe1bf+EPQ2zkrsTVHg3F6TTxJ1BdQ/iomvCPFmuSG69BvTKOEuI=
X-Received: by 2002:a50:be81:: with SMTP id b1mr12074944edk.59.1634858538458;
 Thu, 21 Oct 2021 16:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211019151212.23410-1-kamil.dziezyk@arm.com>
In-Reply-To: <20211019151212.23410-1-kamil.dziezyk@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 21 Oct 2021 19:22:07 -0400
Message-ID: <CADkTA4Ppi=7SLtd4hbDPZT1WARmaxs_7dwKMqa33wPuxz9aGLA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] k3s: Update k3s service configuration
To: Kamil Dziezyk <kamil.dziezyk@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

Thanks for the tweaks, they look good to me.

I have some other pending k3s changes I'm working on, but there was no
reason to hold these up, so I've pulled them into master.

Bruce

On Tue, Oct 19, 2021 at 11:13 AM Kamil Dziezyk <kamil.dziezyk@arm.com> wrote:
>
> Update k3s.service with the latest changes from install.sh script.
> Add k3s-killall.sh script to stop all of the K3s containers and reset
> the containerd state.
>
> The killall script cleans up containers, K3s directories, and networking
> components while also removing the iptables chain with all the associated
> rules. The cluster data will not be deleted.
>
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> Change-Id: If1794367cabfc18fc8e3ecaf26badd4d0bc25114
> ---
>  recipes-containers/k3s/k3s/k3s-killall.sh | 82 +++++++++++++++++++++++
>  recipes-containers/k3s/k3s/k3s.service    | 12 +++-
>  recipes-containers/k3s/k3s_git.bb         |  2 +
>  3 files changed, 95 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-containers/k3s/k3s/k3s-killall.sh
>
> diff --git a/recipes-containers/k3s/k3s/k3s-killall.sh b/recipes-containers/k3s/k3s/k3s-killall.sh
> new file mode 100644
> index 0000000..9e72615
> --- /dev/null
> +++ b/recipes-containers/k3s/k3s/k3s-killall.sh
> @@ -0,0 +1,82 @@
> +#!/bin/sh
> +
> +# Based on: k3s-killall.sh installed when running Rancher Lab's K3S install.sh
> +# In open-source project: https://github.com/k3s-io/k3s
> +#
> +# Original file: Copyright (c) 2021 Rancher Labs and Contributors.
> +# Modifications: Copyright (c) 2021 Arm Limited and Contributors. All rights reserved.
> +#
> +# Modifications:
> +# - Change systemd service directory location
> +# - Fix PID parsing to run on core image
> +# - Remove service stopping code (as this is intended to run as part of service
> +#   stop)
> +# - Changes to resolve warnings from the ShellCheck static analysis tool
> +#
> +# SPDX-License-Identifier: Apache License 2.0
> +
> +[ "$(id -u)" -eq 0 ] || exec sudo "$0" "$@"
> +
> +for bin in /var/lib/rancher/k3s/data/**/bin/; do
> +    [ -d "$bin" ] && export PATH=$PATH:$bin:$bin/aux
> +done
> +
> +set -x
> +
> +pschildren() {
> +    ps -e -o ppid= -o pid= | sed -e 's/^\s*//g; s/\s\s*/\t/g;' | grep -w "^$1" | cut -f2
> +}
> +
> +pstree() {
> +    for pid in "$@"; do
> +        echo "$pid"
> +        for child in $(pschildren "$pid"); do
> +            pstree "$child"
> +        done
> +    done
> +}
> +
> +killtree() {
> +    while read -r pid; do
> +        if [ -n "${pid}" ]; then
> +                kill -9 "${pid}" 2>/dev/null
> +        fi
> +    done <<EOF
> +$({ set +x; } 2>/dev/null; pstree "$@"; set -x;)
> +EOF
> +}
> +
> +getshims() {
> +    ps -e -o pid= -o args= | sed -e 's/^ *//; s/\s\s*/\t/;' | grep -w '[^/]*/bin/containerd-shim' | cut -f1
> +}
> +
> +killtree "$({ set +x; } 2>/dev/null; getshims; set -x)"
> +
> +# shellcheck disable=SC2016
> +do_unmount_and_remove() {
> +    set +x
> +    while read -r _ path _; do
> +        case "$path" in $1*) echo "$path" ;; esac
> +    done < /proc/self/mounts | sort -r | xargs -r -t -n 1 sh -c 'umount "$0" && rm -rf "$0"'
> +    set -x
> +}
> +
> +do_unmount_and_remove '/run/k3s'
> +do_unmount_and_remove '/var/lib/rancher/k3s'
> +do_unmount_and_remove '/var/lib/kubelet/pods'
> +do_unmount_and_remove '/var/lib/kubelet/plugins'
> +do_unmount_and_remove '/run/netns/cni-'
> +
> +# Remove CNI namespaces
> +ip netns show 2>/dev/null | grep cni- | xargs -r -t -n 1 ip netns delete
> +
> +# Delete network interface(s) that match 'master cni0'
> +ip link show 2>/dev/null | grep 'master cni0' | while read -r _ iface _; do
> +    iface=${iface%%@*}
> +    [ -z "$iface" ] || ip link delete "$iface"
> +done
> +ip link delete cni0
> +ip link delete flannel.1
> +ip link delete flannel-v6.1
> +rm -rf /var/lib/cni/
> +iptables-save | grep -v KUBE- | grep -v CNI- | iptables-restore
> diff --git a/recipes-containers/k3s/k3s/k3s.service b/recipes-containers/k3s/k3s/k3s.service
> index 34c7a80..33d3ee7 100644
> --- a/recipes-containers/k3s/k3s/k3s.service
> +++ b/recipes-containers/k3s/k3s/k3s.service
> @@ -4,12 +4,17 @@ Description=Lightweight Kubernetes
>  Documentation=https://k3s.io
>  Requires=containerd.service
>  After=containerd.service
> +After=network-online.target
> +Wants=network-online.target
>
>  [Install]
>  WantedBy=multi-user.target
>
>  [Service]
>  Type=notify
> +EnvironmentFile=-/etc/default/%N
> +EnvironmentFile=-/etc/sysconfig/%N
> +EnvironmentFile=-/etc/systemd/system/k3s.service.env
>  KillMode=process
>  Delegate=yes
>  # Having non-zero Limit*s causes performance problems due to accounting overhead
> @@ -21,7 +26,12 @@ TasksMax=infinity
>  TimeoutStartSec=0
>  Restart=always
>  RestartSec=5s
> +ExecStartPre=/bin/sh -xc '! systemctl is-enabled --quiet nm-cloud-setup.service'
>  ExecStartPre=-/sbin/modprobe br_netfilter
>  ExecStartPre=-/sbin/modprobe overlay
>  ExecStart=/usr/local/bin/k3s server
> -
> +# Avoid any delay due to this service when the system is rebooting or shutting
> +# down by using the k3s-killall.sh script to kill all of the running k3s
> +# services and containers
> +ExecStopPost=/bin/sh -c "if systemctl is-system-running | grep -i \
> +                           'stopping'; then /usr/local/bin/k3s-killall.sh; fi"
> diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
> index 5971dde..0300fc3 100644
> --- a/recipes-containers/k3s/k3s_git.bb
> +++ b/recipes-containers/k3s/k3s_git.bb
> @@ -11,6 +11,7 @@ SRC_URI = "git://github.com/rancher/k3s.git;branch=release-1.22;name=k3s \
>             file://k3s-clean \
>             file://cni-containerd-net.conf \
>             file://0001-Finding-host-local-in-usr-libexec.patch;patchdir=src/import \
> +           file://k3s-killall.sh \
>            "
>  SRC_URI[k3s.md5sum] = "363d3a08dc0b72ba6e6577964f6e94a5"
>  SRCREV_k3s = "737f722315b9832e9180fa232253d28ae1f2272f"
> @@ -60,6 +61,7 @@ do_install() {
>          # ln -sr "${D}/${BIN_PREFIX}/bin/k3s" "${D}${BIN_PREFIX}/bin/ctr"
>          ln -sr "${D}/${BIN_PREFIX}/bin/k3s" "${D}${BIN_PREFIX}/bin/kubectl"
>          install -m 755 "${WORKDIR}/k3s-clean" "${D}${BIN_PREFIX}/bin"
> +        install -m 755 "${WORKDIR}/k3s-killall.sh" "${D}${BIN_PREFIX}/bin"
>
>          if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>                  install -D -m 0644 "${WORKDIR}/k3s.service" "${D}${systemd_system_unitdir}/k3s.service"
> --
> 2.17.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
