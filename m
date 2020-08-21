Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.143745.1598044309628230048
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 21 Aug 2020 14:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tISUgUxG;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id i26so2674414edv.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Aug 2020 14:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cOeN8sgyPrFHj7wUP4oZV+uzCWrSO6FlEf0SONghLi4=;
        b=tISUgUxGbNAW24D8S7gJi29x9EFNaQPs2IRwhxpreQmB4rPSO7R/A6yfAVwNaZPf+e
         sGrH+sBW6xwKJUbYcWmVAU1GQoKFYpLWoAeqR65c4nMzzs9kwGhCcJCOPMXVHwOpM6nY
         ZloGsx93wHOE+hml3tDwy0v7w+BD82FCSsuYuWZYEJlfhhx9/ki7HMgXBbdYPdLjRpKq
         ITzWdoyJcW0/PPH5dnIWami2SkrZZ1ipYOBuoE0Jt/l2HFTCNuHoHwet34VggLIROras
         3BtRYgsgJdYToNeNPWMk7c8ZDTLZwxP7Z3FN9JdhazfuKroIHeCx7985JmhdHWUT3yg1
         YTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cOeN8sgyPrFHj7wUP4oZV+uzCWrSO6FlEf0SONghLi4=;
        b=eywTH4v0sLKGyANAuZRgUZQb05XSjpIAChWn+RGy1qF9vldchA2j0v1CcmrtovVnLu
         x2UKhuKrXUvXRQdJU+Z/g+jbHdXyf1Qi1CtI/6WhYwsggbSihVgtqG0MFBGveFSCww8m
         1omRHqFUNnWTXOr2k8cHkdWzYj2Hwl8qr7oIxM13a7A4swg8/VgRg/INEz2NiKrqExUe
         /zXxOIT/VKLanH1ED1USnN+n0FzWRX/gNNIZSdiNrjiE0E7PFDp3P7YEYaHojy/9yPTw
         tsUl3/nLj+FxOBp01WtXztWmzzhxuBw1zy6+3iGtxuTeSVBZ9xok6xmFJmrW5C1XSQtE
         YBrw==
X-Gm-Message-State: AOAM532ht+S9UOysm1WiS6ddk9pFaxE7C0DNa6JKu8+Xxc8WfxpuaKwd
	+lO+G/JjQSkyBXVdal/xx6AJZJuS5jf8WYbm1Y0=
X-Google-Smtp-Source: ABdhPJwndz78/LpHsEldlmUEpXrxeR2Ad+k6nCE5W+9aYTLfXwoJB7x22vJOq8zh3DUl1FdCcrn0d4LQtbJnBFZuurI=
X-Received: by 2002:a50:e846:: with SMTP id k6mr4597441edn.27.1598044307828;
 Fri, 21 Aug 2020 14:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200821205936.30561-1-erik.jansson@axis.com>
In-Reply-To: <20200821205936.30561-1-erik.jansson@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 21 Aug 2020 17:11:36 -0400
Message-ID: <CADkTA4OfiXvb=9D0NWU8-Oy9qzivgSLA3byvBDN6Ly=yyEc=Tg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] Adding k3s recipe
To: Erik Jansson <erik.jansson@axis.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Joakim Roubert <joakim.roubert@axis.com>
Content-Type: multipart/alternative; boundary="0000000000004db1e605ad69af2e"

--0000000000004db1e605ad69af2e
Content-Type: text/plain; charset="UTF-8"

I already have a much delayed variant of this, which consolidates common
elements with k8s itself. But I've been tied up finishing the 5.8 kernel
for core and haven't pushed it for public consumption yet.

I'll have a look at this, and see how I can merge the bits together.

Cheers,

Bruce

On Fri, Aug 21, 2020 at 4:59 PM Erik Jansson <erik.jansson@axis.com> wrote:

> Signed-off-by: Erik Jansson <erik.jansson@axis.com>
> ---
>  ...1-Updating-bin-location-to-not-local.patch | 25 +++++
>  ...02-Finding-host-local-in-usr-libexec.patch | 25 +++++
>  recipes-containers/k3s/k3s/agent.service      | 23 +++++
>  .../k3s/k3s/cni-containerd-net.conf           | 24 +++++
>  recipes-containers/k3s/k3s/k3s-agent          | 99 +++++++++++++++++++
>  recipes-containers/k3s/k3s/k3s-clean          | 24 +++++
>  recipes-containers/k3s/k3s/server.service     | 21 ++++
>  recipes-containers/k3s/k3s_git.bb             | 74 ++++++++++++++
>  8 files changed, 315 insertions(+)
>  create mode 100644
> recipes-containers/k3s/k3s/0001-Updating-bin-location-to-not-local.patch
>  create mode 100644
> recipes-containers/k3s/k3s/0002-Finding-host-local-in-usr-libexec.patch
>  create mode 100644 recipes-containers/k3s/k3s/agent.service
>  create mode 100644 recipes-containers/k3s/k3s/cni-containerd-net.conf
>  create mode 100755 recipes-containers/k3s/k3s/k3s-agent
>  create mode 100644 recipes-containers/k3s/k3s/k3s-clean
>  create mode 100644 recipes-containers/k3s/k3s/server.service
>  create mode 100644 recipes-containers/k3s/k3s_git.bb
>
> diff --git
> a/recipes-containers/k3s/k3s/0001-Updating-bin-location-to-not-local.patch
> b/recipes-containers/k3s/k3s/0001-Updating-bin-location-to-not-local.patch
> new file mode 100644
> index 0000000..9876f61
> --- /dev/null
> +++
> b/recipes-containers/k3s/k3s/0001-Updating-bin-location-to-not-local.patch
> @@ -0,0 +1,25 @@
> +From f007ddd1eb43f43e5b596ef31df91e4ae689ba8b Mon Sep 17 00:00:00 2001
> +From: Erik Jansson <erikja@axis.com>
> +Date: Mon, 14 Oct 2019 09:57:52 +0200
> +Subject: [PATCH] Updating bin location to not local
> +
> +---
> + k3s.service | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/k3s.service b/k3s.service
> +index 94abfb771a..e93a28138f 100644
> +--- a/k3s.service
> ++++ b/k3s.service
> +@@ -6,7 +6,7 @@ After=network-online.target
> + [Service]
> + Type=notify
> + EnvironmentFile=/etc/systemd/system/k3s.service.env
> +-ExecStart=/usr/local/bin/k3s server
> ++ExecStart=/usr/bin/k3s server
> + KillMode=process
> + Delegate=yes
> + LimitNOFILE=infinity
> +--
> +2.11.0
> +
> diff --git
> a/recipes-containers/k3s/k3s/0002-Finding-host-local-in-usr-libexec.patch
> b/recipes-containers/k3s/k3s/0002-Finding-host-local-in-usr-libexec.patch
> new file mode 100644
> index 0000000..9fc81e0
> --- /dev/null
> +++
> b/recipes-containers/k3s/k3s/0002-Finding-host-local-in-usr-libexec.patch
> @@ -0,0 +1,25 @@
> +From 4faf68d68c97cfd10947e1152f711acc59f39647 Mon Sep 17 00:00:00 2001
> +From: Erik Jansson <erikja@axis.com>
> +Date: Wed, 16 Oct 2019 15:07:48 +0200
> +Subject: [PATCH] Finding host-local in /usr/libexec
> +
> +---
> + pkg/agent/config/config.go | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pkg/agent/config/config.go b/pkg/agent/config/config.go
> +index b4296f360a..6af9dab895 100644
> +--- a/pkg/agent/config/config.go
> ++++ b/pkg/agent/config/config.go
> +@@ -308,7 +308,7 @@ func get(envInfo *cmds.Agent) (*config.Node, error) {
> +               return nil, err
> +       }
> +
> +-      hostLocal, err := exec.LookPath("host-local")
> ++      hostLocal, err := exec.LookPath("/usr/libexec/cni/host-local")
> +       if err != nil {
> +               return nil, errors.Wrapf(err, "failed to find host-local")
> +       }
> +--
> +2.11.0
> +
> diff --git a/recipes-containers/k3s/k3s/agent.service
> b/recipes-containers/k3s/k3s/agent.service
> new file mode 100644
> index 0000000..80bfe40
> --- /dev/null
> +++ b/recipes-containers/k3s/k3s/agent.service
> @@ -0,0 +1,23 @@
> +[Unit]
> +Description=Lightweight Kubernetes Agent
> +Documentation=https://k3s.io
> +Requires=containerd.service
> +After=containerd.service
> +
> +[Service]
> +Type=notify
> +ExecStart=/usr/bin/k3s agent
> +ExecStopPost=/usr/bin/k3s-clean
> +KillMode=control-group
> +Delegate=yes
> +LimitNOFILE=infinity
> +LimitNPROC=infinity
> +LimitCORE=infinity
> +TasksMax=infinity
> +TimeoutStartSec=0
> +TimeoutStopSec=5
> +Restart=always
> +RestartSec=5s
> +
> +[Install]
> +WantedBy=multi-user.target
> \ No newline at end of file
> diff --git a/recipes-containers/k3s/k3s/cni-containerd-net.conf
> b/recipes-containers/k3s/k3s/cni-containerd-net.conf
> new file mode 100644
> index 0000000..ca434d6
> --- /dev/null
> +++ b/recipes-containers/k3s/k3s/cni-containerd-net.conf
> @@ -0,0 +1,24 @@
> +{
> +  "cniVersion": "0.4.0",
> +  "name": "containerd-net",
> +  "plugins": [
> +    {
> +      "type": "bridge",
> +      "bridge": "cni0",
> +      "isGateway": true,
> +      "ipMasq": true,
> +      "promiscMode": true,
> +      "ipam": {
> +        "type": "host-local",
> +        "subnet": "10.88.0.0/16",
> +        "routes": [
> +          { "dst": "0.0.0.0/0" }
> +        ]
> +      }
> +    },
> +    {
> +      "type": "portmap",
> +      "capabilities": {"portMappings": true}
> +    }
> +  ]
> +}
> diff --git a/recipes-containers/k3s/k3s/k3s-agent
> b/recipes-containers/k3s/k3s/k3s-agent
> new file mode 100755
> index 0000000..c6cab05
> --- /dev/null
> +++ b/recipes-containers/k3s/k3s/k3s-agent
> @@ -0,0 +1,99 @@
> +#!/bin/sh -eu
> +
> +ENV_CONF=/etc/systemd/system/k3s-agent.service.d/10-env.conf
> +
> +usage() {
> +       echo "
> +USAGE:
> +    ${0##*/} [OPTIONS]
> +OPTIONS:
> +    --token value, -t value             Token to use for authentication
> [\$K3S_TOKEN]
> +    --token-file value                  Token file to use for
> authentication [\$K3S_TOKEN_FILE]
> +    --server value, -s value            Server to connect to [\$K3S_URL]
> +    --node-name value                   Node name [\$K3S_NODE_NAME]
> +    --resolv-conf value                 Kubelet resolv.conf file
> [\$K3S_RESOLV_CONF]
> +    --cluster-secret value              Shared secret used to bootstrap a
> cluster [\$K3S_CLUSTER_SECRET]
> +    -h                                  print this
> +"
> +}
> +
> +[ $# -gt 0 ] || {
> +       usage
> +       exit
> +}
> +
> +case $1 in
> +       -*)
> +               ;;
> +       *)
> +               usage
> +               exit 1
> +               ;;
> +esac
> +
> +rm -f $ENV_CONF
> +mkdir -p ${ENV_CONF%/*}
> +echo [Service] > $ENV_CONF
> +
> +while getopts "t:s:-:h" opt; do
> +       case $opt in
> +               h)
> +                       usage
> +                       exit
> +                       ;;
> +               t)
> +                       VAR_NAME=K3S_TOKEN
> +                       ;;
> +               s)
> +                       VAR_NAME=K3S_URL
> +                       ;;
> +               -)
> +                       [ $# -ge $OPTIND ] || {
> +                               usage
> +                               exit 1
> +                       }
> +                       opt=$OPTARG
> +                       eval OPTARG='$'$OPTIND
> +                       OPTIND=$(($OPTIND + 1))
> +                       case $opt in
> +                               token)
> +                                       VAR_NAME=K3S_TOKEN
> +                                       ;;
> +                               token-file)
> +                                       VAR_NAME=K3S_TOKEN_FILE
> +                                       ;;
> +                               server)
> +                                       VAR_NAME=K3S_URL
> +                                       ;;
> +                               node-name)
> +                                       VAR_NAME=K3S_NODE_NAME
> +                                       ;;
> +                               resolv-conf)
> +                                       VAR_NAME=K3S_RESOLV_CONF
> +                                       ;;
> +                               cluster-secret)
> +                                       VAR_NAME=K3S_CLUSTER_SECRET
> +                                       ;;
> +                               help)
> +                                       usage
> +                                       exit
> +                                       ;;
> +                               *)
> +                                       usage
> +                                       exit 1
> +                                       ;;
> +                       esac
> +                       ;;
> +               *)
> +                       usage
> +                       exit 1
> +                       ;;
> +       esac
> +    echo Environment=$VAR_NAME=$OPTARG >> $ENV_CONF
> +done
> +
> +chmod 0644 $ENV_CONF
> +rm -rf /var/lib/rancher/k3s/agent
> +systemctl daemon-reload
> +systemctl restart k3s-agent
> +systemctl enable k3s-agent.service
> diff --git a/recipes-containers/k3s/k3s/k3s-clean
> b/recipes-containers/k3s/k3s/k3s-clean
> new file mode 100644
> index 0000000..b726637
> --- /dev/null
> +++ b/recipes-containers/k3s/k3s/k3s-clean
> @@ -0,0 +1,24 @@
> +#!/bin/sh -eu
> +do_unmount() {
> +       [ $# -eq 2 ] || return
> +       local mounts=
> +       while read ignore mount ignore; do
> +               case $mount in
> +                       $1/*|$2/*)
> +                               mounts="$mount $mounts"
> +                               ;;
> +               esac
> +       done </proc/self/mounts
> +       [ -z "$mounts" ] || umount $mounts
> +}
> +
> +do_unmount /run/k3s /var/lib/rancher/k3s
> +
> +ip link show | grep 'master cni0' | while read ignore iface ignore; do
> +    iface=${iface%%@*}
> +    [ -z "$iface" ] || ip link delete $iface
> +done
> +
> +ip link delete cni0
> +ip link delete flannel.1
> +rm -rf /var/lib/cni/
> \ No newline at end of file
> diff --git a/recipes-containers/k3s/k3s/server.service
> b/recipes-containers/k3s/k3s/server.service
> new file mode 100644
> index 0000000..02b5446
> --- /dev/null
> +++ b/recipes-containers/k3s/k3s/server.service
> @@ -0,0 +1,21 @@
> +[Unit]
> +Description=Lightweight Kubernetes
> +Documentation=https://k3s.io
> +Requires=containerd.service
> +After=containerd.service
> +
> +[Service]
> +Type=notify
> +ExecStart=/usr/bin/k3s server
> +KillMode=process
> +Delegate=yes
> +LimitNOFILE=infinity
> +LimitNPROC=infinity
> +LimitCORE=infinity
> +TasksMax=infinity
> +TimeoutStartSec=0
> +Restart=always
> +RestartSec=5s
> +
> +[Install]
> +WantedBy=multi-user.target
> \ No newline at end of file
> diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/
> k3s_git.bb
> new file mode 100644
> index 0000000..5052613
> --- /dev/null
> +++ b/recipes-containers/k3s/k3s_git.bb
> @@ -0,0 +1,74 @@
> +SUMMARY = "Production-Grade Container Scheduling and Management"
> +DESCRIPTION = "Lightweight Kubernetes, intended to be a fully compliant
> Kubernetes."
> +HOMEPAGE = "https://k3s.io/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM =
> "file://${S}/src/import/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
> +PV = "v1.18.6+k3s1-dirty"
> +
> +SRC_URI = "git://github.com/rancher/k3s.git;branch=release-1.18;name=k3s
> \
> +           file://agent.service \
> +           file://server.service \
> +           file://k3s-agent \
> +           file://k3s-clean \
> +           file://cni-containerd-net.conf \
> +
>  file://0001-Updating-bin-location-to-not-local.patch;patchdir=src/import \
> +
>  file://0002-Finding-host-local-in-usr-libexec.patch;patchdir=src/import \
> +          "
> +SRC_URI[k3s.md5sum] = "363d3a08dc0b72ba6e6577964f6e94a5"
> +SRCREV_k3s = "6f56fa1d68a5a48b8b6fdefa8eb7ead2015a4b3a"
> +
> +inherit go
> +inherit goarch
> +inherit systemd
> +
> +PACKAGECONFIG = ""
> +PACKAGECONFIG[upx] = ",,upx-native"
> +GO_IMPORT = "import"
> +GO_BUILD_LDFLAGS = "-X github.com/rancher/k3s/pkg/version.Version=${PV}
> <http://github.com/rancher/k3s/pkg/version.Version=$%7BPV%7D> \
> +                    -X
> github.com/rancher/k3s/pkg/version.GitCommit=${@d.getVar('SRCREV_k3s
> <http://github.com/rancher/k3s/pkg/version.GitCommit=$%7B@d.getVar('SRCREV_k3s>',
> d, 1)[:8]} \
> +                    -w -s \
> +                   "
> +
> +do_compile() {
> +        export
> GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
> +        export CGO_ENABLED="1"
> +        export GOFLAGS="-mod=vendor"
> +        cd ${S}/src/import
> +        ${GO} build -tags providerless -ldflags "${GO_BUILD_LDFLAGS}" -o
> ./dist/artifacts/k3s ./cmd/server/main.go
> +        # Use UPX if it is enabled (and thus exists) to compress binary
> +        if command -v upx > /dev/null 2>&1; then
> +                upx -9 ./dist/artifacts/k3s
> +        fi
> +}
> +do_install() {
> +        install -d "${D}${bindir}"
> +        install -m 755 "${S}/src/import/dist/artifacts/k3s"
> "${D}${bindir}"
> +        ln -sr "${D}/${bindir}/k3s" "${D}${bindir}/crictl"
> +        ln -sr "${D}/${bindir}/k3s" "${D}${bindir}/ctr"
> +        ln -sr "${D}/${bindir}/k3s" "${D}${bindir}/kubectl"
> +        if
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +                install -D -m 0644 "${WORKDIR}/server.service"
> "${D}${systemd_system_unitdir}/k3s.service"
> +                install -D -m 0644 "${WORKDIR}/agent.service"
> "${D}${systemd_system_unitdir}/k3s-agent.service"
> +                install -m 755 "${WORKDIR}/k3s-agent" "${D}${bindir}"
> +        fi
> +        install -m 755 "${WORKDIR}/k3s-clean" "${D}${bindir}"
> +        install -D -m 0644 "${WORKDIR}/cni-containerd-net.conf"
> "${D}/${sysconfdir}/cni/net.d/10-containerd-net.conf"
> +}
> +
> +PACKAGES =+ "${PN}-server ${PN}-agent"
> +
> +SYSTEMD_PACKAGES =
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}-server
> ${PN}-agent','',d)}"
> +SYSTEMD_SERVICE_${PN}-server =
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','k3s.service','',d)}"
> +SYSTEMD_SERVICE_${PN}-agent =
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','k3s-agent.service','',d)}"
> +SYSTEMD_AUTO_ENABLE_${PN}-agent = "disable"
> +
> +FILES_${PN}-agent = "${bindir}/k3s-agent"
> +
> +RDEPENDS_${PN} = "cni conntrack-tools coreutils findutils ipset
> virtual/containerd"
> +RDEPENDS_${PN}-server = "${PN}"
> +RDEPENDS_${PN}-agent = "${PN}"
> +
> +RCONFLICTS_${PN} = "kubectl"
> +
> +INHIBIT_PACKAGE_STRIP = "1"
> +INSANE_SKIP_${PN} += "ldflags already-stripped"
> --
> 2.20.1
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004db1e605ad69af2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">I a=
lready have a much delayed variant of this, which consolidates common eleme=
nts with k8s itself. But I&#39;ve been tied up finishing the 5.8 kernel for=
 core and haven&#39;t pushed it for public consumption yet.</div><div class=
=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">I&#39;ll have a look at this, and see h=
ow I can merge the bits together.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Cheers,</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Fri, Aug 21, 2020 at 4:59 PM Erik Jansson &lt;<a href=3D"mailto:erik.jan=
sson@axis.com">erik.jansson@axis.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Signed-off-by: Erik Jansson &lt;<a href=3D"mailto:erik.jan=
sson@axis.com" target=3D"_blank">erik.jansson@axis.com</a>&gt;<br>
---<br>
=C2=A0...1-Updating-bin-location-to-not-local.patch | 25 +++++<br>
=C2=A0...02-Finding-host-local-in-usr-libexec.patch | 25 +++++<br>
=C2=A0recipes-containers/k3s/k3s/agent.service=C2=A0 =C2=A0 =C2=A0 | 23 ++=
+++<br>
=C2=A0.../k3s/k3s/cni-containerd-net.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 24 +++++<br>
=C2=A0recipes-containers/k3s/k3s/k3s-agent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 99 +++++++++++++++++++<br>
=C2=A0recipes-containers/k3s/k3s/k3s-clean=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 24 +++++<br>
=C2=A0recipes-containers/k3s/k3s/server.service=C2=A0 =C2=A0 =C2=A0| 21 ++=
++<br>
=C2=A0recipes-containers/k3s/<a href=3D"http://k3s_git.bb" rel=3D"noreferr=
er" target=3D"_blank">k3s_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 74 ++++++++++++++<br>
=C2=A08 files changed, 315 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/k3s/k3s/0001-Updating-bin-loca=
tion-to-not-local.patch<br>
=C2=A0create mode 100644 recipes-containers/k3s/k3s/0002-Finding-host-loca=
l-in-usr-libexec.patch<br>
=C2=A0create mode 100644 recipes-containers/k3s/k3s/agent.service<br>
=C2=A0create mode 100644 recipes-containers/k3s/k3s/cni-containerd-net.con=
f<br>
=C2=A0create mode 100755 recipes-containers/k3s/k3s/k3s-agent<br>
=C2=A0create mode 100644 recipes-containers/k3s/k3s/k3s-clean<br>
=C2=A0create mode 100644 recipes-containers/k3s/k3s/server.service<br>
=C2=A0create mode 100644 recipes-containers/k3s/<a href=3D"http://k3s_git.=
bb" rel=3D"noreferrer" target=3D"_blank">k3s_git.bb</a><br>
<br>
diff --git a/recipes-containers/k3s/k3s/0001-Updating-bin-location-to-not-=
local.patch b/recipes-containers/k3s/k3s/0001-Updating-bin-location-to-not-=
local.patch<br>
new file mode 100644<br>
index 0000000..9876f61<br>
--- /dev/null<br>
+++ b/recipes-containers/k3s/k3s/0001-Updating-bin-location-to-not-local.p=
atch<br>
@@ -0,0 +1,25 @@<br>
+From f007ddd1eb43f43e5b596ef31df91e4ae689ba8b Mon Sep 17 00:00:00 2001<br=
>
+From: Erik Jansson &lt;<a href=3D"mailto:erikja@axis.com" target=3D"_blan=
k">erikja@axis.com</a>&gt;<br>
+Date: Mon, 14 Oct 2019 09:57:52 +0200<br>
+Subject: [PATCH] Updating bin location to not local<br>
+<br>
+---<br>
+ k3s.service | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/k3s.service b/k3s.service<br>
+index 94abfb771a..e93a28138f 100644<br>
+--- a/k3s.service<br>
++++ b/k3s.service<br>
+@@ -6,7 +6,7 @@ After=3Dnetwork-online.target<br>
+ [Service]<br>
+ Type=3Dnotify<br>
+ EnvironmentFile=3D/etc/systemd/system/k3s.service.env<br>
+-ExecStart=3D/usr/local/bin/k3s server<br>
++ExecStart=3D/usr/bin/k3s server<br>
+ KillMode=3Dprocess<br>
+ Delegate=3Dyes<br>
+ LimitNOFILE=3Dinfinity<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/recipes-containers/k3s/k3s/0002-Finding-host-local-in-usr-lib=
exec.patch b/recipes-containers/k3s/k3s/0002-Finding-host-local-in-usr-libe=
xec.patch<br>
new file mode 100644<br>
index 0000000..9fc81e0<br>
--- /dev/null<br>
+++ b/recipes-containers/k3s/k3s/0002-Finding-host-local-in-usr-libexec.pa=
tch<br>
@@ -0,0 +1,25 @@<br>
+From 4faf68d68c97cfd10947e1152f711acc59f39647 Mon Sep 17 00:00:00 2001<br=
>
+From: Erik Jansson &lt;<a href=3D"mailto:erikja@axis.com" target=3D"_blan=
k">erikja@axis.com</a>&gt;<br>
+Date: Wed, 16 Oct 2019 15:07:48 +0200<br>
+Subject: [PATCH] Finding host-local in /usr/libexec<br>
+<br>
+---<br>
+ pkg/agent/config/config.go | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/pkg/agent/config/config.go b/pkg/agent/config/config.go<br>
+index b4296f360a..6af9dab895 100644<br>
+--- a/pkg/agent/config/config.go<br>
++++ b/pkg/agent/config/config.go<br>
+@@ -308,7 +308,7 @@ func get(envInfo *cmds.Agent) (*config.Node, error) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, err<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 hostLocal, err :=3D exec.LookPath(&quot;host-local&=
quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 hostLocal, err :=3D exec.LookPath(&quot;/usr/libexe=
c/cni/host-local&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, errors=
.Wrapf(err, &quot;failed to find host-local&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-- <br>
+2.11.0<br>
+<br>
diff --git a/recipes-containers/k3s/k3s/agent.service b/recipes-containers=
/k3s/k3s/agent.service<br>
new file mode 100644<br>
index 0000000..80bfe40<br>
--- /dev/null<br>
+++ b/recipes-containers/k3s/k3s/agent.service<br>
@@ -0,0 +1,23 @@<br>
+[Unit]<br>
+Description=3DLightweight Kubernetes Agent<br>
+Documentation=3D<a href=3D"https://k3s.io" rel=3D"noreferrer" target=3D"_=
blank">https://k3s.io</a><br>
+Requires=3Dcontainerd.service<br>
+After=3Dcontainerd.service<br>
+<br>
+[Service]<br>
+Type=3Dnotify<br>
+ExecStart=3D/usr/bin/k3s agent<br>
+ExecStopPost=3D/usr/bin/k3s-clean<br>
+KillMode=3Dcontrol-group<br>
+Delegate=3Dyes<br>
+LimitNOFILE=3Dinfinity<br>
+LimitNPROC=3Dinfinity<br>
+LimitCORE=3Dinfinity<br>
+TasksMax=3Dinfinity<br>
+TimeoutStartSec=3D0<br>
+TimeoutStopSec=3D5<br>
+Restart=3Dalways<br>
+RestartSec=3D5s<br>
+<br>
+[Install]<br>
+WantedBy=3Dmulti-user.target<br>
\ No newline at end of file<br>
diff --git a/recipes-containers/k3s/k3s/cni-containerd-net.conf b/recipes-=
containers/k3s/k3s/cni-containerd-net.conf<br>
new file mode 100644<br>
index 0000000..ca434d6<br>
--- /dev/null<br>
+++ b/recipes-containers/k3s/k3s/cni-containerd-net.conf<br>
@@ -0,0 +1,24 @@<br>
+{<br>
+=C2=A0 &quot;cniVersion&quot;: &quot;0.4.0&quot;,<br>
+=C2=A0 &quot;name&quot;: &quot;containerd-net&quot;,<br>
+=C2=A0 &quot;plugins&quot;: [<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;bridge&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;bridge&quot;: &quot;cni0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;isGateway&quot;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;ipMasq&quot;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;promiscMode&quot;: true,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;ipam&quot;: {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;host-local&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;subnet&quot;: &quot;<a href=3D"http://1=
0.88.0.0/16" rel=3D"noreferrer" target=3D"_blank">10.88.0.0/16</a>&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;routes&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;dst&quot;: &quot;<a href=3D"ht=
tp://0.0.0.0/0" rel=3D"noreferrer" target=3D"_blank">0.0.0.0/0</a>&quot; }<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;portmap&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;capabilities&quot;: {&quot;portMappings&quot;:=
 true}<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 ]<br>
+}<br>
diff --git a/recipes-containers/k3s/k3s/k3s-agent b/recipes-containers/k3s=
/k3s/k3s-agent<br>
new file mode 100755<br>
index 0000000..c6cab05<br>
--- /dev/null<br>
+++ b/recipes-containers/k3s/k3s/k3s-agent<br>
@@ -0,0 +1,99 @@<br>
+#!/bin/sh -eu<br>
+<br>
+ENV_CONF=3D/etc/systemd/system/k3s-agent.service.d/10-env.conf<br>
+<br>
+usage() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;<br>
+USAGE:<br>
+=C2=A0 =C2=A0 ${0##*/} [OPTIONS]<br>
+OPTIONS:<br>
+=C2=A0 =C2=A0 --token value, -t value=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Token to use for authentication [\$K3S_TOKEN]<br>
+=C2=A0 =C2=A0 --token-file value=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 Token file to use for authentication [\$K3S_TOKEN_FIL=
E]<br>
+=C2=A0 =C2=A0 --server value, -s value=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 Server to connect to [\$K3S_URL]<br>
+=C2=A0 =C2=A0 --node-name value=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0Node name [\$K3S_NODE_NAME]<br>
+=C2=A0 =C2=A0 --resolv-conf value=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Kubelet resolv.conf file [\$K3S_RESOLV_CONF]<br>
+=C2=A0 =C2=A0 --cluster-secret value=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Shared secret used to bootstrap a cluster [\$K3S_CLUSTER_SEC=
RET]<br>
+=C2=A0 =C2=A0 -h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print this<=
br>
+&quot;<br>
+}<br>
+<br>
+[ $# -gt 0 ] || {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0usage<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exit<br>
+}<br>
+<br>
+case $1 in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usage<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+esac<br>
+<br>
+rm -f $ENV_CONF<br>
+mkdir -p ${ENV_CONF%/*}<br>
+echo [Service] &gt; $ENV_CONF<br>
+<br>
+while getopts &quot;t:s:-:h&quot; opt; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case $opt in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0h)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0usage<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0exit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0VAR_NAME=3DK3S_TOKEN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0VAR_NAME=3DK3S_URL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0[ $# -ge $OPTIND ] || {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usage<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0opt=3D$OPTARG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0eval OPTARG=3D&#39;$&#39;$OPTIND<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0OPTIND=3D$(($OPTIND + 1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0case $opt in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0token)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VAR_NAME=
=
=3DK3S_TOKEN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0token-file)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VAR_NAME=
=
=3DK3S_TOKEN_FILE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0server)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VAR_NAME=
=
=3DK3S_URL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node-name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VAR_NAME=
=
=3DK3S_NODE_NAME<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resolv-conf)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VAR_NAME=
=
=3DK3S_RESOLV_CONF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cluster-secret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VAR_NAME=
=
=3DK3S_CLUSTER_SECRET<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usage<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usage<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0esac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0usage<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0exit 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
+=C2=A0 =C2=A0 echo Environment=3D$VAR_NAME=3D$OPTARG &gt;&gt; $ENV_CONF<b=
r>
+done<br>
+<br>
+chmod 0644 $ENV_CONF<br>
+rm -rf /var/lib/rancher/k3s/agent<br>
+systemctl daemon-reload<br>
+systemctl restart k3s-agent<br>
+systemctl enable k3s-agent.service<br>
diff --git a/recipes-containers/k3s/k3s/k3s-clean b/recipes-containers/k3s=
/k3s/k3s-clean<br>
new file mode 100644<br>
index 0000000..b726637<br>
--- /dev/null<br>
+++ b/recipes-containers/k3s/k3s/k3s-clean<br>
@@ -0,0 +1,24 @@<br>
+#!/bin/sh -eu<br>
+do_unmount() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ $# -eq 2 ] || return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local mounts=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while read ignore mount ignore; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case $mount in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0$1/*|$2/*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mounts=3D&quot;$mount $mounts&quot;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done &lt;/proc/self/mounts<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -z &quot;$mounts&quot; ] || umount $mounts<b=
r>
+}<br>
+<br>
+do_unmount /run/k3s /var/lib/rancher/k3s<br>
+<br>
+ip link show | grep &#39;master cni0&#39; | while read ignore iface ignor=
e; do<br>
+=C2=A0 =C2=A0 iface=3D${iface%%@*}<br>
+=C2=A0 =C2=A0 [ -z &quot;$iface&quot; ] || ip link delete $iface<br>
+done<br>
+<br>
+ip link delete cni0<br>
+ip link delete flannel.1<br>
+rm -rf /var/lib/cni/<br>
\ No newline at end of file<br>
diff --git a/recipes-containers/k3s/k3s/server.service b/recipes-container=
s/k3s/k3s/server.service<br>
new file mode 100644<br>
index 0000000..02b5446<br>
--- /dev/null<br>
+++ b/recipes-containers/k3s/k3s/server.service<br>
@@ -0,0 +1,21 @@<br>
+[Unit]<br>
+Description=3DLightweight Kubernetes<br>
+Documentation=3D<a href=3D"https://k3s.io" rel=3D"noreferrer" target=3D"_=
blank">https://k3s.io</a><br>
+Requires=3Dcontainerd.service<br>
+After=3Dcontainerd.service<br>
+<br>
+[Service]<br>
+Type=3Dnotify<br>
+ExecStart=3D/usr/bin/k3s server<br>
+KillMode=3Dprocess<br>
+Delegate=3Dyes<br>
+LimitNOFILE=3Dinfinity<br>
+LimitNPROC=3Dinfinity<br>
+LimitCORE=3Dinfinity<br>
+TasksMax=3Dinfinity<br>
+TimeoutStartSec=3D0<br>
+Restart=3Dalways<br>
+RestartSec=3D5s<br>
+<br>
+[Install]<br>
+WantedBy=3Dmulti-user.target<br>
\ No newline at end of file<br>
diff --git a/recipes-containers/k3s/<a href=3D"http://k3s_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">k3s_git.bb</a> b/recipes-containers/k3s/<a hre=
f=3D"http://k3s_git.bb" rel=3D"noreferrer" target=3D"_blank">k3s_git.bb</a>=
<br>
new file mode 100644<br>
index 0000000..5052613<br>
--- /dev/null<br>
+++ b/recipes-containers/k3s/<a href=3D"http://k3s_git.bb" rel=3D"noreferr=
er" target=3D"_blank">k3s_git.bb</a><br>
@@ -0,0 +1,74 @@<br>
+SUMMARY =3D &quot;Production-Grade Container Scheduling and Management&qu=
ot;<br>
+DESCRIPTION =3D &quot;Lightweight Kubernetes, intended to be a fully comp=
liant Kubernetes.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://k3s.io/" rel=3D"noreferrer" target=
=3D"_blank">https://k3s.io/</a>&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${S}/src/import/LICENSE;md5=3D2ee41112a=
44fe7014dce33e26468ba93&quot;<br>
+PV =3D &quot;v1.18.6+k3s1-dirty&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/rancher/k3s.git;bran=
ch=3Drelease-1.18;name=3Dk3s" rel=3D"noreferrer" target=3D"_blank">github.c=
om/rancher/k3s.git;branch=3Drelease-1.18;name=3Dk3s</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://agent.service \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://server.service \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://k3s-agent \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://k3s-clean \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cni-containerd-net.conf \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Updating-bin-locatio=
n-to-not-local.patch;patchdir=3Dsrc/import \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Finding-host-local-i=
n-usr-libexec.patch;patchdir=3Dsrc/import \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+SRC_URI[k3s.md5sum] =3D &quot;363d3a08dc0b72ba6e6577964f6e94a5&quot;<br>
+SRCREV_k3s =3D &quot;6f56fa1d68a5a48b8b6fdefa8eb7ead2015a4b3a&quot;<br>
+<br>
+inherit go<br>
+inherit goarch<br>
+inherit systemd<br>
+<br>
+PACKAGECONFIG =3D &quot;&quot;<br>
+PACKAGECONFIG[upx] =3D &quot;,,upx-native&quot;<br>
+GO_IMPORT =3D &quot;import&quot;<br>
+GO_BUILD_LDFLAGS =3D &quot;-X <a href=3D"http://github.com/rancher/k3s/pk=
g/version.Version=3D$%7BPV%7D" rel=3D"noreferrer" target=3D"_blank">github.=
com/rancher/k3s/pkg/version.Version=3D${PV}</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -X =
<a href=3D"http://github.com/rancher/k3s/pkg/version.GitCommit=3D$%7B@d.get=
Var(&#39;SRCREV_k3s" rel=3D"noreferrer" target=3D"_blank">github.com/ranche=
r/k3s/pkg/version.GitCommit=3D${@d.getVar(&#39;SRCREV_k3s</a>&#39;, d, 1)[:=
8]} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -w =
-s \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quo=
t;<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOPATH=3D&quot;${S}/src/import/.gopath=
:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_ENABLED=3D&quot;1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOFLAGS=3D&quot;-mod=3Dvendor&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}/src/import<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${GO} build -tags providerless -ldflags &quot=
;${GO_BUILD_LDFLAGS}&quot; -o ./dist/artifacts/k3s ./cmd/server/main.go<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use UPX if it is enabled (and thus exists) =
to compress binary<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if command -v upx &gt; /dev/null 2&gt;&amp;1;=
 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 upx -9 ./dist/art=
ifacts/k3s<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+}<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d &quot;${D}${bindir}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 755 &quot;${S}/src/import/dist/art=
ifacts/k3s&quot; &quot;${D}${bindir}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sr &quot;${D}/${bindir}/k3s&quot; &quot;$=
{D}${bindir}/crictl&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sr &quot;${D}/${bindir}/k3s&quot; &quot;$=
{D}${bindir}/ctr&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sr &quot;${D}/${bindir}/k3s&quot; &quot;$=
{D}${bindir}/kubectl&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&=
#39;,&#39;systemd&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 064=
4 &quot;${WORKDIR}/server.service&quot; &quot;${D}${systemd_system_unitdir}=
/k3s.service&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 064=
4 &quot;${WORKDIR}/agent.service&quot; &quot;${D}${systemd_system_unitdir}/=
k3s-agent.service&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 755 &q=
uot;${WORKDIR}/k3s-agent&quot; &quot;${D}${bindir}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 755 &quot;${WORKDIR}/k3s-clean&quo=
t; &quot;${D}${bindir}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 0644 &quot;${WORKDIR}/cni-conta=
inerd-net.conf&quot; &quot;${D}/${sysconfdir}/cni/net.d/10-containerd-net.c=
onf&quot;<br>
+}<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-server ${PN}-agent&quot;<br>
+<br>
+SYSTEMD_PACKAGES =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;=
,&#39;systemd&#39;,&#39;${PN}-server ${PN}-agent&#39;,&#39;&#39;,d)}&quot;<=
br>
+SYSTEMD_SERVICE_${PN}-server =3D &quot;${@bb.utils.contains(&#39;DISTRO_F=
EATURES&#39;,&#39;systemd&#39;,&#39;k3s.service&#39;,&#39;&#39;,d)}&quot;<b=
r>
+SYSTEMD_SERVICE_${PN}-agent =3D &quot;${@bb.utils.contains(&#39;DISTRO_FE=
ATURES&#39;,&#39;systemd&#39;,&#39;k3s-agent.service&#39;,&#39;&#39;,d)}&qu=
ot;<br>
+SYSTEMD_AUTO_ENABLE_${PN}-agent =3D &quot;disable&quot;<br>
+<br>
+FILES_${PN}-agent =3D &quot;${bindir}/k3s-agent&quot;<br>
+<br>
+RDEPENDS_${PN} =3D &quot;cni conntrack-tools coreutils findutils ipset vi=
rtual/containerd&quot;<br>
+RDEPENDS_${PN}-server =3D &quot;${PN}&quot;<br>
+RDEPENDS_${PN}-agent =3D &quot;${PN}&quot;<br>
+<br>
+RCONFLICTS_${PN} =3D &quot;kubectl&quot;<br>
+<br>
+INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
+INSANE_SKIP_${PN} +=3D &quot;ldflags already-stripped&quot;<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">- Thou shalt=
 not follow the NULL pointer, for chaos and madness await thee at its end<b=
r>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><br></div></=
div>

--0000000000004db1e605ad69af2e--
