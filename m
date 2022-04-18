Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA4DC64EAE
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.39179.1650289426170551488
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Apr 2022 06:43:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qd6qlWlQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id y20so6783114eju.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Apr 2022 06:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lW7JYUmZBmTS1qXy/9f9ob6VGBrRllEMbJn6NYDAneI=;
        b=qd6qlWlQpAIYxPqgBdCVk45nAYPhS/WuY4ifOTYzBDlmGmvmQ9EMytYV0UirDxrkpH
         N17VAeEnsDCBjV3G/TMoG/OvHH8okzd/Bkx9Lx+nPJ6XoMrocC9KWynQVm+cHbdbyb8J
         eRPIdnZNnsYcR+/kIXY1F4BKCnABj/maoWloGchg9aW1S0csfw52f7RYXFPUrlgT7D7+
         TuomOEYDHCQ+1VsP8Xlxq1rsl5FN6i2s7M94ATZt6lY+ZlYoIBumedYuQw0Om1sM3MOH
         2WbDj8zPqZeGpiKNdDIZsR3RON/kmsYzLGTBU370XTMxDYKkpELkeWOmYc8ur8AvN7lC
         kEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lW7JYUmZBmTS1qXy/9f9ob6VGBrRllEMbJn6NYDAneI=;
        b=tOFBNgpZdE4H3wtPsPAbjn793kEH/prH9A9Mxa5nmi2Hy6UDTUF0vlm5yY33th7rRZ
         3vFk+MquKRazQ05YtHbSN4BTf4fjsadUj2pQRhTQSsjYvjusgZc1crhONh5KOE3EbKix
         ebERt3kmMsp2sl+B4WYh14HJS62ZjL02wErpMdgEE0cbpxjqj5lbkZcP1NdTY9HlGCWD
         iBjChwAtxT9sdyzvYJZqhnDLn007OY9Ad5OFrNoL0ifMPtG/CO4DskFAUNdzfCuFQOwC
         V0WniI6jn//u9ljhwpm3fr/jUx/FHVIJWH2IIF97F+FhEmKdQArDvJ8Z4rcjnaBpiqqM
         iDTw==
X-Gm-Message-State: AOAM531J9iw7JitmlStDkFx801ZDeFaqSCYN9axlnGPOC+M5fEsgc+Wm
	5lfEFt4w5iQfg32eoxXM18s5hCPVeNf3HegRrlHDG67pOjY=
X-Google-Smtp-Source: 
 ABdhPJxmfJpuH1U/DeYCebp3vXqZGufLx2BeB67PyIto291RRiXBqzjdl8NmY44sXsiX7r9kNPxaKhc1UpE5C/7BsaM=
X-Received: by 2002:a17:907:3f04:b0:6e8:4b0e:438d with SMTP id
 hq4-20020a1709073f0400b006e84b0e438dmr9179495ejc.391.1650289424102; Mon, 18
 Apr 2022 06:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220418104623.4194-1-Qi.Chen@windriver.com>
In-Reply-To: <20220418104623.4194-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 18 Apr 2022 09:43:32 -0400
Message-ID: 
 <CADkTA4NQBm1mX7H2f4+bcVyOw81TxUFaLULqzSSJxFtUkYXG6w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] nerdctl: upgrade to v0.18.0
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7184

As I mentioned earlier, I have a WIP progress version bump that I'm
testing the script/tool against.

I'll keep this as a reference, and will follow up with the delta
between what I end up with, and this.

Bruce

On Mon, Apr 18, 2022 at 6:46 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../nerdctl/nerdctl/modules.txt               |  72 +++---
>  recipes-containers/nerdctl/nerdctl_git.bb     | 205 +++++++++---------
>  2 files changed, 137 insertions(+), 140 deletions(-)
>
> diff --git a/recipes-containers/nerdctl/nerdctl/modules.txt b/recipes-con=
tainers/nerdctl/nerdctl/modules.txt
> index 3b144736..5f90f206 100644
> --- a/recipes-containers/nerdctl/nerdctl/modules.txt
> +++ b/recipes-containers/nerdctl/nerdctl/modules.txt
> @@ -1,36 +1,38 @@
> +# github.com/Masterminds/semver/v3 v3.1.1
> +## explicit
>  # github.com/Microsoft/go-winio v0.5.2
>  ## explicit
> -# github.com/compose-spec/compose-go v1.0.9
> +# github.com/compose-spec/compose-go v1.1.0
>  ## explicit
>  # github.com/containerd/cgroups v1.0.3
>  ## explicit
>  # github.com/containerd/console v1.0.3
>  ## explicit
> -# github.com/containerd/containerd v1.6.0
> +# github.com/containerd/containerd v1.6.2
>  ## explicit
>  # github.com/containerd/continuity v0.2.2
>  ## explicit
> -# github.com/containerd/go-cni v1.1.3
> +# github.com/containerd/go-cni v1.1.4
>  ## explicit
> -# github.com/containerd/imgcrypt v1.1.3
> +# github.com/containerd/imgcrypt v1.1.4
>  ## explicit
> -# github.com/containerd/stargz-snapshotter v0.11.0
> +# github.com/containerd/stargz-snapshotter v0.11.3
>  ## explicit
> -# github.com/containerd/stargz-snapshotter/estargz v0.11.0
> +# github.com/containerd/stargz-snapshotter/estargz v0.11.3
>  ## explicit
> -# github.com/containerd/stargz-snapshotter/ipfs v0.11.0
> +# github.com/containerd/stargz-snapshotter/ipfs v0.11.3
>  ## explicit
>  # github.com/containerd/typeurl v1.0.2
>  ## explicit
>  # github.com/containernetworking/cni v1.0.1
>  ## explicit
> -# github.com/containernetworking/plugins v1.0.1
> +# github.com/containernetworking/plugins v1.1.1
>  ## explicit
>  # github.com/cyphar/filepath-securejoin v0.2.3
>  ## explicit
> -# github.com/docker/cli v20.10.12+incompatible
> +# github.com/docker/cli v20.10.14+incompatible
>  ## explicit
> -# github.com/docker/docker v20.10.12+incompatible
> +# github.com/docker/docker v20.10.14+incompatible
>  ## explicit
>  # github.com/docker/go-connections v0.4.0
>  ## explicit
> @@ -48,9 +50,7 @@
>  ## explicit
>  # github.com/ipfs/go-ipfs-http-client v0.2.0
>  ## explicit
> -# github.com/ipfs/interface-go-ipfs-core v0.5.2
> -## explicit
> -# github.com/jaytaylor/go-hostsfile v0.0.0-20211120191712-f53f85d8b98f
> +# github.com/ipfs/interface-go-ipfs-core v0.6.1
>  ## explicit
>  # github.com/mattn/go-isatty v0.0.14
>  ## explicit
> @@ -60,35 +60,35 @@
>  ## explicit
>  # github.com/opencontainers/go-digest v1.0.0
>  ## explicit
> -# github.com/opencontainers/image-spec v1.0.3-0.20211215212317-ea0209f50=
ae1
> +# github.com/opencontainers/image-spec v1.0.3-0.20220303224323-02efb9a75=
ee1
>  ## explicit
> -# github.com/opencontainers/runtime-spec v1.0.3-0.20211214071223-8958f93=
039ab
> +# github.com/opencontainers/runtime-spec v1.0.3-0.20220311020903-6969a0a=
09ab1
>  ## explicit
>  # github.com/pelletier/go-toml v1.9.4
>  ## explicit
> -# github.com/rootless-containers/bypass4netns v0.1.1-0.20220214050838-56=
2b4845f47e
> +# github.com/rootless-containers/bypass4netns v0.2.2
>  ## explicit
> -# github.com/rootless-containers/rootlesskit v0.14.6
> +# github.com/rootless-containers/rootlesskit v1.0.0
>  ## explicit
>  # github.com/sirupsen/logrus v1.8.1
>  ## explicit
> -# github.com/spf13/cobra v1.3.0
> +# github.com/spf13/cobra v1.4.0
>  ## explicit
>  # github.com/spf13/pflag v1.0.5
>  ## explicit
>  # github.com/tidwall/gjson v1.14.0
>  ## explicit
> -# github.com/vishvananda/netlink v1.1.1-0.20220125195016-0639e7e787ba
> +# github.com/vishvananda/netlink v1.1.1-0.20220318152240-083e92e21eeb
>  ## explicit
>  # github.com/vishvananda/netns v0.0.0-20211101163701-50045581ed74
>  ## explicit
> -# golang.org/x/crypto v0.0.0-20211215153901-e495a2d5b3d3
> +# golang.org/x/crypto v0.0.0-20220321153916-2c7772ba3064
>  ## explicit
> -# golang.org/x/net v0.0.0-20220127200216-cd36cc0744dd
> +# golang.org/x/net v0.0.0-20220225172249-27dd8689420f
>  ## explicit
>  # golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
>  ## explicit
> -# golang.org/x/sys v0.0.0-20220128215802-99c3d69c2c27
> +# golang.org/x/sys v0.0.0-20220319134239-a9b59b0215f8
>  ## explicit
>  # golang.org/x/term v0.0.0-20210927222741-03fcf44c2211
>  ## explicit
> @@ -112,7 +112,7 @@
>  ## explicit
>  # github.com/containerd/ttrpc v1.1.0
>  ## explicit
> -# github.com/containers/ocicrypt v1.1.2
> +# github.com/containers/ocicrypt v1.1.3
>  ## explicit
>  # github.com/coreos/go-systemd/v22 v22.3.2
>  ## explicit
> @@ -156,31 +156,31 @@
>  ## explicit
>  # github.com/ipfs/go-block-format v0.0.3
>  ## explicit
> -# github.com/ipfs/go-blockservice v0.1.7
> +# github.com/ipfs/go-blockservice v0.3.0
>  ## explicit
> -# github.com/ipfs/go-datastore v0.4.5
> +# github.com/ipfs/go-datastore v0.5.0
>  ## explicit
> -# github.com/ipfs/go-ipfs-blockstore v0.1.6
> +# github.com/ipfs/go-ipfs-blockstore v1.2.0
>  ## explicit
>  # github.com/ipfs/go-ipfs-cmds v0.6.0
>  ## explicit
> -# github.com/ipfs/go-ipfs-ds-help v0.1.1
> +# github.com/ipfs/go-ipfs-ds-help v1.1.0
>  ## explicit
> -# github.com/ipfs/go-ipfs-exchange-interface v0.0.1
> +# github.com/ipfs/go-ipfs-exchange-interface v0.1.0
>  ## explicit
>  # github.com/ipfs/go-ipfs-util v0.0.2
>  ## explicit
>  # github.com/ipfs/go-ipld-cbor v0.0.5
>  ## explicit
> -# github.com/ipfs/go-ipld-format v0.2.0
> +# github.com/ipfs/go-ipld-format v0.3.0
>  ## explicit
>  # github.com/ipfs/go-ipld-legacy v0.1.0
>  ## explicit
>  # github.com/ipfs/go-log v1.0.5
>  ## explicit
> -# github.com/ipfs/go-log/v2 v2.1.3
> +# github.com/ipfs/go-log/v2 v2.3.0
>  ## explicit
> -# github.com/ipfs/go-merkledag v0.4.0
> +# github.com/ipfs/go-merkledag v0.6.0
>  ## explicit
>  # github.com/ipfs/go-metrics-interface v0.0.1
>  ## explicit
> @@ -196,7 +196,7 @@
>  ## explicit
>  # github.com/jbenet/goprocess v0.1.4
>  ## explicit
> -# github.com/klauspost/compress v1.14.2
> +# github.com/klauspost/compress v1.15.1
>  ## explicit
>  # github.com/klauspost/cpuid/v2 v2.0.6
>  ## explicit
> @@ -212,7 +212,7 @@
>  ## explicit
>  # github.com/matttproud/golang_protobuf_extensions v1.0.2-0.201812311719=
20-c182affec369
>  ## explicit
> -# github.com/miekg/pkcs11 v1.0.3
> +# github.com/miekg/pkcs11 v1.1.1
>  ## explicit
>  # github.com/minio/blake2b-simd v0.0.0-20160723061019-3f5f724cb5b1
>  ## explicit
> @@ -254,7 +254,7 @@
>  ## explicit
>  # github.com/polydawn/refmt v0.0.0-20201211092308-30ac6d18308e
>  ## explicit
> -# github.com/prometheus/client_golang v1.12.0
> +# github.com/prometheus/client_golang v1.12.1
>  ## explicit
>  # github.com/prometheus/client_model v0.2.0
>  ## explicit
> @@ -302,7 +302,7 @@
>  ## explicit
>  # google.golang.org/genproto v0.0.0-20220126215142-9970aeb2e350
>  ## explicit
> -# google.golang.org/grpc v1.44.0
> +# google.golang.org/grpc v1.45.0
>  ## explicit
>  # google.golang.org/protobuf v1.27.1
>  ## explicit
> @@ -310,4 +310,4 @@
>  ## explicit
>  # github.com/ktock/golang-lru v0.5.5-0.20211029085301-ec551be6f75c
>  ## explicit
> -# github.com/hashicorp/golang-lru  =3D> github.com/ktock/golang-lru v0.5=
.5-0.20211029085301-ec551be6f75c
> +# github.com/hashicorp/golang-lru =3D> github.com/ktock/golang-lru v0.5.=
5-0.20211029085301-ec551be6f75c
> diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containe=
rs/nerdctl/nerdctl_git.bb
> index e0e87de4..c402c578 100644
> --- a/recipes-containers/nerdctl/nerdctl_git.bb
> +++ b/recipes-containers/nerdctl/nerdctl_git.bb
> @@ -9,19 +9,23 @@ DEPENDS =3D " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>  "
>
> -#SRCREV_FORMAT=3D"nerdcli_cgroups"
> -SRCREV_nerdcli =3D "f2427ffbd1dd67231722fb307f39eecf702de980"
> +SRCREV_nerdcli =3D "77276ff0fffad3f855ab9f2f5a4ad5527ef76485"
>
>  SRC_URI =3D "git://github.com/containerd/nerdctl.git;name=3Dnerdcli;bran=
ch=3Dmaster;protocol=3Dhttps"
>
> +#      github.com/Masterminds/semver/v3 v3.1.1
> +# [1] git ls-remote https://github.com/Masterminds/semver/v3 v3.1.1
> +SRCREV_semver=3D"d387ce7889a157b19ad7694dba39a562051f41b0"
> +SRC_URI +=3D "git://github.com/Masterminds/semver;name=3Dsemver;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/Masterminds/semver/v3"
> +
>  #      github.com/Microsoft/go-winio v0.5.2
>  # [1] git ls-remote https://github.com/Microsoft/go-winio dfd7da8f92a382=
999d77b5d9cfe8cc6bec1894c6
>  SRCREV_go-winio=3D"dfd7da8f92a382999d77b5d9cfe8cc6bec1894c6"
>  SRC_URI +=3D "git://github.com/Microsoft/go-winio;name=3Dgo-winio;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/Microsoft/go-winio"
>
> -#      github.com/compose-spec/compose-go v1.0.9
> -# [1] git ls-remote https://github.com/compose-spec/compose-go ad7931673=
da9b06dd2a326d91a2ab015d62a31d8
> -SRCREV_compose-go=3D"ad7931673da9b06dd2a326d91a2ab015d62a31d8"
> +#      github.com/compose-spec/compose-go v1.1.0
> +# [1] git ls-remote https://github.com/compose-spec/compose-go 8c0547c39=
4378beefe7100ffd419b476fb99eb60
> +SRCREV_compose-go=3D"8c0547c394378beefe7100ffd419b476fb99eb60"
>  SRC_URI +=3D "git://github.com/compose-spec/compose-go;name=3Dcompose-go=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/compose-spec/compose-go"
>
>  #      github.com/containerd/cgroups v1.0.3
> @@ -34,9 +38,9 @@ SRC_URI +=3D "git://github.com/containerd/cgroups;name=
=3Dcgroups;protocol=3Dhttps;nobr
>  SRCREV_console=3D"060a791de16aeb90b3bb4dcd78dfec3ca45fa5df"
>  SRC_URI +=3D "git://github.com/containerd/console;name=3Dconsole;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/containerd/console"
>
> -#      github.com/containerd/containerd v1.6.0
> -# [1] git ls-remote https://github.com/containerd/containerd 13a9d2087b0=
4c1a99ba3fb3159fbd6b2493ca6dd
> -SRCREV_containerd=3D"13a9d2087b04c1a99ba3fb3159fbd6b2493ca6dd"
> +#      github.com/containerd/containerd v1.6.2
> +# [1] git ls-remote https://github.com/containerd/containerd v1.6.2
> +SRCREV_containerd =3D "b30221197bbf818a48ec3f20f5e72a739f84ebeb"
>  SRC_URI +=3D "git://github.com/containerd/containerd;name=3Dcontainerd;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/containerd/containerd"
>
>  #      github.com/containerd/continuity v0.2.2
> @@ -44,19 +48,19 @@ SRC_URI +=3D "git://github.com/containerd/containerd;=
name=3Dcontainerd;protocol=3Dhttp
>  SRCREV_continuity=3D"3a5e5b882aed17b35e1cea5bbc0a4c26b40ab268"
>  SRC_URI +=3D "git://github.com/containerd/continuity;name=3Dcontinuity;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/containerd/continuity"
>
> -#      github.com/containerd/go-cni v1.1.3
> -# [1] git ls-remote https://github.com/containerd/go-cni d3dcbd535b9e305=
167e3d27e1b8cd7bbd4c3c382
> -SRCREV_go-cni=3D"d3dcbd535b9e305167e3d27e1b8cd7bbd4c3c382"
> +#      github.com/containerd/go-cni v1.1.4
> +# [1] git ls-remote https://github.com/containerd/go-cni v1.1.4
> +SRCREV_go-cni =3D "1ae42404d2502e705c1c61de9c254a7cd7f6e74b"
>  SRC_URI +=3D "git://github.com/containerd/go-cni;name=3Dgo-cni;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/containerd/go-cni"
>
> -#      github.com/containerd/imgcrypt v1.1.3
> -# [1] git ls-remote https://github.com/containerd/imgcrypt 41198ab93e761=
6c40a1ed505256a664b81fe84c1
> -SRCREV_imgcrypt=3D"41198ab93e7616c40a1ed505256a664b81fe84c1"
> +#      github.com/containerd/imgcrypt v1.1.4
> +# [1] git ls-remote https://github.com/containerd/imgcrypt v1.1.4
> +SRCREV_imgcrypt =3D "7931b2f099de27afc80e84df85f9361ee6668dd1"
>  SRC_URI +=3D "git://github.com/containerd/imgcrypt;name=3Dimgcrypt;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/containerd/imgcrypt"
>
> -#      github.com/containerd/stargz-snapshotter v0.11.0
> -# [1] git ls-remote https://github.com/containerd/stargz-snapshotter 721=
6b07a2f8f0ec3ec1fb8c6ac8a933c70b82eec
> -SRCREV_stargz-snapshotter=3D"7216b07a2f8f0ec3ec1fb8c6ac8a933c70b82eec"
> +#      github.com/containerd/stargz-snapshotter v0.11.3
> +# [1] git ls-remote https://github.com/containerd/stargz-snapshotter v0.=
11.3
> +SRCREV_stargz-snapshotter =3D "84c8e540467f8701fbf1ba7fb9fce749fdbaf160"
>  SRC_URI +=3D "git://github.com/containerd/stargz-snapshotter;name=3Dstar=
gz-snapshotter;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/=
src/import/vendor.fetch/github.com/containerd/stargz-snapshotter"
>
>  #      github.com/containerd/typeurl v1.0.2
> @@ -69,9 +73,9 @@ SRC_URI +=3D "git://github.com/containerd/typeurl;name=
=3Dtypeurl;protocol=3Dhttps;nobr
>  SRCREV_cni=3D"1694fd7b57e0176a98a12823a5ffc03337fdc152"
>  SRC_URI +=3D "git://github.com/containernetworking/cni;name=3Dcni;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/containernetworking/cni"
>
> -#      github.com/containernetworking/plugins v1.0.1
> -# [1] git ls-remote https://github.com/containernetworking/plugins 56d83=
64f1bd3fa0d35717936ec5cd385e61d3815
> -SRCREV_plugins=3D"56d8364f1bd3fa0d35717936ec5cd385e61d3815"
> +#      github.com/containernetworking/plugins v1.1.1
> +# [1] git ls-remote https://github.com/containernetworking/plugins v1.1.=
1
> +SRCREV_plugins =3D "587d42b2ca2b8fb2f111b50fd90f0089cc03b8ad"
>  SRC_URI +=3D "git://github.com/containernetworking/plugins;name=3Dplugin=
s;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/containernetworking/plugins"
>
>  #      github.com/cyphar/filepath-securejoin v0.2.3
> @@ -79,14 +83,14 @@ SRC_URI +=3D "git://github.com/containernetworking/pl=
ugins;name=3Dplugins;protocol=3Dh
>  SRCREV_filepath-securejoin=3D"a89baba1e4f44c5512e245cbd156de1293d6185a"
>  SRC_URI +=3D "git://github.com/cyphar/filepath-securejoin;name=3Dfilepat=
h-securejoin;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/sr=
c/import/vendor.fetch/github.com/cyphar/filepath-securejoin"
>
> -#      github.com/docker/cli v20.10.12+incompatible
> -# [1] git ls-remote https://github.com/docker/cli 60293e390eba4de1a06309=
b75bbf61dd7a45bbcb
> -SRCREV_cli=3D"60293e390eba4de1a06309b75bbf61dd7a45bbcb"
> +#      github.com/docker/cli v20.10.14+incompatible
> +# [1] git ls-remote https://github.com/docker/cli v20.10.14
> +SRCREV_cli=3D"0a7772e9b73210a9c25df0d1d74a6566b5e410eb"
>  SRC_URI +=3D "git://github.com/docker/cli;name=3Dcli;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/docker/cli"
>
>  #      github.com/docker/docker v20.10.12+incompatible
> -# [1] git ls-remote https://github.com/docker/docker bd6d47cb470e2c31aca=
ef7dc0da42dc8cfb42085
> -SRCREV_docker=3D"bd6d47cb470e2c31acaef7dc0da42dc8cfb42085"
> +# [1] git ls-remote https://github.com/docker/docker v20.10.14
> +SRCREV_docker=3D"0ea83a3744846f1b998016406c457c3d6c68c7a6"
>  SRC_URI +=3D "git://github.com/docker/docker;name=3Ddocker;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/docker/docker"
>
>  #      github.com/docker/go-connections v0.4.0
> @@ -129,16 +133,11 @@ SRC_URI +=3D "git://github.com/ipfs/go-ipfs-files;n=
ame=3Dgo-ipfs-files;protocol=3Dhttp
>  SRCREV_go-ipfs-http-client=3D"434ac969c653f7c4781144aaa2834b5f8828ce22"
>  SRC_URI +=3D "git://github.com/ipfs/go-ipfs-http-client;name=3Dgo-ipfs-h=
ttp-client;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/=
import/vendor.fetch/github.com/ipfs/go-ipfs-http-client"
>
> -#      github.com/ipfs/interface-go-ipfs-core v0.5.2
> -# [1] git ls-remote https://github.com/ipfs/interface-go-ipfs-core 275b8=
0e1f34ead0fb06a9216e3bffee57a01b636
> -SRCREV_interface-go-ipfs-core=3D"275b80e1f34ead0fb06a9216e3bffee57a01b63=
6"
> +#      github.com/ipfs/interface-go-ipfs-core v0.6.1
> +# [1] git ls-remote https://github.com/ipfs/interface-go-ipfs-core v0.6.=
1
> +SRCREV_interface-go-ipfs-core =3D "d61758a39392e9853a304189a26c3e546e00e=
e3a"
>  SRC_URI +=3D "git://github.com/ipfs/interface-go-ipfs-core;name=3Dinterf=
ace-go-ipfs-core;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP=
}/src/import/vendor.fetch/github.com/ipfs/interface-go-ipfs-core"
>
> -#      github.com/jaytaylor/go-hostsfile v0.0.0-20211120191712-f53f85d8b=
98f
> -# [1] git ls-remote https://github.com/jaytaylor/go-hostsfile f53f85d8b9=
8f8f4925bceab7890a431e2f46c38f
> -SRCREV_go-hostsfile=3D"f53f85d8b98f8f4925bceab7890a431e2f46c38f"
> -SRC_URI +=3D "git://github.com/jaytaylor/go-hostsfile;name=3Dgo-hostsfil=
e;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/jaytaylor/go-hostsfile"
> -
>  #      github.com/mattn/go-isatty v0.0.14
>  # [1] git ls-remote https://github.com/mattn/go-isatty 504425e14f742f1f5=
17c4586048b49b37f829c8e
>  SRCREV_go-isatty=3D"504425e14f742f1f517c4586048b49b37f829c8e"
> @@ -159,14 +158,14 @@ SRC_URI +=3D "git://github.com/multiformats/go-mult=
iaddr;name=3Dgo-multiaddr;protoco
>  SRCREV_go-digest=3D"4a41a1fddd8208cc64f911e551a7f361716f8ae5"
>  SRC_URI +=3D "git://github.com/opencontainers/go-digest;name=3Dgo-digest=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/opencontainers/go-digest"
>
> -#      github.com/opencontainers/image-spec v1.0.3-0.20211215212317-ea02=
09f50ae1
> -# [1] git ls-remote https://github.com/opencontainers/image-spec ea0209f=
50ae1a3707cff054cdb6b7487050487de
> -SRCREV_image-spec=3D"ea0209f50ae1a3707cff054cdb6b7487050487de"
> +#      github.com/opencontainers/image-spec v1.0.3-0.20220303224323-02ef=
b9a75ee1
> +# [1] git ls-remote https://github.com/opencontainers/image-spec 02efb9a=
75ee11e05937b535cc5f228f9343ab2f5
> +SRCREV_image-spec=3D"02efb9a75ee11e05937b535cc5f228f9343ab2f5"
>  SRC_URI +=3D "git://github.com/opencontainers/image-spec;name=3Dimage-sp=
ec;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/opencontainers/image-spec"
>
> -#      github.com/opencontainers/runtime-spec v1.0.3-0.20211214071223-89=
58f93039ab
> -# [1] git ls-remote https://github.com/opencontainers/runtime-spec 8958f=
93039ab90be53d803cd7e231a775f644451
> -SRCREV_runtime-spec=3D"8958f93039ab90be53d803cd7e231a775f644451"
> +#      github.com/opencontainers/runtime-spec v1.0.3-0.20220311020903-69=
69a0a09ab1
> +# [1] git ls-remote https://github.com/opencontainers/runtime-spec 6969a=
0a09ab162a574cafcc9ac814e498962c943
> +SRCREV_runtime-spec=3D"6969a0a09ab162a574cafcc9ac814e498962c943"
>  SRC_URI +=3D "git://github.com/opencontainers/runtime-spec;name=3Druntim=
e-spec;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/impo=
rt/vendor.fetch/github.com/opencontainers/runtime-spec"
>
>  #      github.com/pelletier/go-toml v1.9.4
> @@ -174,14 +173,14 @@ SRC_URI +=3D "git://github.com/opencontainers/runti=
me-spec;name=3Druntime-spec;proto
>  SRCREV_go-toml=3D"b8ba995eaaba4be30c8a8090bdfb4aa61af52054"
>  SRC_URI +=3D "git://github.com/pelletier/go-toml;name=3Dgo-toml;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/pelletier/go-toml"
>
> -#      github.com/rootless-containers/bypass4netns v0.1.1-0.202202140508=
38-562b4845f47e
> -# [1] git ls-remote https://github.com/rootless-containers/bypass4netns =
562b4845f47e3bb1019e37369948845a27ef5b58
> -SRCREV_bypass4netns=3D"562b4845f47e3bb1019e37369948845a27ef5b58"
> +#      github.com/rootless-containers/bypass4netns v0.2.2
> +# [1] git ls-remote https://github.com/rootless-containers/bypass4netns =
c3682687bc69a704c4ca312ab61febe2606c9680
> +SRCREV_bypass4netns=3D"c3682687bc69a704c4ca312ab61febe2606c9680"
>  SRC_URI +=3D "git://github.com/rootless-containers/bypass4netns;name=3Db=
ypass4netns;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src=
/import/vendor.fetch/github.com/rootless-containers/bypass4netns"
>
> -#      github.com/rootless-containers/rootlesskit v0.14.6
> -# [1] git ls-remote https://github.com/rootless-containers/rootlesskit 0=
f88c14fd0966e018bb8f0eefc57c5283459a56c
> -SRCREV_rootlesskit=3D"0f88c14fd0966e018bb8f0eefc57c5283459a56c"
> +#      github.com/rootless-containers/rootlesskit v1.0.0
> +# [1] git ls-remote https://github.com/rootless-containers/rootlesskit v=
1.0.0
> +SRCREV_rootlesskit =3D "4c5afdcdb381581c7eaaea09ac9cdf226b8dda03"
>  SRC_URI +=3D "git://github.com/rootless-containers/rootlesskit;name=3Dro=
otlesskit;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/i=
mport/vendor.fetch/github.com/rootless-containers/rootlesskit"
>
>  #      github.com/sirupsen/logrus v1.8.1
> @@ -189,9 +188,9 @@ SRC_URI +=3D "git://github.com/rootless-containers/ro=
otlesskit;name=3Drootlesskit;pr
>  SRCREV_logrus=3D"bdc0db8ead3853c56b7cd1ac2ba4e11b47d7da6b"
>  SRC_URI +=3D "git://github.com/sirupsen/logrus;name=3Dlogrus;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/sirupsen/logrus"
>
> -#      github.com/spf13/cobra v1.3.0
> -# [1] git ls-remote https://github.com/spf13/cobra 178edbb247f35e4665782=
11dcf5f4892dbbd369b
> -SRCREV_cobra=3D"178edbb247f35e466578211dcf5f4892dbbd369b"
> +#      github.com/spf13/cobra v1.4.0
> +# [1] git ls-remote https://github.com/spf13/cobra v1.4.0
> +SRCREV_cobra =3D "5b2b9e9f61d36ccb66167301f76a2292c3729855"
>  SRC_URI +=3D "git://github.com/spf13/cobra;name=3Dcobra;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/spf13/cobra"
>
>  #      github.com/spf13/pflag v1.0.5
> @@ -204,9 +203,9 @@ SRC_URI +=3D "git://github.com/spf13/pflag;name=3Dpfl=
ag;protocol=3Dhttps;nobranch=3D1;de
>  SRCREV_gjson=3D"7a94820afd8a0d993c07b9cde761b95943823a9f"
>  SRC_URI +=3D "git://github.com/tidwall/gjson;name=3Dgjson;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/tidwall/gjson"
>
> -#      github.com/vishvananda/netlink v1.1.1-0.20220125195016-0639e7e787=
ba
> -# [1] git ls-remote https://github.com/vishvananda/netlink 0639e7e787ba7=
257fc7d097a14d203b1cf1fece9
> -SRCREV_netlink=3D"0639e7e787ba7257fc7d097a14d203b1cf1fece9"
> +#      github.com/vishvananda/netlink v1.1.1-0.20220318152240-083e92e21e=
eb
> +# [1] git ls-remote https://github.com/vishvananda/netlink 083e92e21eebd=
e7a218b0da26a7a1b27c9b5e0f0
> +SRCREV_netlink=3D"083e92e21eebde7a218b0da26a7a1b27c9b5e0f0"
>  SRC_URI +=3D "git://github.com/vishvananda/netlink;name=3Dnetlink;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/vishvananda/netlink"
>
>  #      github.com/vishvananda/netns v0.0.0-20211101163701-50045581ed74
> @@ -214,14 +213,14 @@ SRC_URI +=3D "git://github.com/vishvananda/netlink;=
name=3Dnetlink;protocol=3Dhttps;nob
>  SRCREV_netns=3D"50045581ed74c15eded78746bae9fb3df07d6655"
>  SRC_URI +=3D "git://github.com/vishvananda/netns;name=3Dnetns;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/vishvananda/netns"
>
> -#      golang.org/x/crypto v0.0.0-20211215153901-e495a2d5b3d3
> -# [1] git ls-remote https://go.googlesource.com/crypto e495a2d5b3d3be434=
68d0ebb413f46eeaedf7eb3
> -SRCREV_crypto=3D"e495a2d5b3d3be43468d0ebb413f46eeaedf7eb3"
> +#      golang.org/x/crypto v0.0.0-20220321153916-2c7772ba3064
> +# [1] git ls-remote https://go.googlesource.com/crypto 2c7772ba30643b7a2=
026cbea938420dce7c6384d
> +SRCREV_crypto=3D"2c7772ba30643b7a2026cbea938420dce7c6384d"
>  SRC_URI +=3D "git://go.googlesource.com/crypto;name=3Dcrypto;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
.googlesource.com/crypto"
>
> -#      golang.org/x/net v0.0.0-20220127200216-cd36cc0744dd
> -# [1] git ls-remote https://go.googlesource.com/net cd36cc0744dd69565798=
8f15f08446dc81e16efc
> -SRCREV_net=3D"cd36cc0744dd695657988f15f08446dc81e16efc"
> +#      golang.org/x/net v0.0.0-20220225172249-27dd8689420f
> +# [1] git ls-remote https://go.googlesource.com/net 27dd8689420fcde08851=
4397d015e4fea5174e0e
> +SRCREV_net=3D"27dd8689420fcde088514397d015e4fea5174e0e"
>  SRC_URI +=3D "git://go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googl=
esource.com/net"
>
>  #      golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
> @@ -229,9 +228,9 @@ SRC_URI +=3D "git://go.googlesource.com/net;name=3Dne=
t;protocol=3Dhttps;nobranch=3D1;des
>  SRCREV_sync=3D"036812b2e83c0ddf193dd5a34e034151da389d09"
>  SRC_URI +=3D "git://go.googlesource.com/sync;name=3Dsync;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.goo=
glesource.com/sync"
>
> -#      golang.org/x/sys v0.0.0-20220128215802-99c3d69c2c27
> -# [1] git ls-remote https://go.googlesource.com/sys 99c3d69c2c27d4f16bc6=
cb2698ad877a3ba5fe75
> -SRCREV_sys=3D"99c3d69c2c27d4f16bc6cb2698ad877a3ba5fe75"
> +#      golang.org/x/sys v0.0.0-20220319134239-a9b59b0215f8
> +# [1] git ls-remote https://go.googlesource.com/sys a9b59b0215f867c0675d=
50602208ab8c4f4fe9c7
> +SRCREV_sys=3D"a9b59b0215f867c0675d50602208ab8c4f4fe9c7"
>  SRC_URI +=3D "git://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googl=
esource.com/sys"
>
>  #      golang.org/x/term v0.0.0-20210927222741-03fcf44c2211
> @@ -289,9 +288,9 @@ SRC_URI +=3D "git://github.com/containerd/fifo;name=
=3Dfifo;protocol=3Dhttps;nobranch=3D1
>  SRCREV_ttrpc=3D"5e8fe05f04c91bc8713ee4241e58d0b9da1c4a59"
>  SRC_URI +=3D "git://github.com/containerd/ttrpc;name=3Dttrpc;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/containerd/ttrpc"
>
> -#      github.com/containers/ocicrypt v1.1.2
> -# [1] git ls-remote https://github.com/containers/ocicrypt 1272152ccae67=
a2c3a4ed543d72b7e42928c99bb
> -SRCREV_ocicrypt=3D"1272152ccae67a2c3a4ed543d72b7e42928c99bb"
> +#      github.com/containers/ocicrypt v1.1.3
> +# [1] git ls-remote https://github.com/containers/ocicrypt v1.1.3
> +SRCREV_ocicrypt =3D "01e7d427cd74fec566a69393e3de805df382f77c"
>  SRC_URI +=3D "git://github.com/containers/ocicrypt;name=3Docicrypt;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/containers/ocicrypt"
>
>  #      github.com/coreos/go-systemd/v22 v22.3.2
> @@ -399,19 +398,19 @@ SRC_URI +=3D "git://github.com/ipfs/bbloom;name=3Db=
bloom;protocol=3Dhttps;nobranch=3D1;d
>  SRCREV_go-block-format=3D"b30b45004baf0d2dcd3d1b5b5604fb4c0ccb0825"
>  SRC_URI +=3D "git://github.com/ipfs/go-block-format;name=3Dgo-block-form=
at;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/ipfs/go-block-format"
>
> -#      github.com/ipfs/go-blockservice v0.1.7
> -# [1] git ls-remote https://github.com/ipfs/go-blockservice 7e86180be5c2=
959033db973c0eae033de03dd423
> -SRCREV_go-blockservice=3D"7e86180be5c2959033db973c0eae033de03dd423"
> +#      github.com/ipfs/go-blockservice v0.3.0
> +# [1] git ls-remote https://github.com/ipfs/go-blockservice v0.3.0
> +SRCREV_go-blockservice =3D "888c7cc7c29cf4752865ce2e856237cb1d5c85b2"
>  SRC_URI +=3D "git://github.com/ipfs/go-blockservice;name=3Dgo-blockservi=
ce;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/ipfs/go-blockservice"
>
> -#      github.com/ipfs/go-datastore v0.4.5
> -# [1] git ls-remote https://github.com/ipfs/go-datastore 73ce3192124c578=
1bc875f2e5d4f483ab8de0d04
> -SRCREV_go-datastore=3D"73ce3192124c5781bc875f2e5d4f483ab8de0d04"
> +#      github.com/ipfs/go-datastore v0.5.0
> +# [1] git ls-remote https://github.com/ipfs/go-datastore v0.5.0
> +SRCREV_go-datastore =3D "7548998537794105418980aeb5dac19802712392"
>  SRC_URI +=3D "git://github.com/ipfs/go-datastore;name=3Dgo-datastore;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/ipfs/go-datastore"
>
> -#      github.com/ipfs/go-ipfs-blockstore v0.1.6
> -# [1] git ls-remote https://github.com/ipfs/go-ipfs-blockstore 95a1a08b3=
3f8e55a45a4c306f6f05cf91e8f0728
> -SRCREV_go-ipfs-blockstore=3D"95a1a08b33f8e55a45a4c306f6f05cf91e8f0728"
> +#      github.com/ipfs/go-ipfs-blockstore v1.2.0
> +# [1] git ls-remote https://github.com/ipfs/go-ipfs-blockstore v1.2.0
> +SRCREV_go-ipfs-blockstore =3D "ffd43a8d91e6ee80b26d3a6eca5b8c4816c5508b"
>  SRC_URI +=3D "git://github.com/ipfs/go-ipfs-blockstore;name=3Dgo-ipfs-bl=
ockstore;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/im=
port/vendor.fetch/github.com/ipfs/go-ipfs-blockstore"
>
>  #      github.com/ipfs/go-ipfs-cmds v0.6.0
> @@ -419,14 +418,14 @@ SRC_URI +=3D "git://github.com/ipfs/go-ipfs-blockst=
ore;name=3Dgo-ipfs-blockstore;pro
>  SRCREV_go-ipfs-cmds=3D"4ade007405e5d3befb14184290576c63cc43a6a3"
>  SRC_URI +=3D "git://github.com/ipfs/go-ipfs-cmds;name=3Dgo-ipfs-cmds;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/ipfs/go-ipfs-cmds"
>
> -#      github.com/ipfs/go-ipfs-ds-help v0.1.1
> -# [1] git ls-remote https://github.com/ipfs/go-ipfs-ds-help 48b9cc210923=
d23b39582b5fa6670ed0d08dc2af
> -SRCREV_go-ipfs-ds-help=3D"48b9cc210923d23b39582b5fa6670ed0d08dc2af"
> +#      github.com/ipfs/go-ipfs-ds-help v1.1.0
> +# [1] git ls-remote https://github.com/ipfs/go-ipfs-ds-help v1.1.0
> +SRCREV_go-ipfs-ds-help =3D "0ce85d6dd676a9c7d3018dd79f43b2b1d7f31082"
>  SRC_URI +=3D "git://github.com/ipfs/go-ipfs-ds-help;name=3Dgo-ipfs-ds-he=
lp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/ipfs/go-ipfs-ds-help"
>
> -#      github.com/ipfs/go-ipfs-exchange-interface v0.0.1
> -# [1] git ls-remote https://github.com/ipfs/go-ipfs-exchange-interface b=
6e88260772433e18af18bb3f237d78678e65f0b
> -SRCREV_go-ipfs-exchange-interface=3D"b6e88260772433e18af18bb3f237d78678e=
65f0b"
> +#      github.com/ipfs/go-ipfs-exchange-interface v0.1.0
> +# [1] git ls-remote https://github.com/ipfs/go-ipfs-exchange-interface v=
0.1.0
> +SRCREV_go-ipfs-exchange-interface =3D "2e7c882a034eacabca59c5cd2d9ab959c=
2da78f7"
>  SRC_URI +=3D "git://github.com/ipfs/go-ipfs-exchange-interface;name=3Dgo=
-ipfs-exchange-interface;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKD=
IR}/${BP}/src/import/vendor.fetch/github.com/ipfs/go-ipfs-exchange-interfac=
e"
>
>  #      github.com/ipfs/go-ipfs-util v0.0.2
> @@ -439,9 +438,9 @@ SRC_URI +=3D "git://github.com/ipfs/go-ipfs-util;name=
=3Dgo-ipfs-util;protocol=3Dhttps;
>  SRCREV_go-ipld-cbor=3D"f689d2bb3874cf3fafb71721cafb2c945234e781"
>  SRC_URI +=3D "git://github.com/ipfs/go-ipld-cbor;name=3Dgo-ipld-cbor;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/ipfs/go-ipld-cbor"
>
> -#      github.com/ipfs/go-ipld-format v0.2.0
> -# [1] git ls-remote https://github.com/ipfs/go-ipld-format c582c36b70867=
2f99752a0b6171adec7820e0049
> -SRCREV_go-ipld-format=3D"c582c36b708672f99752a0b6171adec7820e0049"
> +#      github.com/ipfs/go-ipld-format v0.3.0
> +# [1] git ls-remote https://github.com/ipfs/go-ipld-format v0.3.0
> +SRCREV_go-ipld-format =3D "c545ab0d87f91c656e48d1adf0ec4dcf4d21f1dc"
>  SRC_URI +=3D "git://github.com/ipfs/go-ipld-format;name=3Dgo-ipld-format=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/ipfs/go-ipld-format"
>
>  #      github.com/ipfs/go-ipld-legacy v0.1.0
> @@ -454,14 +453,14 @@ SRC_URI +=3D "git://github.com/ipfs/go-ipld-legacy;=
name=3Dgo-ipld-legacy;protocol=3Dht
>  SRCREV_go-log=3D"0e04229b160a92ebd2a924d9078e087161c8d53f"
>  SRC_URI +=3D "git://github.com/ipfs/go-log;name=3Dgo-log;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/ipfs/go-log"
>
> -#      github.com/ipfs/go-log/v2 v2.1.3
> -# [1] git ls-remote https://github.com/ipfs/go-log 7f9ba9d7836afbe447102=
89d1c3a7c111f093149
> -SRCREV_v212=3D"7f9ba9d7836afbe44710289d1c3a7c111f093149"
> -SRC_URI +=3D "git://github.com/ipfs/go-log;name=3Dv212;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/ipfs/go-log/v2"
> +#      github.com/ipfs/go-log/v2 v2.3.0
> +# [1] git ls-remote https://github.com/ipfs/go-log v2.3.0
> +SRCREV_go-log2 =3D "2c2975b5095a771b0d8066a458b944ac71591bc7"
> +SRC_URI +=3D "git://github.com/ipfs/go-log;name=3Dgo-log2;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/ipfs/go-log/v2"
>
> -#      github.com/ipfs/go-merkledag v0.4.0
> -# [1] git ls-remote https://github.com/ipfs/go-merkledag 8794146d52c211b=
8af0456e734a248649e636be0
> -SRCREV_go-merkledag=3D"8794146d52c211b8af0456e734a248649e636be0"
> +#      github.com/ipfs/go-merkledag v0.6.0
> +# [1] git ls-remote https://github.com/ipfs/go-merkledag v0.6.0
> +SRCREV_go-merkledag =3D "c076715ad64cccb1976de3686b0d6304ec3f2839"
>  SRC_URI +=3D "git://github.com/ipfs/go-merkledag;name=3Dgo-merkledag;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/ipfs/go-merkledag"
>
>  #      github.com/ipfs/go-metrics-interface v0.0.1
> @@ -499,9 +498,9 @@ SRC_URI +=3D "git://github.com/ipld/go-ipld-prime;nam=
e=3Dgo-ipld-prime;protocol=3Dhttp
>  SRCREV_goprocess=3D"23d20c20149e1f362afda26f4500cb9d6393f0ad"
>  SRC_URI +=3D "git://github.com/jbenet/goprocess;name=3Dgoprocess;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/jbenet/goprocess"
>
> -#      github.com/klauspost/compress v1.14.2
> -# [1] git ls-remote https://github.com/klauspost/compress 7f260be218b66d=
c1c5b2d6be2d5c0925aa9a4a0d
> -SRCREV_compress=3D"7f260be218b66dc1c5b2d6be2d5c0925aa9a4a0d"
> +#      github.com/klauspost/compress v1.15.1
> +# [1] git ls-remote https://github.com/klauspost/compress v1.15.1
> +SRCREV_compress =3D "7c7079ec1ed2c07fd15e6f3f369dbae5288051d5"
>  SRC_URI +=3D "git://github.com/klauspost/compress;name=3Dcompress;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/klauspost/compress"
>
>  #      github.com/klauspost/cpuid/v2 v2.0.6
> @@ -539,9 +538,9 @@ SRC_URI +=3D "git://github.com/mattn/go-shellwords;na=
me=3Dgo-shellwords;protocol=3Dhtt
>  SRCREV_golang_protobuf_extensions=3D"c182affec369e30f25d3eb8cd8a478dee58=
5ae7d"
>  SRC_URI +=3D "git://github.com/matttproud/golang_protobuf_extensions;nam=
e=3Dgolang_protobuf_extensions;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$=
{WORKDIR}/${BP}/src/import/vendor.fetch/github.com/matttproud/golang_protob=
uf_extensions"
>
> -#      github.com/miekg/pkcs11 v1.0.3
> -# [1] git ls-remote https://github.com/miekg/pkcs11 210dc1e16747c5ba98a0=
3bcbcf728c38086ea357
> -SRCREV_pkcs11=3D"210dc1e16747c5ba98a03bcbcf728c38086ea357"
> +#      github.com/miekg/pkcs11 v1.1.1
> +# [1] git ls-remote https://github.com/miekg/pkcs11 v1.1.1
> +SRCREV_pkcs11 =3D "f3481918a208bd212aa995a41f92d786eb418a7d"
>  SRC_URI +=3D "git://github.com/miekg/pkcs11;name=3Dpkcs11;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/miekg/pkcs11"
>
>  #      github.com/minio/blake2b-simd v0.0.0-20160723061019-3f5f724cb5b1
> @@ -634,9 +633,9 @@ SRC_URI +=3D "git://github.com/pkg/errors;name=3Derro=
rs;protocol=3Dhttps;nobranch=3D1;de
>  SRCREV_refmt=3D"30ac6d18308e584ca6a2e74ba81475559db94c5f"
>  SRC_URI +=3D "git://github.com/polydawn/refmt;name=3Drefmt;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/polydawn/refmt"
>
> -#      github.com/prometheus/client_golang v1.12.0
> -# [1] git ls-remote https://github.com/prometheus/client_golang 01087964=
d02726ef7438fdb19c2672e6e5d0b48a
> -SRCREV_client_golang=3D"01087964d02726ef7438fdb19c2672e6e5d0b48a"
> +#      github.com/prometheus/client_golang v1.12.1
> +# [1] git ls-remote https://github.com/prometheus/client_golang v1.12.1
> +SRCREV_client_golang =3D "2e1c4818ccfdcf953ce399cadad615ff2bed968c"
>  SRC_URI +=3D "git://github.com/prometheus/client_golang;name=3Dclient_go=
lang;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import=
/vendor.fetch/github.com/prometheus/client_golang"
>
>  #      github.com/prometheus/client_model v0.2.0
> @@ -754,9 +753,9 @@ SRC_URI +=3D "git://go.googlesource.com/xerrors;name=
=3Dxerrors;protocol=3Dhttps;nobran
>  SRCREV_genproto=3D"9970aeb2e350469c6bdc3e220a3ddecf38a85f61"
>  SRC_URI +=3D "git://github.com/googleapis/go-genproto;name=3Dgenproto;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/google.golang.org/genproto"
>
> -#      google.golang.org/grpc v1.44.0
> -# [1] git ls-remote https://github.com/grpc/grpc-go b4c5e24c7373b22c6c38=
d68379c39ecdc616a968
> -SRCREV_grpc=3D"b4c5e24c7373b22c6c38d68379c39ecdc616a968"
> +#      google.golang.org/grpc v1.45.0
> +# [1] git ls-remote https://github.com/grpc/grpc-go v1.45.0
> +SRCREV_grpc=3D"a82cc96f07c960e02623688e4067ae6b7895334a"
>  SRC_URI +=3D "git://github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.=
golang.org/grpc"
>
>  #      google.golang.org/protobuf v1.27.1
> @@ -781,8 +780,6 @@ SRC_URI +=3D "file://0001-Makefile-allow-external-spe=
cification-of-build-setti.pat
>              file://modules.txt \
>             "
>
> -SRC_URI[sha256sum] =3D "d7b05a9bff34dfb25abe7e5b1e54cf2607f953d91cb33fb2=
31a4775a1a4afa3d"
> -
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D3b83ef96387f14655f=
c854ddc3c6bd57"
>
> @@ -790,7 +787,7 @@ GO_IMPORT =3D "import"
>
>  # S =3D "${WORKDIR}/git"
>
> -PV =3D "v0.17.0"
> +PV =3D "v0.18.0"
>
>  NERDCTL_PKG =3D "github.com/containerd/nerdctl"
>
> @@ -824,7 +821,7 @@ do_compile() {
>
>         # this moves all the fetches into the proper vendor structure
>         # expected for build
> -       sites=3D"github.com/Microsoft/go-winio:github.com/Microsoft/go-wi=
nio github.com/compose-spec/compose-go:github.com/compose-spec/compose-go g=
ithub.com/containerd/cgroups:github.com/containerd/cgroups github.com/conta=
inerd/console:github.com/containerd/console github.com/containerd/container=
d:github.com/containerd/containerd github.com/containerd/continuity:github.=
com/containerd/continuity github.com/containerd/go-cni:github.com/container=
d/go-cni github.com/containerd/imgcrypt:github.com/containerd/imgcrypt gith=
ub.com/containerd/stargz-snapshotter:github.com/containerd/stargz-snapshott=
er github.com/containerd/stargz-snapshotter/estargz:github.com/containerd/s=
targz-snapshotter//estargz github.com/containerd/stargz-snapshotter/ipfs:gi=
thub.com/containerd/stargz-snapshotter//ipfs github.com/containerd/typeurl:=
github.com/containerd/typeurl github.com/containernetworking/cni:github.com=
/containernetworking/cni github.com/containernetworking/plugins:github.com/=
containernetworking/plugins github.com/cyphar/filepath-securejoin:github.co=
m/cyphar/filepath-securejoin github.com/docker/cli:github.com/docker/cli gi=
thub.com/docker/docker:github.com/docker/docker github.com/docker/go-connec=
tions:github.com/docker/go-connections github.com/docker/go-units:github.co=
m/docker/go-units github.com/fatih/color:github.com/fatih/color github.com/=
gogo/protobuf:github.com/gogo/protobuf github.com/hashicorp/go-multierror:g=
ithub.com/hashicorp/go-multierror github.com/ipfs/go-cid:github.com/ipfs/go=
-cid github.com/ipfs/go-ipfs-files:github.com/ipfs/go-ipfs-files github.com=
/ipfs/go-ipfs-http-client:github.com/ipfs/go-ipfs-http-client github.com/ip=
fs/interface-go-ipfs-core:github.com/ipfs/interface-go-ipfs-core github.com=
/jaytaylor/go-hostsfile:github.com/jaytaylor/go-hostsfile github.com/mattn/=
go-isatty:github.com/mattn/go-isatty github.com/moby/sys/mount:github.com/m=
oby/sys/mount//mount github.com/moby/sys/mountinfo:github.com/moby/sys/moun=
t//mountinfo github.com/moby/sys/signal:github.com/moby/sys/mount//signal g=
ithub.com/multiformats/go-multiaddr:github.com/multiformats/go-multiaddr gi=
thub.com/opencontainers/go-digest:github.com/opencontainers/go-digest githu=
b.com/opencontainers/image-spec:github.com/opencontainers/image-spec github=
.com/opencontainers/runtime-spec:github.com/opencontainers/runtime-spec git=
hub.com/pelletier/go-toml:github.com/pelletier/go-toml github.com/rootless-=
containers/bypass4netns:github.com/rootless-containers/bypass4netns github.=
com/rootless-containers/rootlesskit:github.com/rootless-containers/rootless=
kit github.com/sirupsen/logrus:github.com/sirupsen/logrus github.com/spf13/=
cobra:github.com/spf13/cobra github.com/spf13/pflag:github.com/spf13/pflag =
github.com/tidwall/gjson:github.com/tidwall/gjson github.com/vishvananda/ne=
tlink:github.com/vishvananda/netlink github.com/vishvananda/netns:github.co=
m/vishvananda/netns golang.org/x/crypto:go.googlesource.com/crypto golang.o=
rg/x/net:go.googlesource.com/net golang.org/x/sync:go.googlesource.com/sync=
 golang.org/x/sys:go.googlesource.com/sys golang.org/x/term:go.googlesource=
.com/term gopkg.in/yaml.v2:gopkg.in/yaml.v2 gotest.tools/v3:github.com/gote=
styourself/gotest.tools/v3 github.com/Azure/go-ansiterm:github.com/Azure/go=
-ansiterm github.com/Microsoft/hcsshim:github.com/Microsoft/hcsshim github.=
com/beorn7/perks:github.com/beorn7/perks github.com/btcsuite/btcd:github.co=
m/btcsuite/btcd github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2 g=
ithub.com/cilium/ebpf:github.com/cilium/ebpf github.com/containerd/fifo:git=
hub.com/containerd/fifo github.com/containerd/ttrpc:github.com/containerd/t=
trpc github.com/containers/ocicrypt:github.com/containers/ocicrypt github.c=
om/coreos/go-systemd/v22:github.com/coreos/go-systemd/v22 github.com/cpuguy=
83/go-md2man/v2:github.com/cpuguy83/go-md2man/v2 github.com/crackcomm/go-gi=
tignore:github.com/crackcomm/go-gitignore github.com/distribution/distribut=
ion/v3:github.com/distribution/distribution/v3 github.com/docker/distributi=
on:github.com/docker/distribution github.com/docker/docker-credential-helpe=
rs:github.com/docker/docker-credential-helpers github.com/docker/go-events:=
github.com/docker/go-events github.com/docker/go-metrics:github.com/docker/=
go-metrics github.com/godbus/dbus/v5:github.com/godbus/dbus/v5 github.com/g=
ogo/googleapis:github.com/gogo/googleapis github.com/golang/groupcache:gith=
ub.com/golang/groupcache github.com/golang/protobuf:github.com/golang/proto=
buf github.com/google/go-cmp:github.com/google/go-cmp github.com/google/uui=
d:github.com/google/uuid github.com/gorilla/mux:github.com/gorilla/mux gith=
ub.com/hashicorp/errwrap:github.com/hashicorp/errwrap github.com/hashicorp/=
golang-lru:github.com/hashicorp/golang-lru github.com/imdario/mergo:github.=
com/imdario/mergo github.com/inconshreveable/mousetrap:github.com/inconshre=
veable/mousetrap github.com/ipfs/bbloom:github.com/ipfs/bbloom github.com/i=
pfs/go-block-format:github.com/ipfs/go-block-format github.com/ipfs/go-bloc=
kservice:github.com/ipfs/go-blockservice github.com/ipfs/go-datastore:githu=
b.com/ipfs/go-datastore github.com/ipfs/go-ipfs-blockstore:github.com/ipfs/=
go-ipfs-blockstore github.com/ipfs/go-ipfs-cmds:github.com/ipfs/go-ipfs-cmd=
s github.com/ipfs/go-ipfs-ds-help:github.com/ipfs/go-ipfs-ds-help github.co=
m/ipfs/go-ipfs-exchange-interface:github.com/ipfs/go-ipfs-exchange-interfac=
e github.com/ipfs/go-ipfs-util:github.com/ipfs/go-ipfs-util github.com/ipfs=
/go-ipld-cbor:github.com/ipfs/go-ipld-cbor github.com/ipfs/go-ipld-format:g=
ithub.com/ipfs/go-ipld-format github.com/ipfs/go-ipld-legacy:github.com/ipf=
s/go-ipld-legacy github.com/ipfs/go-log:github.com/ipfs/go-log github.com/i=
pfs/go-log/v2:github.com/ipfs/go-log/v2 github.com/ipfs/go-merkledag:github=
.com/ipfs/go-merkledag github.com/ipfs/go-metrics-interface:github.com/ipfs=
/go-metrics-interface github.com/ipfs/go-path:github.com/ipfs/go-path githu=
b.com/ipfs/go-unixfs:github.com/ipfs/go-unixfs github.com/ipfs/go-verifcid:=
github.com/ipfs/go-verifcid github.com/ipld/go-codec-dagpb:github.com/ipld/=
go-codec-dagpb github.com/ipld/go-ipld-prime:github.com/ipld/go-ipld-prime =
github.com/jbenet/goprocess:github.com/jbenet/goprocess github.com/klauspos=
t/compress:github.com/klauspost/compress github.com/klauspost/cpuid/v2:gith=
ub.com/klauspost/cpuid/v2 github.com/libp2p/go-buffer-pool:github.com/libp2=
p/go-buffer-pool github.com/libp2p/go-libp2p-core:github.com/libp2p/go-libp=
2p-core github.com/libp2p/go-openssl:github.com/libp2p/go-openssl github.co=
m/mattn/go-colorable:github.com/mattn/go-colorable github.com/mattn/go-shel=
lwords:github.com/mattn/go-shellwords github.com/matttproud/golang_protobuf=
_extensions:github.com/matttproud/golang_protobuf_extensions github.com/mie=
kg/pkcs11:github.com/miekg/pkcs11 github.com/minio/blake2b-simd:github.com/=
minio/blake2b-simd github.com/minio/sha256-simd:github.com/minio/sha256-sim=
d github.com/mitchellh/go-homedir:github.com/mitchellh/go-homedir github.co=
m/mitchellh/mapstructure:github.com/mitchellh/mapstructure github.com/moby/=
locker:github.com/moby/locker github.com/moby/term:github.com/moby/term git=
hub.com/morikuni/aec:github.com/morikuni/aec github.com/mr-tron/base58:gith=
ub.com/mr-tron/base58 github.com/multiformats/go-base32:github.com/multifor=
mats/go-base32 github.com/multiformats/go-base36:github.com/multiformats/go=
-base36 github.com/multiformats/go-multibase:github.com/multiformats/go-mul=
tibase github.com/multiformats/go-multihash:github.com/multiformats/go-mult=
ihash github.com/multiformats/go-varint:github.com/multiformats/go-varint g=
ithub.com/opencontainers/runc:github.com/opencontainers/runc github.com/ope=
ncontainers/selinux:github.com/opencontainers/selinux github.com/opentracin=
g/opentracing-go:github.com/opentracing/opentracing-go github.com/pkg/error=
s:github.com/pkg/errors github.com/polydawn/refmt:github.com/polydawn/refmt=
 github.com/prometheus/client_golang:github.com/prometheus/client_golang gi=
thub.com/prometheus/client_model:github.com/prometheus/client_model github.=
com/prometheus/common:github.com/prometheus/common github.com/prometheus/pr=
ocfs:github.com/prometheus/procfs github.com/rs/cors:github.com/rs/cors git=
hub.com/russross/blackfriday/v2:github.com/russross/blackfriday/v2 github.c=
om/spacemonkeygo/spacelog:github.com/spacemonkeygo/spacelog github.com/stef=
anberger/go-pkcs11uri:github.com/stefanberger/go-pkcs11uri github.com/tidwa=
ll/match:github.com/tidwall/match github.com/tidwall/pretty:github.com/tidw=
all/pretty github.com/urfave/cli:github.com/urfave/cli github.com/vbatts/ta=
r-split:github.com/vbatts/tar-split github.com/whyrusleeping/cbor-gen:githu=
b.com/whyrusleeping/cbor-gen github.com/xeipuuv/gojsonpointer:github.com/xe=
ipuuv/gojsonpointer github.com/xeipuuv/gojsonreference:github.com/xeipuuv/g=
ojsonreference github.com/xeipuuv/gojsonschema:github.com/xeipuuv/gojsonsch=
ema go.mozilla.org/pkcs7:go.mozilla.org/pkcs7 go.opencensus.io:go.opencensu=
s.io go.uber.org/atomic:go.uber.org/atomic go.uber.org/multierr:go.uber.org=
/multierr go.uber.org/zap:go.uber.org/zap golang.org/x/text:go.googlesource=
.com/text golang.org/x/xerrors:go.googlesource.com/xerrors google.golang.or=
g/genproto:google.golang.org/genproto google.golang.org/grpc:google.golang.=
org/grpc google.golang.org/protobuf:google.golang.org/protobuf gopkg.in/squ=
are/go-jose.v2:gopkg.in/square/go-jose.v2 github.com/hashicorp/golang-lru :=
github.com/hashicorp/golang-lru "
> +       sites=3D"github.com/Masterminds/semver/v3:github.com/Masterminds/=
semver/v3 github.com/Microsoft/go-winio:github.com/Microsoft/go-winio githu=
b.com/compose-spec/compose-go:github.com/compose-spec/compose-go github.com=
/containerd/cgroups:github.com/containerd/cgroups github.com/containerd/con=
sole:github.com/containerd/console github.com/containerd/containerd:github.=
com/containerd/containerd github.com/containerd/continuity:github.com/conta=
inerd/continuity github.com/containerd/go-cni:github.com/containerd/go-cni =
github.com/containerd/imgcrypt:github.com/containerd/imgcrypt github.com/co=
ntainerd/stargz-snapshotter:github.com/containerd/stargz-snapshotter github=
.com/containerd/stargz-snapshotter/estargz:github.com/containerd/stargz-sna=
pshotter//estargz github.com/containerd/stargz-snapshotter/ipfs:github.com/=
containerd/stargz-snapshotter//ipfs github.com/containerd/typeurl:github.co=
m/containerd/typeurl github.com/containernetworking/cni:github.com/containe=
rnetworking/cni github.com/containernetworking/plugins:github.com/container=
networking/plugins github.com/cyphar/filepath-securejoin:github.com/cyphar/=
filepath-securejoin github.com/docker/cli:github.com/docker/cli github.com/=
docker/docker:github.com/docker/docker github.com/docker/go-connections:git=
hub.com/docker/go-connections github.com/docker/go-units:github.com/docker/=
go-units github.com/fatih/color:github.com/fatih/color github.com/gogo/prot=
obuf:github.com/gogo/protobuf github.com/hashicorp/go-multierror:github.com=
/hashicorp/go-multierror github.com/ipfs/go-cid:github.com/ipfs/go-cid gith=
ub.com/ipfs/go-ipfs-files:github.com/ipfs/go-ipfs-files github.com/ipfs/go-=
ipfs-http-client:github.com/ipfs/go-ipfs-http-client github.com/ipfs/interf=
ace-go-ipfs-core:github.com/ipfs/interface-go-ipfs-core github.com/mattn/go=
-isatty:github.com/mattn/go-isatty github.com/moby/sys/mount:github.com/mob=
y/sys/mount//mount github.com/moby/sys/mountinfo:github.com/moby/sys/mount/=
/mountinfo github.com/moby/sys/signal:github.com/moby/sys/mount//signal git=
hub.com/multiformats/go-multiaddr:github.com/multiformats/go-multiaddr gith=
ub.com/opencontainers/go-digest:github.com/opencontainers/go-digest github.=
com/opencontainers/image-spec:github.com/opencontainers/image-spec github.c=
om/opencontainers/runtime-spec:github.com/opencontainers/runtime-spec githu=
b.com/pelletier/go-toml:github.com/pelletier/go-toml github.com/rootless-co=
ntainers/bypass4netns:github.com/rootless-containers/bypass4netns github.co=
m/rootless-containers/rootlesskit:github.com/rootless-containers/rootlesski=
t github.com/sirupsen/logrus:github.com/sirupsen/logrus github.com/spf13/co=
bra:github.com/spf13/cobra github.com/spf13/pflag:github.com/spf13/pflag gi=
thub.com/tidwall/gjson:github.com/tidwall/gjson github.com/vishvananda/netl=
ink:github.com/vishvananda/netlink github.com/vishvananda/netns:github.com/=
vishvananda/netns golang.org/x/crypto:go.googlesource.com/crypto golang.org=
/x/net:go.googlesource.com/net golang.org/x/sync:go.googlesource.com/sync g=
olang.org/x/sys:go.googlesource.com/sys golang.org/x/term:go.googlesource.c=
om/term gopkg.in/yaml.v2:gopkg.in/yaml.v2 gotest.tools/v3:github.com/gotest=
yourself/gotest.tools/v3 github.com/Azure/go-ansiterm:github.com/Azure/go-a=
nsiterm github.com/Microsoft/hcsshim:github.com/Microsoft/hcsshim github.co=
m/beorn7/perks:github.com/beorn7/perks github.com/btcsuite/btcd:github.com/=
btcsuite/btcd github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2 git=
hub.com/cilium/ebpf:github.com/cilium/ebpf github.com/containerd/fifo:githu=
b.com/containerd/fifo github.com/containerd/ttrpc:github.com/containerd/ttr=
pc github.com/containers/ocicrypt:github.com/containers/ocicrypt github.com=
/coreos/go-systemd/v22:github.com/coreos/go-systemd/v22 github.com/cpuguy83=
/go-md2man/v2:github.com/cpuguy83/go-md2man/v2 github.com/crackcomm/go-giti=
gnore:github.com/crackcomm/go-gitignore github.com/distribution/distributio=
n/v3:github.com/distribution/distribution/v3 github.com/docker/distribution=
:github.com/docker/distribution github.com/docker/docker-credential-helpers=
:github.com/docker/docker-credential-helpers github.com/docker/go-events:gi=
thub.com/docker/go-events github.com/docker/go-metrics:github.com/docker/go=
-metrics github.com/godbus/dbus/v5:github.com/godbus/dbus/v5 github.com/gog=
o/googleapis:github.com/gogo/googleapis github.com/golang/groupcache:github=
.com/golang/groupcache github.com/golang/protobuf:github.com/golang/protobu=
f github.com/google/go-cmp:github.com/google/go-cmp github.com/google/uuid:=
github.com/google/uuid github.com/gorilla/mux:github.com/gorilla/mux github=
.com/hashicorp/errwrap:github.com/hashicorp/errwrap github.com/hashicorp/go=
lang-lru:github.com/hashicorp/golang-lru github.com/imdario/mergo:github.co=
m/imdario/mergo github.com/inconshreveable/mousetrap:github.com/inconshreve=
able/mousetrap github.com/ipfs/bbloom:github.com/ipfs/bbloom github.com/ipf=
s/go-block-format:github.com/ipfs/go-block-format github.com/ipfs/go-blocks=
ervice:github.com/ipfs/go-blockservice github.com/ipfs/go-datastore:github.=
com/ipfs/go-datastore github.com/ipfs/go-ipfs-blockstore:github.com/ipfs/go=
-ipfs-blockstore github.com/ipfs/go-ipfs-cmds:github.com/ipfs/go-ipfs-cmds =
github.com/ipfs/go-ipfs-ds-help:github.com/ipfs/go-ipfs-ds-help github.com/=
ipfs/go-ipfs-exchange-interface:github.com/ipfs/go-ipfs-exchange-interface =
github.com/ipfs/go-ipfs-util:github.com/ipfs/go-ipfs-util github.com/ipfs/g=
o-ipld-cbor:github.com/ipfs/go-ipld-cbor github.com/ipfs/go-ipld-format:git=
hub.com/ipfs/go-ipld-format github.com/ipfs/go-ipld-legacy:github.com/ipfs/=
go-ipld-legacy github.com/ipfs/go-log:github.com/ipfs/go-log github.com/ipf=
s/go-log/v2:github.com/ipfs/go-log/v2 github.com/ipfs/go-merkledag:github.c=
om/ipfs/go-merkledag github.com/ipfs/go-metrics-interface:github.com/ipfs/g=
o-metrics-interface github.com/ipfs/go-path:github.com/ipfs/go-path github.=
com/ipfs/go-unixfs:github.com/ipfs/go-unixfs github.com/ipfs/go-verifcid:gi=
thub.com/ipfs/go-verifcid github.com/ipld/go-codec-dagpb:github.com/ipld/go=
-codec-dagpb github.com/ipld/go-ipld-prime:github.com/ipld/go-ipld-prime gi=
thub.com/jbenet/goprocess:github.com/jbenet/goprocess github.com/klauspost/=
compress:github.com/klauspost/compress github.com/klauspost/cpuid/v2:github=
.com/klauspost/cpuid/v2 github.com/libp2p/go-buffer-pool:github.com/libp2p/=
go-buffer-pool github.com/libp2p/go-libp2p-core:github.com/libp2p/go-libp2p=
-core github.com/libp2p/go-openssl:github.com/libp2p/go-openssl github.com/=
mattn/go-colorable:github.com/mattn/go-colorable github.com/mattn/go-shellw=
ords:github.com/mattn/go-shellwords github.com/matttproud/golang_protobuf_e=
xtensions:github.com/matttproud/golang_protobuf_extensions github.com/miekg=
/pkcs11:github.com/miekg/pkcs11 github.com/minio/blake2b-simd:github.com/mi=
nio/blake2b-simd github.com/minio/sha256-simd:github.com/minio/sha256-simd =
github.com/mitchellh/go-homedir:github.com/mitchellh/go-homedir github.com/=
mitchellh/mapstructure:github.com/mitchellh/mapstructure github.com/moby/lo=
cker:github.com/moby/locker github.com/moby/term:github.com/moby/term githu=
b.com/morikuni/aec:github.com/morikuni/aec github.com/mr-tron/base58:github=
.com/mr-tron/base58 github.com/multiformats/go-base32:github.com/multiforma=
ts/go-base32 github.com/multiformats/go-base36:github.com/multiformats/go-b=
ase36 github.com/multiformats/go-multibase:github.com/multiformats/go-multi=
base github.com/multiformats/go-multihash:github.com/multiformats/go-multih=
ash github.com/multiformats/go-varint:github.com/multiformats/go-varint git=
hub.com/opencontainers/runc:github.com/opencontainers/runc github.com/openc=
ontainers/selinux:github.com/opencontainers/selinux github.com/opentracing/=
opentracing-go:github.com/opentracing/opentracing-go github.com/pkg/errors:=
github.com/pkg/errors github.com/polydawn/refmt:github.com/polydawn/refmt g=
ithub.com/prometheus/client_golang:github.com/prometheus/client_golang gith=
ub.com/prometheus/client_model:github.com/prometheus/client_model github.co=
m/prometheus/common:github.com/prometheus/common github.com/prometheus/proc=
fs:github.com/prometheus/procfs github.com/rs/cors:github.com/rs/cors githu=
b.com/russross/blackfriday/v2:github.com/russross/blackfriday/v2 github.com=
/spacemonkeygo/spacelog:github.com/spacemonkeygo/spacelog github.com/stefan=
berger/go-pkcs11uri:github.com/stefanberger/go-pkcs11uri github.com/tidwall=
/match:github.com/tidwall/match github.com/tidwall/pretty:github.com/tidwal=
l/pretty github.com/urfave/cli:github.com/urfave/cli github.com/vbatts/tar-=
split:github.com/vbatts/tar-split github.com/whyrusleeping/cbor-gen:github.=
com/whyrusleeping/cbor-gen github.com/xeipuuv/gojsonpointer:github.com/xeip=
uuv/gojsonpointer github.com/xeipuuv/gojsonreference:github.com/xeipuuv/goj=
sonreference github.com/xeipuuv/gojsonschema:github.com/xeipuuv/gojsonschem=
a go.mozilla.org/pkcs7:go.mozilla.org/pkcs7 go.opencensus.io:go.opencensus.=
io go.uber.org/atomic:go.uber.org/atomic go.uber.org/multierr:go.uber.org/m=
ultierr go.uber.org/zap:go.uber.org/zap golang.org/x/text:go.googlesource.c=
om/text golang.org/x/xerrors:go.googlesource.com/xerrors google.golang.org/=
genproto:google.golang.org/genproto google.golang.org/grpc:google.golang.or=
g/grpc google.golang.org/protobuf:google.golang.org/protobuf gopkg.in/squar=
e/go-jose.v2:gopkg.in/square/go-jose.v2 github.com/hashicorp/golang-lru :gi=
thub.com/hashicorp/golang-lru "
>         for s in $sites; do
>              site_dest=3D$(echo $s | cut -d: -f1)
>              site_source=3D$(echo $s | cut -d: -f2)
> --
> 2.33.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7182): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7182
> Mute This Topic: https://lists.yoctoproject.org/mt/90537000/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

