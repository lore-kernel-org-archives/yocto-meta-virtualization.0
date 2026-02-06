Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F76EE209C
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 12:49:32 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10768.1770382170474575519
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Feb 2026 04:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hSzLpdo5;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-352ccc61658so1096218a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Feb 2026 04:49:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770382170; cv=none;
        d=google.com; s=arc-20240605;
        b=PRN1aQznp1qDCeMng/07kC6dvCEt8s67MNqU7UHHvrOGi5nb8TU8IMDEkeQOG1VyCS
         vZJTdlAJbVCaJGbdRkTbKd2cWTI5w01bfdPBc4eX/5E9OJLPgdtrTdei2kqsrsA2jGGJ
         iol3CGpUkAboVzQdvW7tsDcsS9vEXlICEX7I8w6sOOtEG9V+VMbRdG5gTneMzEJ9YTF+
         rFfBSZnnb9VgghbhILd71vZBzGIMhxXh7W+nl20EYnGa1/rXBP9UBVVqIeE7wpp7Ukin
         pe/wdIk19m4AtnHA0kAPZGgvi3/7RjadakHaolcR6CkSbM+teCsAztDjTu3MLk1/3isU
         gTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=feqGYdHl24M03fK9057IIKwWgXSKDKbfeRs2oszbeHw=;
        fh=TA/DqR0yLg6S9X3bO0Ym1T8UojDnIj+cFYRmd99upJQ=;
        b=JF6qqDqJOYXa/h5aAcrhQtKRK249j//QWzYpJXQ8zOKbyBNjotJGdqezZtoH9+vcn3
         lshTJ283z1mL/D3+Fybwb9s5bJ4aqMoTAJNfpk8jIjNIxjpJIopqzyp3m3bAVVumb40V
         Qgip4t4G0jyzx/MIkpB2gYgYklCkVeVT6OlL00WZSfs0D096CSAfcGTl38NqPpoK2nUx
         QfOgfPaNehZIqRoVnuxzgEaiQNbbqPkA7XDTMj2s26A8dBWDlrP/PjN7g4W4qL1a9aqC
         htbVxEgetUNIwfJAHjEReV9l1LlQ9Dw0XpvTxK/bv6I9lh8rQaqquMLEtyJby3xU/1ZN
         EnUQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770382170; x=1770986970; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=feqGYdHl24M03fK9057IIKwWgXSKDKbfeRs2oszbeHw=;
        b=hSzLpdo5/qt1pf5PANVwMMs5Rk0gxYzL/KuV69QbSVURKKyI5bRKkuOL15ShLysNHE
         3kvpbj1H3R9qyVCjOSuuGp3RphiHnYtt9DsRE1q8v5QFQvYP2LIKaKjHQ1K3LEo9Xj28
         D4WTtpJ8QOf5RHBC6aWtve6FZnl8iv/GENLfM17sxN9Yx8fej3XMfsCUzDVs4MCzqrRH
         Dk7tM/Nbc1aUn2jxzsBhXMPKor6CIccEG8yqoKVgLztbsgSkHp8fkNbTSbOCEu1KcL9w
         +9rNgS7mZ4CH4L9a6eSG3kzQjeuEaVb/OUzl0YCcPGr6E9IB3bN3NzTb8ii6MJtGjQUZ
         GtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770382170; x=1770986970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feqGYdHl24M03fK9057IIKwWgXSKDKbfeRs2oszbeHw=;
        b=PJDPf4Og6TDTk+GthVvlUXqPEZG+IdKo/pfA5ZX5HDlXdRFyK58UFHwtJmMM6BlraC
         XMbT6W/v0ChzeVrTiRO4+19SAjxrqHJ5rTXREBuCZTrVGUBod/+Zbt8zUH3culTCKEvW
         2geD6Qtcmy6Y56VD4EQbrh0g67o2Tq8taEKmryJFzUjXCW9tmP5sAQBI6nL5HDD1Xf6Q
         /wGaJVZ60kwzSX3RixDwctFJXHZ/uWmMpVKvD3XPAFmopAQFdpJ9GsF1bXOcPQ8uFOuH
         2xq18+TfSeKSYXgqwNQgUSQjJcHtd+AwQQ/keGfEWqFilsBgL/nNIPO5/VDBv29xeB4w
         HPDg==
X-Gm-Message-State: AOJu0YyHdLaS9GGZg629FiBUVb4ugjBzW6QTSHOPDwzqY3pp3Tl8hdBh
	YpAI4iBA2GdnWHzLYgp9p9jZNAu2vNLwWUaVQpdjJcbEGT+RFewkqXQJxHiPig3ZEG+QloKMUdo
	VIwW80FN+XhsKF9TsmeGM2byiOtARBqc=
X-Gm-Gg: AZuq6aJyFnRAEDFslqIUnfHKKuAwOP8AJK4glgpN/846AvZBIoqDfvWkCkoqzqzRC+U
	VlmE/uG8kwJOdjb3DT3haB6PbI1pfor2kbQCOX/SrXK5B5LVSpfNuc/laSNQ9Zq2hsLs+T7JP6L
	htMfuiAKQagSInEqvFEkj7nVNKo+vc4yl5Nvv3p5bP4dkmipDrK3pgwF8umnbnN9ymckAfYLDEd
	37V5HBq87BA3g+3AMfLUxIjepOLIRg4pM64PA9jAkRWmBz6x+ABm2gw4UPauaerBEwvucteKB7w
	Caxf/Kx6fdlOddohULzgwMTgDYBL
X-Received: by 2002:a17:90b:3c8b:b0:352:e27e:79c5 with SMTP id
 98e67ed59e1d1-354b3cfeca9mr2030139a91.31.1770382169596; Fri, 06 Feb 2026
 04:49:29 -0800 (PST)
MIME-Version: 1.0
References: <20260206091701.3904742-1-changqing.li@windriver.com>
In-Reply-To: <20260206091701.3904742-1-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Feb 2026 07:49:18 -0500
X-Gm-Features: AZwV_QgEHk3lvYnreHHtUdqgC3161kKZR26BR19XASUQk7JwuQCDY8JWNYuXNPE
Message-ID: <CADkTA4MCbciKHGNog=fEdGVQ0JY9HMgYxsVTEeLr1z6=DLQ4=Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] improve reproducibility
To: changqing.li@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000055e4e7064a273813"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Feb 2026 12:49:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9563

--00000000000055e4e7064a273813
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 4:17=E2=80=AFAM Changqing Li via lists.yoctoproject.=
org <
changqing.li=3Dwindriver.com@lists.yoctoproject.org> wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> * Refer [1], cgo will embeded cgo_ldflags in the intermediary output,
>   which make content ID will be incfluenced by cgo_ldflags.
>   '--sysroot=3Dxxx' includes build path, which will make the binary not
>   reproducible, these recipes can build successfully without --sysroot, s=
o
>   remove it
>
> * CGO_ENABLED/CGO_CFLAGS/CGO_LDFLAGS already exported in go.bbclass with
>   the same value, remove the not needed settings
>

refer to all my previous email on the subject.

I will continue to set these in the classes themselves.

Bruce



>
> [1]
> https://git.openembedded.org/openembedded-core/commit/?id=3D1797741aad02b=
8bf429fac4b81e30cdda64b5448
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-containers/containerd/containerd_git.bb           | 3 ---
>  recipes-containers/cri-tools/cri-tools_git.bb             | 5 -----
>  recipes-containers/docker-compose/docker-compose_git.bb   | 6 +-----
>  .../docker-distribution/docker-distribution_git.bb        | 3 ---
>  recipes-containers/docker/docker.inc                      | 4 ----
>  recipes-containers/kubernetes/kubernetes_git.bb           | 8 +++++---
>  recipes-containers/nerdctl/nerdctl_git.bb                 | 6 ------
>  recipes-containers/oci-image-tools/oci-image-tools_git.bb | 3 ---
>  .../oci-runtime-tools/oci-runtime-tools_git.bb            | 3 ---
>  recipes-containers/podman/podman_git.bb                   | 8 --------
>  recipes-containers/runc/runc.inc                          | 3 ---
>  recipes-containers/skopeo/skopeo_git.bb                   | 3 ---
>  recipes-containers/umoci/umoci_git.bb                     | 3 ---
>  13 files changed, 6 insertions(+), 52 deletions(-)
>
> diff --git a/recipes-containers/containerd/containerd_git.bb
> b/recipes-containers/containerd/containerd_git.bb
> index 081cf354..3d66e06e 100644
> --- a/recipes-containers/containerd/containerd_git.bb
> +++ b/recipes-containers/containerd/containerd_git.bb
> @@ -47,9 +47,6 @@ do_compile() {
>
>      # Pass the needed cflags/ldflags so that cgo
>      # can find the needed headers files and libraries
> -    export CGO_ENABLED=3D"1"
> -    export CGO_CFLAGS=3D"${CFLAGS} --sysroot=3D${STAGING_DIR_TARGET}"
> -    export CGO_LDFLAGS=3D"${LDFLAGS} --sysroot=3D${STAGING_DIR_TARGET}"
>      export BUILDTAGS=3D"no_btrfs static_build netgo"
>      export CFLAGS=3D"${CFLAGS}"
>      export LDFLAGS=3D"${LDFLAGS}"
> diff --git a/recipes-containers/cri-tools/cri-tools_git.bb
> b/recipes-containers/cri-tools/cri-tools_git.bb
> index dad675e8..98c43b6b 100644
> --- a/recipes-containers/cri-tools/cri-tools_git.bb
> +++ b/recipes-containers/cri-tools/cri-tools_git.bb
> @@ -46,12 +46,7 @@ do_compile() {
>         export
> GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TA=
RGET}/${prefix}/local/go"
>         cd ${S}/src/import
>
> -       # Build the target binaries
> -       export GOARCH=3D"${TARGET_GOARCH}"
>         # Pass the needed cflags/ldflags so that cgo can find the needed
> headers files and libraries
> -       export CGO_ENABLED=3D"1"
> -       export CGO_CFLAGS=3D"${CFLAGS} --sysroot=3D${STAGING_DIR_TARGET}"
> -       export CGO_LDFLAGS=3D"${LDFLAGS} --sysroot=3D${STAGING_DIR_TARGET=
}"
>         export CFLAGS=3D""
>         export LDFLAGS=3D""
>         export CC=3D"${CC}"
> diff --git a/recipes-containers/docker-compose/docker-compose_git.bb
> b/recipes-containers/docker-compose/docker-compose_git.bb
> index ccb36a16..de9427ae 100644
> --- a/recipes-containers/docker-compose/docker-compose_git.bb
> +++ b/recipes-containers/docker-compose/docker-compose_git.bb
> @@ -53,13 +53,9 @@ do_compile() {
>
>         # GOMODCACHE, GOPROXY, GOSUMDB, GOTOOLCHAIN are set by
> go-mod-vcs.bbclass
>         export
> GOPATH=3D"${S}/src/import/.gopath:${STAGING_DIR_TARGET}/${prefix}/local/g=
o"
> -       export CGO_ENABLED=3D"1"
>
>         # Pass the needed cflags/ldflags so that cgo
>         # can find the needed headers files and libraries
> -       export GOARCH=3D${TARGET_GOARCH}
> -       export CGO_CFLAGS=3D"${CFLAGS} --sysroot=3D${STAGING_DIR_TARGET}"
> -       export CGO_LDFLAGS=3D"${LDFLAGS} --sysroot=3D${STAGING_DIR_TARGET=
}"
>
>         GO_LDFLAGS=3D"-s -w -X internal.Version=3D${PV} -X
> ${COMPOSE_PKG}/internal.Version=3D${PV}"
>         GO_BUILDTAGS=3D""
> @@ -85,4 +81,4 @@ INSANE_SKIP:${PN} +=3D "ldflags already-stripped"
>
>  # the AWS dependency is 8GB, try and control the
>  # size of the clones
> -BB_GIT_SHALLOW =3D "1"
> \ No newline at end of file
> +BB_GIT_SHALLOW =3D "1"
> diff --git a/recipes-containers/docker-distribution/
> docker-distribution_git.bb b/recipes-containers/docker-distribution/
> docker-distribution_git.bb
> index 5e37fe74..63001331 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -28,12 +28,9 @@ do_compile() {
>         export GOROOT=3D"${STAGING_LIBDIR}/go"
>         # Pass the needed cflags/ldflags so that cgo
>         # can find the needed headers files and libraries
> -       export CGO_ENABLED=3D"1"
>         export CFLAGS=3D""
>         export LDFLAGS=3D""
> -       export CGO_CFLAGS=3D"${TARGET_CFLAGS}"
>         export GO_GCFLAGS=3D""
> -       export CGO_LDFLAGS=3D"${TARGET_LDFLAGS}"
>         export GO111MODULE=3Doff
>         export GO_BUILD_FLAGS=3D"-trimpath"
>
> diff --git a/recipes-containers/docker/docker.inc
> b/recipes-containers/docker/docker.inc
> index 99535a77..b0f52d77 100644
> --- a/recipes-containers/docker/docker.inc
> +++ b/recipes-containers/docker/docker.inc
> @@ -80,10 +80,6 @@ do_compile() {
>
>         # Pass the needed cflags/ldflags so that cgo
>         # can find the needed headers files and libraries
> -       export GOARCH=3D${TARGET_GOARCH}
> -       export CGO_ENABLED=3D"1"
> -       export CGO_CFLAGS=3D"${CFLAGS} --sysroot=3D${STAGING_DIR_TARGET}"
> -       export CGO_LDFLAGS=3D"${LDFLAGS} --sysroot=3D${STAGING_DIR_TARGET=
}"
>         export DOCKER_BUILDTAGS=3D'${BUILD_TAGS} ${PACKAGECONFIG_CONFARGS=
}'
>         export GO111MODULE=3Doff
>
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb
> b/recipes-containers/kubernetes/kubernetes_git.bb
> index f7b6940a..89c53930 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -54,6 +54,9 @@ inherit cni_networking
>
>  COMPATIBLE_HOST =3D '(x86_64.*|arm.*|aarch64.*)-linux'
>
> +CGO_LDFLAGS ?=3D "${LDFLAGS}"
> +CGO_LDFLAGS:remove =3D "${DEBUG_PREFIX_MAP}"
> +
>  do_compile() {
>         export
> GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TA=
RGET}/${prefix}/local/go:${UNPACKDIR}/git/"
>         cd ${S}
> @@ -70,7 +73,6 @@ do_compile() {
>         export CGO_LDFLAGS=3D"$(echo ${BUILD_LDFLAGS} | sed 's/-Wl,-O1//g=
' |
> sed 's/-Wl,--dynamic-linker.*?\( \|$\)//g')"
>         export CC=3D"${BUILD_CC}"
>         export LD=3D"${BUILD_LD}"
> -
>         # set the toolchain to local to avoid an attempted fetch of
>         # valiation by the build
>         # https://github.com/actions/setup-go/issues/420
> @@ -85,8 +87,8 @@ do_compile() {
>         export GOARCH=3D"${TARGET_GOARCH}"
>         # Pass the needed cflags/ldflags so that cgo can find the needed
> headers files and libraries
>         export CGO_ENABLED=3D"1"
> -       export CGO_CFLAGS=3D"${CFLAGS} --sysroot=3D${STAGING_DIR_TARGET}"
> -       export CGO_LDFLAGS=3D"${LDFLAGS} --sysroot=3D${STAGING_DIR_TARGET=
}"
> +       export CGO_CFLAGS=3D"${CFLAGS}"
> +       export CGO_LDFLAGS=3D"${CGO_LDFLAGS}"
>         export CFLAGS=3D""
>         export LDFLAGS=3D""
>         export CC=3D"${CC}"
> diff --git a/recipes-containers/nerdctl/nerdctl_git.bb
> b/recipes-containers/nerdctl/nerdctl_git.bb
> index 8f63b48c..eb873e23 100644
> --- a/recipes-containers/nerdctl/nerdctl_git.bb
> +++ b/recipes-containers/nerdctl/nerdctl_git.bb
> @@ -71,12 +71,6 @@ do_compile() {
>
>          cd ${S}/src/import
>
> -        # Pass the needed cflags/ldflags so that cgo
> -        # can find the needed headers files and libraries
> -        export GOARCH=3D${TARGET_GOARCH}
> -        export CGO_CFLAGS=3D"${CFLAGS} --sysroot=3D${STAGING_DIR_TARGET}=
"
> -        export CGO_LDFLAGS=3D"${LDFLAGS} --sysroot=3D${STAGING_DIR_TARGE=
T}"
> -
>          # -trimpath removes build paths from the binary (required for
> reproducible builds)
>          oe_runmake GO=3D${GO} BUILDTAGS=3D"${BUILDTAGS}"
> GO_BUILD_FLAGS=3D"-trimpath" binaries
>  }
> diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> index 36026214..6c355377 100644
> --- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> +++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
> @@ -29,11 +29,8 @@ do_compile() {
>
>         # Pass the needed cflags/ldflags so that cgo
>         # can find the needed headers files and libraries
> -       export CGO_ENABLED=3D"1"
>         export CFLAGS=3D""
>         export LDFLAGS=3D""
> -       export CGO_CFLAGS=3D"${TARGET_CFLAGS}"
> -       export CGO_LDFLAGS=3D"${TARGET_LDFLAGS}"
>         export GO111MODULE=3Doff
>
>         export GOBUILDFLAGS=3D"-trimpath"
> diff --git a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.b=
b
> b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
> index 81f51f9c..0ba69756 100644
> --- a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
> +++ b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
> @@ -25,11 +25,8 @@ do_compile() {
>
>         # Pass the needed cflags/ldflags so that cgo
>         # can find the needed headers files and libraries
> -       export CGO_ENABLED=3D"1"
>         export CFLAGS=3D""
>         export LDFLAGS=3D""
> -       export CGO_CFLAGS=3D"${TARGET_CFLAGS}"
> -       export CGO_LDFLAGS=3D"${TARGET_LDFLAGS}"
>         export GO111MODULE=3Doff
>         export GOFLAGS=3D"-mod=3Dvendor"
>
> diff --git a/recipes-containers/podman/podman_git.bb
> b/recipes-containers/podman/podman_git.bb
> index f09e01f8..5e5f1f9b 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -78,19 +78,11 @@ do_compile() {
>
>         ln -sf "../../../import/vendor/github.com/varlink/" ".gopath/src/
> github.com/varlink"
>
> -       export GOARCH=3D"${BUILD_GOARCH}"
>         export GOPATH=3D"${S}/src/.gopath"
>         export
> GOROOT=3D"${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
>
>         cd ${S}/src/.gopath/src/"${PODMAN_PKG}"
>
> -       # Pass the needed cflags/ldflags so that cgo
> -       # can find the needed headers files and libraries
> -       export GOARCH=3D${TARGET_GOARCH}
> -       export CGO_ENABLED=3D"1"
> -       export CGO_CFLAGS=3D"${CFLAGS} --sysroot=3D${STAGING_DIR_TARGET}"
> -       export CGO_LDFLAGS=3D"${LDFLAGS} --sysroot=3D${STAGING_DIR_TARGET=
}"
> -
>         # podman now builds go-md2man and requires the host/build details
>         export NATIVE_GOOS=3D${BUILD_GOOS}
>         export NATIVE_GOARCH=3D${BUILD_GOARCH}
> diff --git a/recipes-containers/runc/runc.inc
> b/recipes-containers/runc/runc.inc
> index b834ab14..ebff354f 100644
> --- a/recipes-containers/runc/runc.inc
> +++ b/recipes-containers/runc/runc.inc
> @@ -57,9 +57,6 @@ do_compile() {
>
>         # Pass the needed cflags/ldflags so that cgo
>         # can find the needed headers files and libraries
> -       export CGO_ENABLED=3D"1"
> -       export CGO_CFLAGS=3D"${CFLAGS} --sysroot=3D${STAGING_DIR_TARGET}"
> -       export CGO_LDFLAGS=3D"${LDFLAGS} --sysroot=3D${STAGING_DIR_TARGET=
}"
>         export GO=3D${GO}
>
>         export CFLAGS=3D""
> diff --git a/recipes-containers/skopeo/skopeo_git.bb
> b/recipes-containers/skopeo/skopeo_git.bb
> index 936d2c3d..1542f2a6 100644
> --- a/recipes-containers/skopeo/skopeo_git.bb
> +++ b/recipes-containers/skopeo/skopeo_git.bb
> @@ -53,11 +53,8 @@ do_compile() {
>
>         # Pass the needed cflags/ldflags so that cgo
>         # can find the needed headers files and libraries
> -       export CGO_ENABLED=3D"1"
>         export CFLAGS=3D""
>         export LDFLAGS=3D""
> -       export CGO_CFLAGS=3D"${TARGET_CFLAGS}"
> -       export CGO_LDFLAGS=3D"${TARGET_LDFLAGS}"
>
>         export GO111MODULE=3Doff
>         export EXTRA_LDFLAGS=3D"-s -w"
> diff --git a/recipes-containers/umoci/umoci_git.bb
> b/recipes-containers/umoci/umoci_git.bb
> index f148b7fa..32868594 100644
> --- a/recipes-containers/umoci/umoci_git.bb
> +++ b/recipes-containers/umoci/umoci_git.bb
> @@ -62,11 +62,8 @@ do_compile() {
>
>      # Pass the needed cflags/ldflags so that cgo
>      # can find the needed headers files and libraries
> -    export CGO_ENABLED=3D"1"
>      export CFLAGS=3D""
>      export LDFLAGS=3D""
> -    export CGO_CFLAGS=3D"${TARGET_CFLAGS}"
> -    export CGO_LDFLAGS=3D"${TARGET_LDFLAGS}"
>
>      export GO111MODULE=3Doff
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9562):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9562
> Mute This Topic: https://lists.yoctoproject.org/mt/117668816/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000055e4e7064a273813
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 6, 2026 at 4:17=
=E2=80=AFAM Changqing Li via <a href=3D"http://lists.yoctoproject.org">list=
s.yoctoproject.org</a> &lt;<a href=3D"http://changqing.li">changqing.li</a>=
=3D<a href=3D"mailto:windriver.com@lists.yoctoproject.org">windriver.com@li=
sts.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">From: Changqing Li &lt;<a href=3D"mailto:changqing.li@w=
indriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
<br>
* Refer [1], cgo will embeded cgo_ldflags in the intermediary output,<br>
=C2=A0 which make content ID will be incfluenced by cgo_ldflags.<br>
=C2=A0 &#39;--sysroot=3Dxxx&#39; includes build path, which will make the b=
inary not<br>
=C2=A0 reproducible, these recipes can build successfully without --sysroot=
, so<br>
=C2=A0 remove it<br>
<br>
* CGO_ENABLED/CGO_CFLAGS/CGO_LDFLAGS already exported in go.bbclass with<br=
>
=C2=A0 the same value, remove the not needed settings<br></blockquote><div>=
<br></div><div><div class=3D"gmail_default" style=3D"font-size:small">refer=
 to all my previous email on the subject.</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">I will continue to set these in the classes themselves.</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
[1] <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D=
1797741aad02b8bf429fac4b81e30cdda64b5448" rel=3D"noreferrer" target=3D"_bla=
nk">https://git.openembedded.org/openembedded-core/commit/?id=3D1797741aad0=
2b8bf429fac4b81e30cdda64b5448</a><br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/containerd/<a href=3D"http://containerd_git.bb" re=
l=3D"noreferrer" target=3D"_blank">containerd_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 3 ---<br>
=C2=A0recipes-containers/cri-tools/<a href=3D"http://cri-tools_git.bb" rel=
=3D"noreferrer" target=3D"_blank">cri-tools_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 -----<br>
=C2=A0recipes-containers/docker-compose/<a href=3D"http://docker-compose_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a>=C2=A0 =
=C2=A0| 6 +-----<br>
=C2=A0.../docker-distribution/<a href=3D"http://docker-distribution_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">docker-distribution_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 3 ---<br>
=C2=A0recipes-containers/docker/docker.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ----<br>
=C2=A0recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" re=
l=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 8 +++++---<br>
=C2=A0recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nerdctl_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ------<br>
=C2=A0recipes-containers/oci-image-tools/<a href=3D"http://oci-image-tools_=
git.bb" rel=3D"noreferrer" target=3D"_blank">oci-image-tools_git.bb</a> | 3=
 ---<br>
=C2=A0.../oci-runtime-tools/<a href=3D"http://oci-runtime-tools_git.bb" rel=
=3D"noreferrer" target=3D"_blank">oci-runtime-tools_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 ---<br>
=C2=A0recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 8 --------<br>
=C2=A0recipes-containers/runc/runc.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 ---<br>
=C2=A0recipes-containers/skopeo/<a href=3D"http://skopeo_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">skopeo_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ---<br>
=C2=A0recipes-containers/umoci/<a href=3D"http://umoci_git.bb" rel=3D"noref=
errer" target=3D"_blank">umoci_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ---<br>
=C2=A013 files changed, 6 insertions(+), 52 deletions(-)<br>
<br>
diff --git a/recipes-containers/containerd/<a href=3D"http://containerd_git=
.bb" rel=3D"noreferrer" target=3D"_blank">containerd_git.bb</a> b/recipes-c=
ontainers/containerd/<a href=3D"http://containerd_git.bb" rel=3D"noreferrer=
" target=3D"_blank">containerd_git.bb</a><br>
index 081cf354..3d66e06e 100644<br>
--- a/recipes-containers/containerd/<a href=3D"http://containerd_git.bb" re=
l=3D"noreferrer" target=3D"_blank">containerd_git.bb</a><br>
+++ b/recipes-containers/containerd/<a href=3D"http://containerd_git.bb" re=
l=3D"noreferrer" target=3D"_blank">containerd_git.bb</a><br>
@@ -47,9 +47,6 @@ do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Pass the needed cflags/ldflags so that cgo<br>
=C2=A0 =C2=A0 =C2=A0# can find the needed headers files and libraries<br>
-=C2=A0 =C2=A0 export CGO_ENABLED=3D&quot;1&quot;<br>
-=C2=A0 =C2=A0 export CGO_CFLAGS=3D&quot;${CFLAGS} --sysroot=3D${STAGING_DI=
R_TARGET}&quot;<br>
-=C2=A0 =C2=A0 export CGO_LDFLAGS=3D&quot;${LDFLAGS} --sysroot=3D${STAGING_=
DIR_TARGET}&quot;<br>
=C2=A0 =C2=A0 =C2=A0export BUILDTAGS=3D&quot;no_btrfs static_build netgo&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0export CFLAGS=3D&quot;${CFLAGS}&quot;<br>
=C2=A0 =C2=A0 =C2=A0export LDFLAGS=3D&quot;${LDFLAGS}&quot;<br>
diff --git a/recipes-containers/cri-tools/<a href=3D"http://cri-tools_git.b=
b" rel=3D"noreferrer" target=3D"_blank">cri-tools_git.bb</a> b/recipes-cont=
ainers/cri-tools/<a href=3D"http://cri-tools_git.bb" rel=3D"noreferrer" tar=
get=3D"_blank">cri-tools_git.bb</a><br>
index dad675e8..98c43b6b 100644<br>
--- a/recipes-containers/cri-tools/<a href=3D"http://cri-tools_git.bb" rel=
=3D"noreferrer" target=3D"_blank">cri-tools_git.bb</a><br>
+++ b/recipes-containers/cri-tools/<a href=3D"http://cri-tools_git.bb" rel=
=3D"noreferrer" target=3D"_blank">cri-tools_git.bb</a><br>
@@ -46,12 +46,7 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOPATH=3D&quot;${S}/src/import/.gopath:$=
{S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}/src/import<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Build the target binaries<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D&quot;${TARGET_GOARCH}&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo ca=
n find the needed headers files and libraries<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${CFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${LDFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CC=3D&quot;${CC}&quot;<br>
diff --git a/recipes-containers/docker-compose/<a href=3D"http://docker-com=
pose_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a>=
 b/recipes-containers/docker-compose/<a href=3D"http://docker-compose_git.b=
b" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a><br>
index ccb36a16..de9427ae 100644<br>
--- a/recipes-containers/docker-compose/<a href=3D"http://docker-compose_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a><br>
+++ b/recipes-containers/docker-compose/<a href=3D"http://docker-compose_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">docker-compose_git.bb</a><br>
@@ -53,13 +53,9 @@ do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # GOMODCACHE, GOPROXY, GOSUMDB, GOTOOLCHAIN are=
 set by go-mod-vcs.bbclass<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOPATH=3D&quot;${S}/src/import/.gopath:$=
{STAGING_DIR_TARGET}/${prefix}/local/go&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files and librari=
es<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D${TARGET_GOARCH}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${CFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${LDFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GO_LDFLAGS=3D&quot;-s -w -X internal.Version=3D=
${PV} -X ${COMPOSE_PKG}/internal.Version=3D${PV}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GO_BUILDTAGS=3D&quot;&quot;<br>
@@ -85,4 +81,4 @@ INSANE_SKIP:${PN} +=3D &quot;ldflags already-stripped&quo=
t;<br>
<br>
=C2=A0# the AWS dependency is 8GB, try and control the<br>
=C2=A0# size of the clones<br>
-BB_GIT_SHALLOW =3D &quot;1&quot;<br>
\ No newline at end of file<br>
+BB_GIT_SHALLOW =3D &quot;1&quot;<br>
diff --git a/recipes-containers/docker-distribution/<a href=3D"http://docke=
r-distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-distribu=
tion_git.bb</a> b/recipes-containers/docker-distribution/<a href=3D"http://=
docker-distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-dis=
tribution_git.bb</a><br>
index 5e37fe74..63001331 100644<br>
--- a/recipes-containers/docker-distribution/<a href=3D"http://docker-distr=
ibution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-distribution_gi=
t.bb</a><br>
+++ b/recipes-containers/docker-distribution/<a href=3D"http://docker-distr=
ibution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-distribution_gi=
t.bb</a><br>
@@ -28,12 +28,9 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOROOT=3D&quot;${STAGING_LIBDIR}/go&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files and librari=
es<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${TARGET_CFLAGS}&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GO_GCFLAGS=3D&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${TARGET_LDFLAGS}&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GO111MODULE=3Doff<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GO_BUILD_FLAGS=3D&quot;-trimpath&quot;<b=
r>
<br>
diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/dock=
er/docker.inc<br>
index 99535a77..b0f52d77 100644<br>
--- a/recipes-containers/docker/docker.inc<br>
+++ b/recipes-containers/docker/docker.inc<br>
@@ -80,10 +80,6 @@ do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files and librari=
es<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D${TARGET_GOARCH}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${CFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${LDFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export DOCKER_BUILDTAGS=3D&#39;${BUILD_TAGS} ${=
PACKAGECONFIG_CONFARGS}&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GO111MODULE=3Doff<br>
<br>
diff --git a/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git=
.bb" rel=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a> b/recipes-c=
ontainers/kubernetes/<a href=3D"http://kubernetes_git.bb" rel=3D"noreferrer=
" target=3D"_blank">kubernetes_git.bb</a><br>
index f7b6940a..89c53930 100644<br>
--- a/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" re=
l=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
+++ b/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" re=
l=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
@@ -54,6 +54,9 @@ inherit cni_networking<br>
<br>
=C2=A0COMPATIBLE_HOST =3D &#39;(x86_64.*|arm.*|aarch64.*)-linux&#39;<br>
<br>
+CGO_LDFLAGS ?=3D &quot;${LDFLAGS}&quot;<br>
+CGO_LDFLAGS:remove =3D &quot;${DEBUG_PREFIX_MAP}&quot;<br>
+<br>
=C2=A0do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOPATH=3D&quot;${S}/src/import/.gopath:$=
{S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go:${UNPACKDIR}=
/git/&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}<br>
@@ -70,7 +73,6 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_LDFLAGS=3D&quot;$(echo ${BUILD_LDFLA=
GS} | sed &#39;s/-Wl,-O1//g&#39; | sed &#39;s/-Wl,--dynamic-linker.*?\( \|$=
\)//g&#39;)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CC=3D&quot;${BUILD_CC}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export LD=3D&quot;${BUILD_LD}&quot;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # set the toolchain to local to avoid an attemp=
ted fetch of<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # valiation by the build<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # <a href=3D"https://github.com/actions/setup-g=
o/issues/420" rel=3D"noreferrer" target=3D"_blank">https://github.com/actio=
ns/setup-go/issues/420</a><br>
@@ -85,8 +87,8 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOARCH=3D&quot;${TARGET_GOARCH}&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo ca=
n find the needed headers files and libraries<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_ENABLED=3D&quot;1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${CFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${LDFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${CFLAGS}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${CGO_LDFLAGS}&quot;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CC=3D&quot;${CC}&quot;<br>
diff --git a/recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" r=
el=3D"noreferrer" target=3D"_blank">nerdctl_git.bb</a> b/recipes-containers=
/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">nerdctl_git.bb</a><br>
index 8f63b48c..eb873e23 100644<br>
--- a/recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nerdctl_git.bb</a><br>
+++ b/recipes-containers/nerdctl/<a href=3D"http://nerdctl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">nerdctl_git.bb</a><br>
@@ -71,12 +71,6 @@ do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files and librar=
ies<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOARCH=3D${TARGET_GOARCH}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_CFLAGS=3D&quot;${CFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_LDFLAGS=3D&quot;${LDFLAGS} --sysroo=
t=3D${STAGING_DIR_TARGET}&quot;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# -trimpath removes build paths from the =
binary (required for reproducible builds)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake GO=3D${GO} BUILDTAGS=3D&quot;$=
{BUILDTAGS}&quot; GO_BUILD_FLAGS=3D&quot;-trimpath&quot; binaries<br>
=C2=A0}<br>
diff --git a/recipes-containers/oci-image-tools/<a href=3D"http://oci-image=
-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-image-tools_git.bb<=
/a> b/recipes-containers/oci-image-tools/<a href=3D"http://oci-image-tools_=
git.bb" rel=3D"noreferrer" target=3D"_blank">oci-image-tools_git.bb</a><br>
index 36026214..6c355377 100644<br>
--- a/recipes-containers/oci-image-tools/<a href=3D"http://oci-image-tools_=
git.bb" rel=3D"noreferrer" target=3D"_blank">oci-image-tools_git.bb</a><br>
+++ b/recipes-containers/oci-image-tools/<a href=3D"http://oci-image-tools_=
git.bb" rel=3D"noreferrer" target=3D"_blank">oci-image-tools_git.bb</a><br>
@@ -29,11 +29,8 @@ do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files and librari=
es<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${TARGET_CFLAGS}&quot=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${TARGET_LDFLAGS}&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GO111MODULE=3Doff<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOBUILDFLAGS=3D&quot;-trimpath&quot;<br>
diff --git a/recipes-containers/oci-runtime-tools/<a href=3D"http://oci-run=
time-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-runtime-tools_g=
it.bb</a> b/recipes-containers/oci-runtime-tools/<a href=3D"http://oci-runt=
ime-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-runtime-tools_gi=
t.bb</a><br>
index 81f51f9c..0ba69756 100644<br>
--- a/recipes-containers/oci-runtime-tools/<a href=3D"http://oci-runtime-to=
ols_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-runtime-tools_git.bb</=
a><br>
+++ b/recipes-containers/oci-runtime-tools/<a href=3D"http://oci-runtime-to=
ols_git.bb" rel=3D"noreferrer" target=3D"_blank">oci-runtime-tools_git.bb</=
a><br>
@@ -25,11 +25,8 @@ do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files and librari=
es<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${TARGET_CFLAGS}&quot=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${TARGET_LDFLAGS}&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GO111MODULE=3Doff<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOFLAGS=3D&quot;-mod=3Dvendor&quot;<br>
<br>
diff --git a/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a> b/recipes-containers/po=
dman/<a href=3D"http://podman_git.bb" rel=3D"noreferrer" target=3D"_blank">=
podman_git.bb</a><br>
index f09e01f8..5e5f1f9b 100644<br>
--- a/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a><br>
+++ b/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a><br>
@@ -78,19 +78,11 @@ do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf &quot;../../../import/vendor/<a href=3D"=
http://github.com/varlink/" rel=3D"noreferrer" target=3D"_blank">github.com=
/varlink/</a>&quot; &quot;.gopath/src/<a href=3D"http://github.com/varlink"=
 rel=3D"noreferrer" target=3D"_blank">github.com/varlink</a>&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D&quot;${BUILD_GOARCH}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOPATH=3D&quot;${S}/src/.gopath&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOROOT=3D&quot;${STAGING_DIR_NATIVE}/${n=
onarch_libdir}/${HOST_SYS}/go&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}/src/.gopath/src/&quot;${PODMAN_PKG}&quo=
t;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Pass the needed cflags/ldflags so that cgo<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# can find the needed headers files and librari=
es<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D${TARGET_GOARCH}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${CFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${LDFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # podman now builds go-md2man and requires the =
host/build details<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export NATIVE_GOOS=3D${BUILD_GOOS}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export NATIVE_GOARCH=3D${BUILD_GOARCH}<br>
diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/run=
c.inc<br>
index b834ab14..ebff354f 100644<br>
--- a/recipes-containers/runc/runc.inc<br>
+++ b/recipes-containers/runc/runc.inc<br>
@@ -57,9 +57,6 @@ do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files and librari=
es<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${CFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${LDFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GO=3D${GO}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D&quot;&quot;<br>
diff --git a/recipes-containers/skopeo/<a href=3D"http://skopeo_git.bb" rel=
=3D"noreferrer" target=3D"_blank">skopeo_git.bb</a> b/recipes-containers/sk=
opeo/<a href=3D"http://skopeo_git.bb" rel=3D"noreferrer" target=3D"_blank">=
skopeo_git.bb</a><br>
index 936d2c3d..1542f2a6 100644<br>
--- a/recipes-containers/skopeo/<a href=3D"http://skopeo_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">skopeo_git.bb</a><br>
+++ b/recipes-containers/skopeo/<a href=3D"http://skopeo_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">skopeo_git.bb</a><br>
@@ -53,11 +53,8 @@ do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pass the needed cflags/ldflags so that cgo<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # can find the needed headers files and librari=
es<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${TARGET_CFLAGS}&quot=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${TARGET_LDFLAGS}&qu=
ot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GO111MODULE=3Doff<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export EXTRA_LDFLAGS=3D&quot;-s -w&quot;<br>
diff --git a/recipes-containers/umoci/<a href=3D"http://umoci_git.bb" rel=
=3D"noreferrer" target=3D"_blank">umoci_git.bb</a> b/recipes-containers/umo=
ci/<a href=3D"http://umoci_git.bb" rel=3D"noreferrer" target=3D"_blank">umo=
ci_git.bb</a><br>
index f148b7fa..32868594 100644<br>
--- a/recipes-containers/umoci/<a href=3D"http://umoci_git.bb" rel=3D"noref=
errer" target=3D"_blank">umoci_git.bb</a><br>
+++ b/recipes-containers/umoci/<a href=3D"http://umoci_git.bb" rel=3D"noref=
errer" target=3D"_blank">umoci_git.bb</a><br>
@@ -62,11 +62,8 @@ do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Pass the needed cflags/ldflags so that cgo<br>
=C2=A0 =C2=A0 =C2=A0# can find the needed headers files and libraries<br>
-=C2=A0 =C2=A0 export CGO_ENABLED=3D&quot;1&quot;<br>
=C2=A0 =C2=A0 =C2=A0export CFLAGS=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0export LDFLAGS=3D&quot;&quot;<br>
-=C2=A0 =C2=A0 export CGO_CFLAGS=3D&quot;${TARGET_CFLAGS}&quot;<br>
-=C2=A0 =C2=A0 export CGO_LDFLAGS=3D&quot;${TARGET_LDFLAGS}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0export GO111MODULE=3Doff<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9562): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9562" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9562</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117668816/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/117668816/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000055e4e7064a273813--

