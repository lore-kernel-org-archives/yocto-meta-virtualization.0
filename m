Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88ABC7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 12:26:50 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web11.7506.1686054406448454618
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 05:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Yvm1EHcl;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-33b3674acdeso20917495ab.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jun 2023 05:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686054405; x=1688646405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5xBGXRZCgbCtIJHWuujUoIV/LI1FGCONevKNz5VUdg=;
        b=Yvm1EHclOGtP7BZjJ7IdzABUVbTsaEnFX9DrNU6UoTqqhJI+4rRd6ZZ4RvmUfci4gD
         zcuuvsnK0nXHN0GFXnNpwktmGCycTMjCjCESwdRCRfKyl/ImOlHRBchdZbLeMXqybsa0
         iggxUDc80Bn/HvQV+HrUzJ7FHdfFJLWe3P5JrLLLgUW/hYhof2lTric+d87lnH7aWgXU
         rzgUpy3CVFFA9/60hhPcDHD3u/bbuMBEmkthNKxaPos7jN8FIGBftO2YDlEqFkZ3RmLh
         3kWP/6gdDgXT/W61ufqpuLn0ljGDhoL5CMneE48Mvw0PSGwCNpgCHm8AFT7npq7RqBzE
         3sjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686054405; x=1688646405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5xBGXRZCgbCtIJHWuujUoIV/LI1FGCONevKNz5VUdg=;
        b=Q13XZ4UK+uc4gtDHqt2KizgnTCkCi8GhiXqKudiIopP3PvZ5tYzfKclUQWCnFUifYO
         y7mXCbAStwOKP+4IEJy5r+/QiY3iq1k+XB8rhGJYiqvz8PAQCcOfup+fWa+6Mi/NtygW
         RWPQDBE4Z4ebRLJnLIGeRwXBCbeXo9AHts2DmjXEkynR5yT840b+Wv3EuIFI/a/Yvtrt
         y/ewJUVtdYKSPCuNQUW1zQ0G1kgQK2+1Mi8sLh+3Rx07C/MWJbqgJPD3hJs+6DKr/vib
         MOjpiBP95EseNCLA8L5fDOm/P/YuSRJFnYuqxN6EMiWtQw6yIujV+J2IQg+ygUA2PIGQ
         QS1g==
X-Gm-Message-State: AC+VfDzx7fOVCu9jrBxNbwsronVz2QrPB//LS8Hnp9kLIn2WrhINo8GF
	aOPO59wqEjgSJudn2kaIJ/ArTZ5lo8TisPbFiue8qsCfSrs=
X-Google-Smtp-Source: ACHHUZ6gkjhazXz8I2m1yjWu9jm9ukMEw9cWkIZ4VLfkw0g8yhijx5NPrjimLYu/OMkMbjFDi6OmpAadJMVHYfCfoEI=
X-Received: by 2002:a92:1804:0:b0:334:fa57:e670 with SMTP id
 4-20020a921804000000b00334fa57e670mr1822248ily.0.1686054405563; Tue, 06 Jun
 2023 05:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230606074311.2269186-1-Qi.Chen@windriver.com>
In-Reply-To: <20230606074311.2269186-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 6 Jun 2023 08:26:36 -0400
Message-ID: <CADkTA4M4JmxAneEWuJh2g_j7FQGr2Q_EQ-7aOvuHoaGqF=t9Nw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] docker: upgrade to 23.0.6
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jun 2023 12:26:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8093

likewise, this is already in master-next (along with 24.0), and will
be cherry picked to mickeldore once ready.

Bruce


On Tue, Jun 6, 2023 at 3:43=E2=80=AFAM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/docker/docker-moby_git.bb  |   7 +-
>  ...Allow-for-xattr-copy-failure-for-vfs.patch | 113 ------------------
>  2 files changed, 3 insertions(+), 117 deletions(-)
>  delete mode 100644 recipes-containers/docker/files/0001-Allow-for-xattr-=
copy-failure-for-vfs.patch
>
> diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-conta=
iners/docker/docker-moby_git.bb
> index 7858bebf..507d968a 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -44,9 +44,9 @@ DESCRIPTION =3D "Linux container runtime \
>  # so we get that tag, and make it our SRCREVS:
>  #
>
> -SRCREV_moby =3D "219f21bf07502b447095649b5a2764661737f164"
> +SRCREV_moby =3D "9dbdbd4b6d7681bd18c897a6ba0376073c2a72ff"
>  SRCREV_libnetwork =3D "25ec449c45d2075c85fb3688ef4c1730be0466e0"
> -SRCREV_cli =3D "569dd73db13099a7c3104d73aa15117b359045bc"
> +SRCREV_cli =3D "ef23cbc4315ae76c744e02d687c09548ede461bd"
>  SRCREV_FORMAT =3D "moby_libnetwork"
>  SRC_URI =3D "\
>         git://github.com/moby/moby.git;branch=3D23.0;name=3Dmoby;protocol=
=3Dhttps \
> @@ -56,7 +56,6 @@ SRC_URI =3D "\
>         file://0001-libnetwork-use-GO-instead-of-go.patch \
>          file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patc=
h \
>          file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=3Dsrc=
/import \
> -        file://0001-Allow-for-xattr-copy-failure-for-vfs.patch;patchdir=
=3Dsrc/import \
>         "
>
>  DOCKER_COMMIT =3D "${SRCREV_moby}"
> @@ -67,7 +66,7 @@ require docker.inc
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D4859e97a9c7780e779=
72d989f0823f28"
>
> -DOCKER_VERSION =3D "23.0.2"
> +DOCKER_VERSION =3D "23.0.6"
>  PV =3D "${DOCKER_VERSION}+git${SRCREV_moby}"
>
>  CVE_PRODUCT =3D "docker mobyproject:moby"
> diff --git a/recipes-containers/docker/files/0001-Allow-for-xattr-copy-fa=
ilure-for-vfs.patch b/recipes-containers/docker/files/0001-Allow-for-xattr-=
copy-failure-for-vfs.patch
> deleted file mode 100644
> index b657cafd..00000000
> --- a/recipes-containers/docker/files/0001-Allow-for-xattr-copy-failure-f=
or-vfs.patch
> +++ /dev/null
> @@ -1,113 +0,0 @@
> -From f0dbd4eaf1416074bc8845063f4b6fb285bf75bd Mon Sep 17 00:00:00 2001
> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Thu, 27 Apr 2023 00:42:19 -0700
> -Subject: [PATCH] Allow for xattr copy failure for vfs
> -
> -vfs is declared to work with any filesystem, but after
> -https://github.com/moby/moby/commit/31f654a704f61768828d5950a13f30bb493d=
1239
> -it's no longer working with NFS.
> -
> -As the extended attribute support depends on filesystem and
> -if we do copy it in vfs and do not allow failure, that would
> -essentially mean that vfs does NOT support all filesystems but
> -only those that support xattr.
> -
> -So we should just try to copy security.capabilities and allow
> -for failure. In this way, vfs come back to the state of
> -being able to run on any filesystem as declared in
> -https://docs.docker.com/storage/storagedriver/select-storage-driver/.
> -
> -Fixes https://github.com/moby/moby/issues/45417
> -
> -Upstream-Status: Submitted [https://github.com/moby/moby/pull/45420]
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - daemon/graphdriver/copy/copy.go       | 6 ++++--
> - daemon/graphdriver/copy/copy_test.go  | 4 ++--
> - daemon/graphdriver/overlay/overlay.go | 4 ++--
> - daemon/graphdriver/vfs/copy_linux.go  | 2 +-
> - 4 files changed, 9 insertions(+), 7 deletions(-)
> -
> -diff --git a/daemon/graphdriver/copy/copy.go b/daemon/graphdriver/copy/c=
opy.go
> -index 0fb8a1a9d9..f6a5b74af5 100644
> ---- a/daemon/graphdriver/copy/copy.go
> -+++ b/daemon/graphdriver/copy/copy.go
> -@@ -116,7 +116,7 @@ type dirMtimeInfo struct {
> - //
> - // The copyOpaqueXattrs controls if "trusted.overlay.opaque" xattrs are=
 copied.
> - // Passing false disables copying "trusted.overlay.opaque" xattrs.
> --func DirCopy(srcDir, dstDir string, copyMode Mode, copyOpaqueXattrs boo=
l) error {
> -+func DirCopy(srcDir, dstDir string, copyMode Mode, copyOpaqueXattrs boo=
l, allowXattrFailure bool) error {
> -       copyWithFileRange :=3D true
> -       copyWithFileClone :=3D true
> -
> -@@ -210,7 +210,9 @@ func DirCopy(srcDir, dstDir string, copyMode Mode, c=
opyOpaqueXattrs bool) error
> -               }
> -
> -               if err :=3D copyXattr(srcPath, dstPath, "security.capabil=
ity"); err !=3D nil {
> --                      return err
> -+                      if !allowXattrFailure {
> -+                              return err
> -+                      }
> -               }
> -
> -               if copyOpaqueXattrs {
> -diff --git a/daemon/graphdriver/copy/copy_test.go b/daemon/graphdriver/c=
opy/copy_test.go
> -index 8dcd8d9d56..340c715f5f 100644
> ---- a/daemon/graphdriver/copy/copy_test.go
> -+++ b/daemon/graphdriver/copy/copy_test.go
> -@@ -40,7 +40,7 @@ func TestCopyDir(t *testing.T) {
> -       assert.NilError(t, err)
> -       defer os.RemoveAll(dstDir)
> -
> --      assert.Check(t, DirCopy(srcDir, dstDir, Content, false))
> -+      assert.Check(t, DirCopy(srcDir, dstDir, Content, false, true))
> -       assert.NilError(t, filepath.Walk(srcDir, func(srcPath string, f o=
s.FileInfo, err error) error {
> -               if err !=3D nil {
> -                       return err
> -@@ -146,7 +146,7 @@ func TestCopyHardlink(t *testing.T) {
> -       assert.NilError(t, os.WriteFile(srcFile1, []byte{}, 0777))
> -       assert.NilError(t, os.Link(srcFile1, srcFile2))
> -
> --      assert.Check(t, DirCopy(srcDir, dstDir, Content, false))
> -+      assert.Check(t, DirCopy(srcDir, dstDir, Content, false, true))
> -
> -       assert.NilError(t, unix.Stat(srcFile1, &srcFile1FileInfo))
> -       assert.NilError(t, unix.Stat(srcFile2, &srcFile2FileInfo))
> -diff --git a/daemon/graphdriver/overlay/overlay.go b/daemon/graphdriver/=
overlay/overlay.go
> -index 2ed53d82e9..909478963e 100644
> ---- a/daemon/graphdriver/overlay/overlay.go
> -+++ b/daemon/graphdriver/overlay/overlay.go
> -@@ -320,7 +320,7 @@ func (d *Driver) Create(id, parent string, opts *gra=
phdriver.CreateOpts) (retErr
> -               return err
> -       }
> -
> --      return copy.DirCopy(parentUpperDir, upperDir, copy.Content, true)
> -+      return copy.DirCopy(parentUpperDir, upperDir, copy.Content, true,=
 false)
> - }
> -
> - func (d *Driver) dir(id string) string {
> -@@ -460,7 +460,7 @@ func (d *Driver) ApplyDiff(id string, parent string,=
 diff io.Reader) (size int64
> -               }
> -       }()
> -
> --      if err =3D copy.DirCopy(parentRootDir, tmpRootDir, copy.Hardlink,=
 true); err !=3D nil {
> -+      if err =3D copy.DirCopy(parentRootDir, tmpRootDir, copy.Hardlink,=
 true, false); err !=3D nil {
> -               return 0, err
> -       }
> -
> -diff --git a/daemon/graphdriver/vfs/copy_linux.go b/daemon/graphdriver/v=
fs/copy_linux.go
> -index 7276b3837f..592825c1a5 100644
> ---- a/daemon/graphdriver/vfs/copy_linux.go
> -+++ b/daemon/graphdriver/vfs/copy_linux.go
> -@@ -3,5 +3,5 @@ package vfs // import "github.com/docker/docker/daemon/g=
raphdriver/vfs"
> - import "github.com/docker/docker/daemon/graphdriver/copy"
> -
> - func dirCopy(srcDir, dstDir string) error {
> --      return copy.DirCopy(srcDir, dstDir, copy.Content, false)
> -+      return copy.DirCopy(srcDir, dstDir, copy.Content, false, true)
> - }
> ---
> -2.40.0
> -
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8089): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8089
> Mute This Topic: https://lists.yoctoproject.org/mt/99358924/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

