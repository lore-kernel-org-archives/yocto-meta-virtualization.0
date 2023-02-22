Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A951C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 13:41:17 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.8952.1677073270308469197
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 05:41:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=At7KacUt;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id k199so5214097ybf.4
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Feb 2023 05:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHor5yVc86uXJ/6ni3RJ6dpEENxk3yvx/8QadMC1H1Q=;
        b=At7KacUt4CFZkf17KofHaqKwlus5gETNqv7Wk/E11n5tXTTk7jGRFo/q3HylWyWYhI
         iosJpIW4UbZnqdor06II2tJjOO9Svn28p+jGkne4j8aDOjyyE5B8vaLM+jJLsC2D/YMK
         dv8BpWLWRo+AMWOiRr/Ifqqb7n84Nr+KuWwXwWxvbWCOQGy2bTn1vDeSL4+LJOHEx+vZ
         7XZ4EuPckQ4Gt7r5qIDucTkzHB1M713X4D2mhCWqzsLAPQm8iawMiCIF8oHOx8aLa3FX
         GB7aYHvLxT0Yic7ZUVJqNj1XAiOBvtXlMw9rP2qp0a7pKhuzeqNKy1JMNPGcKKu4OFYW
         PZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHor5yVc86uXJ/6ni3RJ6dpEENxk3yvx/8QadMC1H1Q=;
        b=TisXeBVyrV9PTzCYiIWXsRgxkwgPJQOKKvqZHJOc0jsn9cEdkX3Y4r11dXBVsvc/P+
         QKzu/VDnu2JycAbR+W8mA4Abhn/zxkAOWBPGVnSUfdGkGOs8g+Bu5PlTV0pOgiyAZMM5
         7+dUIQR6iMhiNnQzycWD86gzUWJnKjE60zRdKx7VJtw8+pooNQ16SuSUwYc6P3HP6+GP
         9hRpBhj9EhS6/OBlu+ikYL3sMbGoFcEVrKzsuca+FYzn9AizLpSfT93gJYTr5McBiZXx
         3ibOj0YX4hCQYlLs6C5WaPh/KMHahE4UPPBlF0j1jidmYHL5JIQPczms28KRQylqZm4U
         kDzg==
X-Gm-Message-State: AO0yUKUN8+7yBq6WHuIOSXTy8xxQOHdBeMKCdDV4e0i8ONtkMct6+6Rm
	7irvxFNH+jH5g29VytwbHShatR2yJMrQ6Epxnrz7Q8D8f5U=
X-Google-Smtp-Source: AK7set++oC9l/3kZSkMWZKkX1gC4x1fj4uNOWYv5tckCpu4D5QacucMDDCSOsnf5tTzA8hR8vnPC9/In1y3P50Rvqos=
X-Received: by 2002:a5b:387:0:b0:916:20df:c31a with SMTP id
 k7-20020a5b0387000000b0091620dfc31amr265795ybp.627.1677073268948; Wed, 22 Feb
 2023 05:41:08 -0800 (PST)
MIME-Version: 1.0
References: <PR3P192MB07146B2824AD9A0DD1E5E8E2DAAA9@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: <PR3P192MB07146B2824AD9A0DD1E5E8E2DAAA9@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 22 Feb 2023 08:40:57 -0500
Message-ID: <CADkTA4Mzy0jzXJqiaRnfarAh71=mq9ASikitSmWuUqrMotcPhw@mail.gmail.com>
Subject: Re: [meta-virtualization][dunfell][PATCH 1/3] runc: update to 1.0.3
To: hsimeliere.opensource@witekio.com
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Feb 2023 13:41:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7894

On Wed, Feb 22, 2023 at 5:41 AM Hugo Simeliere via
lists.yoctoproject.org
<hsimeliere.opensource=3Dwitekio.com@lists.yoctoproject.org> wrote:
>
> Bumping runc to last release-1.0.
> Upstream based on commit df3cc4955002b5057fba92f1fd8b6fd94af3eb0b
>

So this is based off the meta-virt commit you list. Has anything
changed from the original ?

If nothing has changed, then the original commit message should be
maintained, with it noted that the commit is a cherry-pick of commit
<x>

If something has changed from the original commit, the original commit
message should still be maintained, but any differences noted.

Bruce

> Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
> ---
>  ...-GOBUILDFLAGS-for-runc-and-remove-re.patch |  40 ++--
>  ...nly-allow-proc-mount-if-it-is-procfs.patch | 201 ------------------
>  ...001-runc-Add-console-socket-dev-null.patch |  19 +-
>  .../0001-runc-docker-SIGUSR1-daemonize.patch  |  21 +-
>  recipes-containers/runc/runc-docker_git.bb    |   7 +-
>  .../runc/runc-opencontainers_git.bb           |   7 +-
>  recipes-containers/runc/runc.inc              |  15 +-
>  7 files changed, 60 insertions(+), 250 deletions(-)
>  delete mode 100644 recipes-containers/runc/files/0001-Only-allow-proc-mo=
unt-if-it-is-procfs.patch
>
> diff --git a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDF=
LAGS-for-runc-and-remove-re.patch b/recipes-containers/runc/files/0001-Make=
file-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
> index 94cbb4c..c855d7b 100644
> --- a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-fo=
r-runc-and-remove-re.patch
> +++ b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-fo=
r-runc-and-remove-re.patch
> @@ -1,35 +1,37 @@
> -From d2c47a973f354ffd505bb4e809c59e57b543726d Mon Sep 17 00:00:00 2001
> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Tue, 6 Aug 2019 19:01:45 +0800
> +From 0fe50d2ca4517f5e3070585040f35ace413acd44 Mon Sep 17 00:00:00 2001
> +From: Bruce Ashfield <bruce.ashfield@gmail.com>
> +Date: Tue, 24 Aug 2021 11:38:23 -0400
>  Subject: [PATCH] Makefile: respect GOBUILDFLAGS for runc and remove recv=
tty
>   from static
>
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +[bva: refreshed for release 1.0.2]
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>  ---
>   Makefile | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> -diff --git a/Makefile b/Makefile
> -index 0f26a1c8..a0c6b40b 100644
> +diff --git a/src/import/Makefile b/src/import/Makefile
> +index efbddf0d..4b174c80 100644
>  --- a/src/import/Makefile
>  +++ b/src/import/Makefile
> -@@ -30,7 +30,7 @@ SHELL :=3D $(shell command -v bash 2>/dev/null)
> - .DEFAULT: runc
> +@@ -24,7 +24,7 @@ ifeq ($(shell $(GO) env GOOS),linux)
> + =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82endif
> + =E2=80=82=E2=80=82=E2=80=82=E2=80=82endif
> + endif
> +-GO_BUILD :=3D $(GO) build -trimpath $(MOD_VENDOR) $(GO_BUILDMODE) $(EXT=
RA_FLAGS) -tags "$(BUILDTAGS)" \
> ++GO_BUILD :=3D $(GO) build $(GOBUILDFLAGS) -trimpath $(MOD_VENDOR) $(GO_=
BUILDMODE) $(EXTRA_FLAGS) -tags "$(BUILDTAGS)" \
> + =E2=80=82=E2=80=82=E2=80=82=E2=80=82-ldflags "-X main.gitCommit=3D$(COM=
MIT) -X main.version=3D$(VERSION) $(EXTRA_LDFLAGS)"
> + GO_BUILD_STATIC :=3D CGO_ENABLED=3D1 $(GO) build -trimpath $(MOD_VENDOR=
) $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo osusergo" \
> + =E2=80=82=E2=80=82=E2=80=82=E2=80=82-ldflags "-extldflags -static -X ma=
in.gitCommit=3D$(COMMIT) -X main.version=3D$(VERSION) $(EXTRA_LDFLAGS)"
> +@@ -41,7 +41,6 @@ recvtty:
>
> - runc: $(SOURCES)
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82$(GO) build -buildmode=3Dpie $(EXTR=
A_FLAGS) -ldflags "-X main.gitCommit=3D${COMMIT} -X main.version=3D${VERSIO=
N} $(EXTRA_LDFLAGS)" -tags "$(BUILDTAGS)" -o runc .
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82$(GO) build $(GOBUILDFLAGS) $(EXTRA=
_FLAGS) -ldflags "-X main.gitCommit=3D${COMMIT} -X main.version=3D${VERSION=
} $(EXTRA_LDFLAGS)" -tags "$(BUILDTAGS)" -o runc .
> -
> - all: runc recvtty
> -
> -@@ -41,7 +41,6 @@ contrib/cmd/recvtty/recvtty: $(SOURCES)
> -
> - static: $(SOURCES)
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82CGO_ENABLED=3D1 $(GO) build $(EXTRA=
_FLAGS) -tags "$(BUILDTAGS) netgo osusergo static_build" -installsuffix net=
go -ldflags "-w -extldflags -static -X main.gitCommit=3D${COMMIT} -X main.v=
ersion=3D${VERSION} $(EXTRA_LDFLAGS)" -o runc .
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82CGO_ENABLED=3D1 $(GO) build $(EXTRA=
_FLAGS) -tags "$(BUILDTAGS) netgo osusergo static_build" -installsuffix net=
go -ldflags "-w -extldflags -static -X main.gitCommit=3D${COMMIT} -X main.v=
ersion=3D${VERSION} $(EXTRA_LDFLAGS)" -o contrib/cmd/recvtty/recvtty ./cont=
rib/cmd/recvtty
> + static:
> + =E2=80=82=E2=80=82=E2=80=82=E2=80=82$(GO_BUILD_STATIC) -o runc .
> +-=E2=80=82=E2=80=82=E2=80=82=E2=80=82$(GO_BUILD_STATIC) -o contrib/cmd/r=
ecvtty/recvtty ./contrib/cmd/recvtty
>
>   release:
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82script/release.sh -r release/$(VERS=
ION) -v $(VERSION)
>  --
> -2.17.1
> +2.19.1
>
> diff --git a/recipes-containers/runc/files/0001-Only-allow-proc-mount-if-=
it-is-procfs.patch b/recipes-containers/runc/files/0001-Only-allow-proc-mou=
nt-if-it-is-procfs.patch
> deleted file mode 100644
> index 5aca99e..0000000
> --- a/recipes-containers/runc/files/0001-Only-allow-proc-mount-if-it-is-p=
rocfs.patch
> +++ /dev/null
> @@ -1,201 +0,0 @@
> -From d75b05441772417a0828465a9483f16287937724 Mon Sep 17 00:00:00 2001
> -From: Michael Crosby <crosbymichael@gmail.com>
> -Date: Mon, 23 Sep 2019 16:45:45 -0400
> -Subject: [PATCH] Only allow proc mount if it is procfs
> -
> -Fixes #2128
> -
> -This allows proc to be bind mounted for host and rootless namespace usec=
ases but
> -it removes the ability to mount over the top of proc with a directory.
> -
> -```bash
> -> sudo docker run --rm  apparmor
> -docker: Error response from daemon: OCI runtime create failed:
> -container_linux.go:346: starting container process caused "process_linux=
.go:449:
> -container init caused \"rootfs_linux.go:58: mounting
> -\\\"/var/lib/docker/volumes/aae28ea068c33d60e64d1a75916cf3ec2dc3634f9757=
1854c9ed30c8401460c1/_data\\\"
> -to rootfs
> -\\\"/var/lib/docker/overlay2/a6be5ae911bf19f8eecb23a295dec85be9a8ee8da66=
e9fb55b47c841d1e381b7/merged\\\"
> -at \\\"/proc\\\" caused
> -\\\"\\\\\\\"/var/lib/docker/overlay2/a6be5ae911bf19f8eecb23a295dec85be9a=
8ee8da66e9fb55b47c841d1e381b7/merged/proc\\\\\\\"
> -cannot be mounted because it is not of type proc\\\"\"": unknown.
> -
> -> sudo docker run --rm -v /proc:/proc apparmor
> -
> -docker-default (enforce)        root     18989  0.9  0.0   1288     4 ?
> -Ss   16:47   0:00 sleep 20
> -```
> -
> -Signed-off-by: Michael Crosby <crosbymichael@gmail.com>
> -
> -Upstream-Status: Backport [https://github.com/opencontainers/runc/pull/2=
129/commits/331692baa7afdf6c186f8667cb0e6362ea0802b3]
> -
> -CVE: CVE-2019-16884
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - libcontainer/container_linux.go   |  4 +--
> - libcontainer/rootfs_linux.go      | 50 +++++++++++++++++++++++--------
> - libcontainer/rootfs_linux_test.go |  8 ++---
> - 3 files changed, 43 insertions(+), 19 deletions(-)
> -
> -diff --git a/libcontainer/container_linux.go b/libcontainer/container_li=
nux.go
> -index 7e58e5e0..d51e35df 100644
> ---- a/src/import/libcontainer/container_linux.go
> -+++ b/src/import/libcontainer/container_linux.go
> -@@ -19,7 +19,7 @@ import (
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82"syscall" // only for SysProcAttr a=
nd Signal
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82"time"
> -
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82"github.com/cyphar/filepath-securej=
oin"
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82securejoin "github.com/cyphar/filep=
ath-securejoin"
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82"github.com/opencontainers/runc/lib=
container/cgroups"
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82"github.com/opencontainers/runc/lib=
container/configs"
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82"github.com/opencontainers/runc/lib=
container/intelrdt"
> -@@ -1160,7 +1160,7 @@ func (c *linuxContainer) makeCriuRestoreMountpoint=
s(m *configs.Mount) error {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82if err !=3D nil {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
return err
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82}
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82if err :=3D checkMountDestination(c.config.Rootfs, des=
t); err !=3D nil {
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82if err :=3D checkProcMount(c.config.Rootfs, dest, "");=
 err !=3D nil {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
return err
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82}
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82m.Destination =3D dest
> -diff --git a/libcontainer/rootfs_linux.go b/libcontainer/rootfs_linux.go
> -index f13b226e..5650b0ac 100644
> ---- a/src/import/libcontainer/rootfs_linux.go
> -+++ b/src/import/libcontainer/rootfs_linux.go
> -@@ -13,7 +13,7 @@ import (
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82"strings"
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82"time"
> -
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82"github.com/cyphar/filepath-securej=
oin"
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82securejoin "github.com/cyphar/filep=
ath-securejoin"
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82"github.com/mrunalp/fileutils"
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82"github.com/opencontainers/runc/lib=
container/cgroups"
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82"github.com/opencontainers/runc/lib=
container/configs"
> -@@ -197,7 +197,7 @@ func prepareBindMount(m *configs.Mount, rootfs strin=
g) error {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82if dest, err =3D securejoin.SecureJ=
oin(rootfs, m.Destination); err !=3D nil {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82return err
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82}
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82if err :=3D checkMountDestination(r=
ootfs, dest); err !=3D nil {
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82if err :=3D checkProcMount(rootfs, =
dest, m.Source); err !=3D nil {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82return err
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82}
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82// update the mount with the correc=
t dest after symlinks are resolved.
> -@@ -388,7 +388,7 @@ func mountToRootfs(m *configs.Mount, rootfs, mountLa=
bel string, enableCgroupns b
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82if dest, err =3D securejoin.SecureJoin(rootfs, m.Desti=
nation); err !=3D nil {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
return err
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82}
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82if err :=3D checkMountDestination(rootfs, dest); err !=
=3D nil {
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82if err :=3D checkProcMount(rootfs, dest, m.Source); er=
r !=3D nil {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
return err
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82}
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82// update the mount with the correct dest after symlin=
ks are resolved.
> -@@ -435,12 +435,12 @@ func getCgroupMounts(m *configs.Mount) ([]*configs=
.Mount, error) {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82return binds, nil
> - }
> -
> --// checkMountDestination checks to ensure that the mount destination is=
 not over the top of /proc.
> -+// checkProcMount checks to ensure that the mount destination is not ov=
er the top of /proc.
> - // dest is required to be an abs path and have any symlinks resolved be=
fore calling this function.
> --func checkMountDestination(rootfs, dest string) error {
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82invalidDestinations :=3D []string{
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82"/proc",
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82}
> -+//
> -+// if source is nil, don't stat the filesystem.  This is used for resto=
re of a checkpoint.
> -+func checkProcMount(rootfs, dest, source string) error {
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82const procPath =3D "/proc"
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82// White list, it should be sub dir=
ectories of invalid destinations
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82validDestinations :=3D []string{
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82// These entries can be bind mounted by files emulated=
 by fuse,
> -@@ -463,16 +463,40 @@ func checkMountDestination(rootfs, dest string) er=
ror {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
return nil
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82}
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82}
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82for _, invalid :=3D range invalidDe=
stinations {
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82path, err :=3D filepath.Rel(filepath.Join(rootfs, inva=
lid), dest)
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82path, err :=3D filepath.Rel(filepat=
h.Join(rootfs, procPath), dest)
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82if err !=3D nil {
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82return err
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82}
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82// pass if the mount path is locate=
d outside of /proc
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82if strings.HasPrefix(path, "..") {
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82return nil
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82}
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82if path =3D=3D "." {
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82// an empty source is pasted on restore
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82if source =3D=3D "" {
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
return nil
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82}
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82// only allow a mount on-top of proc if it's source is=
 "proc"
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82isproc, err :=3D isProc(source)
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82if err !=3D nil {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
return err
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82}
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82if path !=3D "." && !strings.HasPrefix(path, "..") {
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
return fmt.Errorf("%q cannot be mounted because it is located inside %q", d=
est, invalid)
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82// pass if the mount is happening on top of /proc and =
the source of
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82// the mount is a proc filesystem
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82if isproc {
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
return nil
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82}
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82return fmt.Errorf("%q cannot be mounted because it is =
not of type proc", dest)
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82}
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82return nil
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82return fmt.Errorf("%q cannot be mou=
nted because it is inside /proc", dest)
> -+}
> -+
> -+func isProc(path string) (bool, error) {
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82var s unix.Statfs_t
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82if err :=3D unix.Statfs(path, &s); =
err !=3D nil {
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82return false, err
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82}
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82return s.Type =3D=3D unix.PROC_SUPE=
R_MAGIC, nil
> - }
> -
> - func setupDevSymlinks(rootfs string) error {
> -diff --git a/libcontainer/rootfs_linux_test.go b/libcontainer/rootfs_lin=
ux_test.go
> -index d755984b..1bfe7c66 100644
> ---- a/src/import/libcontainer/rootfs_linux_test.go
> -+++ b/src/import/libcontainer/rootfs_linux_test.go
> -@@ -10,7 +10,7 @@ import (
> -
> - func TestCheckMountDestOnProc(t *testing.T) {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82dest :=3D "/rootfs/proc/sys"
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82err :=3D checkMountDestination("/ro=
otfs", dest)
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82err :=3D checkProcMount("/rootfs", =
dest, "")
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82if err =3D=3D nil {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82t.Fatal("destination inside proc should return an erro=
r")
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82}
> -@@ -18,7 +18,7 @@ func TestCheckMountDestOnProc(t *testing.T) {
> -
> - func TestCheckMountDestOnProcChroot(t *testing.T) {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82dest :=3D "/rootfs/proc/"
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82err :=3D checkMountDestination("/ro=
otfs", dest)
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82err :=3D checkProcMount("/rootfs", =
dest, "/proc")
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82if err !=3D nil {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82t.Fatal("destination inside proc when using chroot sho=
uld not return an error")
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82}
> -@@ -26,7 +26,7 @@ func TestCheckMountDestOnProcChroot(t *testing.T) {
> -
> - func TestCheckMountDestInSys(t *testing.T) {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82dest :=3D "/rootfs//sys/fs/cgroup"
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82err :=3D checkMountDestination("/ro=
otfs", dest)
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82err :=3D checkProcMount("/rootfs", =
dest, "")
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82if err !=3D nil {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82t.Fatal("destination inside /sys should not return an =
error")
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82}
> -@@ -34,7 +34,7 @@ func TestCheckMountDestInSys(t *testing.T) {
> -
> - func TestCheckMountDestFalsePositive(t *testing.T) {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82dest :=3D "/rootfs/sysfiles/fs/cgro=
up"
> --=E2=80=82=E2=80=82=E2=80=82=E2=80=82err :=3D checkMountDestination("/ro=
otfs", dest)
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82err :=3D checkProcMount("/rootfs", =
dest, "")
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82if err !=3D nil {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82t.Fatal(err)
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82}
> ---
> -2.17.1
> -
> diff --git a/recipes-containers/runc/runc-docker/0001-runc-Add-console-so=
cket-dev-null.patch b/recipes-containers/runc/runc-docker/0001-runc-Add-con=
sole-socket-dev-null.patch
> index 48c1250..bcf4c10 100644
> --- a/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-de=
v-null.patch
> +++ b/recipes-containers/runc/runc-docker/0001-runc-Add-console-socket-de=
v-null.patch
> @@ -12,11 +12,11 @@ Signed-off-by: Jason Wessel <jason.wessel@windriver.c=
om>
>   utils_linux.go | 5 +++++
>   1 file changed, 5 insertions(+)
>
> -diff --git a/utils_linux.go b/utils_linux.go
> -index 8085f7fe..e6d31b35 100644
> ---- a/src/import/utils_linux.go
> -+++ b/src/import/utils_linux.go
> -@@ -227,6 +227,11 @@ type runner struct {
> +Index: git/src/import/utils_linux.go
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/src/import/utils_linux.go
> ++++ git/src/import/utils_linux.go
> +@@ -267,6 +267,11 @@
>   }
>
>   func (r *runner) run(config *specs.Process) (int, error) {
> @@ -25,9 +25,6 @@ index 8085f7fe..e6d31b35 100644
>  +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82r.consoleSocket =3D ""
>  +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82config.Terminal =3D false
>  +=E2=80=82=E2=80=82=E2=80=82=E2=80=82}
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82if err :=3D r.checkTerminal(config)=
; err !=3D nil {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82r.destroy()
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82return -1, err
> ---
> -2.11.0
> -
> + =E2=80=82=E2=80=82=E2=80=82=E2=80=82var err error
> + =E2=80=82=E2=80=82=E2=80=82=E2=80=82defer func() {
> + =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82if err !=3D nil {
> diff --git a/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1=
-daemonize.patch b/recipes-containers/runc/runc-docker/0001-runc-docker-SIG=
USR1-daemonize.patch
> index 0af7495..4350c40 100644
> --- a/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemon=
ize.patch
> +++ b/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemon=
ize.patch
> @@ -33,15 +33,17 @@ Index: git/src/import/signals.go
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- git.orig/src/import/signals.go
>  +++ git/src/import/signals.go
> -@@ -6,6 +6,7 @@
> +@@ -5,7 +5,9 @@
> + import (
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82"os"
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82"os/signal"
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82"syscall" // only for Signal
> -+=E2=80=82=E2=80=82=E2=80=82=E2=80=82"strconv"
> ++=E2=80=82=E2=80=82=E2=80=82=E2=80=82"syscall" // only for Signal
>
> ++        "strconv"
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82"github.com/opencontainers/runc/lib=
container"
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82"github.com/opencontainers/runc/lib=
container/system"
> -@@ -56,9 +57,6 @@
> + =E2=80=82=E2=80=82=E2=80=82=E2=80=82"github.com/opencontainers/runc/lib=
container/utils"
> +@@ -55,9 +57,6 @@
>   func (h *signalHandler) forward(process *libcontainer.Process, tty *tty=
, detach bool) (int, error) {
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82// make sure we know the pid of our=
 main process so that we can return
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82// after it dies.
> @@ -51,13 +53,14 @@ Index: git/src/import/signals.go
>
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82pid1, err :=3D process.Pid()
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82if err !=3D nil {
> -@@ -68,11 +66,60 @@
> +@@ -67,12 +66,61 @@
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82if h.notifySocket !=3D nil {
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82if detach {
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
h.notifySocket.run(pid1)
> + =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
_ =3D h.notifySocket.run(pid1)
>  -=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
return 0, nil
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82}
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82go h.notifySocket.run(0)
> + =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82_ =3D h.notifySocket.run(os.Getpid())
> + =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82go func() { _ =3D h.notifySocket.run(0) }()
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82}
>
>  +=E2=80=82=E2=80=82=E2=80=82=E2=80=82if (detach) {
> @@ -117,7 +120,7 @@ Index: git/src/import/utils_linux.go
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  --- git.orig/src/import/utils_linux.go
>  +++ git/src/import/utils_linux.go
> -@@ -347,7 +347,7 @@
> +@@ -345,7 +345,7 @@
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82if err !=3D nil {
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82r.terminate(process)
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82}
> @@ -125,4 +128,4 @@ Index: git/src/import/utils_linux.go
>  +=E2=80=82=E2=80=82=E2=80=82=E2=80=82if (detach && os.Getenv("SIGUSR1_PA=
RENT_PID") =3D=3D "") {
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=
=82=E2=80=82=E2=80=82return 0, nil
>   =E2=80=82=E2=80=82=E2=80=82=E2=80=82}
> - =E2=80=82=E2=80=82=E2=80=82=E2=80=82r.destroy()
> + =E2=80=82=E2=80=82=E2=80=82=E2=80=82if err =3D=3D nil {
> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-contain=
ers/runc/runc-docker_git.bb
> index 42b4cb5..2019ad3 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -2,14 +2,13 @@ include runc.inc
>
>  # Note: this rev is before the required protocol field, update when all =
components
>  #       have been updated to match.
> -SRCREV_runc-docker =3D "425e105d5a03fabd737a126ad93d62a9eeede87f"
> -SRC_URI =3D "git://github.com/opencontainers/runc;nobranch=3D1;name=3Dru=
nc-docker;protocol=3Dhttps \
> +SRCREV_runc-docker =3D "e0124d569cb2dfe93bd9fb8d7f4ade461e006464"
> +SRC_URI =3D "git://github.com/opencontainers/runc;branch=3Drelease-1.0;n=
ame=3Drunc-docker;protocol=3Dhttps \
>             file://0001-runc-Add-console-socket-dev-null.patch \
>             file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove=
-re.patch \
>             file://0001-runc-docker-SIGUSR1-daemonize.patch \
> -           file://0001-Only-allow-proc-mount-if-it-is-procfs.patch \
>            "
>
> -RUNC_VERSION =3D "1.0.0-rc8"
> +RUNC_VERSION =3D "1.0.3"
>
>  CVE_PRODUCT =3D "runc"
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes=
-containers/runc/runc-opencontainers_git.bb
> index ac6532c..4b1d0a0 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -1,11 +1,10 @@
>  include runc.inc
>
> -SRCREV =3D "652297c7c7e6c94e8d064ad5916c32891a6fd388"
> +SRCREV =3D "e0124d569cb2dfe93bd9fb8d7f4ade461e006464"
>  SRC_URI =3D " \
> -    git://github.com/opencontainers/runc;branch=3Dmain;protocol=3Dhttps =
\
> +    git://github.com/opencontainers/runc;branch=3Drelease-1.0;protocol=
=3Dhttps \
>      file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.pat=
ch \
> -    file://0001-Only-allow-proc-mount-if-it-is-procfs.patch \
>      "
> -RUNC_VERSION =3D "1.0.0-rc8"
> +RUNC_VERSION =3D "1.0.3"
>
>  CVE_PRODUCT =3D "runc"
> diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/r=
unc.inc
> index 41ea41b..eb8aa02 100644
> --- a/recipes-containers/runc/runc.inc
> +++ b/recipes-containers/runc/runc.inc
> @@ -14,11 +14,17 @@ inherit go
>  inherit goarch
>  inherit pkgconfig
>
> -PACKAGECONFIG ??=3D "static"
>  PACKAGECONFIG[seccomp] =3D "seccomp,,libseccomp"
> +PACKAGECONFIG[selinux] =3D "selinux,,libselinux"
>  # This PACKAGECONFIG serves the purpose of whether building runc as stat=
ic or not
>  PACKAGECONFIG[static] =3D ""
>
> +PACKAGECONFIG ??=3D "static \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 's=
eccomp', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 's=
elinux', '', d)} \
> +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82          "
> +
> +
>  PROVIDES +=3D "virtual/runc"
>  RPROVIDES_${PN} =3D "virtual/runc"
>
> @@ -27,7 +33,12 @@ GO_IMPORT =3D "import"
>  LIBCONTAINER_PACKAGE=3D"github.com/opencontainers/runc/libcontainer"
>
>  do_configure[noexec] =3D "1"
> -EXTRA_OEMAKE=3D"BUILDTAGS=3D'${PACKAGECONFIG_CONFARGS}' GO=3D${GO}"
> +
> +
> +DISTRO_BUILDTAGS ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'seccomp'=
, 'seccomp', '', d)} \
> +                     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', =
'selinux', '', d)}"
> +
> +EXTRA_OEMAKE=3D"BUILDTAGS=3D'${PACKAGECONFIG_CONFARGS} ${DISTRO_BUILDTAG=
S}' GO=3D${GO}"
>
>  do_compile() {
>  =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82# Set GOPATH. See 'PACKAGER=
S.md'. Don't rely on
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7890): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7890
> Mute This Topic: https://lists.yoctoproject.org/mt/97157077/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

